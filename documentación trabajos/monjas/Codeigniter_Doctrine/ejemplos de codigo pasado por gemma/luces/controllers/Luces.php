<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Luces extends CI_Controller {
   private $TRB_RASPBERRYDALI="raspberrydali";
   private $TRB_RASPBERRSD="raspberrysd";

   private $TP_S_ESTADOZONA1="155";
   private $TP_S_INTESIDADZONA1="135";
   private $TP_S_RGBZONA1="136";
   private $TP_S_ESTADOZONA2="156";
   private $TP_S_INTESIDADZONA2="143";
   private $TP_S_RGBZONA2="144";
   private $TP_S_ESTADOZONA3="154";
   private $TP_S_INTESIDADZONA3="127";


   function __construct() {
      parent::__construct();
      
      $this->load->model('luces/M_luces','Mluces',true);
   }

   public function leerNombreEscenas() {

      $valor = $this->Mluces->leerNombreEscenas();//ok
      foreach($valor as $key => $value) {
         $escenas[$key] = array('id' => $valor[$key]->codigoescena, 'nemo' => $valor[$key]->nemo);
		}
      echo json_encode( $escenas );
   }

   function cargarEscenas(){
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){
            $valor = $post->id;
			$escenas = $this->Mluces->cargarEscenas($post->id);//ok
			foreach($escenas as $key => $value) {
				$zona=$escenas[$key]->codigozona;
				switch ($zona){
					case 1:
						$estadoZona1 = $escenas[$key]->estado;
						$intensidadZona1 = $escenas[$key]->intensidad;
						$rgbzona1 = explode("$", $escenas[$key]->rgb);
					break;

					case 2:
						$estadoZona2 = $escenas[$key]->estado;
						$intensidadZona2 = $escenas[$key]->intensidad;
						$rgbzona2 = explode("$", $escenas[$key]->rgb);
					break;
					case 3:
                        $estadoZona3 = $escenas[$key]->estado;
                        $intensidadZona3 = $escenas[$key]->intensidad;
					break;
				}

			}

         if ($estadoZona1 == 1) {
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD,$this->TP_S_ESTADOZONA1, '1');
            $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_INTESIDADZONA1, $intensidadZona1);
            $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,$this->TP_S_RGBZONA1, $rgbzona1[0], $rgbzona1[1], $rgbzona1[2]);
         }
         else
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD,$this->TP_S_ESTADOZONA1, '0');

         /*
          * Enviamos zona 2
          */
         if ($estadoZona2 == 1) {
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA2, '1');
            $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_INTESIDADZONA2, $intensidadZona2);
            $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_RGBZONA2, $rgbzona2[0], $rgbzona2[1], $rgbzona2[2]);
         }
         else
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA2, '0');

        if ($estadoZona3 == 1) {
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA3, '1');
            $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_INTESIDADZONA3, $intensidadZona3);
         }
         else
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA3, '0');
    
         /*
          * Enviamos zona 3
          */

         $respuesta = array(
            'estadoZona1' => $estadoZona1,
            'estadoZona2' => $estadoZona2,
            'estadoZona3' => $estadoZona3,
            'intensidadZona1' => $intensidadZona1,
            'intensidadZona2' => $intensidadZona2,
            'intensidadZona3' => $intensidadZona3,
            'rgbZona1' => $rgbzona1[0].','.$rgbzona1[1].','.$rgbzona1[2],
            'rgbZona2' => $rgbzona2[0].','.$rgbzona2[1].','.$rgbzona2[2]
         );

         echo json_encode( $respuesta );
      }
   }
   function obtenerEscenaActual(){
		$valor = $this->Mluces->obtenerEscenaActual();//ok
      $resultado = array('escena' => $valor);

      echo json_encode($resultado);
   }
   function encenderApagarLucesGeneral() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));

      if( isset($post) ){

         /*
          * Enviamos zona 1
          */
         // if ($post->estadoZona1 == 1) {
         //   $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,$this->TP_S_INTESIDADZONA1, $post->intensidadZona1);
         //   $rgbzona1 = explode("$", $post->rgbZona1);
         //   $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_RGBZONA1, $rgbzona1[0], $rgbzona1[1], $rgbzona1[2]);
         // }
         // else
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA1, $post->estadoZona1);

	      /*
          * Enviamos zona 2
          */
         // if ($post->estadoZona2 == 1) {
         //    $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_INTESIDADZONA2, $post->intensidadZona2);
         //    $rgbzona2 = explode("$", $post->rgbZona2);
         //    $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_RGBZONA2, $rgbzona2[0], $rgbzona2[1], $rgbzona2[2]);
         // }
         // else
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA2, $post->estadoZona2);

         /*
          * Enviamos zona 3
          */
         // if ($post->estadoZona3 == 1) {
         //    $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_INTESIDADZONA3, $post->intensidadZona3);
         // }
         // else
            $this->llamadaRpcSalidas($this->TRB_RASPBERRSD,  $this->TP_S_ESTADOZONA3, $post->estadoZona3);

         echo json_encode(0);
      }
   }

   function escribirIntensidadZona( ){
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));
      if( isset($post) ){
         $intensidad = $post->valor;
         $zona = $post->zona;
         $valorrgb=$post->rgb;
         $rgb = explode("$", $valorrgb);

         switch ($zona) {
            case 1:
               $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_INTESIDADZONA1, $intensidad);
            break;
            case 2:
               $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_INTESIDADZONA2, $intensidad);
            break;
            case 3:
               $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_INTESIDADZONA3, $intensidad);
            break;
         }
      }

      echo json_encode(0);
   }

   function escribirApagadoEncendidoZona(){
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));
      if( isset($post) ){
         echo json_encode(0);

         $valor = $post->valor;
         $zona = $post->zona;
         $intensidad= $post->intensidad;

         switch ($zona) {
            case 1:
               if ($valor == 0)
                  $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA1, $valor);
               else {
                  $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA1, $valor);
                  // usleep(300000);
                  // $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_INTESIDADZONA1, $intensidad);
               }
            break;
            case 2:
               if ($valor == 0)
                  $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA2, $valor);
               else {
                  $this->llamadaRpcSalidas($this->TRB_RASPBERRSD,  $this->TP_S_ESTADOZONA2, $valor);
                  // usleep(300000);
                  // $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_INTESIDADZONA2, $intensidad);
               }
            break;
            case 3:
               if ($valor == 0)
                  $this->llamadaRpcSalidas($this->TRB_RASPBERRSD, $this->TP_S_ESTADOZONA3, $valor);
               else {
                  $this->llamadaRpcSalidas($this->TRB_RASPBERRSD,  $this->TP_S_ESTADOZONA3, $valor);
                  // usleep(300000);
                  // $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_INTESIDADZONA3, $intensidad);
               }
            break;
         }
      }
   }

   function EscribirColorZona() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));
      if( isset($post) ){
         $intensidad = $post->intensidad;
         $zona = $post->zona;
         $valorrgb=$post->rgb;
         $rgb = explode("$", $valorrgb);

         switch ($zona) {
            case 1:
               $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_RGBZONA1, $rgb[0], $rgb[1], $rgb[2]);
            break;
            case 2:
               $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_RGBZONA2, $rgb[0], $rgb[1], $rgb[2]);
            break;
         }

         echo json_encode(0);
   	}
   }

   function reprogramarEscena() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));
      if( isset($post) ){
         $this->Mluces->reprogramarEscena(
            $post->escenaId,
            $post->valores->estadoZona1,
            $post->valores->estadoZona2,
            $post->valores->estadoZona3,
            $post->valores->intensidadZona1,
            $post->valores->intensidadZona2,
            $post->valores->intensidadZona3,
            $post->valores->rgbZona1,
            $post->valores->rgbZona2);
         echo json_encode(0);
   	}
   }
	function crearEscena() {
      $post = json_decode($this->security->xss_clean($this->input->raw_input_stream));
      if( isset($post) ){
         $this->Mluces->crearEscena(
            $post->escenaNemo,
				$post->estadoZona1,
				$post->estadoZona2,
				$post->estadoZona3,
				$post->intensidadZona1,
				$post->intensidadZona2,
				$post->intensidadZona3,
				$post->rgbZona1,
				$post->rgbZona2);
         echo json_encode(0);
   	}
   }
   function actualizarLucesZonas() {
      $valor = $this->Mluces->leerZonaLuces();//ok

      $zona1 = array('estado' => $valor[0]->estado, 'intensidad' => $valor[0]->intensidad, 'rgb' => str_replace('$',',',$valor[0]->rgb));
      $zona2 = array('estado' => $valor[1]->estado, 'intensidad' => $valor[1]->intensidad, 'rgb' => str_replace('$',',',$valor[1]->rgb));
      $zona3 = array('estado' => $valor[2]->estado,'intensidad' => $valor[2]->intensidad);
      $escena = $this->Mluces->obtenerEscenaActual();//ok


      $resultado = array('zona1' => $zona1, 'zona2' => $zona2,  'zona3' => $zona3, 'escena' => $escena);

      echo json_encode($resultado);
   }

   public function llamadaRpcSalidas() {
      $args = func_get_args();
      $valores = array();

      foreach ($args as $key => $value) {
         array_push($valores, strval($value));
      }
      $request = xmlrpc_encode_request('FBFK_salidas_rpc_libsoav1', $valores);
      $url = "http://192.168.1.30:457/RPC2";
      $header[] = "Content-type: text/xml";
      $header[] = "Content-length: ".strlen($request);

      $ch = curl_init();
      curl_setopt($ch, CURLOPT_URL, $url);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_TIMEOUT, 1);
      curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $request);

      $data = curl_exec($ch);
      
      // if (curl_errno($ch)) {
      //    print curl_error($ch);
      // } else {
      //    curl_close($ch);
      //    print($data);
      //    return $data;
      // }
      
   }

   public function rpc($trb, $tp, $valor) {
      $this->llamadaRpcSalidas($trb, $tp, $valor);
   }


   // TODO: ini 14042021
   //Estas funciones las he puesto en este archivo que me pasó Gemma para tenerlas documentadas.
   /** cambiarColorLuzZona: cambia el color de la luz de la zona
      *
      * PARAMETROS (data)
      *  id
      *	id_zona
      *	color
      *
      * RESPUESTA
   */
   function cambiarColorLuzZona() {
      $request = service('request');
      $data = $request->getJSON();

      // if( isset($data->id) && isset($data->color) && isset($data->id_zona) && isset($data->intensidad)) {
         // $borna = 2;
         // $valorrgb=$data->color;
         // $rgb = explode("$", $valorrgb);

         // switch ($data->id_zona) {
         //    case 1:
         //       $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_DALI1, $rgb[0], $rgb[1], $rgb[2],$borna);
         //    break;
         //    case 2:
         //       $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI, $this->TP_S_DALI2, $rgb[0], $rgb[1], $rgb[2],$borna);
         //    break;
         //    case 3:
         //       $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_DALI3, $rgb[0], $rgb[1], $rgb[2],$borna);
         //    break;
         //    case 4:
         //       $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_DALI4, $rgb[0], $rgb[1], $rgb[2],$borna);
         //    break;
         // }
         
         $obj = (object) array('code' => 0 );
         return $this->response->setStatusCode(200)->setJSON( $obj);
      // } else {
      //    $res = (object) array('code' =>400);
      //    return $this->response->setStatusCode(400)->setJSON( $res);
      // }
   }

   /** cambiarIntensidadCompletoLuzZona: cambia el color y la intensidad de la luz de la zona
      *
      * PARAMETROS (data)
      *  id
      *	id_zona
      *	color
      *  intensidad
      *
      * RESPUESTA
   */
   function cambiarIntensidadCompletoLuzZona() {
      $request = service('request');
      $data = $request->getJSON();

      // if( isset($data->id) && isset($data->color) && isset($data->id_zona) && isset($data->intensidad)) {
         //para probar  (probado el 14042021 y ha funcionado todo ok)
         $borna = 3;
         $valorrgb="255$255$255";
         $intensidad=50/100;
         //Por cada color hay que multiplicar el valor de cada RGB por la intensidad/100
         $rgb = explode("$", $valorrgb);
         $rgb[0] = $rgb[0]*$intensidad;
         $rgb[1] = $rgb[1]*$intensidad;
         $rgb[2] = $rgb[2]*$intensidad;
         // preparamos los valores

         //hay que programar un dali salida para cada color en la borna 3 (por tanto tenemos 3TPs (rojo, verde, azul) )
         $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_DALI1, $rgb[0], $borna);//rojo
         $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_DALI2, $rgb[1], $borna);//verde
         $this->llamadaRpcSalidas($this->TRB_RASPBERRYDALI,  $this->TP_S_DALI3, $rgb[2], $borna);//azul

         $obj = (object) array('code' => 0 );
         return $this->response->setStatusCode(200)->setJSON( $obj);
      // } else {
      //    $res = (object) array('code' =>400);
      //    return $this->response->setStatusCode(400)->setJSON( $res);
      // }
   }
   // TODO: fin 14042021
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
