[TOC]

# PRUEBAS API

Todo el codigo se debe añadir en la cesta correspondiente antes del authorithated y poner la llamada a la cesta en el navegador

## DOMO:

### Domo:

Ambientes:

Crear Ambiente

```web-idl
http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Domo/createAmbients
```

```php
$ambient = $this->domo->createAmbient(4, "ambiente3");

$ope4 = array('id'=> 7,'color'=> null,'brightness'=> 50,'status'=> 1);
$ope5 = array('id'=> 8,'color'=> '200,44,5','brightness'=> 81,'status'=> 0);
$ope6 = array('id'=> 9,'color'=> null,'brightness'=> 10,'status'=> 1);

$lights1 = array($ope4,$ope5,$ope6);
$lights2 =json_encode($lights1);
$this->lights->createOperationAmbient($ambient,json_decode($lights2));

$lights_scene = array(array('id'=> 1));
$lights_scene2 =json_encode($lights_scene);
$this->domo->createSceneAmbient($ambient,json_decode($lights_scene2));

$obj = (object) array('code' => 0 , 'data' =>$ambient->getId());
return $this->response->setStatusCode(200)->setJSON( $obj);

$obj = (object) array('code' => 0 , 'data' =>$ambients);
return $this->response->setStatusCode(200)->setJSON( $obj);

```

Activar Ambiente

```

```

```

```

RUTINAS:

Crear rutinas:

```web-idl
http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Domo/createRutines
```



```php
$schedule = array(1,2,5);

$rutine = $this->domo->createRutine(4, "rutina1", $schedule, "12:00", "13:00",0);

$ot = $this->domo->createOt("2021-12-20", "2021-12-30");

$this->domo->createOtRutina($ot, $rutine);

$this->domo->createTareaRutina($rutine);

$ope4 = array('id'=> 7,'color'=> null,'brightness'=> 50,'status'=> 1);
$ope5 = array('id'=> 8,'color'=> '200,44,5','brightness'=> 81,'status'=> 0);
$ope6 = array('id'=> 9,'color'=> null,'brightness'=> 10,'status'=> 1);

$lights1 = array($ope4,$ope5,$ope6);
$lights2 =json_encode($lights1);
$this->lights->createOperationRutine($rutine,json_decode($lights2));

$lights_scene = array(array('id'=> 2));
$lights_scene2 =json_encode($lights_scene);
$this->domo->createSceneRutine($rutine,json_decode($lights_scene2));

```

