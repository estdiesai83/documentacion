# Cestas Data

## Data/getData ()

```php
Respuesta:
{
    households: // (viviendas)
    [
        {
            "id": 1, // id de la ubicacion
            "nemo": "Montecerrado",
            "status": 1, // 0-> inhabilitado, 1-> habilitado
            "weathercode": 0,
            "api": "",
            "apiJs": "",
            "idaco": "",
            "previewHome": 
            [
                {
                    path: 'foto1.jpg'	
                },
                {
                    path: 'foto2.jpg'	
                },
                {
                    path: 'foto3.jpg'	
                }
            ]
        },
    ],
    project: 
    {
        "id": 1
        "nemo": 'Miriam & David',
        "photo": 'ruta'
    },
}
```

Muestra las viviendas, nombre de proyecto y  camaras

* Este controlador se llama desde el proyecto de monjas.hometech.red, y este llama a las funciones de la libreria:

  Si el valor de $GLOBALS['DATA']->user_type == 1

  * readLocations: lee de la tabla 'ubicacion ' de bd: sistema_pruebas para el codigoproyecto 'x'
  * readProject: lee de la tabla proyecto de bd: sistema_pruebas para el proyecto 'x'.

  Si el valor de $GLOBALS['DATA']->user_type == 2

  * getCameras

  * getIntercoms

  * getSipCredentials

    

## Data/getConfig ()

```php
data:
1. location_id (id ubicacion)

Respuesta:
"home": [
     {
         "type": 0,
         "module": 0,
         "nemo": "Menu",
         "icon": "fa fa-bars"
     },
 ],
"menu": [
    {
        "nemo": "UTILIDADES",
        "icon": "fas fa-user-edit",
        "module": 0,
        "submenu": [
            {
                "nemo": "POSTIT",
                "module": 17,
            },
        ],
        "status": 0,
        "logo":    
    }
],
"homeStatus": { // estado Vivieda 
    status: 0//  0-> Hola 1-> Adios 2->Hasta luego,
    mode: 0 //0-> Confort 1-> Eco, 2-> Antihielo, 3-> Vacaciones
},
"homeModes": [ // modos vivienda
    {
        id: 0,
        nemo: ''
    }
],
"floors": [
    {
        "id": 0,
        "nemo": "1º PLANTA",
        "icon": 'fas fa-seedling',
        "scenesEnabled": 0,
                "scenes":  {  // escenas de la estancia
                    "lights": [ // escenas de las luces
                        {
                            "id": 0,
                            "nemo": "standard",
                            "lights": [ // luces
                                {
                                    "id": 0,
                                    "nemo": "Zona Techo",
                                    "status": 1,
                                    "brightness": 34,
                                    "color": "9,228,31"
                                }
                            ]
                        }
                    ],
                    "climate": [ // escenas del clima
                        {
                            "id": 0,
                            "nemo": "standard",
                            "climate": [ //clima
                            {
                                "id": 0,
                                "nemo": "zona ",
                                "status": 1,
                                "thermostat": "25",
                            }     
                        ]
                        }
                	],
                	"blinds": [ // escenas de los estores
                    	{
                            "id": 0,
                            "nemo": "standard",
                            "blind": [ {
                                "id": 0,
                                "nemo": "Zona Techo",
                                "level": 1,
                                "consigna": "12",
                            	}
    						]
                        }
                    ]
                },
        "rooms": [
            {
                "model": 2, //1-> Modelo Mariano/Hazard 2->Modelo modo 3-> Modelo Riego 4-> MOdelo Alumbrado Ex.
                "id": 0,
                "nemo": "HABITACION",
                "image": "assets/img/estancia/alumbrado.jpg",
                "lightStatus": 1,
                "iotStatus": 1,
                "climateStatus": 1,
                "blindStatus": 0,
                "temperature": "12",
                "humidity": "50",
                "co2": "500",
                "thermostat": "25",
              	"intensityEnabled": 1,
              	"colorEnabled": 1,
                "scenesEnabled": 0,
                "scenes":  {  // escenas de la estancia
                    "lights": [ // escenas de las luces
                        {
                            "id": 0,
                            "nemo": "standard",
                            "lights": [ // luces
                                {
                                    "id": 0,
                                    "nemo": "Zona Techo",
                                    "status": 1,
                                    "brightness": 34,
                                    "color": "9,228,31"
                                }
                            ]
                        }
                    ],
                    "climate": [ // escenas del clima
                        {
                            "id": 0,
                            "nemo": "standard",
                            "climate": [ //clima
                            {
                                "id": 0,
                                "nemo": "zona ",
                                "status": 1,
                                "thermostat": "25",
                            }     
                        ]
                        }
                	],
                	"blinds": [ // escenas de los estores
                    	{
                            "id": 0,
                            "nemo": "standard",
                            "blind": [ {
                                "id": 0,
                                "nemo": "Zona Techo",
                                "level": 1,
                                "consigna": "12",
                            	}
    						]
                        }
                    ]
                },
                "ambientsEnabled": 0,
                "ambients": [{  // ambientes de la estancia
                    "id": 0,
                    "nemo": "Ambiente1",
                    "status": 0,
                    "elements": [ 
                        "ligths": [// luces
                            {
                                "id": 0,
                                "nemo": "Zona Techo",
                                "status": 1,
                                "brightness": 34,
                                "color": "9,228,31"
                            }
                        ],
                        "iot": //idem iot
                        "climate": // idem climate
                        "blinds": //idem blinds
                        "louvers": //idem louvers
                    ],
                    "lights_scenes": [ // ambientes de las escenas luces
                        {
                            "id": 0,
                            "nemo": "standard",
                            "lights": [ // luces
                                {
                                    "id": 0,
                                    "nemo": "Zona Techo",
                                    "status": 1,
                                    "brightness": 34,
                                    "color": "9,228,31"
                                }
                            ]
                        }
                    ],
                    "climate": [ //clima
                        {
                            "id": 0,
                            "nemo": "zona ",
                            "status": 1,
                            "thermostat": "25",
                        }]  ,
                    "climate_scenes": [ // escenas del clima
                        {
                            "id": 0,
                            "nemo": "standard",
                            "climate": [ //clima
                            {
                                "id": 0,
                                "nemo": "zona ",
                                "status": 1,
                                "thermostat": "25",
                            }     
                        ]
                        }
                	],
                    "blind": [ {
                                "id": 0,
                                "nemo": "Zona Techo",
                                "level": 1,
                                "consigna": "12",
                            	}
    						],
                	"blinds_scenes": [ // escenas de los estores
                    	{
                            "id": 0,
                            "nemo": "standard",
                            "blind": [ {
                                "id": 0,
                                "nemo": "Zona Techo",
                                "level": 1,
                                "consigna": "12",
                            	}
    						]
                        }
                    ]
                }],
                "roomMode": 0,// 0-> confort 1-> standby // modo de la estancia
                "groups": [  // grupo de luces Alumbrado
                    {
                        "id": 1
                        "status": 0, // 0-> manual 1-> auto
                        "nemo": 'Zona garaje y entrada',
                        "hour": '02:00'
                    },
          		],
                "climate": [ //clima
                    {
                        "id": 0,
                        "nemo": "",
                        "status": 1,
                        "temperature": "12",
                        "humidity": "50",
                        "co2": "500",
                        "thermostat": "25",
                    }
                ],
                "lights": [ // luces
                    {
                        "id": 0,
                        "nemo": "Zona Techo",
                        "status": 1,
                        "brightness": 34,
                        "color": "9,228,31",
                        "temperature",-1
                    }
                ],
                "blinds": [{
                  "id": 3,
                  "nemo": "Estor Derecha",
                  "position": 2,
                  "level": 30
                }]
                "louvers": [{
                  "id": 3,
                  "nemo": "Persiana Derecha",
                  "position": 2,
                  "dim": 1
                }]
                "iot": [ // iot
                    {
                        "id": 0,
                        "status": 0, // 0-> apagado 1-> encendido
                        "nemo": "EXTERIOR"
                    },                   
                ],
                "multimedia":[
                  {
                    "id": 1,
                    "nemo": "tv techo",
                    "status": 0,
                    "type": 2
                  }
                ],
                "airConditioning": [
                    {
                        "id": 25,
                        "status": 0,
                        "nemo": "Gimnasio",
                        "temperature": 22,
                        "thermostat": 22,
                        "speed": 0
                    }
                ],
                "pumps": [
                    {
                        "id": 1,
                        "nemo": "Bomba Fuente",
                        "status": 0,
                        "mode", 0 -> manual, 1-> automatico
                        "hours": {
                            "init": '00:00' // hora inicio
                            "end": '01:00' // hora fin
                        }
                    }
                ],
            },            
        ]
    }, 
    "irrigation": {
        calendar: [
            {
                date: '', (fotmato javasctipt),
             	programs: [ {id, color, nemo, except, 
                               sessions[{id,nemo,hour,status, 
                                     operations[{id, nemo, timer, status}], 
                                         mode: //1 -> sesion, 2 -> manual
                            }],
                sessions :[ { id, nemo, hour, status, operations[{id, nemo, timer, status}],
                            }]
            }
        ],
        modes:[
            { 
                id, color, nemo, operations[{id, nemo, timer, status}]
            }
        ], 
        programs : [
             {
                 id, color, nemo, execpt, sessions: [{id,nemo,hour,status, 
                                                    operations[{id, nemo, timer, status}], 
            }
        ],
        elements : [
                { id, nemo }
        ],
    },
	"depuration": {
        calendar: [
            {
                date: '', (fotmato javasctipt),
             	programs: [ {id, color, nemo, except, 
                               sessions[{id,nemo,hour,status, 
                                     operations[{id, nemo, timer, status}], 
                                         mode: //1 -> sesion, 2 -> manual
                            }],
                sessions :[ { id, nemo, hour, status, operations[{id, nemo, timer, status}],
                            }]
            }
        ],
        modes:[
            { 
                id, color, nemo, operations[{id, nemo, timer, status}]
            }
        ], 
        programs : [
             {
                 id, color, nemo, execpt, sessions: [{id,nemo,hour,status, 
                                                    operations[{id, nemo, timer, status}], 
            }
        ],
        elements : [
                { id, nemo }
        ],
    },
	"secure" : {
        "camara": [{
              "nemo": "Camara Interior 1",
              "tipo": 3,
              "user": "user_robert",
              "pass": "room_robert"
            }],
        "intercomp": [{
          "nemo": "Puerta",
          "id": 3
        }]
    },
	"token" : {
        access_token:,
        refresh_token:
        tipo:
    },
    "airConditioning":[{
      "id": 1,
      "nemo": "Ala Norte",
      "valor": "1"
    }],
    "distributionPanel":[
        "dimension": "2 x 24",
		"id": 1,
		"nemo": "C1 - ALUMBRADO EXTERIOR",
        "automaticos":[ {
             estado: 1,
			 fila: 1,
			 id: 1,
			 nemo: "Diferencial entrada",
			 nemofila: "Fila 1",
			 tipo: 0,   
            }]
    ],            
]
```

Muestra los datos del menu, plantas con sus dependencias y los botones del panel, para ello llama a las siguientes funciones de la libreria _Data

Lee el home: $home = $this->data->readHome($GLOBALS['CODIGOUBICACION']);

Lee el menu: $menu = $this->data->readMenu($GLOBALS['CODIGOUBICACION']);

Llee el homeStatus: $homeStatus = $this->data->readHomeStatus($GLOBALS['CODIGOUBICACION']);

Lee el homeModes: $homeModes = $this->data->readHomeModes($GLOBALS['CODIGOUBICACION']);

Lee las plantas con sus correspondientes estancias

​      $floors = $this->data->readFloors($GLOBALS['CODIGOUBICACION']);

Lee las camaras: $access = $this->access->getAccess($GLOBALS['CODIGOUBICACION']);

Lee el riego: $irrigation = $this->mto->readMaintenance(1);  enviando tipo = 1

Lee la depuracion piscina: $depuration = $this->mto->readMaintenance(2);  enviando tipo = 2

Lee las camaras y ekeeper secure: $secure =$this->camara->getSecure($GLOBALS['CODIGOUBICACION']);



## Data/changeProjectPhoto ()

```php
data:

1. id (id proyecto)
2. photo (url)
    
Respuesta:
object (code)
```

Cambia la imagen del proyecto.





```json
access
: 
{door: {camera: {}, buttons: [{}]},…}
airConditioning
: 
[{id: 1, nemo: "Ala Norte", valor: "0"}, {id: 2, nemo: "Ala Sur", valor: "0"}]
depuration
: 
{calendar: [{id: 1, date: "2022-01-04T09:11:28", programs: [],…}], modes: [], programs: [],…}
distributionPanel
: 
[{id: 1, nemo: "HABITACION INVITADOS", dimension: "2x12",…}]
floors
: 
[{id: 4, nemo: "PRINCIPAL ZONAS COMUNES", icon: "fas fa-couch", rooms: [,…],…},…]
home
: 
[{type: 2, module: 0, nemo: "Menu", icon: ""}, {type: 3, module: 0, nemo: "Cabecera", icon: ""}]
homeModes
: 
[{id: 0, nemo: "Modo Confort"}, {id: 1, nemo: "Modo Eco"}, {id: 2, nemo: "Modo Antihielo"},…]
homeStatus
: 
{status: 0, mode: 0}
irrigation
: 
{calendar: [{id: 2, date: "2022-01-06T00:46:42", programs: [],…},…],…}
menu
: 
[{nemo: "SOSTENIBILIDAD", icon: "fas fa-leaf", module: 29, status: 1, logo: 1,…},…]
permissions
: 
{,…}
rcs
: 
[{id: 7, token_id: "rc_406", nemo: "sotano", estado: 0, codigoFondos: 0},…]
secure
: 
{,…}
token
: 
{tipo: 10,…}
```



Zoom Floors:

```
ambients
: 
[{id: 1000, nemo: "Ambiente1", status: 0, elements: null},…]
ambientsEnabled
: 
1
blindsEnabled
: 
1
climateEnabled
: 
1
climateStatus
: 
1
colorEnabled
: 
0
groups
: 
[{id: 1, nemo: "Salon", icon: "fas fa-couch",…}, {id: 2, nemo: "Cocina", icon: "fas fa-utensils",…},…]
icon
: 
"fas fa-couch"
id
: 
4
intensityEnabled
: 
1
iotEnabled
: 
1
iotStatus
: 
1
lightsEnabled
: 
1
lightsStatus
: 
1
louversEnabled
: 
0
nemo
: 
"PRINCIPAL ZONAS COMUNES"
pumpsEnabled
: 
0
rooms
: 
[,…]
routines
: 
[{id: 13, nemo: "rutina1", status: 1, notifications: 0, schedule: [3], init_date: "2022-10-05",…},…]
routinesEnabled
: 
1
scenes
: 
{,…}
scenesEnabled
: 
1
temperatureEnabled
: 
0
```

