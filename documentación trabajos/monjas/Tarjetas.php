<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tarjetas extends CI_Controller {

   function __construct(){
      parent::__construct();

      $this->load->model('M_tarjetas','tarjetas' , true);
      $this->load->library('email');
   }
   

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
			$respuesta=$this->tarjetas->verificarMaster($post->nif,$post->tlf);
			echo json_encode($respuesta);
		}
	}
	/** verificarUsuario : Verifica si el usuario y la clave existen
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
	public function verificarUsuario() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->tarjetas->verficarUsuario($post->usuario, $post->clave);
         echo json_encode( $respuesta );
      }
   }
		
	/** crearMaster : Crea tabla master, crea caso en tcaso clave y envia sms
		* 
		* PARAMETROS (post)
		* nif
		* nombre 
		* tlf
		*
		* RESPUESTA
		* 0 Ok
	*/
	 public function crearMaster() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
				$respuesta = $this->tarjetas->crearMaster($post->nif);

				if ( $respuesta == 0 ) {// crear clave
               $this->crearClave($post->nif, $post->nombre,$post->tlf);
               $mensaje="CERTIFIED CARDS. Gracias por descargarse la app. Los datos de acceso para usar la app son USUARIO: ".$post->nombre." CLAVE: ".$post->nif."";
               $this->enviarSMS($post->tlf, $mensaje);
            }
            
            echo json_encode( $respuesta );
		}
	 }
	 /** crearDatosObligatorios : Crear caso Tcaso Obligatorios
		* 
		* PARAMETROS
		* nif
		* Nombre
		* apellido
		* apellido2 No obiligatorio
		* codigoEtiqueta
		*
		* RESPUESTA
		* 0 Ok
		* 1 Error
	*/
	private function crearClave($nif,$nombre,$tlf) {
		$respuesta = $this->tarjetas->crearClave($nif, $nombre, $tlf);
		return $respuesta;
	}
	/** crearDatosObligatorios : Crear caso Tcaso Obligatorios
		* 
		* PARAMETROS
		* nif
		* Nombre
		* apellido
		* apellido2 No obiligatorio
		* codigoEtiqueta
		*
		* RESPUESTA
		* 0 Ok
		* 1 Error
	*/
	 private function crearDatosObligatorios($nif,$nombre,$apellido,$apellido2,$codigoetiqueta) {
		$apellido2 = isset($post->apellido2) ? $post->apellido2 : '';
		$respuesta = $this->tarjetas->crearDatosObligatorios($nif, $nombre, $apellido, $apellido2, $codigoetiqueta);
		return($respuesta);
	}
	/** crearDatosComplementarios : Crea caso Tcaso Complementarios
		* 
		* PARAMETROS
		* nif
		* direccion
		* tlf
		* email
		* codigoetiqueta
		*
		* RESPUESTA
		* 0 Ok
		* 1 Error
	*/
	private function crearDatosComplementarios($nif,$direccion,$tlf,$email,$codigoetiqueta) {
		$direccion = isset($post->direccion) ? $post->direccion : '';
		$tlf = isset($post->tlf) ? $post->tlf : '';
		$email = isset($post->email) ? $post->email : '';
		$respuesta = $this->tarjetas->crearDatosComplementarios($post->nif, $direccion, $tlf, $email, $post->codigoetiqueta);
		return($respuesta);
	}
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

			$codigoetiqueta = $this->tarjetas->crearEtiqueta($post->nif, $link, $post->tipotarjeta,$color,$cargo);
			$apellido2 = isset($post->apellido2) ? $post->apellido2 : '';
			$respuesta = $this->crearDatosObligatorios($post->nif, $post->nombre, $post->apellido, $apellido2,$codigoetiqueta);

			$direccion = isset($post->direccion) ? $post->direccion : '';
			$tlf = isset($post->tlf) ? $post->tlf : '';
			$email = isset($post->email) ? $post->email : '';
			$respuesta = $this->crearDatosComplementarios($post->nif, $direccion, $tlf, $email,$codigoetiqueta);

         echo json_encode( $respuesta );
      }
   }
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
         $respuesta = $this->tarjetas->crearTarjeta($post->nifusuario,  $post->idtarjeta,$post->niftarjeta);
         echo json_encode( $respuesta );
      }
   }
   /** CrearQr : Crear dato en tdato qr
	 * 
  	 * PARAMETROS (post)
	 * nif
    * nombre fichero qr
    * codigotarjeta
	 * 
	 * RESPUESTA
	 * O Ok
    */
   public function crearQr() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
        
        $rutaCompleta = $this->tarjetas->subirArchivo($post->nif, 0);

        $this->escribirAdjuntoQr($post->codigotarjeta, $rutaCompleta,$post->nif);

         echo json_encode( $respuesta );
      }
   }

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
         
         $rutaCompleta = $this->tarjetas->subirArchivo($nif, $tipo);

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
   
   private function escribirAdjuntoQr($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);

      $this->tarjetas->escribirAdjuntoQr($codigoetiqueta, $ruta);
      echo json_encode(0);
   }

   private function escribirAdjuntoImagen($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);
  
      $this->tarjetas->escribirAdjuntoImagen($codigoetiqueta, $ruta);
        echo json_encode(0);
   }
	private function escribirAdjuntoVideo($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);
  
      $thiis->tarjetas->escribirAdjuntoVideo($codigoetiqueta, $ruta);
        echo json_encode(0);
   }
   private function escribirAdjuntoAudio($codigoetiqueta, $rutaCompleta){
      $ruta = str_replace(["SLASH", "DPUNTO", "PUNTO"], ['/', ':', '.'], $rutaCompleta);
  
      $this->tarjetas->escribirAdjuntoAudio($codigoetiqueta, $ruta);
        echo json_encode(0);
   }

	/** leerEtiquetas : lee todas las etiquetas de un tipo
		 * 
		 * PARAMETROS (post)
		 * nif
		 * tipotarjeta -> business o particulary
		 * RESPUESTA
		 * array :id etiqueta qr color cargo nombre apellido apellido2 tlf email direccion fotos
	 */
   public function leerEtiquetas() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->tarjetas->leerEtiquetas($post->nif,$post->tipotarjeta);

         echo json_encode( $respuesta );
      }
	}
	 /** leerTarjetas : lee todas las tarjetas de un tipo
		 * 
		 * PARAMETROS (post)
		 * nif
		 * tipotarjeta -> business o particulary
		 * RESPUESTA
		 * array :id etiqueta qr color link cargo  sector empresa ciudad nombre apellido apellido2 tlf email direccion fotos sector empresa
	 */
   public function leerTarjetas() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
        // $respuesta = $this->tarjetas->leerTarjetas($post->nif,$post->tipotarjeta);
		  $respuesta = $this->tarjetas->leerTarjetas($post->nif,$post->tipotarjeta);
		//  $respuesta = $this->tarjetas->leerTarjetas($post->nif);
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
        // $respuesta = $this->tarjetas->leerTarjetas($post->nif,$post->tipotarjeta);
		  $respuesta = $this->tarjetas->leerTarjetasFiltrado($post->nif,$post->tipotarjeta,$post->sector,$post->empresa,$post->cargo,$post->provincia);
		//  $respuesta = $this->tarjetas->leerTarjetas($post->nif);
         echo json_encode( $respuesta );
      }
	}
	 
	/** leerEtiquetaEnviada :Lee la tarjeta enviada
	 * 
  	 * PARAMETROS (post)
	 * nif tarjeta
	 * id tarjeta
	 * RESPUESTA
	 * array :tipotarjeta color cargo nombre apellido apellido2 tlf email direccion fotos 
     */
	public function leerEtiquetaenviada() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
         $respuesta = $this->tarjetas->leerEtiquetaenviada($post->id,$post->nif);

         echo json_encode( $respuesta );
      }
	}
	
	private function enviarSMS($telefono, $mensaje) {
		// Envio SMS
		$command = "gsmsendsms -d /dev/ttyUSB0 ".$telefono." '".$mensaje."'";
		exec($command);

		return 0;
	}

	// public function test() {
	// 	echo password_hash('66666', PASSWORD_DEFAULT);
	// }
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
	/** crearEmpresa : Crea tabla empresa_cif,
      *               Crea caso tcaso claveempresaaccesoporregistro en la tabla claves,               
      *               Crea caso en tcaso empresa en tabla empresa_cif,
      *               Crea caso en tcaso representante en tabla empresa_cif,
      *               Crea tantos casos en tcaso entidad en tabla empresa_cif como elementos tenga el array entidad
	   * 
      * PARAMETROS (post)
      * cif
      * razonsocial (empresa)
      * direccion_empr
      * telefono_empr
      * email_empr
      * web
      * nombre
      * apellidos
      * nif
      * cargo
      * direccion_rep
      * telefono_rep
      * email_rep
      * array entidad


		* RESPUESTA
      * 0 -> Ok
      * 1 -> tabla ya existe
   */
	public function crearEmpresa() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
		   $respuesta = $this->tarjetas->crearEmpresa($post->cif);
         if ( $respuesta == 0 ) {
            $this->tarjetas->crearCasoTcasoClaveEmpresaAccesoPorRegistro($post->cif,$post->empresa);
            $this->tarjetas->crearCasoTcasoEmpresa($post->cif,$post->empresa,$post->direccion_empr,$post->telefono_empr,
                                                         $post->email_empr,$post->web);
            $this->tarjetas->crearCasoTcasoRepresentante($post->cif,$post->nombre,$post->apellidos,$post->nif,
                                                         $post->cargo,$post->direccion_rep,$post->telefono_rep,$post->email_rep);
            $this->tarjetas->crearCasoTcasoEntidad($post->cif,$post->empresa,$post->entidad);                                                         
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
         $respuesta = $this->tarjetas->leerSectorEmpresa($post->cif);

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
         $respuesta = $this->tarjetas->leerProvinciaEmpresa($post->cif);

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
         $respuesta = $this->tarjetas->leerCargosEmpresa($post->cif);

         echo json_encode( $obj );
	  }
	}
	  

}
