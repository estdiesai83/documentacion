<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_domo extends CI_Model {
   private $nombredb = "karnaverde_fincarudy";
   
   ///MODELOS UTILIDADES_RUDY.
	function __construct(){
		parent::__construct();
	}
	public function escribirEstado($tp,$estado){
		$sql="UPDATE ".$this->nombredb."._192_168_1_30_".$tp." SET valor=".$estado." WHERE tipotcaso='estado' ";
      $query = $this->db->query($sql);
      
		unset($sql);
		flush();
		return 0;
	}
	/*luces*/
	function leerZonaLuces($planta){
      $sql="SELECT estado FROM ".$this->nombredb.".zonas WHERE f1=".$planta." and tipotcaso='zonas' and estado='1'";
		$query = $this->db->query($sql);

		if ($query->num_rows() > 0) {
			$respuesta=1;
		}
		else
		{
			$respuesta=0;
		}

		unset($sql);
		flush();
		return $respuesta;
   }
   function leerEstanciasLuces($planta,$estancia){
      $sql="SELECT estado FROM ".$this->nombredb.".zonas WHERE f1=".$planta." AND f2=".$estancia." AND tipotcaso='zonas' and estado='1'";
		$query = $this->db->query($sql);

		if ($query->num_rows() > 0) {
			$respuesta=1;
		}
		else
		{
			$respuesta=0;
		}

		unset($sql);
		flush();
		return $respuesta;
	}
   /*clima*/
   function leerClima($tps){
      for($i=0;$i<count($tps);$i++){
         $sql="SELECT valor FROM ".$this->nombredb."._192_168_1_30_".$tps[$i]." WHERE _id_192_168_1_30_".$tps[$i]."=1 AND valor=1";
         $query = $this->db->query($sql);
         if ($query->num_rows() > 0) {
            $respuesta=1;
            break;
         }
         else
         {
            $respuesta=0;
         }         
         //echo "\n leerClima ".$respuesta."   i->".$i."  ".$sql;
         unset($sql);
      }
      //echo "\n\n\n";
      return $respuesta;
   }
   function leerEstanciaClima($tps){
      $sql="SELECT valor FROM ".$this->nombredb."._192_168_1_30_".$tps." WHERE _id_192_168_1_30_".$tps."=1 AND valor=1";
      $query = $this->db->query($sql);
      if ($query->num_rows() > 0) {
         $respuesta=1;
      }
      else
      {
         $respuesta=0;
      }
      
      unset($sql);
      flush();
      return $respuesta;
   }
   /*iot*/
   function leerIot($tps){
      for($i=0;$i<count($tps);$i++){
         $sql="SELECT valor FROM ".$this->nombredb."._192_168_1_30_".$tps[$i]." WHERE _id_192_168_1_30_".$tps[$i]."=1 AND valor=1";
         $query = $this->db->query($sql);
         if ($query->num_rows() > 0) {
            $respuesta=1;
            break;
         }
         else
         {
            $respuesta=0;
         }
         unset($sql);
      }
      flush();
      return $respuesta;
   }   
}

?>

