<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_tarjetas extends CI_Model {

   private $db_utilidades = "utilidades_cards";
   private $directorioServidor = "ideacomonjas_cards";
   private $rutaData = "/var/www/html/ideacomonjas_cards";

   function __construct(){
      parent::__construct();
   }

   public function crearMaster($nif) {
      $sql = "CREATE TABLE ".$this->db_utilidades.".master_".$nif." (";
      $sql .= "_idmaster_".$nif." int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,";
      $sql .= "fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,";
      $sql .= "tipotcaso varchar(50) DEFAULT NULL,";
      $sql .= "etiqueta varchar(50) DEFAULT NULL,";
      $sql .= "color varchar(10) DEFAULT NULL,";
      $sql .= "qr varchar(500) DEFAULT NULL,";
      $sql .= "link varchar(50) DEFAULT NULL,";
      $sql .= "cargo varchar(150) DEFAULT NULL,";
      $sql .= "sector varchar(150) DEFAULT NULL,";
      $sql .= "provincia_tarj varchar(150) DEFAULT NULL,";
      $sql .= "tipotarjeta varchar(50) DEFAULT NULL,";
      $sql .= "codigoempresa int(20) DEFAULT NULL,";
      $sql .= "empresa varchar(50) DEFAULT NULL,";
      $sql .= "nombre varchar(50) DEFAULT NULL,";
      $sql .= "apellido varchar(50) DEFAULT NULL,";
      $sql .= "apellido2 varchar(50) DEFAULT NULL,";
      $sql .= "fechanacimiento datetime DEFAULT NULL,";
      $sql .= "direccion varchar(200) DEFAULT NULL,";
      $sql .= "poblacion varchar(50) DEFAULT NULL,";
      $sql .= "provincia varchar(50) DEFAULT NULL,";
      $sql .= "codigopostal varchar(50) DEFAULT NULL,";
      $sql .= "tlf varchar(20) DEFAULT NULL,";
      $sql .= "email varchar(100) DEFAULT NULL,";
      $sql .= "tdaton varchar(50) DEFAULT NULL,";
      $sql .= "fotos varchar(500) DEFAULT NULL,";
      $sql .= "audios varchar(500) DEFAULT NULL,";
      $sql .= "videos varchar(500) DEFAULT NULL,";
      $sql .= "doc varchar(500) DEFAULT NULL,";
      $sql .= "otros varchar(500) DEFAULT NULL,";
      $sql .= "fk varchar(50) DEFAULT NULL,";
      $sql .= "argumentos varchar(50) DEFAULT NULL,";
      $sql .= "inhibir varchar(50) DEFAULT NULL,";
      $sql .= "codigoetiqueta int(11) DEFAULT NULL,";
      $sql .= "codigodia int(11) DEFAULT NULL,";
      $sql .= "codigoturno int(11) DEFAULT NULL,";
      $sql .= "entrada varchar(50) DEFAULT NULL,";
      $sql .= "duracion varchar(50) DEFAULT NULL,";
      $sql .= "clave1 varchar(50) DEFAULT NULL,";
      $sql .= "clave2 varchar(50) DEFAULT NULL,";
      $sql .= "claveadmin varchar(50) DEFAULT NULL)";
      
      $this->db->simple_query($sql);

      if ( $this->db->error()['code'] == 1050 ){
         // Tabla ya existe
         return 1;
      } else {
         return 0;
      }
   }

   public function crearDatosObligatorios($nif, $nombre, $apellido, $apellido2,$codigoetiqueta) {
      $sql = "INSERT INTO ".$this->db_utilidades.".master_".$nif." ";
      $sql .= "(tipotcaso, nombre, apellido, apellido2,codigoetiqueta) ";
      $sql .= "VALUES ('obligatorios', '".$nombre."', '".$apellido."', '".$apellido2."',".$codigoetiqueta.")";


      $this->db->simple_query($sql);

      return 0;
   }
   public function crearDatosComplementarios($nif, $direccion, $tlf, $email,$codigoetiqueta) {
      $sql = "INSERT INTO ".$this->db_utilidades.".master_".$nif." ";
      $sql .= "(tipotcaso, direccion, tlf, email,codigoetiqueta) ";
      $sql .= "VALUES ('complementarios',  '".$direccion."', '".$tlf."', '".$email."',".$codigoetiqueta.")";

      $this->db->simple_query($sql);

      return 0;
   }
   public function crearClave($nif, $nombre,$tlf) {
     // $token = hash('sha256', $nombre);
	  // Estado -> 0 -> primera vez
	  // Estado -> 1 -> ya usado
      $sql = "INSERT INTO ".$this->db_utilidades.".claves  ";
      $sql .= "(tipotcaso, usuario, nif, claveactual, tlf,fechainstalacion,estado) ";
      $sql .= "VALUES ('clave', '".$nombre."', '".$nif."', '".password_hash($nif, PASSWORD_DEFAULT)."', '".$tlf."', now(),0)";

      $this->db->query($sql);

     // return $token;
   }

   public function escribirAdjuntoImagen($indice, $rutaCompleta){
      $this->crearThumb($rutaCompleta, $rutaCompleta.".thumb", 200);
      // Recibes el indice y la ruta (000.../....)
      $ruta = substr($rutaCompleta, strpos($rutaCompleta, $this->directorioServidor) + strlen($this->directorioServidor) + 1);
      
      // Escribir caso en la base de datos
      $sql = "INSERT INTO  ".$this->db_utilidades.".master_".$nif." (fecha,tipotcaso,codigoetiqueta,fotos) VALUES (now(),'adjunto',".$indice.",'".$ruta."')";
       $this->db->query($sql);   
      unset($sql);
      flush();
   }
   public function escribirAdjuntoVideo($indice, $rutaCompleta){
      // Recibes el indice y la ruta (000.../....)
      $ruta = substr($rutaCompleta, strpos($rutaCompleta, $this->directorioServidor) + strlen($this->directorioServidor) + 1);

      // Escribir caso en la base de datos
      $sql = "INSERT INTO  ".$this->db_utilidades.".master_".$nif."  (fecha,tipotcaso,codigoetiqueta,videos) VALUES (now(),'adjunto',".$indice.",'".$ruta.",)";
       $this->db->query($sql);   
      unset($sql);
      flush();
   }
   public function escribirAdjuntoAudio($indice, $rutaCompleta){
      // Recibes el indice y la ruta (000.../....)
      $ruta = substr($rutaCompleta, strpos($rutaCompleta, $this->directorioServidor) + strlen($this->directorioServidor) + 1);

      // Escribir caso en la base de datos
      $sql = "INSERT INTO  ".$this->db_utilidades.".master_".$nif." (fecha,tipotcaso,codigoetiqueta,audio) VALUES (now(),'adjunto',".$indice.",'".$ruta."')";
      $this->db->query($sql);   
      unset($sql);
      flush();
   }
  
   public function escribirAdjuntoQr($indice, $rutaCompleta,$nif){
      $ruta = substr($rutaCompleta, strpos($rutaCompleta, $this->directorioServidor) + strlen($this->directorioServidor) + 1);

      // Escribir caso en la base de datos
      $sql = "UPDATE  ".$this->db_utilidades.".master_".$nif."  SET qr ='".$rutaCompleta."' WHERE _idmaster_".$nif."=". $indice."";
       $this->db->query($sql);
      unset($sql);
      flush();
   }
   public function crearEtiqueta($nif, $link, $tipotarjeta,$color,$cargo,$sector,$empresa,$ciudad) {
      $sql = "INSERT INTO ".$this->db_utilidades.".master_".$nif." ";
      $sql .= "(tipotcaso,  link, tipotarjeta,color,cargo,sector,empresa,provincia) ";
      $sql .= "VALUES ('etiqueta',  '".$link."', '".$tipotarjeta."', '".$color."', '".$cargo."', '".$sector."', '".$empresa."', '".$ciudad."')";
      $this->db->query($sql);
      $codigoetiqueta = $this->db->insert_id();
      $sql="update ".$this->db_utilidades.".master_".$nif."  SET etiqueta='nif=".$nif."&id=".$codigoetiqueta."'  WHERE  _idmaster_".$nif."=".$codigoetiqueta;
      $query = $this->db->query($sql);
      return $codigoetiqueta;
   }
   public function crearTarjeta($nif,$idtarjeta,$niftarjeta) {
	 
      $sql = "SELECT etiqueta,_idmaster_".$nif." "; 
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." ";
      $sql .= "WHERE etiqueta = 'nif=".$niftarjeta."&id=".$idtarjeta."' and tipotcaso='tarjeta'";
		$query = $this->db->query($sql);
		
		if ($query->num_rows() > 0){
			$row = $query->result();
			$id="_idmaster_".$nif."";
			$codigoetiqueta=$row[0]->$id;
			$query->free_result(); 

		}
		else
		{

			$sql = "SELECT color, tipotarjeta, link, cargo,sector,empresa,provincia "; 
			$sql .= "FROM ".$this->db_utilidades.".master_".$niftarjeta." ";
			$sql .= "WHERE tipotcaso = 'etiqueta' and _idmaster_".$niftarjeta."=".$idtarjeta."";
			$query = $this->db->query($sql);

			if ($query->num_rows() > 0){
				$row = $query->result();
				$query->free_result(); 

				// Insertar tarjeta
				$sql = "INSERT INTO ".$this->db_utilidades.".master_".$nif." ";
				$sql .= "(tipotcaso, etiqueta, color, tipotarjeta,link,cargo,sector,empresa,provincia) ";
				$sql .= "VALUES ('tarjeta', 'nif=".$niftarjeta."&id=".$idtarjeta."','".$row[0]->color."','".$row[0]->tipotarjeta."', '".$row[0]->link."', '".$row[0]->cargo."', '".$row[0]->sector."', '".$row[0]->empresa."', '".$row[0]->provincia."')";
				$this->db->query($sql);
				$row = $query->result(); 
				$codigoetiqueta = $this->db->insert_id();
				$query->free_result();                 

				// Coger datos obligatorios
				$sql = "SELECT nombre, apellido, apellido2  "; 
				$sql .= "FROM ".$this->db_utilidades.".master_".$niftarjeta." ";
				$sql .= "WHERE tipotcaso = 'obligatorios' and codigoetiqueta=".$idtarjeta."";
				$query = $this->db->query($sql);
				if ($query->num_rows() > 0){
					$row = $query->result();
					$sql = "INSERT INTO ".$this->db_utilidades.".master_".$nif." ";
					$sql .= "(tipotcaso,  nombre, apellido,apellido2,codigoetiqueta) ";
					$sql .= "VALUES ('obligatorios',  '".$row[0]->nombre."', '".$row[0]->apellido."', '".$row[0]->apellido2."',".$codigoetiqueta.")";
					$this->db->query($sql);
				}
				
				// Coger datos complementarios
				$sql = "SELECT tlf, email, direccion  "; 
				$sql .= "FROM ".$this->db_utilidades.".master_".$niftarjeta." ";
				$sql .= "WHERE tipotcaso = 'complementarios' and codigoetiqueta=".$idtarjeta."";
				$query = $this->db->query($sql);
				if ($query->num_rows() > 0){
					$row = $query->result();
					$sql = "INSERT INTO ".$this->db_utilidades.".master_".$nif." ";
					$sql .= "(tipotcaso,  tlf, email,direccion,codigoetiqueta) ";
					$sql .= "VALUES ('complementarios',  '".$row[0]->tlf."', '".$row[0]->email."', '".$row[0]->direccion."',".$codigoetiqueta.")";
					$this->db->query($sql);
				}
				
				// Coger los adjuntos
				$sql = "SELECT fotos, audios, videos, doc, otros ";
				$sql .= "FROM ".$this->db_utilidades.".master_".$niftarjeta." ";
				$sql .= "WHERE tipotcaso = 'adjuntos' and codigoetiqueta=".$idtarjeta."";
				$query = $this->db->query($sql);
				if ($query->num_rows() > 0){
					$row = $query->result();

					foreach ($row as $key => $adjunto) {
						$sql = "INSERT INTO ".$this->db_utilidades.".master_".$nif." ";
						$sql .= "(tipotcaso, fotos, audios, videos, doc, otros, codigoetiqueta) ";
						$sql .= "VALUES ('adjuntos',  '".$adjunto->fotos."', '".$adjunto->audios."', '".$adjunto->videos."', '".$adjunto->doc."', '".$adjunto->otros."', ".$codigoetiqueta.")";
						$this->db->query($sql);
					}
				}

			} 

		}
		return $codigoetiqueta;

   }

   public function leerEtiquetas($nif,$tipotarjeta) {
      $sql = "SELECT ";
      $sql .= "a._idmaster_".$nif." as id , ";
      $sql .= "a.etiqueta, "; 
      $sql .= "a.sector, "; 
      $sql .= "a.provincia, "; 
      $sql .= "a.empresa, "; 
      $sql .= "a.qr, "; 
      $sql .= "a.color, "; 
      $sql .= "a.cargo, "; 
      $sql .= "b.nombre, "; 
      $sql .= "b.apellido, "; 
      $sql .= "b.apellido2, "; 
      $sql .= "c.tlf, "; 
      $sql .= "c.email, "; 
      $sql .= "c.direccion, "; 
      $sql .= "GROUP_CONCAT(DISTINCT d.fotos ORDER BY d._idmaster_".$nif." ASC SEPARATOR ',') AS fotos ";
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." a ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." b ON a._idmaster_".$nif." =b.codigoetiqueta ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." c ON a._idmaster_".$nif." =c.codigoetiqueta ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." d ON a._idmaster_".$nif." = d.codigoetiqueta ";
      $sql .= "WHERE  a.tipotcaso = 'etiqueta' and a.tipotarjeta = '".$tipotarjeta."'   ";
      $sql .= "and b.tipotcaso='obligatorios' ";
      $sql .= "and c.tipotcaso='complementarios' and d.tipotcaso = 'adjuntos' ";
      $sql .= "GROUP BY a._idmaster_".$nif." " ;
      $sql .= "ORDER BY a.empresa,a.nombre asc";

    // echo $sql;
      $query = $this->db->query($sql);

      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }

      return $row;
   }
   public function leerTarjetas($nif,$tipotarjeta) {
		if ($tipotarjeta=="")
			$tipotarjeta='%%';
      $sql = "SELECT DISTINCT ";
      $sql .= "a._idmaster_".$nif." as id , ";
      $sql .= "a.color, "; 
      $sql .= "a.link, "; 
      $sql .= "a.cargo, ";  
      $sql .= "a.sector, "; 
      $sql .= "a.provincia, "; 
      $sql .= "a.empresa, "; 
      $sql .= "b.nombre, "; 
      $sql .= "b.apellido, "; 
      $sql .= "b.apellido2, "; 
      $sql .= "c.tlf, "; 
      $sql .= "c.email, "; 
      $sql .= "c.direccion, "; 
      $sql .= "GROUP_CONCAT(DISTINCT d.fotos ORDER BY d._idmaster_".$nif." ASC SEPARATOR ',') AS fotos ";
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." a ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." b ON b.codigoetiqueta=a._idmaster_".$nif. " ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." c  ON c.codigoetiqueta=a._idmaster_".$nif. " ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." d ON a._idmaster_".$nif." = d.codigoetiqueta ";
      $sql .= "WHERE  a.tipotcaso = 'tarjeta' and a.tipotarjeta = '".$tipotarjeta."'   ";
		//$sql .= "WHERE  a.tipotcaso = 'tarjeta'   ";
      $sql .= "and b.tipotcaso='obligatorios'  ";
      $sql .= "and c.tipotcaso='complementarios' and d.tipotcaso = 'adjuntos' ";
      $sql .= "GROUP BY a._idmaster_".$nif." " ;
      $sql .= "ORDER BY a.empresa,b.nombre asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }

      return $row;
	}
	
   public function leerEtiquetaenviada($idtarjeta,$nif) {
      $sql = "SELECT ";
      $sql .= "a.color, "; 
      $sql .= "a.tipotarjeta, "; 
      $sql .= "b.nombre, "; 
      $sql .= "b.apellido, "; 
      $sql .= "b.apellido2, "; 
      $sql .= "a.cargo, "; 
      $sql .= "c.tlf, "; 
      $sql .= "c.email, "; 
      $sql .= "c.direccion, "; 
      $sql .= "GROUP_CONCAT(DISTINCT d.fotos SEPARATOR ',') AS fotos  ";
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." a ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." b ON a._idmaster_".$nif." = b.codigoetiqueta ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." c ON a._idmaster_".$nif." = c.codigoetiqueta ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." d ON a._idmaster_".$nif." = d.codigoetiqueta ";
      $sql .= "WHERE  a.tipotcaso = 'etiqueta' and a._idmaster_".$nif."= ".$idtarjeta." and d.tipotcaso = 'adjuntos' ";
      $sql .= "and b.tipotcaso='obligatorios' ";
      $sql .= "and c.tipotcaso='complementarios' ";
      $sql .= "GROUP BY a._idmaster_".$nif." " ;
      $sql .= "ORDER BY a.fecha asc LIMIT 1";
      
      $query = $this->db->query($sql);

      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }

      return $row;
   }
   public function subirArchivo($nif, $tipo){
      /*
       * IMPORTANTE
       *
       * PHP tiene un limite de archivo que se puede subir,
       * para cambiarlo hay que modificar en php.ini los siguientes
       * campos:
       *
       * --> upload_max_filesize = 128M
       * --> post_max_size = 128M
       *
       * Si intentamos subir un archivo que supera esa capacidad,
       * dara error, y directamente esta funcion no se llegara
       * a ejecutar
       */


      // Obtengo el directorio donde se va a guardar el archivo
      $directorio = $this->obtenerDirectorioDestino();

      // Obtengo el hash del nombre del archivo que sera en que se escriba en la
      // base de datos y con el que se subira al servidor
      $nombreHash = $this->obtenerHashArchivo( $_FILES['userfile']['name'] );

      //var_dump($_POST['indice']);

      // Comprobar en la base de datos si el archivo existe
      $rutaCompleta = $directorio."/".$nombreHash;

      //FUNCION COMPROBAR SI EL ARCHIVO YA SE HABIA SUBIDO
      $extension=pathinfo($_FILES['userfile']['name']);
      $extension=$extension['extension'];
      //select bd  swicth con el nombreHas
      //SI EL ARCHIVO YA EXISTE, NO SE VUELVE A SUBIR

      // Subo el archivo al disco
      $config['file_name']      = $nombreHash;
      $config['upload_path']    = $directorio;
      $config['allowed_types']  = 'gif|jpg|png|jpeg|mp4|xlsx|xls|csv|docx|rtf|xml|pdf|html|apk';
      $config['max_width']      = 0;
      $config['max_height']     = 0;

      // Configuro el tamano maximo
      switch ( $tipo ) {
         case 0: $config['max_size'] = 512;  break;
         case 1: $config['max_size'] = 512; /* 128MB */ break;
         case 2: $config['max_size'] = 131072; /* 128MB */ break;
         case 3: $config['max_size'] = 131072; /* 128MB */ break;
      }

      $this->load->library('upload', $config);
      $this->upload->do_upload('userfile');

      return $rutaCompleta;
   }

   private function obtenerDirectorioDestino(){
      $dirNum = 0;
      $done = false;
      $dirDestino;

      while(!$done){
         // Genero el nombre del directorio
         $directorio = strval($dirNum);

         switch ( strlen($directorio) ) {
            case 1: $directorio = "00000".$directorio; break;
            case 2: $directorio = "0000".$directorio; break;
            case 3: $directorio = "000".$directorio; break;
            case 4: $directorio = "00".$directorio; break;
            case 5: $directorio = "0".$directorio; break;
            case 6: break;
            default: return $this->rutaData."000000"; break;
         }

         $directorio = $this->rutaData.$directorio;

         // Compruebo si este directorio existe, en caso afirmativo
         // compruebo si tiene el maximo de archivos, si no existe
         // lo creo y acabo
         if( is_dir( $directorio ) ){
            // Compruebo el numero de archivos que el directorio tiene dentro,
            // si no ha llegado al maximo, acabo, en caso contrario sigo
            $ficheros = scandir($directorio);
            $numFicheros = count($ficheros) - 2;

            if( $numFicheros <  $this->archivosPorDirectorio ){
               $dirDestino = $directorio;
               $done = true;
            }
         }
         else{
            // Creo el directorio y acabo
            mkdir($directorio);
            $dirDestino = $directorio;
            $done = true;
         }

         $dirNum++;
      }

      return $dirDestino;
   }

   private function obtenerHashArchivo($nombre){
      // Obtengo informacion sobre el fichero, lo que me interera
      // es la extension
      $path_info = pathinfo($nombre);

      // Obtengo el hash
      $nombreHash = hash('sha256',$nombre);

      // Añado la extension al hash
      $nombreHash = $nombreHash.".".$path_info['extension'];

      return $nombreHash;
   }

 
   public function verficarUsuario($usuario, $clave){
		// Obtengo la clave del usuario
		$ban=0;
      $sql = "SELECT _idclaves,claveactual,estado,codigobusiness FROM ".$this->db_utilidades.".claves WHERE usuario = '".$usuario."' AND tipotcaso = 'clave'";

      $query = $this->db->query($sql);

      if ($query->num_rows() > 0){

         $row = $query->result();
         foreach ($row as $key => $value) {     
				  
				if ( password_verify($clave, $value->claveactual) && $ban==0) {
					if ($value->estado==0){
						$sql = "SELECT _idclaves,claveactual,estado FROM ".$this->db_utilidades.".claves WHERE usuario = '".$usuario."' AND tipotcaso = 'clave'";
						$sql = "UPDATE  ".$this->db_utilidades.".claves  SET estado =1  WHERE _idclaves = ".$value->_idclaves."";
						$this->db->query($sql);
						unset($sql);
						flush();
						$respuesta = 1;
						$ban=1;
						break;
					}
					else
						$respuesta = 0;
				} else{
					$respuesta = 3;
				}

      }
         // Compruebo si la clave es correcta
        
      } else {
         $respuesta = 2;
      }

      $obj = (object) array('codigo' => $respuesta, 'codigobusiness' => $row[0]->codigobusiness);

      return $obj;
   }

   public function verificarMaster($nif,$tlf){
    $sql = "SELECT * FROM ".$this->db_utilidades.".claves WHERE nif = '".$nif."' OR tlf =".$tlf."";

    $query = $this->db->query($sql);

    if ($query->num_rows() > 0){
        $respuesta = 1;
    } else {
       $respuesta = 0;
    }
	 return $respuesta;
   }   
   public function leerSectorMaster($nif) {
      $sql = "SELECT DISTINCT ";
      $sql .= "sector as nombre "; 
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." ";
		$sql .= "WHERE  tipotcaso = 'tarjeta'  and tipotarjeta='business' ";
      $sql .= "ORDER BY sector asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }

      return $row;
	}
	public function leerCargoMaster($nif) {
      $sql = "SELECT DISTINCT ";
      $sql .= "cargo as nombre "; 
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." ";
		$sql .= "WHERE  tipotcaso = 'tarjeta'   and tipotarjeta='business' ";
      $sql .= "ORDER BY cargo asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }

      return $row;
	}
	public function leerProvinciaMaster($nif) {
      $sql = "SELECT DISTINCT ";
      $sql .= "provincia as nombre "; 
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." ";
		  $sql .= "WHERE  tipotcaso = 'tarjeta'  and tipotarjeta='business' ";
      $sql .= "ORDER BY provincia asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }
      return $row;
	}
	public function leerEmpresaMaster($nif) {
      $sql = "SELECT DISTINCT ";
      $sql .= "empresa as nombre "; 
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." ";
		$sql .= "WHERE  tipotcaso = 'tarjeta'   and tipotarjeta='business' ";
      $sql .= "ORDER BY empresa asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }

      return $row;
   }
   public function crearEmpresa($cif) {
      $sql = "CREATE TABLE ".$this->db_utilidades.".empresa_".$cif." (";
      $sql .= "_idempresa_".$cif." int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,";
      $sql .= "fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,";
      $sql .= "tipotcaso varchar(50) DEFAULT NULL,";
      $sql .= "razonsocial varchar(50) DEFAULT NULL,";
      $sql .= "web varchar(50) DEFAULT NULL,";
      $sql .= "cargo varchar(50) DEFAULT NULL,";
      $sql .= "nif varchar(50) DEFAULT NULL,";
      $sql .= "entidad varchar(150) DEFAULT NULL,";
      $sql .= "nombre varchar(50) DEFAULT NULL,";
      $sql .= "apellidos varchar(50) DEFAULT NULL,";
      $sql .= "fechanacimiento datetime DEFAULT NULL,";
      $sql .= "direccion varchar(200) DEFAULT NULL,";
      $sql .= "poblacion varchar(50) DEFAULT NULL,";
      $sql .= "provincia varchar(50) DEFAULT NULL,";
      $sql .= "codigopostal varchar(50) DEFAULT NULL,";
      $sql .= "tlf varchar(20) DEFAULT NULL,";
      $sql .= "email varchar(100) DEFAULT NULL,";
      $sql .= "tdaton varchar(50) DEFAULT NULL,";
      $sql .= "fotos varchar(500) DEFAULT NULL,";
      $sql .= "audios varchar(500) DEFAULT NULL,";
      $sql .= "videos varchar(500) DEFAULT NULL,";
      $sql .= "doc varchar(500) DEFAULT NULL,";
      $sql .= "otros varchar(500) DEFAULT NULL)";
      
      $this->db->simple_query($sql);
		
		unset($sql);
		flush();
		
      if ( $this->db->error()['code'] == 1050 ){
         // Tabla ya existe
         return 1;
      } else {
         return 0;
      }
   }
   public function leerSectorEmpresa($cif) {
      $sql = "SELECT DISTINCT ";
      $sql .= "sector"; 
      $sql .= "FROM ".$this->db_utilidades.".empresa_".$cif." ";
		$sql .= "WHERE  tipotcaso = 'representante'   ";
      $sql .= "ORDER BY sector asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }
      return $row;
	}
	public function leerCargoEmpresa($cif) {
      $sql = "SELECT DISTINCT  cargo"; 
      $sql .= "FROM ".$this->db_utilidades.".empresa_".$cif." ";
		$sql .= "WHERE  tipotcaso = 'representante'   ";
      $sql .= "ORDER BY cargo asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }
      return $row;
	}
	public function leerProvinciaEmpresa($cif) {
      $sql = "SELECT DISTINCT ";
      $sql .= "provincia"; 
      $sql .= "FROM ".$this->db_utilidades.".empresa_".$cif." ";
		  $sql .= "WHERE  tipotcaso = 'representante'   ";
      $sql .= "ORDER BY provincia asc";
      
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else 
         $row = 0;

      return $row;
      
	}	
	function leerTarjetasFiltrado( $nif,$tipotarjeta,$sector, $empresa, $cargo, $provincia){

		if ($tipotarjeta=="")
			$tipotarjeta='%%';
		
      $sql = "SELECT DISTINCT ";
      $sql .= "a._idmaster_".$nif." as id , ";
      $sql .= "a.color, "; 
      $sql .= "a.link, "; 
      $sql .= "a.cargo, ";  
      $sql .= "a.sector, "; 
      $sql .= "a.provincia, "; 
      $sql .= "a.empresa, "; 
      $sql .= "b.nombre, "; 
      $sql .= "b.apellido, "; 
      $sql .= "b.apellido2, "; 
      $sql .= "c.tlf, "; 
      $sql .= "c.email, "; 
      $sql .= "c.direccion, "; 
      $sql .= "GROUP_CONCAT(DISTINCT d.fotos ORDER BY d._idmaster_".$nif." ASC SEPARATOR ',') AS fotos ";
      $sql .= "FROM ".$this->db_utilidades.".master_".$nif." a ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." b ON b.codigoetiqueta=a._idmaster_".$nif. " ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." c  ON c.codigoetiqueta=a._idmaster_".$nif. " ";
      $sql .= "JOIN ".$this->db_utilidades.".master_".$nif." d ON a._idmaster_".$nif." = d.codigoetiqueta ";
      $sql .= "WHERE  a.tipotcaso = 'tarjeta' and a.tipotarjeta = '".$tipotarjeta."'   ";
      $sql .= "and b.tipotcaso='obligatorios'  ";
		$sql .= "and c.tipotcaso='complementarios' and d.tipotcaso = 'adjuntos' ";
		if( count($sector) > 0){
			$sql.=' AND (';
			foreach ($sector as $u){
				$sql.='a.sector="'.$u->nombre.'" OR ';
			}
  
			$sql = substr($sql , 0, -4);

			$sql.=')';
		}
		if( count($empresa) > 0){
			$sql.=' AND (';
			foreach ($empresa as $u){
				$sql.='a.empresa="'.$u->nombre.'" OR ';
			}
  
			$sql = substr($sql , 0, -4);

			$sql.=')';
		}
		if( count($cargo) > 0){
			$sql.=' AND (';
			foreach ($cargo as $u){
				$sql.='a.cargo="'.$u->nombre.'" OR ';
			}
  
			$sql = substr($sql , 0, -4);

			$sql.=')';
		}if( count($provincia) > 0){
			$sql.=' AND (';
			foreach ($provincia as $u){
				$sql.='a.provincia="'.$u->nombre.'" OR ';
			}
  
			$sql = substr($sql , 0, -4);

			$sql.=')';
		}
      $sql .= " GROUP BY a._idmaster_".$nif." " ;
      $sql .= "ORDER BY a.empresa,b.nombre asc";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0){
         $row = $query->result();
      } else {
         $row = 0;
      }

      return $row;
		
   }	
   public function crearCasoTcasoRepresentante($cif,$nombre,$apellidos,$nif,$cargo,$direccion,$telefono,$email) {
		$sql = "INSERT INTO ".$this->db_utilidades.".empresa_".$cif." ";
      $sql .= "(tipotcaso, nombre, apellidos, nif, cargo, direccion, tlf, email) ";
      $sql .= "VALUES ('representante', '".$nombre."', '".$apellidos."', '".$nif."', '".$cargo."', '".$direccion."', '";
      $sql .= $telefono."', '".$email."')";
		
		$this->db->simple_query($sql);
		
		unset($sql);
		flush();
		
		return 0;
   }	
   public function crearCasoTcasoEmpresa($cif,$razonsocial,$direccion,$telefono,$email,$web) {
		$sql = "INSERT INTO ".$this->db_utilidades.".empresa_".$cif." ";
      $sql .= "(tipotcaso, razonsocial, direccion, tlf, email, web) ";
      $sql .= "VALUES ('empresa', '".$razonsocial."', '".$direccion."', '".$telefono."', '".$email."', '".$web."')";
		
		$this->db->simple_query($sql);
		
		unset($sql);
		flush();
		
		return 0;
   }
   public function crearCasoTcasoEntidad($cif,$razonsocial,$entidad) {
		$i=0;
      foreach ($entidad as $ent){
         $sql = "INSERT INTO ".$this->db_utilidades.".empresa_".$cif." ";
         $sql .= "(tipotcaso, razonsocial, entidad) ";
         $sql .= "VALUES ('entidad', '".$razonsocial."', '".$entidad[$i]."')";
         
         $this->db->simple_query($sql);
         
         unset($sql);

         $i++;
      }
      
      flush();
      
      return 0;
	}
	public function crearCasoTcasoClaveEmpresaAccesoPorRegistro($cif, $empresa) {
		$sql = "INSERT INTO ".$this->db_utilidades.".claves ";
		$sql .= "(tipotcaso, empresa, cif, claveactual) ";
      $sql .= "VALUES ('claveempresaaccesoporregistro', '".$empresa."', '".$cif."', '".password_hash($cif, PASSWORD_DEFAULT)."')";   

		$this->db->simple_query($sql);
		
		unset($sql);
		flush();
	
		return 0;
	}
}

?>
