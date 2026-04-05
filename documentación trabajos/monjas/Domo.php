<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Domo extends CI_Controller {
   private $TRB_RASPBERRYDALI="raspberrydali";
   private $TRB_RASPBERRSD="raspberrysd";

   /***********************CLIMA PLANTA*********************/
   //planta 1 clima (hab_principal, hab_nino, hab_nina, pasillo (tiene 2),vestidor (tiene 2))
   private $TP_CLIMA_PLANTA1=array("29","84","155","219","221","280","282");
   //planta recepcion clima (invitados1,invitados2,despacho,salajuegos,salon comedor,pasillo,cocina)
   private $TP_CLIMA_PLANTA0=array("328","392","511","640","722","865","1293");
   //planta sotano clima (salonjuegos, gimnasio)
   private $TP_CLIMA_SOTANO=array("1396","1502");

   /***********************IOT PLANTA*********************/
   //planta 1 iot
   private $TP_IOT_PLANTA1=array("6","7","8","9",//hab_principal
                              "60","61","62","63",//hab_nino
                              "130","131","132","133",//hab_nina
                              "205","206","207","208",//pasillo
                              "271","272");//vestidor

   //planta recepcion iot
   private $TP_IOT_PLANTA0=array("308","309","310","311","312",//invitados1
                                 "370","371","372","373",//invitados2
                                 "506","507","508",//despacho
                                 "624","625","626","627",//salajuegos
                                 "857","858","859","860",//pasillo
                                 "1277","1278","1279","1280","1281","1282");//cocina

   //planta sotano iot
   private $TP_IOT_SOTANO=array("1381","1382","1383","1384","1385","1386","1387","1388","1389",//salonjuegos
                              "1487","1488","1489","1490",//gimnasio
                              "1844","1845",//garaje
                              "1676","1677","1678");//spa

   /***********************IOT PLANTA ESTANCIA*********************/
   //planta 1 iot
   private $TP_I_PRINCIPAL=array("6","7","8","9");//hab_principal
   private $TP_I_NINO=array("60","61","62");//hab_nino hab 
   private $TP_I_NINO_BANO=array("63");//hab_nino bano
   private $TP_I_NINA=array("130","131","132");//hab_nina hab
   private $TP_I_NINA_BANO=array("133");//hab_nina bano
   private $TP_I_PASILLO1=array("205","206");//pasillo
   private $TP_I_PASILLO2=array("207","208");//pasillo sala estar
   private $TP_I_VESTIDOR=array("271","272");//vestidor bano

   //planta recepcion iot
   private $TP_I_INVITADOS1=array("308","309","310","311");//invitados1
   private $TP_I_INVITADOS1_BANO=array("312");//invitados1 bano
   private $TP_I_INVITADOS2=array("370","371","372");//invitados2
   private $TP_I_INVITADOS2_BANO=array("373");//invitados2
   private $TP_I_DESPACHO=array("506","507","508");//despacho
   private $TP_I_SALAJUEGOS=array("624","625","626","627");//sala juegos
   private $TP_I_PASILLO0=array("857","858","859","860");//pasillo
   private $TP_I_COCINA=array("1277","1278","1279","1280","1281","1282");//cocina

   //planta sotano iot
   private $TP_I_SALONJUEGOS1=array("1381","1382","1383","1384","1385","1386","1387","1388","1389");//salonjuegos
   private $TP_I_GIMNASIO=array("1487","1488","1489","1490");//gimnasio
   private $TP_I_GARAJE=array("1844","1845");//garaje
   private $TP_I_SPA1=array("1676");//spa
   private $TP_I_SPA2=array("1677","1678");//spa vest-patio ingles

   function __construct() {
      parent::__construct();
      
      $this->load->model('domo/M_domo','Mdomo',true);
   }

  
   function actualizacionPlantas() {
      //luces planta 1
      $luces_pta1 = $this->Mdomo->leerZonaLuces(1);

      //luces planta recepcion
      $luces_pta0 = $this->Mdomo->leerZonaLuces(0);

      //luces planta sotano
      $luces_ptas = $this->Mdomo->leerZonaLuces(2);

      //clima planta 1
      $clima_pta1 = $this->Mdomo->leerClima($this->TP_CLIMA_PLANTA1);

      //clima planta recepcion
      $clima_pta0 = $this->Mdomo->leerClima($this->TP_CLIMA_PLANTA0);

      //clima planta sotano
      $clima_ptas = $this->Mdomo->leerClima($this->TP_CLIMA_SOTANO);

      //iot planta 1
      $iot_pta1 = $this->Mdomo->leerIot($this->TP_IOT_PLANTA1);

      //iot planta recepcion
      $iot_pta0 = $this->Mdomo->leerIot($this->TP_IOT_PLANTA0);

      //iot planta sotano
      $iot_ptas = $this->Mdomo->leerIot($this->TP_IOT_SOTANO);

      $pt1 = array('luz' => $luces_pta1,'clima'=>$clima_pta1,'iot'=>$iot_pta1,'candado'=>0);
      $pt0 = array('luz' => $luces_pta0,'clima'=>$clima_pta0,'iot'=>$iot_pta0,'candado'=>1);
      $pts = array('luz' => $luces_ptas,'clima'=>$clima_ptas,'iot'=>$iot_ptas,'candado'=>0);

      $resultado = array('pt1' => $pt1, 'pt0' => $pt0, 'pts' => $pts);

      echo json_encode($resultado);
   }
   function actualizacionEstanciasPlantas() {

      // Falta temperatura de todas los sitios 

      //luces estancias planta1
      $luces_pta1_est1 = $this->Mdomo->leerEstanciasLuces(1,10);//hab_principal
      $luces_pta1_est2 = $this->Mdomo->leerEstanciasLuces(1,11);//hab_nino hab
      $luces_pta1_est3 = $this->Mdomo->leerEstanciasLuces(1,12);//hab_nino bano
      $luces_pta1_est4 = $this->Mdomo->leerEstanciasLuces(1,13);//hab_nina hab
      $luces_pta1_est5 = $this->Mdomo->leerEstanciasLuces(1,14);//hab_nina bano
      $luces_pta1_est6 = $this->Mdomo->leerEstanciasLuces(1,15);//pasillo
      $luces_pta1_est7 = $this->Mdomo->leerEstanciasLuces(1,16);//sala estar
      $luces_pta1_est8 = $this->Mdomo->leerEstanciasLuces(1,17);//vestidor
      $luces_pta1_est9 = $this->Mdomo->leerEstanciasLuces(1,18);//vestidor bano

      //luces estancias planta recepcion
      $luces_pta0_est1 = $this->Mdomo->leerEstanciasLuces(1,0);//invitados1 hab
      $luces_pta0_est2 = $this->Mdomo->leerEstanciasLuces(1,1);//invitados1 bano
      $luces_pta0_est3 = $this->Mdomo->leerEstanciasLuces(1,2);//invitados2 hab
      $luces_pta0_est4 = $this->Mdomo->leerEstanciasLuces(1,3);//invitados2 bano
      $luces_pta0_est5 = $this->Mdomo->leerEstanciasLuces(1,4);//despacho
      $luces_pta0_est6 = $this->Mdomo->leerEstanciasLuces(1,5);//sala juegos
      $luces_pta0_est7 = $this->Mdomo->leerEstanciasLuces(1,6);//comedor
      $luces_pta0_est8 = $this->Mdomo->leerEstanciasLuces(1,7);//salon
      $luces_pta0_est9 = $this->Mdomo->leerEstanciasLuces(1,8);//pasillo
      $luces_pta0_est9 = $this->Mdomo->leerEstanciasLuces(1,9);//pasillo bano
      $luces_pta0_est10 = $this->Mdomo->leerEstanciasLuces(1,19);//cocina

      //luces estancias sotano
      $luces_ptas_est1 = $this->Mdomo->leerEstanciasLuces(1,20);//salon juegos
      $luces_ptas_est2 = $this->Mdomo->leerEstanciasLuces(1,21);//gimnasio
      $luces_ptas_est3 = $this->Mdomo->leerEstanciasLuces(1,22);//spa 
      $luces_ptas_est4 = $this->Mdomo->leerEstanciasLuces(1,23);//spa vest-patioingles
      $luces_ptas_est5 = $this->Mdomo->leerEstanciasLuces(1,24);//garaje


      // clima estancias planta1
      $clima_pta1_est1 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA1[0]);//hab_principal
      $clima_pta1_est2 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA1[1]);//hab_nino
      $clima_pta1_est3 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA1[2]);//hab_nina
      $clima_pta1_est4 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA1[3]);//pasillo
      if(intval($clima_pta1_est4)==0)
         $clima_pta1_est4 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA1[4]);//pasillo sala
      
      $clima_pta1_est5 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA1[5]);//vestidor
      if(intval($clima_pta1_est5)==0)
         $clima_pta1_est5 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA1[5]);//vestidor bano

      // clima estancias planta recepcion
      $clima_pta0_est1 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA0[0]);//invitados1
      $clima_pta0_est2 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA0[1]);//invitados2
      $clima_pta0_est3 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA0[2]);//despacho
      $clima_pta0_est4 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA0[3]);//salajuegos
      $clima_pta0_est5 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA0[4]);//salon comedor
      $clima_pta0_est6 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA0[5]);//pasillo
      $clima_pta0_est7 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_PLANTA0[6]);//cocina

      // clima estancias planta sotano
      $clima_ptas_est1 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_SOTANO[0]);//salon juegos
      $clima_ptas_est2 = $this->Mdomo->leerEstanciaClima($this->TP_CLIMA_SOTANO[1]);//gimnasio
            
      // iot estancias planta1
      $iot_pta1_est1 = $this->Mdomo->leerIot($this->TP_I_PRINCIPAL);
      $iot_pta1_est2 = $this->Mdomo->leerIot($this->TP_I_NINO);
      $iot_pta1_est3 = $this->Mdomo->leerIot($this->TP_I_NINO_BANO);
      $iot_pta1_est4 = $this->Mdomo->leerIot($this->TP_I_NINA);
      $iot_pta1_est5 = $this->Mdomo->leerIot($this->TP_I_NINA_BANO);
      $iot_pta1_est6 = $this->Mdomo->leerIot($this->TP_I_PASILLO1);
      $iot_pta1_est7 = $this->Mdomo->leerIot($this->TP_I_PASILLO2);
      $iot_pta1_est8 = $this->Mdomo->leerIot($this->TP_I_VESTIDOR);

      // iot estancias planta recepcion
      $iot_pta0_est1 = $this->Mdomo->leerIot($this->TP_I_INVITADOS1);
      $iot_pta0_est2 = $this->Mdomo->leerIot($this->TP_I_INVITADOS1_BANO);
      $iot_pta0_est3 = $this->Mdomo->leerIot($this->TP_I_INVITADOS2);
      $iot_pta0_est3_1 = $this->Mdomo->leerIot($this->TP_I_INVITADOS2_BANO);

      $iot_pta0_est4 = $this->Mdomo->leerIot($this->TP_I_DESPACHO);
      $iot_pta0_est5 = $this->Mdomo->leerIot($this->TP_I_SALAJUEGOS);
      $iot_pta0_est6 = $this->Mdomo->leerIot($this->TP_I_PASILLO0);
      $iot_pta0_est7 = $this->Mdomo->leerIot($this->TP_I_COCINA);

      // iot estancias planta sotano
      $iot_ptas_est1 = $this->Mdomo->leerIot($this->TP_I_SALONJUEGOS1);
      $iot_ptas_est2 = $this->Mdomo->leerIot($this->TP_I_GIMNASIO);
      $iot_ptas_est3 = $this->Mdomo->leerIot($this->TP_I_SPA1);
      $iot_ptas_est4 = $this->Mdomo->leerIot($this->TP_I_SPA2);
      $iot_ptas_est5 = $this->Mdomo->leerIot($this->TP_I_GARAJE);

      $estancia1 = array('luz' => $luces_pta1_est1,'clima'=>$clima_pta1_est1,'iot'=>$iot_pta1_est1,'temperatura'=>"24");//hab_principal
      $estancia2 = array('luz' => $luces_pta1_est2,'clima'=>$clima_pta1_est2,'iot'=>$iot_pta1_est2,'temperatura'=>"24");//hab_nino hab
      $estancia3 = array('luz' => $luces_pta1_est3,'clima'=>$clima_pta1_est2,'iot'=>$iot_pta1_est3,'temperatura'=>"24");//hab_nino bano
      $estancia4 = array('luz' => $luces_pta1_est4,'clima'=>$clima_pta1_est3,'iot'=>$iot_pta1_est4,'temperatura'=>"24");//hab_nina hab
      $estancia5 = array('luz' => $luces_pta1_est5,'clima'=>$clima_pta1_est3,'iot'=>$iot_pta1_est5,'temperatura'=>"24");//hab_nina bano
      $estancia6 = array('luz' => $luces_pta1_est6,'clima'=>$clima_pta1_est5,'iot'=>$iot_pta1_est6,'temperatura'=>"24");//pasillo
      $estancia7 = array('luz' => $luces_pta1_est7,'clima'=>$clima_pta1_est5,'iot'=>$iot_pta1_est7,'temperatura'=>"24");//sala estar
      $estancia8 = array('luz' => $luces_pta1_est8,'clima'=>$clima_pta1_est5,'iot'=>0,'temperatura'=>"24");//vestidor
      $estancia9 = array('luz' => $luces_pta1_est9,'clima'=>$clima_pta1_est5,'iot'=>$iot_pta1_est8,'temperatura'=>"24");//vestidor bano
      
      $pt1 = array($estancia1,$estancia9,$estancia8,$estancia6,$estancia7,$estancia2,$estancia3,$estancia4,$estancia5);
      

      $estancia10 = array('luz' => $luces_pta0_est1,'clima'=>$clima_pta0_est1,'iot'=>$iot_pta0_est1,'temperatura'=>"24");//invitados1 hab
      $estancia11 = array('luz' => $luces_pta0_est2,'clima'=>$clima_pta0_est1,'iot'=>$iot_pta0_est2,'temperatura'=>"24");//invitados1 bano
      $estancia12 = array('luz' => $luces_pta0_est3,'clima'=>$clima_pta0_est2,'iot'=>$iot_pta0_est3,'temperatura'=>"24");//invitados2 hab
      $estancia13 = array('luz' => $luces_pta0_est4,'clima'=>$clima_pta0_est2,'iot'=>$iot_pta0_est3_1,'temperatura'=>"24");//invitados2 bano
      $estancia14 = array('luz' => $luces_pta0_est5,'clima'=>$clima_pta0_est3,'iot'=>$iot_pta0_est4,'temperatura'=>"24");//despacho
      $estancia15 = array('luz' => $luces_pta0_est6,'clima'=>$clima_pta0_est4,'iot'=>$iot_pta0_est5,'temperatura'=>"24");//sala juegos
      $estancia16 = array('luz' => $luces_pta0_est7,'clima'=>$clima_pta0_est5,'iot'=>0,'temperatura'=>"24");//comedor
      $estancia17 = array('luz' => $luces_pta0_est8,'clima'=>$clima_pta0_est5,'iot'=>0,'temperatura'=>"24");//salon
      $estancia18 = array('luz' => $luces_pta0_est9,'clima'=>$clima_pta0_est6,'iot'=>$iot_pta0_est6,'temperatura'=>"24");//pasillo
      $estancia19 = array('luz' => $luces_pta0_est9,'clima'=>$clima_pta0_est6,'iot'=>0,'temperatura'=>"24");//pasillo bano
      $estancia20 = array('luz' => $luces_pta0_est10,'clima'=>$clima_pta0_est7,'iot'=>$iot_pta0_est7,'temperatura'=>"24");//cocina
      $pt0 = array($estancia14,$estancia15,$estancia18,$estancia19,$estancia17,$estancia20,$estancia16,$estancia10,$estancia11,$estancia12,$estancia13);

      $estancia21 = array('luz' => $luces_ptas_est1,'clima'=>$clima_ptas_est1,'iot'=>$iot_ptas_est1,'temperatura'=>"24");//salon juegos
      $estancia22 = array('luz' => $luces_ptas_est2,'clima'=>$clima_ptas_est2,'iot'=>$iot_ptas_est2,'temperatura'=>"24");//gimnasio
      $estancia23 = array('luz' => $luces_ptas_est3,'clima'=>0,'iot'=>$iot_ptas_est3,'temperatura'=>"24");//spa
      $estancia24 = array('luz' => $luces_ptas_est4,'clima'=>0,'iot'=>$iot_ptas_est4,'temperatura'=>"24");//spa vest-patio ingles
      $estancia25 = array('luz' => $luces_ptas_est5,'clima'=>0,'iot'=>$iot_ptas_est5,'temperatura'=>"24");//garaje
      $pts = array($estancia21,$estancia24,$estancia2,$estancia23,$estancia22);

/*
      $pt1 = array('estancia1'=>0,'luz1' => $luces_pta1_est1,'clima1'=>$clima_pta1_est1,'iot1'=>$iot_pta1_est1,//hab_principal
                  'estancia2'=>1,'luz2' => $luces_pta1_est2,'clima2'=>$clima_pta1_est2,'iot2'=>$iot_pta1_est2,//hab_nino hab
                  'estancia3'=>2,'luz3' => $luces_pta1_est3,'clima3'=>$clima_pta1_est2,'iot3'=>$iot_pta1_est3,//hab_nino bano
                  'estancia4'=>3,'luz4' => $luces_pta1_est4,'clima4'=>$clima_pta1_est3,'iot4'=>$iot_pta1_est4,//hab_nina hab
                  'estancia5'=>4,'luz5' => $luces_pta1_est5,'clima5'=>$clima_pta1_est3,'iot5'=>$iot_pta1_est5,//hab_nina bano
                  'estancia6'=>5,'luz6' => $luces_pta1_est6,'clima6'=>$clima_pta1_est5,'iot6'=>$iot_pta1_est6,//pasillo
                  'estancia7'=>6,'luz7' => $luces_pta1_est7,'clima7'=>$clima_pta1_est5,'iot7'=>$iot_pta1_est7,//sala estar
                  'estancia8'=>7,'luz8' => $luces_pta1_est8,'clima8'=>$clima_pta1_est5,'iot8'=>'',//vestidor
                  'estancia9'=>8,'luz9' => $luces_pta1_est9,'clima9'=>$clima_pta1_est5,'iot9'=>$iot_pta1_est8);//vestidor bano

      $pt0 = array('estancia1'=>9,'luz1' => $luces_pta0_est1,'clima1'=>$clima_pta0_est1,'iot1'=>$iot_pta0_est1,//invitados1 hab
                  'estancia2'=>10,'luz2' => $luces_pta0_est2,'clima2'=>$clima_pta0_est2,'iot2'=>$iot_pta0_est2,//invitados1 bano
                  'estancia3'=>11,'luz3' => $luces_pta0_est3,'clima3'=>$clima_pta0_est3,'iot3'=>$iot_pta0_est3,//invitados2 hab
                  'estancia4'=>12,'luz4' => $luces_pta0_est4,'clima4'=>$clima_pta0_est4,'iot4'=>'',//invitados2 bano
                  'estancia5'=>13,'luz5' => $luces_pta0_est5,'clima5'=>$clima_pta0_est5,'iot5'=>$iot_pta0_est4,//despacho
                  'estancia6'=>14,'luz6' => $luces_pta0_est6,'clima6'=>'','iot6'=>$iot_pta0_est5,//sala juegos
                  'estancia7'=>15,'luz7' => $luces_pta0_est7,'clima7'=>'','iot7'=>'',//comedor
                  'estancia8'=>16,'luz8' => $luces_pta0_est8,'clima8'=>'','iot8'=>'',//salon
                  'estancia9'=>17,'luz9' => $luces_pta0_est9,'clima9'=>$clima_pta0_est6,'iot9'=>$iot_pta0_est6,//pasillo
                  'estancia10'=>18,'luz10' => $luces_pta0_est9,'clima10'=>'','iot10'=>'',//pasillo bano
                  'estancia11'=>19,'luz11' => $luces_pta0_est10,'clima11'=>$clima_pta0_est7,'iot11'=>$iot_pta0_est7);//cocina
                  
      $pts = array('estancia1'=>20,'luz1' => $luces_ptas_est1,'clima1'=>$clima_ptas_est1,'iot1'=>$iot_ptas_est1,//salon juegos
                  'estancia2'=>21,'luz2' => $luces_ptas_est2,'clima2'=>$clima_ptas_est2,'iot2'=>$iot_ptas_est2,//gimnasio
                  'estancia3'=>22,'luz3' => $luces_ptas_est3,'clima3'=>'','iot3'=>$iot_ptas_est3,//spa
                  'estancia4'=>23,'luz4' => $luces_ptas_est4,'clima4'=>'','iot4'=>$iot_ptas_est4,//spa vest-patio ingles
                  'estancia5'=>24,'luz5' => $luces_ptas_est5,'clima5'=>'','iot5'=>$iot_ptas_est5);//garaje
*/
      $resultado = array('pt1' => $pt1, 'pt0' => $pt0, 'pts' => $pts);

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

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
