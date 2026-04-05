<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ecards extends CI_Controller {

   function __construct(){
      parent::__construct();

      $this->load->model('M_ecards','ecards' , true);
      $this->load->library('email');
   }
   

   /* ************************* MASTER **************************/

   /** comprobarNifExistente : Verifica si el nif existen
		* 
		* PARAMETROS (post)
		* tlf
		* nif
		* 
		* RESPUESTA
		* 0 -> Ok
		* 1 -> Error
	*/ 
	public function comprobrobarNifTlf() {
		$post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
			$respuesta=$this->ecards->verificarMaster($post->nif,$post->tlf);
			echo json_encode($respuesta);
		}
	}
	/** verificarUsuarioMaster : Verifica si el usuario y la clave existen
		* 
		* PARAMETROS (post)
		* usuario
		* clave
		* 
		* RESPUESTA
		* 0 -> codigo' => $respuesta, 'codigobusiness' => $row[0]->codigobusiness);
		* 1 -> Ok Primera vez
		* 2 -> usuario no existe
		* 3 -> error
	*/ 
	public function verificarUsuarioMaster() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->verficarUsuarioMaster($post->usuario, $post->clave);
         echo json_encode( $respuesta );
      }
   }
		
	/** crearUsuario : Crea tabla master, crea caso en tcaso clave y envia sms
		* 
		* PARAMETROS (post)
		* cif empresa
		* nif
		* Nombre
		* apellido
		* apellido2
		* direccion
		* tlf
		* email
		* poblacion
		* provincia
		* codigo postal
		* fecha nacimiento
		*
		* RESPUESTA
		* 0 Ok
   */
   public function crearUsuarioDesdeEmpresa() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

		$apellido2 = isset($post->apellido2) ? $post->apellido2 : '';
		$direccion = isset($post->direccion) ? $post->direccion : '';
		$email = isset($post->email) ? $post->email : '';
		$poblacion = isset($post->poblacion) ? $post->poblacion : '';
		$provincia = isset($post->provincia) ? $post->provincia : '';
		$codigopostal = isset($post->codigopostal) ? $post->codigopostal : '';
		$fechanacimiento = isset($post->fechanacimiento) ? $post->fechanacimiento : '';

      if(empty($apellido2))
         $apellidos = $post_obli[$j]->apellido;
      else
         $apellidos = $post_obli[$j]->apellido." ".$apellido2;

      if( isset($post) ){
         $respuesta = $this->ecards->crearMaster($post->nif);

         if ( $respuesta == 0 ) {// crear clave
            $tabla="usuario_".$post->nif;
            $codigomaster=$this->ecards->crearDatosMaster($tabla, $post->nombre, $apellidos, $post->tlf);
            $this->ecards->crearDatosComplementarios($tabla,$fechanacimiento,$direccion,$poblacion,$provincia,$codigopostal,$email,$codigomaster); 
            $this->crearClaveMaster($post->nif, $post->nombre,$post->tlf,1);
            $mensaje="CERTIFIED CARDS. Gracias por descargarse la app. Los datos de acceso para usar la app son USUARIO: ".$post->nombre." CLAVE: ".$post->nif."";
            $this->enviarSMS($post->tlf, $mensaje);
            
            $tabla="empresa_".$post->cif;
            $codigomaster=$this->ecards->crearDatosMaster($tabla, $post->nombre, $apellidos, $post->tlf);
            $this->ecards->crearDatosComplementarios($tabla,$fechanacimiento,$direccion,$poblacion,$provincia,$codigopostal,$email,$codigomaster); 
         }
         
         echo json_encode( $respuesta );
      }
	}
	/** crearUsuario : Crea tabla master, crea caso en tcaso clave y envia sms
		* 
		* PARAMETROS (post)
		* nif
		* nombre 
		* tlf
		*
		* RESPUESTA
		* 0 Ok
   */
   public function crearUsuario() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->crearMaster($post->nif);

         if ( $respuesta == 0 ) {// crear clave
            $this->ecards->crearDatosMasterUsuarioNoRegistrado($post->$nif, $post->$nombre, $post->$tlf);
            $this->crearClaveMaster($post->nif, $post->nombre,$post->tlf,0);
            $mensaje="CERTIFIED CARDS. Gracias por descargarse la app. Los datos de acceso para usar la app son USUARIO: ".$post->nombre." CLAVE: ".$post->nif."";
            $this->enviarSMS($post->tlf, $mensaje);
         }
         
         echo json_encode( $respuesta );
      }
   }
	  /** crearClaveMaster : Crear caso Tcaso claveMaster
		* 
		* PARAMETROS
		* nif
		* Nombre
		* tlf
		*
		* RESPUESTA
		* 0 Ok
		* 1 Error
	*/
	private function crearClaveMaster($nif,$nombre,$tlf,$codigobusiness) {
		$respuesta = $this->ecards->crearClaveMaster($nif, $nombre, $tlf,$codigobusiness);
		return $respuesta;
	}
	
   /** leerSectorMaster : lee los diferentes sectores de la tabla master_nif
		 * 
		 * PARAMETROS (post)
		 * nif
		 * RESPUESTA
		 * array :sector
	 */
   public function leerSectorMaster() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->tarjetas->leerSectorMaster($post->nif);

         echo json_encode( $respuesta );
      }
	}
	/** leerProvinciaMaster : lee las diferentes provincias de la tabla master_nif
		 * 
		 * PARAMETROS (post)
		 * nif
		 * RESPUESTA
		 * array :provincia
	 */
   public function leerProvinciaMaster() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->tarjetas->leerProvinciaMaster($post->nif);

         echo json_encode( $respuesta );
      }
	}
	/** leerCargosMaster : lee los diferentes cargos de la tabla master_nif
		 * 
		 * PARAMETROS (post)
		 * nif
		 * RESPUESTA
		 * array :cargo
	 */
   public function leerCargoMaster() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->tarjetas->leerCargoMaster($post->nif);

         echo json_encode( $respuesta );
      }
	}
	/** leerEmpresaMaster : lee las diferentes empresas de la tabla master_nif
		 * 
		 * PARAMETROS (post)
		 * nif
		 * RESPUESTA
		 * array :cargo
	 */
   public function leerEmpresaMaster() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->tarjetas->leerEmpresaMaster($post->nif);
         echo json_encode( $respuesta );
      }
	}
   /* ************************* EMPRESA **************************/

	
	/** verificarEmpresa : Verifica si el usuario y la clave existen de la empresa
		* 
		* PARAMETROS (post)
		* usuario
		* clave
		* 
		* RESPUESTA
		* 0 -> ok
		* 1 -> 
		* 2 -> usuario no existe
		* 3 -> error
	*/ 
	
	public function verificarUsuarioEmpresa() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->verficarUsuarioEmpresa($post->usuario, $post->clave);
         echo json_encode( $respuesta );
      }
   }
		
	
	/** crearEmpresa : Crea tabla empresa_cif,
      *               Crea caso tcaso claveempresaaccesoporregistro en la tabla claves,               
      *               Crea caso en tcaso empresa en tabla empresa_cif,
      *               Crea caso en tcaso representante en tabla empresa_cif,
      *               Crea tantos casos en tcaso entidad en tabla empresa_cif como elementos tenga el array entidad
	   * 
		* PARAMETROS (post)
		* formulario: array (e_razonsocial, e_nif, e_direccion, e_telefono,e_email, e_web, r_nombre, r_apellidos, r_nif, r_cargo, r_direccion, r_telefono,r_email)
            * array entidades


		* RESPUESTA
      * 0 -> Ok
      * 1 -> tabla ya existe
   */
   public function crearEmpresa() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->crearEmpresa($post->formulario->e_nif);
         if ( $respuesta == 0 ) {
            $clave=$this->ecards->crearCasoTcasoClaveEmpresaAccesoPorRegistro($post->formulario->e_nif,$post->formulario->e_razonsocial);
            $this->ecards->crearCasoTcasoEmpresa($post->formulario->e_nif,$post->formulario->e_razonsocial,$post->formulario->e_direccion,$post->formulario->e_telefono,$post->formulario->e_email,$post->formulario->e_web);
            $this->ecards->crearCasoTcasoRepresentante($post->formulario->e_nif,$post->formulario->r_nombre,$post->formulario->r_apellidos,$post->formulario->r_nif,$post->formulario->r_cargo,$post->formulario->r_direccion,$post->formulario->r_telefono,$post->formulario->r_email);
            $this->ecards->crearCasoTcasoEntidad($post->formulario->e_nif,$post->entidades);                                                         
            $mensaje="BUSINESS CARD. Gracias por darse de alta en nuestra web. Los datos de acceso para entrar  son USUARIO: ".$post->formulario->e_nif." CLAVE: ".$clave."";
            $this->enviarSMS($post->formulario->r_telefono, $mensaje);
         }
            
         echo json_encode( $respuesta );         
      }
   }

   /** leerSectorEmpresa : lee los diferentes sectores de la tabla empresa_cif
    * 
    * PARAMETROS (post)
    * cif
    * RESPUESTA
    * array :sector
   */
   public function leerSectorEmpresa() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->leerSectorEmpresa($post->cif);

         echo json_encode( $respuesta );
      }
   }
   
	/** leerProvinciaEmpresa : lee las diferentes provincias de la tabla empresa_cif
		 * 
		 * PARAMETROS (post)
		 * cif
		 * RESPUESTA
		 * array :provincia
	 */
   public function leerProvinciaEmpresa() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->leerProvinciaEmpresa($post->cif);

         echo json_encode( $respuesta );
      }
   }
   
	/** leerCargosEmpresa : lee los diferentes cargos de la tabla empresa_cif
		 * 
		 * PARAMETROS (post)
		 * cif
		 * RESPUESTA
		 * array :cargo
	 */
   public function leerCargosEmpresa() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->leerCargosEmpresa($post->cif);

         echo json_encode( $respuesta );
	  }
   }
   
   /* ************************* ETIQUETAS **************************/

   /** crearEtiqueta : Crear caso Tcaso Etiqueta  
		* 
		* PARAMETROS (post)
		* nif
		* Nombre
		* apellido
		* apellido2 No obiligatorio
		* direccion
		* tlf
		* email
		* link
		* tipotarjeta
		* color
		* cargo
		* empresa
		* provincia
      * sector
		* 
		* RESPUESTA
		* codigotarjeta
    */
   public function crearEtiqueta() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
			$link = isset($post->link) ? $post->link : '';
         $color = isset($post->color) ? $post->color : '';
         $cargo = isset($post->cargo) ? $post->cargo : '';

			$codigoetiqueta = $this->ecards->crearEtiqueta($post->nif, $link, $post->tipotarjeta,$color,$cargo);
			$apellido2 = isset($post->apellido2) ? $post->apellido2 : '';
			$respuesta = $this->crearDatosObligatorios($post->nif, $post->nombre, $post->apellido, $apellido2,$codigoetiqueta);

			$direccion = isset($post->direccion) ? $post->direccion : '';
			$tlf = isset($post->tlf) ? $post->tlf : '';
			$email = isset($post->email) ? $post->email : '';
			$respuesta = $this->crearDatosComplementarios($post->nif, $direccion, $tlf, $email,$codigoetiqueta);

         echo json_encode( $respuesta );
      }
   }

   /** leerEtiquetas : lee todas las etiquetas de un tipo
		 * 
		 * PARAMETROS (post)
		 * nif
		 * tipotarjeta -> business o particulary
		 * RESPUESTA
		 * array :id etiqueta qr doc color cargo nombre apellido apellido2 tlf email direccion fotos
	 */
   public function leerEtiquetas() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->leerEtiquetas($post->nif,$post->tipotarjeta);

         echo json_encode( $respuesta );
      }
   }
   
   /** leerEtiquetaEnviada :Lee la tarjeta enviada
	 * 
  	 * PARAMETROS (post)
	 * nif tarjeta
	 * id tarjeta
	 * RESPUESTA
	 * array :tipotarjeta color cargo doc nombre apellido apellido2 tlf email direccion fotos 

*/
	public function leerEtiquetaenviada() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->leerEtiquetaenviada($post->id,$post->nif);

         echo json_encode( $respuesta );
      }
   }
   
   /* ************************* TARJETAS **************************/

 	/** crearTarjeta : Crear caso Tcaso Etiqueta  
		* 
		* PARAMETROS (post)
		* nif usuario: Nif del usuario
		* idtarjeta; id tarjeta recibida
		* niftarjeta : nif tarjeta recibida
		* 
		* RESPUESTA
		* codigotarjeta
   */
   public function crearTarjeta() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->ecards->crearTarjeta($post->nifusuario,  $post->idtarjeta,$post->niftarjeta);
         echo json_encode( $respuesta );
      }
   }
   
	/** CrearDoc : Crear dato en tdato doc (el +)
	 * 
  	 * PARAMETROS (post)
	 * nif
    * nombre fichero +
    * codigotarjeta
	 * 
	 * RESPUESTA
	 * O Ok
    */
	 public function crearDoc() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
        
        $rutaCompleta = $this->ecards->subirArchivo($post->nif, 0);

        $this->escribirAdjuntoDoc($post->codigotarjeta, $rutaCompleta,$post->nif);

         echo json_encode( $respuesta );
      }
   }

   /** leerTarjetas : lee todas las tarjetas de un tipo
		 * 
		 * PARAMETROS (post)
		 * nif
		 * tipotarjeta -> business o particulary
		 * RESPUESTA
		 * array :id etiqueta qr color link cargo  sector empresa  doc ciudad nombre apellido apellido2 tlf email direccion fotos sector empresa
	 */
   public function leerTarjetas() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
		  $respuesta = $this->ecards->leerTarjetas($post->nif,$post->tipotarjeta);
         echo json_encode( $respuesta );
      }
   }
   
   /** leerTarjetasFiltrado : lee todas las tarjetas de un tipo con los filtros de sector
		 * 
		 * PARAMETROS (post)
		 * nif
		 * tipotarjeta -> business o particulary
		 * sector: array sector
		 * cargo: array cargo
		 * empresa: array empresa
		 * provincia: array
		 * RESPUESTA
		 * array :id etiqueta qr color link cargo  sector empresa ciudad nombre apellido apellido2 tlf email direccion fotos sector empresa
	 */
	
   public function leerTarjetasFiltrado() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
		  $respuesta = $this->ecards->leerTarjetasFiltrado($post->nif,$post->tipotarjeta,$post->sector,$post->empresa,$post->cargo,$post->provincia);
         echo json_encode( $respuesta );
      }
	}
   
   /* ************************* SERVIDORES **************************/
   /** subirArchivo : Sube los archivos al servidor
    *   
    * 
    * PARAMETROS (post)
	 * codigoetiqueta:
	 * tipo:1 imagen,2 video,3 audio
    */
   public function subirArchivo(){
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));
    
      if( isset($post) ){    
         $codigoetiqueta =$post->codicodigoetiquetagomensaje; 
         $tipo = $post->tipo; 
         
         $rutaCompleta = $this->ecards->subirArchivo($nif, $tipo);

         switch($tipo){
           
            case (1):
               $this->escribirAdjuntoImagen($codigoetiqueta, $rutaCompleta);
            break;
            case (2):
               $this->escribirAdjuntoVideo($codigoetiqueta, $rutaCompleta);
            break;
            case (3):
               $this->escribirAdjuntoAaudio($codigoetiqueta, $rutaCompleta);
            break;
         }
      }

      echo json_encode(0);
   }
   
   private function enviarSMS($telefono, $mensaje) {
		// Envio SMS
		$command = "/home/soa/sms.sh ".$telefono." '".$mensaje."'";
		exec($command);

		return 0;
	}

    /* ************************* ADJUNTOS **************************/

   private function escribirAdjuntoQr($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);

      $this->ecards->escribirAdjuntoQr($codigoetiqueta, $ruta);
      echo json_encode(0);
   }
	private function escribirAdjuntoDoc($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);

      $this->ecards->escribirAdjuntoDoc($codigoetiqueta, $ruta);
      echo json_encode(0);
   }
   private function escribirAdjuntoImagen($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);
  
      $this->ecards->escribirAdjuntoImagen($codigoetiqueta, $ruta);
        echo json_encode(0);
   }
	private function escribirAdjuntoVideo($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);
  
      $thiis->ecards->escribirAdjuntoVideo($codigoetiqueta, $ruta);
        echo json_encode(0);
   }
   private function escribirAdjuntoAudio($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);
  
      $this->ecards->escribirAdjuntoAudio($codigoetiqueta, $ruta);
        echo json_encode(0);
   }

}
