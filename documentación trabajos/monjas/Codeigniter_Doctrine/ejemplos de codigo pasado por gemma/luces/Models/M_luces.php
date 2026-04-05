<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_luces extends CI_Model {
 private $nombredb = "karnaverde_rudy";
 ///MODELOS UTILIDADES_RUDY.
	function __construct(){
		parent::__construct();
	}
	function obtenerEscenaActual()
	{
		$sql="SELECT DISTINCT 
			a.codigoescena AS id, b.nemo FROM ".$this->nombredb.".zonas a 
			JOIN  ".$this->nombredb.".zonas b on a.codigoescena=b.codigoescena   WHERE 	a.tipotcaso='zonas' and b.tipotcaso='escenas' LIMIT 1";
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) {
			$row = $query->result();
		}
		else
		{
			$row = -1;
		}

		unset($sql);
		flush();
		return $row[0];
	}
	function cargarEscenas($codigo)
	{
		$sql="UPDATE ".$this->nombredb.".zonas set codigoescena=".$codigo." where tipotcaso='zonas'";
		$query = $this->db->query($sql);
		$sql="SELECT DISTINCT codigozona,estado, intensidad,rgb FROM ".$this->nombredb.".zonas   WHERE 	tipotcaso='escenas' and codigoescena=".$codigo."";
        $query = $this->db->query($sql);
		if ($query->num_rows() > 0) {
			$row = $query->result();
		}
		else
		{
			$row = -1;
		}
		
		unset($sql);
		flush();
		return $row;
	}
	function leerNombreEscenas(){
		$sql="SELECT DISTINCT 
			codigoescena , nemo FROM ".$this->nombredb.".zonas  WHERE 	tipotcaso='escenas'";
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) {
			$row = $query->result();
		}
		else
		{
			$row = -1;
		}

		unset($sql);
		flush();
		return $row;
	}

	function leerZonaLuces(){
      $sql="SELECT 	 estado, intensidad, rgb FROM ".$this->nombredb.".zonas 	WHERE 	tipotcaso='zonas' ";
		$query = $this->db->query($sql);

		if ($query->num_rows() > 0) {
			$row = $query->result();
		}
		else
		{
			$row = -1;
		}

		unset($sql);
		flush();
		return $row;
	}
	function reprogramarEscena($escenaId,$estadoZona1,$estadoZona2,$estadoZona3,$intensidadZona1,$intensidadZona2,$intensidadZona3,$rgbZona1,$rgbZona2)
	{
		
		$sql="UPDATE ".$this->nombredb.".zonas set estado =".$estadoZona1.", intensidad=".$intensidadZona1.",rgb='".$rgbZona1."' where codigoescena=".$escenaId." and   tipotcaso='escenas' and codigozona=1";
		$query = $this->db->query($sql);
		$sql="UPDATE ".$this->nombredb.".zonas set estado =".$estadoZona2.", intensidad=".$intensidadZona2.",rgb='".$rgbZona2."' where codigoescena=".$escenaId."  and  tipotcaso='escenas' and codigozona=2";
		$query = $this->db->query($sql);
		$sql="UPDATE ".$this->nombredb.".zonas set estado =".$estadoZona3.", intensidad=".$intensidadZona3." where codigoescena=".$escenaId."  and  tipotcaso='escenas' and codigozona=3";
		$query = $this->db->query($sql);

		$sql="UPDATE ".$this->nombredb.".zonas set estado =".$estadoZona3.", intensidad=".$intensidadZona1.",rgb='".$rgbZona1."' where   tipotcaso='zonas' and _idzonas=1";
		$query = $this->db->query($sql);
		$sql="UPDATE ".$this->nombredb.".zonas set estado =".$estadoZona2.", intensidad=".$intensidadZona2.",rgb='".$rgbZona2."' where   tipotcaso='zonas' and _idzonas=2";
		$query = $this->db->query($sql);
		$sql="UPDATE ".$this->nombredb.".zonas set estado =".$estadoZona3.", intensidad=".$intensidadZona3." where  tipotcaso='zonas' and _idzonas=3";
		$query = $this->db->query($sql);
		
		unset($sql);
		flush();
	}
	function crearEscena($nemo,$estadoZona1,$estadoZona2,$estadoZona3,$intensidadZona1,$intensidadZona2,$intensidadZona3,$rgbZona1,$rgbZona2)
	{
		$sql="SELECT MAX(codigoescena) as codigoescena FROM ".$this->nombredb.".zonas 	WHERE 	tipotcaso='escenas' LIMIT 1 ";
		$query = $this->db->query($sql);
		if ($query->num_rows() > 0) {
			$row = $query->result();
		} else {
			$row = -1;
		}
		
		$codigoescena=$row[0]->codigoescena + 1;

		$sql="INSERT INTO ".$this->nombredb.".zonas (tipotcaso,codigozona,nemo,codigoescena,estado,intensidad,rgb) VALUES 
		('escenas',1,'".strtoupper($nemo)."',".$codigoescena.",".$estadoZona1.",".$intensidadZona1.",'".$rgbZona1."')";
		$query = $this->db->query($sql);
		$sql="INSERT INTO ".$this->nombredb.".zonas (tipotcaso,codigozona,nemo,codigoescena,estado,intensidad,rgb) VALUES 
		('escenas',2,'".strtoupper($nemo)."',".$codigoescena.",".$estadoZona2.",".$intensidadZona2.",'".$rgbZona2."')";
		$query = $this->db->query($sql);
		
		$sql="INSERT INTO ".$this->nombredb.".zonas (tipotcaso,codigozona,nemo,codigoescena,estado,intensidad) VALUES 
		('escenas',3,'".strtoupper($nemo)."',".$codigoescena.",".$estadoZona3.",".$intensidadZona3.")";
		$query = $this->db->query($sql);
		
		
		unset($sql);
		flush();
		return $row;
	}
}

?>

