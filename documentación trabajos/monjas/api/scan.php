<?php

/**
 * Escanea un documento
 *
 * @param $sessionName	[string] Nombre para identificar la sesion actual, el cliente debera generar
 *                               un identificador cada vez que quiera escanear
 * @param $mode	[string] Modo de escacneo, puede ser "flatbed" (cama) o "adf" (bandeja)
 * @param $colorMode [string] Indica si se quiere escanear a color "color" o a escala de grises "gray"
 * @param $command [string] Solo cuando $mode=flatbed, indica si se quiere escanear una nueva pagina
 *                          "new" o se quiere terminar el escaneo "end"
 */

//$post = file_get_contents('php://input');
//$params = json_decode($post);

$PRINTER_DEVICE = "hpaio:/net/OfficeJet_7510_series?ip=192.168.1.35";
$OUTPUT_SCAN_FOLDER = "/home/soa/Compartido";

$params = (object)array(
   "sessionName" => "test",
   "mode" => "adf",        // "flatbed" or "adf"
   "colorMode" => "color", // "color" or "gray"
   "command" => "end"      // For "flatbed" mode only, new page or end scan
);

if ( isset($params->sessionName) && isset($params->mode) && isset($params->colorMode) ) {
   $sessionName = filter_var($params->sessionName, FILTER_SANITIZE_STRING);
   $mode = filter_var($params->mode, FILTER_SANITIZE_STRING);
   $colorMode = filter_var($params->colorMode, FILTER_SANITIZE_STRING);

   $response = array();

   switch ( $mode ) {
   case "flatbed":
      if ( isset($params->command) ) {
         $command = filter_var($params->command, FILTER_SANITIZE_STRING);

         $result = flatbedScan($sessionName, $colorMode, $command);
      } else {
	      $response["code"] = 400;
      }

      break;
   case "adf":
      $result = adfScan($sessionName, $colorMode);
      break;
   }

	$response["code"] = 200;
	$response["result"] = $result;
} else {
	$response["code"] = 400;
}

/**
 * Run flatbed scan
 */
function flatbedScan($sessionName, $colorMode, $command) {
   global $PRINTER_DEVICE, $OUTPUT_SCAN_FOLDER;

   switch ($command) {
   case "new":
      $result = flatbedScanNew($sessionName, $colorMode);
      break;
   case "end":
      $result = flatbedScanEnd($sessionName);
      break;
   default:
      $result = array( "status" => 1, "message" => "Comando desconocido" );
      break;
   }

   return $result;
}

/**
 * Add new page on flatbed scan
 */
function flatbedScanNew($sessionName, $colorMode) {
   global $PRINTER_DEVICE, $OUTPUT_SCAN_FOLDER;

   // Set the current working directory
   $directory = $OUTPUT_SCAN_FOLDER;

   // Initialize filecount variable
   $filecount = 0;

   $files = glob( $directory."/".$sessionName."*.jpg" );

   if( $files ) {
      $filecount = count($files);
   }

   $command = "hp-scan -i --device=".$PRINTER_DEVICE." --output=".$OUTPUT_SCAN_FOLDER."/".$sessionName."_".$filecount.".jpg --mode=".$colorMode." --res=300 --compression=jpeg";

   exec($command, $executionResult, $executionCode);

   return parseAdfExecutionStatus($executionResult, $executionCode, $sessionName."_".$filecount.".jpg");
}

/**
 * Finish flatbed scan
 */
function flatbedScanEnd($sessionName) {
   global $OUTPUT_SCAN_FOLDER;

   $command = "convert ".$OUTPUT_SCAN_FOLDER."/".$sessionName."*.jpg ".$OUTPUT_SCAN_FOLDER."/".$sessionName.".pdf";

   exec($command, $executionResult, $executionCode);

   exec("rm ".$OUTPUT_SCAN_FOLDER."/".$sessionName."*.jpg");

   if ( $executionCode == 0 ) {
      $result = array( "status" => 0, "message" => "Escaneado completado", "file" => $sessionName.".pdf" );
   } else {
      $result = array( "status" => 1, "message" => "Ha ocurrido un error al generar el archivo PDF" );
   }

   return $result;
}

/**
 * Run ADF scan
 */
function adfScan($sessionName, $colorMode) {
   global $PRINTER_DEVICE, $OUTPUT_SCAN_FOLDER;

   $command = "hp-scan -i --device=".$PRINTER_DEVICE." --adf --output=".$OUTPUT_SCAN_FOLDER."/".$sessionName.".pdf --mode=".$colorMode." --res=300 --compression=jpeg";

   exec($command, $executionResult, $executionCode);

   return parseAdfExecutionStatus($executionResult, $executionCode, $sessionName.".pdf");
}

/**
 * Generate a result from an adf scan
 */
function parseAdfExecutionStatus($executionResult, $executionCode, $file) {
   global $sessionName;

   switch( $executionCode ) {
   case 0:
      $result = array( "status" => 0, "message" => "Escaneado completado", "file" => $file );
      break;
   case 1:
      $result = array( "status" => 1, "message" => "El escaneado ha sido interrumpido" );
      break;
   case 3:
      $result = array( "status" => 1, "message" => "No se han cargado páginas en la bandeja" );
      break;
   default:
      $result = array( "status" => 1, "message" => "Ha ocurrido un error" );
   }

   return $result;
}

echo json_encode($response);

?>
