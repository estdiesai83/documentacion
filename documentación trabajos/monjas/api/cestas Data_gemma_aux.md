#  Data


> ESTA TESTEADO 
> {.is-info}

## getData

<B>Data/getData </B>

```php
@return object(
      code (int)
      households: [{ id:,nemo,status, weathercode,soaTs,apiJs, previewHome }],
      project { id,nemo,photo }     
)    
```

Muestra los proyectos a los que el usuario tiene acceso 
    

## getConfig

<B>Data/getConfig</B>
These parameters are necessary POST:
   location_id (id ubicacion)
```php

 @return object(
				 code: (int),
         home        
         [{ 
         			type, 
              module, 
              nemo, 
              icon,
              lights_enabled ,
              louvers_enabled ,
              climate_enabled,
              iot_enabled,
              blinds_enabled }]
         'menu'         
         [{ 
         			nemo, 
         			icon, 
         			module, 
              submenu:
              [{
              		nemo, 
                  module
              }]
         }]
         atHome      PTE
         floors      
         [{
              'rooms' {               
                 model 
                  id
                  nemo
                 image 
                  lightStatus  
                  intensityEnabled      
                  colorEnabled         
                  temperatureEnabled    
                  lightsMode            
                  lights

                  climate              
                  climateStatus         
                  temperature          
                  humidity              
                  co2                   
                  value  

                  fancoil           
                  iotStatus     

                  iot  

                  pumpStatus         
                  pumps       

                  blindStatus       
                  blinds       

                  louverStatus      
                  louvers      

                  multimediaStatus  
                  multimedia    

                  depuration    

                  pool      

                  programmingEnabled 
                  programming     

                  scenesEnabled     
                  scenes            

                  ambientsEnabled    
                  ambients          

                  routinesEnabled    
                  routines       

                  roomMode           
                  distribution_panel 
               }
              lights_status      
              lights_enabled      
              intensity_enabled  
              color_enabled       
              temperature_enabled 

              climate_enabled    
              climate_status    

              blinds_enabled    

              iot_enabled       
              iot_status       

              pumps_enabled     
              pumps_status     

              louvers_enabled    

              scenes_enabled    
              scenes            

              ambients_enabled  
              ambients          

              routines_enabled   
              routines          
              sleep            
      
          }]  
         access       
         irrigation  
         depuration   
         secure       
         ekeeper     
         token  [  access_token,  refresh_token ]
         distributionPanel
         rcs          
         airConditioning
         permissions
 )
```



```json
@return object(
    code: (int),

{
  "home": {
    "0": [
      {
        "type": 2,
        "module": 0,
        "nemo": "Menu",
        "icon": ""
      },
    ],
    "lights_enabled": 1,
    "louvers_enabled": 1,
    "climate_enabled": 1,
    "iot_enabled": 1,
    "blinds_enabled": 1
  },
  "menu": [
    {
      "nemo": "SOSTENIBILIDAD",
      "icon": "fas fa-leaf",
      "module": 29,
      "status": 1,
      "logo": 1,
      "submenu": [
        {
          "nemo": "SOLAR",
          "module": 16,
          "icon": "fas fa-sun",
          "status": 0,
          "logo": 0
        },
      ]
    },
  ],
  "atHome": [
    {
      "id": 1,
      "nemo": "Alejandro",
      "modes": [
        {
          "id": 1,
          "nemo": "Confort",
          "ambients": []
        }
      ]
    },
  ],
  "floors": [
    {
      "id": 1,
      "nemo": "Planta Primera",
      "icon": "fas fa-tv",
      "groups": [],
      "rooms": [
        {
          "model": 2,
          "id": 1,
          "nemo": "Habitacion Alexander",
          "image": "vivienda/1/habitacionalexander.jpeg",
          "lightStatus": null,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "lightsMode": null,
          "lights": [
            {
              "id": 79,
              "nemo": "Cabecero",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 80,
              "nemo": "Armario",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 81,
              "nemo": "Escritorio",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 82,
              "nemo": "Techo Baño",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 83,
              "nemo": "Espejo Baño",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            }
          ],
          "climate": [
            {
              "id": 20,
              "status": 0,
              "nemo": "Habitacion Alexander",
              "temperature": 22,
              "value": 19,
              "humidity": null,
              "co2": null
            }
          ],
          "climateStatus": 0,
          "temperature": 22,
          "humidity": null,
          "co2": null,
          "value": 19,
          "fancoil": null,
          "iotStatus": null,
          "iot": [
            {
              "id": 28,
              "nemo": "Enchufe cabecero Derecho",
              "status": 1
            },
            {
              "id": 29,
              "nemo": "Enchufe Cabecero Izquierdo",
              "status": 1
            },
            {
              "id": 30,
              "nemo": "Enchufe tv",
              "status": 0
            },
            {
              "id": 31,
              "nemo": "Usos varios",
              "status": 0
            }
          ],
          "pumpStatus": null,
          "pumps": null,
          "blindStatus": 1,
          "blinds": [
            {
              "id": 9,
              "nemo": "Hab. Izq",
              "position": null,
              "level": 100
            },
            {
              "id": 10,
              "nemo": "Hab. centro",
              "position": null,
              "level": 100
            },
            {
              "id": 11,
              "nemo": "Hab. Dcha",
              "position": null,
              "level": 100
            }
          ],
          "louverStatus": null,
          "louvers": null,
          "multimediaStatus": null,
          "multimedia": null,
          "depuration": null,
          "pool": [],
          "programmingEnabled": 0,
          "programming": null,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 1,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 79,
                    "nemo": "Cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 80,
                    "nemo": "Armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 81,
                    "nemo": "Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 82,
                    "nemo": "Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 83,
                    "nemo": "Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 2,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 79,
                    "nemo": "Cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 80,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 81,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 82,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 83,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 3,
                "nemo": "Standard",
                "status": 0,
                "type": 2,
                "lights": [
                  {
                    "id": 79,
                    "nemo": "Cabecero",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 80,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 81,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 82,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 83,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 187,
                "nemo": "kkkkkkk",
                "status": 0,
                "type": 3,
                "lights": [
                  {
                    "id": 79,
                    "nemo": "Cabecero",
                    "status": 1,
                    "intensity": 49,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 80,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 81,
                    "nemo": "Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 82,
                    "nemo": "Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 83,
                    "nemo": "Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 188,
                "nemo": "Noelia",
                "status": 0,
                "type": 3,
                "lights": [
                  {
                    "id": 79,
                    "nemo": "Cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 80,
                    "nemo": "Armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 81,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 82,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 83,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": [
              {
                "id": 118,
                "nemo": "Bajar Todo",
                "status": 1,
                "type": 0,
                "blinds": []
              },
              {
                "id": 119,
                "nemo": "Subir Todo",
                "status": 0,
                "type": 1,
                "blinds": []
              }
            ],
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "roomMode": null,
          "distribution_panel": null
        },
        {
          "model": 2,
          "id": 2,
          "nemo": "Estudio",
          "image": "",
          "lightStatus": null,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "lightsMode": null,
          "lights": [
            {
              "id": 73,
              "nemo": "Led Estudio",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 74,
              "nemo": "Led Chimenea",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 75,
              "nemo": "Focos techo Estudio",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 76,
              "nemo": "Focos techo Chimenea",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            },
            {
              "id": 84,
              "nemo": "Focos techo Vestibulo",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            }
          ],
          "climate": [
            {
              "id": 18,
              "status": 0,
              "nemo": "Estudio",
              "temperature": 22,
              "value": 19,
              "humidity": null,
              "co2": null
            }
          ],
          "climateStatus": 0,
          "temperature": 22,
          "humidity": null,
          "co2": null,
          "value": 19,
          "fancoil": null,
          "iotStatus": null,
          "iot": null,
          "pumpStatus": null,
          "pumps": null,
          "blindStatus": null,
          "blinds": null,
          "louverStatus": null,
          "louvers": null,
          "multimediaStatus": null,
          "multimedia": null,
          "depuration": null,
          "pool": [],
          "programmingEnabled": 0,
          "programming": null,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 4,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 73,
                    "nemo": "Led Estudio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 74,
                    "nemo": "Led Chimenea",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 75,
                    "nemo": "Focos techo Estudio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 76,
                    "nemo": "Focos techo Chimenea",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 84,
                    "nemo": "Focos techo Vestibulo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 5,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 73,
                    "nemo": "Led Estudio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 74,
                    "nemo": "Led Chimenea",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 75,
                    "nemo": "Focos techo Estudio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 76,
                    "nemo": "Focos techo Chimenea",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 84,
                    "nemo": "Focos techo Vestibulo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 6,
                "nemo": "Standard",
                "status": 0,
                "type": 2,
                "lights": [
                  {
                    "id": 73,
                    "nemo": "Led Estudio",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 74,
                    "nemo": "Led Chimenea",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 75,
                    "nemo": "Focos techo Estudio",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 76,
                    "nemo": "Focos techo Chimenea",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 84,
                    "nemo": "Focos techo Vestibulo",
                    "status": 1,
                    "intensity": 50,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "roomMode": null,
          "distribution_panel": null
        },
        {
          "model": 2,
          "id": 3,
          "nemo": "Pecera",
          "image": "",
          "lightStatus": null,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "lightsMode": null,
          "lights": [
            {
              "id": 77,
              "nemo": "Focos techo",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            }
          ],
          "climate": [
            {
              "id": 19,
              "status": 0,
              "nemo": "Pecera",
              "temperature": 22,
              "value": 19,
              "humidity": null,
              "co2": null
            }
          ],
          "climateStatus": 0,
          "temperature": 22,
          "humidity": null,
          "co2": null,
          "value": 19,
          "fancoil": null,
          "iotStatus": null,
          "iot": null,
          "pumpStatus": null,
          "pumps": null,
          "blindStatus": null,
          "blinds": null,
          "louverStatus": null,
          "louvers": null,
          "multimediaStatus": null,
          "multimedia": null,
          "depuration": null,
          "pool": [],
          "programmingEnabled": 0,
          "programming": null,
          "scenesEnabled": 1,
          "scenes": null,
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "roomMode": null,
          "distribution_panel": null
        }
      ],
      "lightsStatus": 0,
      "lightsEnabled": 1,
      "intensityEnabled": 1,
      "colorEnabled": 0,
      "temperatureEnabled": 0,
      "climateEnabled": 1,
      "climateStatus": 0,
      "blindsEnabled": 1,
      "iotEnabled": 1,
      "iotStatus": 0,
      "pumpsEnabled": 0,
      "pumpsStatus": 0,
      "louversEnabled": 0,
      "scenesEnabled": 1,
      "scenes": {
        "lights": [
          {
            "id": 163,
            "nemo": "Apagar",
            "status": 1,
            "type": 0,
            "lights": [
              {
                "id": 79,
                "nemo": "Cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 80,
                "nemo": "Armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 81,
                "nemo": "Escritorio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 82,
                "nemo": "Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 83,
                "nemo": "Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 73,
                "nemo": "Led Estudio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 74,
                "nemo": "Led Chimenea",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 75,
                "nemo": "Focos techo Estudio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 76,
                "nemo": "Focos techo Chimenea",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 84,
                "nemo": "Focos techo Vestibulo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 77,
                "nemo": "Focos techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              }
            ]
          },
          {
            "id": 164,
            "nemo": "Maxima",
            "status": 0,
            "type": 1,
            "lights": [
              {
                "id": 79,
                "nemo": "Cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 80,
                "nemo": "Armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 81,
                "nemo": "Escritorio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 82,
                "nemo": "Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 83,
                "nemo": "Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 73,
                "nemo": "Led Estudio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 74,
                "nemo": "Led Chimenea",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 75,
                "nemo": "Focos techo Estudio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 76,
                "nemo": "Focos techo Chimenea",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 84,
                "nemo": "Focos techo Vestibulo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 77,
                "nemo": "Focos techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              }
            ]
          }
        ],
        "climate": null,
        "blinds": [
          {
            "id": 181,
            "nemo": "Bajar Todo",
            "status": 1,
            "type": 0,
            "blinds": []
          },
          {
            "id": 182,
            "nemo": "Subir Todo",
            "status": 0,
            "type": 1,
            "blinds": []
          }
        ],
        "iot": null,
        "louvers": null,
        "fancoils": null
      },
      "ambientsEnabled": 1,
      "ambients": [
        {
          "id": null,
          "nemo": "Ambiente1",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente2",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente3",
          "status": 0,
          "elements": null
        }
      ],
      "routinesEnabled": 1,
      "routines": null,
      "sleep": null
    },
    {
      "id": 2,
      "nemo": "Planta Principal",
      "icon": "fas fa-couch",
      "groups": [
        {
          "id": 1,
          "nemo": "Salones",
          "icon": "fas fa-couch",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 4,
              "nemo": "Comedor",
              "image": "vivienda/1/comedor.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 61,
                  "nemo": "Led Perimetro pasillo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 62,
                  "nemo": "Focos techo centro comedor",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 63,
                  "nemo": "Focos techo laterales comedor",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 64,
                  "nemo": "Focos techo pasillo sala tv",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 16,
                  "status": 0,
                  "nemo": "Comedor",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 0,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": [
                {
                  "id": 26,
                  "nemo": "Enchufe comedor",
                  "status": 0
                }
              ],
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 7,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 61,
                        "nemo": "Led Perimetro pasillo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 62,
                        "nemo": "Focos techo centro comedor",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 63,
                        "nemo": "Focos techo laterales comedor",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 64,
                        "nemo": "Focos techo pasillo sala tv",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 8,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 61,
                        "nemo": "Led Perimetro pasillo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 62,
                        "nemo": "Focos techo centro comedor",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 63,
                        "nemo": "Focos techo laterales comedor",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 64,
                        "nemo": "Focos techo pasillo sala tv",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 9,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 61,
                        "nemo": "Led Perimetro pasillo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 62,
                        "nemo": "Focos techo centro comedor",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 63,
                        "nemo": "Focos techo laterales comedor",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 64,
                        "nemo": "Focos techo pasillo sala tv",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": null
            },
            {
              "model": 2,
              "id": 5,
              "nemo": "Bar",
              "image": "vivienda/1/bar.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 40,
                  "nemo": "Led Bar",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 45,
                  "nemo": "Barra Bar",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 48,
                  "nemo": "Focos techo distribuidor",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 12,
                  "status": 0,
                  "nemo": "bar",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 0,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 10,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 40,
                        "nemo": "Led Bar",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 45,
                        "nemo": "Barra Bar",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 48,
                        "nemo": "Focos techo distribuidor",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 11,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 40,
                        "nemo": "Led Bar",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 45,
                        "nemo": "Barra Bar",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 48,
                        "nemo": "Focos techo distribuidor",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 12,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 40,
                        "nemo": "Led Bar",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 45,
                        "nemo": "Barra Bar",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 48,
                        "nemo": "Focos techo distribuidor",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 6,
              "nemo": "Sala Cine",
              "image": "vivienda/1/salacine.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 41,
                  "nemo": "Focos techo sala cine",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 42,
                  "nemo": "Led sala cine",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 11,
                  "status": 0,
                  "nemo": "sala cine",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 0,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": 1,
              "multimedia": [
                {
                  "id": 2,
                  "nemo": "Proyector cine",
                  "status": null,
                  "type": 2
                }
              ],
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 13,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 41,
                        "nemo": "Focos techo sala cine",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 42,
                        "nemo": "Led sala cine",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 14,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 41,
                        "nemo": "Focos techo sala cine",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 42,
                        "nemo": "Led sala cine",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 15,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 41,
                        "nemo": "Focos techo sala cine",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 42,
                        "nemo": "Led sala cine",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 7,
              "nemo": "Sala Tv",
              "image": "vivienda/1/sala_tv.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 65,
                  "nemo": "Focos techo vestibulo sala tv",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 66,
                  "nemo": "Focos techo sala TV",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 17,
                  "status": 0,
                  "nemo": "Sala tv",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 0,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": [
                {
                  "id": 24,
                  "nemo": "Enchufe TV",
                  "status": 0
                },
                {
                  "id": 25,
                  "nemo": "Enchufe pared",
                  "status": 0
                }
              ],
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 16,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 65,
                        "nemo": "Focos techo vestibulo sala tv",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 66,
                        "nemo": "Focos techo sala TV",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 17,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 65,
                        "nemo": "Focos techo vestibulo sala tv",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 66,
                        "nemo": "Focos techo sala TV",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 18,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 65,
                        "nemo": "Focos techo vestibulo sala tv",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 66,
                        "nemo": "Focos techo sala TV",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 8,
              "nemo": "Baño Cortesia",
              "image": "vivienda/1/banocortesia.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 69,
                  "nemo": "Focos techo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 70,
                  "nemo": "Espejo techo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 19,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 69,
                        "nemo": "Focos techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 70,
                        "nemo": "Espejo techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 20,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 69,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 70,
                        "nemo": "Espejo techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 21,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 69,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 70,
                        "nemo": "Espejo techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 1,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 1,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 141,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 61,
                    "nemo": "Led Perimetro pasillo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 62,
                    "nemo": "Focos techo centro comedor",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 63,
                    "nemo": "Focos techo laterales comedor",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 64,
                    "nemo": "Focos techo pasillo sala tv",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 40,
                    "nemo": "Led Bar",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 45,
                    "nemo": "Barra Bar",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 48,
                    "nemo": "Focos techo distribuidor",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 41,
                    "nemo": "Focos techo sala cine",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 42,
                    "nemo": "Led sala cine",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 65,
                    "nemo": "Focos techo vestibulo sala tv",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 66,
                    "nemo": "Focos techo sala TV",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 69,
                    "nemo": "Focos techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 70,
                    "nemo": "Espejo techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 142,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 61,
                    "nemo": "Led Perimetro pasillo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 62,
                    "nemo": "Focos techo centro comedor",
                    "status": 1,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 63,
                    "nemo": "Focos techo laterales comedor",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 64,
                    "nemo": "Focos techo pasillo sala tv",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 40,
                    "nemo": "Led Bar",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 45,
                    "nemo": "Barra Bar",
                    "status": 1,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 48,
                    "nemo": "Focos techo distribuidor",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 41,
                    "nemo": "Focos techo sala cine",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 42,
                    "nemo": "Led sala cine",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 65,
                    "nemo": "Focos techo vestibulo sala tv",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 66,
                    "nemo": "Focos techo sala TV",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 69,
                    "nemo": "Focos techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 70,
                    "nemo": "Espejo techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 2,
          "nemo": "Cocinas",
          "icon": "fas fa-utensils",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 9,
              "nemo": "Cocina Alejandro",
              "image": "vivienda/1/cocina_alejandro.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 51,
                  "nemo": "Led techo cocina",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 52,
                  "nemo": "Focos techo Armario Frigorifico",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 53,
                  "nemo": "Focos techo comedor cocina Alejandro",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 15,
                  "status": 1,
                  "nemo": "Cocina Alejandro",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 1,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 22,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 51,
                        "nemo": "Led techo cocina",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 52,
                        "nemo": "Focos techo Armario Frigorifico",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 53,
                        "nemo": "Focos techo comedor cocina Alejandro",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 23,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 51,
                        "nemo": "Led techo cocina",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 52,
                        "nemo": "Focos techo Armario Frigorifico",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 53,
                        "nemo": "Focos techo comedor cocina Alejandro",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 24,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 51,
                        "nemo": "Led techo cocina",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 52,
                        "nemo": "Focos techo Armario Frigorifico",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 53,
                        "nemo": "Focos techo comedor cocina Alejandro",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 10,
              "nemo": "Cocina Servicio",
              "image": "vivienda/1/cocina.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 49,
                  "nemo": "Focos techo cocina",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 50,
                  "nemo": "Led techo cocina",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 14,
                  "status": 1,
                  "nemo": "Cocina Servicio",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 1,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": 1,
              "blinds": [
                {
                  "id": 8,
                  "nemo": "Cocina",
                  "position": null,
                  "level": 100
                }
              ],
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 25,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 49,
                        "nemo": "Focos techo cocina",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 50,
                        "nemo": "Led techo cocina",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 26,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 49,
                        "nemo": "Focos techo cocina",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 50,
                        "nemo": "Led techo cocina",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 27,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 49,
                        "nemo": "Focos techo cocina",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 50,
                        "nemo": "Led techo cocina",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 11,
              "nemo": "Almacen bebida",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 12,
              "nemo": "Almacen Comida",
              "image": "vivienda/1/vestibulo_cocina_entrada.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 54,
                  "nemo": "Focos techo Vestibulo Coc./Ent.",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 55,
                  "nemo": "Focos techo Ropero",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 56,
                  "nemo": "Focos techo Despensa",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 28,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 54,
                        "nemo": "Focos techo Vestibulo Coc./Ent.",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 55,
                        "nemo": "Focos techo Ropero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 56,
                        "nemo": "Focos techo Despensa",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 29,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 54,
                        "nemo": "Focos techo Vestibulo Coc./Ent.",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 55,
                        "nemo": "Focos techo Ropero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 56,
                        "nemo": "Focos techo Despensa",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 30,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 54,
                        "nemo": "Focos techo Vestibulo Coc./Ent.",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 55,
                        "nemo": "Focos techo Ropero",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 56,
                        "nemo": "Focos techo Despensa",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 13,
              "nemo": "Almacen Sotano",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 1,
          "climateStatus": 1,
          "blindsEnabled": 1,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 143,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 51,
                    "nemo": "Led techo cocina",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 52,
                    "nemo": "Focos techo Armario Frigorifico",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 53,
                    "nemo": "Focos techo comedor cocina Alejandro",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 49,
                    "nemo": "Focos techo cocina",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 50,
                    "nemo": "Led techo cocina",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 54,
                    "nemo": "Focos techo Vestibulo Coc./Ent.",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 55,
                    "nemo": "Focos techo Ropero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 56,
                    "nemo": "Focos techo Despensa",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 144,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 51,
                    "nemo": "Led techo cocina",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 52,
                    "nemo": "Focos techo Armario Frigorifico",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 53,
                    "nemo": "Focos techo comedor cocina Alejandro",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 49,
                    "nemo": "Focos techo cocina",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 50,
                    "nemo": "Led techo cocina",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 54,
                    "nemo": "Focos techo Vestibulo Coc./Ent.",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 55,
                    "nemo": "Focos techo Ropero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 56,
                    "nemo": "Focos techo Despensa",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 3,
          "nemo": "Habitaciones Principales",
          "icon": "fas fa-bed",
          "subgroups": [
            {
              "id": 1,
              "nemo": "Hall Habitaciones",
              "icon": "fas fa-door-closed",
              "rooms": [
                {
                  "model": 2,
                  "id": 14,
                  "nemo": "Hall",
                  "image": "vivienda/1/distribuidor_pril.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 21,
                      "nemo": "Focos techo Vestibulo",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": null,
                  "climateStatus": null,
                  "temperature": null,
                  "humidity": null,
                  "co2": null,
                  "value": null,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": null,
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 0,
              "climateStatus": 0,
              "blindsEnabled": 0,
              "iotEnabled": 0,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 0,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            },
            {
              "id": 2,
              "nemo": "Alejandro",
              "icon": "fa fa-male",
              "rooms": [
                {
                  "model": 2,
                  "id": 15,
                  "nemo": "Habitacion",
                  "image": "vivienda/1/habitacion_alejandro.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 22,
                      "nemo": "Focos Techo Cabecero",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 23,
                      "nemo": "Focos Techo Habitacion",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 24,
                      "nemo": "Led Habitacion",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 5,
                      "status": 1,
                      "nemo": "Hab. Alejandro",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": [
                    {
                      "id": 17,
                      "nemo": "Enchufe TV",
                      "status": 0
                    },
                    {
                      "id": 20,
                      "nemo": "Enchufe Cabecero Izquierdo",
                      "status": 0
                    },
                    {
                      "id": 21,
                      "nemo": "Enchufe Cabecero Derecho",
                      "status": 0
                    }
                  ],
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": 1,
                  "louvers": [
                    {
                      "id": 3,
                      "nemo": "Persiana Derecha",
                      "position": 2,
                      "dim": 1
                    },
                    {
                      "id": 4,
                      "nemo": "Persiana Izquierda",
                      "position": null,
                      "dim": null
                    },
                    {
                      "id": 5,
                      "nemo": "Persiana Lateral",
                      "position": null,
                      "dim": null
                    },
                    {
                      "id": 6,
                      "nemo": "Vestibulo baño",
                      "position": null,
                      "dim": null
                    }
                  ],
                  "multimediaStatus": 1,
                  "multimedia": [
                    {
                      "id": 1,
                      "nemo": "tv techo",
                      "status": null,
                      "type": 2
                    }
                  ],
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 31,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 22,
                            "nemo": "Focos Techo Cabecero",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 23,
                            "nemo": "Focos Techo Habitacion",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 24,
                            "nemo": "Led Habitacion",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 32,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 22,
                            "nemo": "Focos Techo Cabecero",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 23,
                            "nemo": "Focos Techo Habitacion",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 24,
                            "nemo": "Led Habitacion",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 33,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 22,
                            "nemo": "Focos Techo Cabecero",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 23,
                            "nemo": "Focos Techo Habitacion",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 24,
                            "nemo": "Led Habitacion",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 16,
                  "nemo": "Baño",
                  "image": "vivienda/1/bano_alejandro.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 25,
                      "nemo": "Focos Techo Baño",
                      "status": 0,
                      "intensity": 79,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 26,
                      "nemo": "Focos Techo Inodoro",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 27,
                      "nemo": "Focos Techo Espejo Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 28,
                      "nemo": "Focos techo jacuzzi Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 29,
                      "nemo": "Led jacuzzi Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 6,
                      "status": 0,
                      "nemo": "Baño Alejandro",
                      "temperature": 23.88,
                      "value": 26,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 0,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 26,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": 1,
                  "blinds": [
                    {
                      "id": 7,
                      "nemo": "Jacuzzi",
                      "position": null,
                      "level": 80
                    }
                  ],
                  "louverStatus": 1,
                  "louvers": [
                    {
                      "id": 1,
                      "nemo": "Ducha",
                      "position": 1,
                      "dim": null
                    },
                    {
                      "id": 2,
                      "nemo": "Inodoro",
                      "position": null,
                      "dim": null
                    }
                  ],
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 34,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 25,
                            "nemo": "Focos Techo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 26,
                            "nemo": "Focos Techo Inodoro",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 27,
                            "nemo": "Focos Techo Espejo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 28,
                            "nemo": "Focos techo jacuzzi Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 29,
                            "nemo": "Led jacuzzi Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 35,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 25,
                            "nemo": "Focos Techo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 26,
                            "nemo": "Focos Techo Inodoro",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 27,
                            "nemo": "Focos Techo Espejo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 28,
                            "nemo": "Focos techo jacuzzi Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 29,
                            "nemo": "Led jacuzzi Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 36,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 25,
                            "nemo": "Focos Techo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 26,
                            "nemo": "Focos Techo Inodoro",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 27,
                            "nemo": "Focos Techo Espejo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 28,
                            "nemo": "Focos techo jacuzzi Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 29,
                            "nemo": "Led jacuzzi Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 17,
                  "nemo": "Vestidor",
                  "image": "vivienda/1/vestidor_alejandro.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 30,
                      "nemo": "Led vestidor",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 37,
                      "nemo": "Led Armarios",
                      "status": 0,
                      "intensity": -1,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 7,
                      "status": 1,
                      "nemo": "Vestidor Alejandro",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": 1,
                  "blinds": [
                    {
                      "id": 5,
                      "nemo": "Vestidor Dcha",
                      "position": null,
                      "level": 100
                    },
                    {
                      "id": 6,
                      "nemo": "Vestidor Izq",
                      "position": null,
                      "level": 100
                    }
                  ],
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 37,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 30,
                            "nemo": "Led vestidor",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 37,
                            "nemo": "Led Armarios",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 38,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 30,
                            "nemo": "Led vestidor",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 37,
                            "nemo": "Led Armarios",
                            "status": 1,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 39,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 30,
                            "nemo": "Led vestidor",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 37,
                            "nemo": "Led Armarios",
                            "status": 1,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": [
                      {
                        "id": 120,
                        "nemo": "Bajar Todo",
                        "status": 1,
                        "type": 0,
                        "blinds": []
                      },
                      {
                        "id": 121,
                        "nemo": "Subir Todo",
                        "status": 0,
                        "type": 1,
                        "blinds": []
                      }
                    ],
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 1,
              "climateStatus": 1,
              "blindsEnabled": 1,
              "iotEnabled": 1,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 1,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 127,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 22,
                        "nemo": "Focos Techo Cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 23,
                        "nemo": "Focos Techo Habitacion",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 24,
                        "nemo": "Led Habitacion",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 25,
                        "nemo": "Focos Techo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 26,
                        "nemo": "Focos Techo Inodoro",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 27,
                        "nemo": "Focos Techo Espejo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 28,
                        "nemo": "Focos techo jacuzzi Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 29,
                        "nemo": "Led jacuzzi Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 30,
                        "nemo": "Led vestidor",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 37,
                        "nemo": "Led Armarios",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 128,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 22,
                        "nemo": "Focos Techo Cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 23,
                        "nemo": "Focos Techo Habitacion",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 24,
                        "nemo": "Led Habitacion",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 25,
                        "nemo": "Focos Techo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 26,
                        "nemo": "Focos Techo Inodoro",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 27,
                        "nemo": "Focos Techo Espejo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 28,
                        "nemo": "Focos techo jacuzzi Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 29,
                        "nemo": "Led jacuzzi Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 30,
                        "nemo": "Led vestidor",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 37,
                        "nemo": "Led Armarios",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": [
                  {
                    "id": 173,
                    "nemo": "Bajar Todo",
                    "status": 1,
                    "type": 0,
                    "blinds": []
                  },
                  {
                    "id": 174,
                    "nemo": "Subir Todo",
                    "status": 0,
                    "type": 1,
                    "blinds": []
                  }
                ],
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            },
            {
              "id": 3,
              "nemo": "Rachel",
              "icon": "fas fa-female",
              "rooms": [
                {
                  "model": 2,
                  "id": 18,
                  "nemo": "Habitacion",
                  "image": "vivienda/1/habitacion_rachel",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 31,
                      "nemo": "Focos techo Habitacion",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 32,
                      "nemo": "Focos Techo Escritorio",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 8,
                      "status": 1,
                      "nemo": "Hab. Rachel",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": [
                    {
                      "id": 18,
                      "nemo": "Enchufe Cabecero Izquierdo",
                      "status": 0
                    },
                    {
                      "id": 19,
                      "nemo": "Enchufe Cabecero Derecho",
                      "status": 0
                    }
                  ],
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": 1,
                  "louvers": [
                    {
                      "id": 7,
                      "nemo": "Persiana Izquierda",
                      "position": null,
                      "dim": null
                    },
                    {
                      "id": 8,
                      "nemo": "Persiana Derecha",
                      "position": null,
                      "dim": null
                    }
                  ],
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 40,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 31,
                            "nemo": "Focos techo Habitacion",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 32,
                            "nemo": "Focos Techo Escritorio",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 41,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 31,
                            "nemo": "Focos techo Habitacion",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 32,
                            "nemo": "Focos Techo Escritorio",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 42,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 31,
                            "nemo": "Focos techo Habitacion",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 32,
                            "nemo": "Focos Techo Escritorio",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 19,
                  "nemo": "Baño",
                  "image": "vivienda/1/bano_rachel.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 33,
                      "nemo": "Focos Techo Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 34,
                      "nemo": "Led Espejo Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 9,
                      "status": 1,
                      "nemo": "Baño Rachel",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": 1,
                  "louvers": [
                    {
                      "id": 9,
                      "nemo": "Baño hab rachel",
                      "position": null,
                      "dim": null
                    }
                  ],
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 43,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 33,
                            "nemo": "Focos Techo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 34,
                            "nemo": "Led Espejo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 44,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 33,
                            "nemo": "Focos Techo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 34,
                            "nemo": "Led Espejo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 45,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 33,
                            "nemo": "Focos Techo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 34,
                            "nemo": "Led Espejo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 20,
                  "nemo": "Vestidor",
                  "image": "vivienda/1/vestidor_rachel.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 35,
                      "nemo": "Led vestidor",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 38,
                      "nemo": "Led Armarios",
                      "status": 0,
                      "intensity": -1,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 10,
                      "status": 1,
                      "nemo": "Vestidor Rachel",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 124,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": null
                      },
                      {
                        "id": 125,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": null
                      },
                      {
                        "id": 126,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": null
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 21,
                  "nemo": "Terraza",
                  "image": "vivienda/1/terrazahabitacionrachel.jpeg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 36,
                      "nemo": "Focos techo terraza",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 39,
                      "nemo": "Led Terraza",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": null,
                  "climateStatus": null,
                  "temperature": null,
                  "humidity": null,
                  "co2": null,
                  "value": null,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 46,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 36,
                            "nemo": "Focos techo terraza",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 39,
                            "nemo": "Led Terraza",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 47,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 36,
                            "nemo": "Focos techo terraza",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 39,
                            "nemo": "Led Terraza",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 48,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 36,
                            "nemo": "Focos techo terraza",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 39,
                            "nemo": "Led Terraza",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 1,
              "climateStatus": 1,
              "blindsEnabled": 0,
              "iotEnabled": 1,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 1,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 129,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 31,
                        "nemo": "Focos techo Habitacion",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 32,
                        "nemo": "Focos Techo Escritorio",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 33,
                        "nemo": "Focos Techo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 34,
                        "nemo": "Led Espejo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 36,
                        "nemo": "Focos techo terraza",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 39,
                        "nemo": "Led Terraza",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 130,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 31,
                        "nemo": "Focos techo Habitacion",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 32,
                        "nemo": "Focos Techo Escritorio",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 33,
                        "nemo": "Focos Techo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 34,
                        "nemo": "Led Espejo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 36,
                        "nemo": "Focos techo terraza",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 39,
                        "nemo": "Led Terraza",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            }
          ],
          "rooms": null,
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 1,
          "climateStatus": 1,
          "blindsEnabled": 1,
          "iotEnabled": 1,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 1,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 145,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 21,
                    "nemo": "Focos techo Vestibulo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 22,
                    "nemo": "Focos Techo Cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 23,
                    "nemo": "Focos Techo Habitacion",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 24,
                    "nemo": "Led Habitacion",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 25,
                    "nemo": "Focos Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 26,
                    "nemo": "Focos Techo Inodoro",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 27,
                    "nemo": "Focos Techo Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 28,
                    "nemo": "Focos techo jacuzzi Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 29,
                    "nemo": "Led jacuzzi Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 30,
                    "nemo": "Led vestidor",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 37,
                    "nemo": "Led Armarios",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 31,
                    "nemo": "Focos techo Habitacion",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 32,
                    "nemo": "Focos Techo Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 33,
                    "nemo": "Focos Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 34,
                    "nemo": "Led Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 36,
                    "nemo": "Focos techo terraza",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 39,
                    "nemo": "Led Terraza",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 146,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 21,
                    "nemo": "Focos techo Vestibulo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 22,
                    "nemo": "Focos Techo Cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 23,
                    "nemo": "Focos Techo Habitacion",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 24,
                    "nemo": "Led Habitacion",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 25,
                    "nemo": "Focos Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 26,
                    "nemo": "Focos Techo Inodoro",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 27,
                    "nemo": "Focos Techo Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 28,
                    "nemo": "Focos techo jacuzzi Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 29,
                    "nemo": "Led jacuzzi Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 30,
                    "nemo": "Led vestidor",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 37,
                    "nemo": "Led Armarios",
                    "status": 1,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 31,
                    "nemo": "Focos techo Habitacion",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 32,
                    "nemo": "Focos Techo Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 33,
                    "nemo": "Focos Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 34,
                    "nemo": "Led Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 36,
                    "nemo": "Focos techo terraza",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 39,
                    "nemo": "Led Terraza",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": [
              {
                "id": 175,
                "nemo": "Bajar Todo",
                "status": 1,
                "type": 0,
                "blinds": []
              },
              {
                "id": 176,
                "nemo": "Subir Todo",
                "status": 0,
                "type": 1,
                "blinds": []
              }
            ],
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 4,
          "nemo": "Habitaciones niños",
          "icon": "fas fa-bed",
          "subgroups": [
            {
              "id": 4,
              "nemo": "Hall",
              "icon": "fas fa-door-closed",
              "rooms": [
                {
                  "model": 2,
                  "id": 22,
                  "nemo": "Hall",
                  "image": "",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 57,
                      "nemo": "Focos techo puertas",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 58,
                      "nemo": "Focos techo pasillo",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 60,
                      "nemo": "Focos techo zona juegos",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": null,
                  "climateStatus": null,
                  "temperature": null,
                  "humidity": null,
                  "co2": null,
                  "value": null,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": [
                    {
                      "id": 27,
                      "nemo": "Enchufe pasillo derecho",
                      "status": 0
                    }
                  ],
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 49,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 57,
                            "nemo": "Focos techo puertas",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 58,
                            "nemo": "Focos techo pasillo",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 60,
                            "nemo": "Focos techo zona juegos",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 50,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 57,
                            "nemo": "Focos techo puertas",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 58,
                            "nemo": "Focos techo pasillo",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 60,
                            "nemo": "Focos techo zona juegos",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 51,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 57,
                            "nemo": "Focos techo puertas",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 58,
                            "nemo": "Focos techo pasillo",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 60,
                            "nemo": "Focos techo zona juegos",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 0,
              "climateStatus": 0,
              "blindsEnabled": 0,
              "iotEnabled": 1,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 0,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 131,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 57,
                        "nemo": "Focos techo puertas",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 58,
                        "nemo": "Focos techo pasillo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 60,
                        "nemo": "Focos techo zona juegos",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 132,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 57,
                        "nemo": "Focos techo puertas",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 58,
                        "nemo": "Focos techo pasillo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 60,
                        "nemo": "Focos techo zona juegos",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            },
            {
              "id": 5,
              "nemo": "Máximo",
              "icon": "fas fa-child",
              "rooms": [
                {
                  "model": 2,
                  "id": 23,
                  "nemo": "Habitacion",
                  "image": "vivienda/1/habitacion_2.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 1,
                      "nemo": "Cabecero",
                      "status": 0,
                      "intensity": 35,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 2,
                      "nemo": "Armario",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 3,
                      "nemo": "Escritorio",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 1,
                      "status": 1,
                      "nemo": "Habitacion Maximo",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": [
                    {
                      "id": 1,
                      "nemo": "Enchufe Cabecero Derecho",
                      "status": 0
                    },
                    {
                      "id": 2,
                      "nemo": "Enchufe Cabecero Izquierdo",
                      "status": 0
                    },
                    {
                      "id": 3,
                      "nemo": "Enchufe Tv",
                      "status": 0
                    },
                    {
                      "id": 4,
                      "nemo": "Usos Varios",
                      "status": 0
                    }
                  ],
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": 1,
                  "blinds": [
                    {
                      "id": 1,
                      "nemo": "Hab. Maximo",
                      "position": null,
                      "level": 0
                    }
                  ],
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 52,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 1,
                            "nemo": "Cabecero",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 2,
                            "nemo": "Armario",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 3,
                            "nemo": "Escritorio",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 53,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 1,
                            "nemo": "Cabecero",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 2,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 3,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 54,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 1,
                            "nemo": "Cabecero",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 2,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 3,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 24,
                  "nemo": "Baño",
                  "image": "vivienda/1/bano_hab2.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 4,
                      "nemo": "Techo Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 5,
                      "nemo": "Espejo Baño",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": null,
                  "climateStatus": null,
                  "temperature": null,
                  "humidity": null,
                  "co2": null,
                  "value": null,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 55,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 4,
                            "nemo": "Techo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 5,
                            "nemo": "Espejo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 56,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 4,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 5,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 57,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 4,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 5,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 1,
              "climateStatus": 1,
              "blindsEnabled": 1,
              "iotEnabled": 1,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 0,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 133,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 1,
                        "nemo": "Cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 2,
                        "nemo": "Armario",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 3,
                        "nemo": "Escritorio",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 4,
                        "nemo": "Techo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 5,
                        "nemo": "Espejo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 134,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 1,
                        "nemo": "Cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 2,
                        "nemo": "Armario",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 3,
                        "nemo": "Escritorio",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 4,
                        "nemo": "Techo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 5,
                        "nemo": "Espejo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            },
            {
              "id": 6,
              "nemo": "Alma",
              "icon": "fas fa-child",
              "rooms": [
                {
                  "model": 2,
                  "id": 25,
                  "nemo": "Habitacion",
                  "image": "vivienda/1/habitacion_3.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 6,
                      "nemo": "Cabecero",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 7,
                      "nemo": "Armario",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 8,
                      "nemo": "Escritorio",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 2,
                      "status": 1,
                      "nemo": "Habitacion Alma",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": [
                    {
                      "id": 5,
                      "nemo": "Enchufe Cabecero Derecho",
                      "status": 0
                    },
                    {
                      "id": 6,
                      "nemo": "Enchufe Cabecero Izquierdo",
                      "status": 0
                    },
                    {
                      "id": 7,
                      "nemo": "Enchufe tv",
                      "status": 0
                    },
                    {
                      "id": 8,
                      "nemo": "Usos Varios",
                      "status": 0
                    }
                  ],
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": 1,
                  "blinds": [
                    {
                      "id": 2,
                      "nemo": "Hab. Alma",
                      "position": null,
                      "level": 0
                    }
                  ],
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 58,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 6,
                            "nemo": "Cabecero",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 7,
                            "nemo": "Armario",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 8,
                            "nemo": "Escritorio",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 59,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 6,
                            "nemo": "Cabecero",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 7,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 8,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 60,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 6,
                            "nemo": "Cabecero",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 7,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 8,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 26,
                  "nemo": "Baño",
                  "image": "vivienda/1/bano_hab3.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 9,
                      "nemo": "Techo Baño",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 10,
                      "nemo": "Espejo Baño",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": null,
                  "climateStatus": null,
                  "temperature": null,
                  "humidity": null,
                  "co2": null,
                  "value": null,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 61,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 9,
                            "nemo": "Techo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 10,
                            "nemo": "Espejo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 62,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 9,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 10,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 63,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 9,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 10,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 1,
              "climateStatus": 1,
              "blindsEnabled": 1,
              "iotEnabled": 1,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 0,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 135,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 6,
                        "nemo": "Cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 7,
                        "nemo": "Armario",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 8,
                        "nemo": "Escritorio",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 9,
                        "nemo": "Techo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 10,
                        "nemo": "Espejo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 136,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 6,
                        "nemo": "Cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 7,
                        "nemo": "Armario",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 8,
                        "nemo": "Escritorio",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 9,
                        "nemo": "Techo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 10,
                        "nemo": "Espejo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            },
            {
              "id": 7,
              "nemo": "Dylan",
              "icon": "fas fa-child",
              "rooms": [
                {
                  "model": 2,
                  "id": 27,
                  "nemo": "Habitacion",
                  "image": "vivienda/1/habitacion_4.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 11,
                      "nemo": "cabecero",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 12,
                      "nemo": "Armario",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 13,
                      "nemo": "Escritorio",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 3,
                      "status": 1,
                      "nemo": "Habitacion Dylan",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": [
                    {
                      "id": 9,
                      "nemo": "Enchufe cabecero Derecho",
                      "status": 0
                    },
                    {
                      "id": 10,
                      "nemo": "Enchufe Cabecero Izquierdo",
                      "status": 0
                    },
                    {
                      "id": 11,
                      "nemo": "Enchufe tv",
                      "status": 0
                    },
                    {
                      "id": 12,
                      "nemo": "Estado usos varios",
                      "status": 0
                    }
                  ],
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": 1,
                  "blinds": [
                    {
                      "id": 3,
                      "nemo": "Hab. Dylan",
                      "position": null,
                      "level": 0
                    }
                  ],
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 64,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 11,
                            "nemo": "cabecero",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 12,
                            "nemo": "Armario",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 13,
                            "nemo": "Escritorio",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 65,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 11,
                            "nemo": "cabecero",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 12,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 13,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 66,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 11,
                            "nemo": "cabecero",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 12,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 13,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 28,
                  "nemo": "Baño",
                  "image": "vivienda/1/bano_hab4.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 14,
                      "nemo": "Techo Baño",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 15,
                      "nemo": "Espejo Baño",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": null,
                  "climateStatus": null,
                  "temperature": null,
                  "humidity": null,
                  "co2": null,
                  "value": null,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 67,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 14,
                            "nemo": "Techo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 15,
                            "nemo": "Espejo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 68,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 14,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 15,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 69,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 14,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 15,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 1,
              "climateStatus": 1,
              "blindsEnabled": 1,
              "iotEnabled": 1,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 0,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 137,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 11,
                        "nemo": "cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 12,
                        "nemo": "Armario",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 13,
                        "nemo": "Escritorio",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 14,
                        "nemo": "Techo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 15,
                        "nemo": "Espejo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 138,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 11,
                        "nemo": "cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 12,
                        "nemo": "Armario",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 13,
                        "nemo": "Escritorio",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 14,
                        "nemo": "Techo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 15,
                        "nemo": "Espejo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            },
            {
              "id": 8,
              "nemo": "Manuela",
              "icon": "fas fa-child",
              "rooms": [
                {
                  "model": 2,
                  "id": 29,
                  "nemo": "Habitacion",
                  "image": "vivienda/1/habitacion_5.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 16,
                      "nemo": "Cabecero",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 17,
                      "nemo": "Armario",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 18,
                      "nemo": "Escritorio",
                      "status": 0,
                      "intensity": 75,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": [
                    {
                      "id": 4,
                      "status": 1,
                      "nemo": "Habitacion Manuela",
                      "temperature": 23.88,
                      "value": 19,
                      "humidity": null,
                      "co2": null
                    }
                  ],
                  "climateStatus": 1,
                  "temperature": 23.88,
                  "humidity": null,
                  "co2": null,
                  "value": 19,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": [
                    {
                      "id": 13,
                      "nemo": "Enchufe cabecero Derecho",
                      "status": 0
                    },
                    {
                      "id": 14,
                      "nemo": "Enchufe Cabecero Izquierdo",
                      "status": 0
                    },
                    {
                      "id": 15,
                      "nemo": "Enchufe tv",
                      "status": 0
                    },
                    {
                      "id": 16,
                      "nemo": "Usos varios",
                      "status": 0
                    }
                  ],
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": 1,
                  "blinds": [
                    {
                      "id": 4,
                      "nemo": "Hab. Manuela",
                      "position": null,
                      "level": 0
                    }
                  ],
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 70,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 16,
                            "nemo": "Cabecero",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 17,
                            "nemo": "Armario",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 18,
                            "nemo": "Escritorio",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 71,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 16,
                            "nemo": "Cabecero",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 17,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 18,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 72,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 16,
                            "nemo": "Cabecero",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 17,
                            "nemo": "Armario",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 18,
                            "nemo": "Escritorio",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                },
                {
                  "model": 2,
                  "id": 30,
                  "nemo": "Baño",
                  "image": "vivienda/1/bano_hab5.jpg",
                  "lightStatus": null,
                  "intensityEnabled": 1,
                  "colorEnabled": 0,
                  "temperatureEnabled": 0,
                  "lightsMode": null,
                  "lights": [
                    {
                      "id": 19,
                      "nemo": "Techo Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    },
                    {
                      "id": 20,
                      "nemo": "Espejo Baño",
                      "status": 0,
                      "intensity": 100,
                      "color": null,
                      "temperature": "-1"
                    }
                  ],
                  "climate": null,
                  "climateStatus": null,
                  "temperature": null,
                  "humidity": null,
                  "co2": null,
                  "value": null,
                  "fancoil": null,
                  "iotStatus": null,
                  "iot": null,
                  "pumpStatus": null,
                  "pumps": null,
                  "blindStatus": null,
                  "blinds": null,
                  "louverStatus": null,
                  "louvers": null,
                  "multimediaStatus": null,
                  "multimedia": null,
                  "depuration": null,
                  "pool": [],
                  "programmingEnabled": 0,
                  "programming": null,
                  "scenesEnabled": 1,
                  "scenes": {
                    "lights": [
                      {
                        "id": 73,
                        "nemo": "Apagar",
                        "status": 1,
                        "type": 0,
                        "lights": [
                          {
                            "id": 19,
                            "nemo": "Techo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 20,
                            "nemo": "Espejo Baño",
                            "status": 0,
                            "intensity": -1,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 74,
                        "nemo": "Maxima",
                        "status": 0,
                        "type": 1,
                        "lights": [
                          {
                            "id": 19,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 20,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 100,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      },
                      {
                        "id": 75,
                        "nemo": "Standard",
                        "status": 0,
                        "type": 2,
                        "lights": [
                          {
                            "id": 19,
                            "nemo": "Techo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          },
                          {
                            "id": 20,
                            "nemo": "Espejo Baño",
                            "status": 1,
                            "intensity": 50,
                            "color": null,
                            "temperature": "-1"
                          }
                        ]
                      }
                    ],
                    "climate": null,
                    "blinds": null,
                    "iot": null,
                    "louvers": null,
                    "fancoils": null
                  },
                  "ambientsEnabled": 1,
                  "ambients": [
                    {
                      "id": null,
                      "nemo": "Ambiente1",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente2",
                      "status": 0,
                      "elements": null
                    },
                    {
                      "id": null,
                      "nemo": "Ambiente3",
                      "status": 0,
                      "elements": null
                    }
                  ],
                  "routinesEnabled": 1,
                  "routines": null,
                  "roomMode": null,
                  "distribution_panel": [
                    {
                      "id": 1,
                      "nemo": "HABITACION INVITADOS",
                      "dimension": "2x12",
                      "automatics": [
                        {
                          "id": 1,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Automatico General",
                          "type": 4,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 2,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Alumbrado",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 3,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Usos Varios",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 4,
                          "fila": 2,
                          "nemofila": "Fila 2",
                          "description": null,
                          "nemo": "Maniobra",
                          "type": 2,
                          "status": null,
                          "status_enable": -1
                        },
                        {
                          "id": 5,
                          "fila": 2,
                          "nemofila": "",
                          "description": null,
                          "nemo": "",
                          "type": -1,
                          "status": null,
                          "status_enable": null
                        }
                      ]
                    }
                  ]
                }
              ],
              "lightsStatus": 0,
              "lightsEnabled": 1,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "climateEnabled": 1,
              "climateStatus": 1,
              "blindsEnabled": 1,
              "iotEnabled": 1,
              "iotStatus": 0,
              "pumpsEnabled": 0,
              "pumpsStatus": 0,
              "louversEnabled": 0,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 139,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 16,
                        "nemo": "Cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 17,
                        "nemo": "Armario",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 18,
                        "nemo": "Escritorio",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 19,
                        "nemo": "Techo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 20,
                        "nemo": "Espejo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 140,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 16,
                        "nemo": "Cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 17,
                        "nemo": "Armario",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 18,
                        "nemo": "Escritorio",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 19,
                        "nemo": "Techo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 20,
                        "nemo": "Espejo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            }
          ],
          "rooms": null,
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 1,
          "climateStatus": 1,
          "blindsEnabled": 1,
          "iotEnabled": 1,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 147,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 57,
                    "nemo": "Focos techo puertas",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 58,
                    "nemo": "Focos techo pasillo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 60,
                    "nemo": "Focos techo zona juegos",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 1,
                    "nemo": "Cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 2,
                    "nemo": "Armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 3,
                    "nemo": "Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 4,
                    "nemo": "Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 5,
                    "nemo": "Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 6,
                    "nemo": "Cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 7,
                    "nemo": "Armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 8,
                    "nemo": "Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 9,
                    "nemo": "Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 10,
                    "nemo": "Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 11,
                    "nemo": "cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 12,
                    "nemo": "Armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 13,
                    "nemo": "Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 14,
                    "nemo": "Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 15,
                    "nemo": "Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 16,
                    "nemo": "Cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 17,
                    "nemo": "Armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 18,
                    "nemo": "Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 19,
                    "nemo": "Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 20,
                    "nemo": "Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 148,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 57,
                    "nemo": "Focos techo puertas",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 58,
                    "nemo": "Focos techo pasillo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 60,
                    "nemo": "Focos techo zona juegos",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 1,
                    "nemo": "Cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 2,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 3,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 4,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 5,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 6,
                    "nemo": "Cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 7,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 8,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 9,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 10,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 11,
                    "nemo": "cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 12,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 13,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 14,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 15,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 16,
                    "nemo": "Cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 17,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 18,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 19,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 20,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": [
              {
                "id": 177,
                "nemo": "Bajar Todo",
                "status": 1,
                "type": 0,
                "blinds": []
              },
              {
                "id": 178,
                "nemo": "Subir Todo",
                "status": 0,
                "type": 1,
                "blinds": []
              }
            ],
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 5,
          "nemo": "Otras Dependencias",
          "icon": "fas fa-cogs",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 31,
              "nemo": "Entrada Principal",
              "image": "vivienda/1/entrada.jpg ",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 71,
                  "nemo": "Led perimetro exterior entrada principal",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 72,
                  "nemo": "Led entrada principal",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 112,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 71,
                        "nemo": "Led perimetro exterior entrada principal",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 72,
                        "nemo": "Led entrada principal",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 113,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 71,
                        "nemo": "Led perimetro exterior entrada principal",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 72,
                        "nemo": "Led entrada principal",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 114,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 71,
                        "nemo": "Led perimetro exterior entrada principal",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 72,
                        "nemo": "Led entrada principal",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 32,
              "nemo": "Biblioteca",
              "image": "vivienda/1/biblio.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 46,
                  "nemo": "Focos techo biblioteca",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 47,
                  "nemo": "Led techo biblioteca",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 13,
                  "status": 1,
                  "nemo": "Biblioteca",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 1,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": [
                {
                  "id": 22,
                  "nemo": "Enchufe suelo",
                  "status": 1
                },
                {
                  "id": 23,
                  "nemo": "Usos varios",
                  "status": 1
                }
              ],
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 115,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 46,
                        "nemo": "Focos techo biblioteca",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 47,
                        "nemo": "Led techo biblioteca",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 116,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 46,
                        "nemo": "Focos techo biblioteca",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 47,
                        "nemo": "Led techo biblioteca",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 117,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 46,
                        "nemo": "Focos techo biblioteca",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 47,
                        "nemo": "Led techo biblioteca",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 1,
          "climateStatus": 1,
          "blindsEnabled": 0,
          "iotEnabled": 1,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 149,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 71,
                    "nemo": "Led perimetro exterior entrada principal",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 72,
                    "nemo": "Led entrada principal",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 46,
                    "nemo": "Focos techo biblioteca",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 47,
                    "nemo": "Led techo biblioteca",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 150,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 71,
                    "nemo": "Led perimetro exterior entrada principal",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 72,
                    "nemo": "Led entrada principal",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 46,
                    "nemo": "Focos techo biblioteca",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 47,
                    "nemo": "Led techo biblioteca",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        }
      ],
      "rooms": null,
      "lightsStatus": 0,
      "lightsEnabled": 1,
      "intensityEnabled": 1,
      "colorEnabled": 0,
      "temperatureEnabled": 0,
      "climateEnabled": 1,
      "climateStatus": 1,
      "blindsEnabled": 1,
      "iotEnabled": 1,
      "iotStatus": 0,
      "pumpsEnabled": 0,
      "pumpsStatus": 0,
      "louversEnabled": 1,
      "scenesEnabled": 1,
      "scenes": {
        "lights": [
          {
            "id": 165,
            "nemo": "Apagar",
            "status": 1,
            "type": 0,
            "lights": [
              {
                "id": 61,
                "nemo": "Led Perimetro pasillo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 62,
                "nemo": "Focos techo centro comedor",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 63,
                "nemo": "Focos techo laterales comedor",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 64,
                "nemo": "Focos techo pasillo sala tv",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 40,
                "nemo": "Led Bar",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 45,
                "nemo": "Barra Bar",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 48,
                "nemo": "Focos techo distribuidor",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 41,
                "nemo": "Focos techo sala cine",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 42,
                "nemo": "Led sala cine",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 65,
                "nemo": "Focos techo vestibulo sala tv",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 66,
                "nemo": "Focos techo sala TV",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 69,
                "nemo": "Focos techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 70,
                "nemo": "Espejo techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 51,
                "nemo": "Led techo cocina",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 52,
                "nemo": "Focos techo Armario Frigorifico",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 53,
                "nemo": "Focos techo comedor cocina Alejandro",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 49,
                "nemo": "Focos techo cocina",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 50,
                "nemo": "Led techo cocina",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 54,
                "nemo": "Focos techo Vestibulo Coc./Ent.",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 55,
                "nemo": "Focos techo Ropero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 56,
                "nemo": "Focos techo Despensa",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 21,
                "nemo": "Focos techo Vestibulo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 22,
                "nemo": "Focos Techo Cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 23,
                "nemo": "Focos Techo Habitacion",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 24,
                "nemo": "Led Habitacion",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 25,
                "nemo": "Focos Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 26,
                "nemo": "Focos Techo Inodoro",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 27,
                "nemo": "Focos Techo Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 28,
                "nemo": "Focos techo jacuzzi Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 29,
                "nemo": "Led jacuzzi Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 30,
                "nemo": "Led vestidor",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 37,
                "nemo": "Led Armarios",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 31,
                "nemo": "Focos techo Habitacion",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 32,
                "nemo": "Focos Techo Escritorio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 33,
                "nemo": "Focos Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 34,
                "nemo": "Led Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 36,
                "nemo": "Focos techo terraza",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 39,
                "nemo": "Led Terraza",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 57,
                "nemo": "Focos techo puertas",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 58,
                "nemo": "Focos techo pasillo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 60,
                "nemo": "Focos techo zona juegos",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 1,
                "nemo": "Cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 2,
                "nemo": "Armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 3,
                "nemo": "Escritorio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 4,
                "nemo": "Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 5,
                "nemo": "Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 6,
                "nemo": "Cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 7,
                "nemo": "Armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 8,
                "nemo": "Escritorio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 9,
                "nemo": "Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 10,
                "nemo": "Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 11,
                "nemo": "cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 12,
                "nemo": "Armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 13,
                "nemo": "Escritorio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 14,
                "nemo": "Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 15,
                "nemo": "Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 16,
                "nemo": "Cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 17,
                "nemo": "Armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 18,
                "nemo": "Escritorio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 19,
                "nemo": "Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 20,
                "nemo": "Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 71,
                "nemo": "Led perimetro exterior entrada principal",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 72,
                "nemo": "Led entrada principal",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 46,
                "nemo": "Focos techo biblioteca",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 47,
                "nemo": "Led techo biblioteca",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              }
            ]
          },
          {
            "id": 166,
            "nemo": "Maxima",
            "status": 0,
            "type": 1,
            "lights": [
              {
                "id": 61,
                "nemo": "Led Perimetro pasillo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 62,
                "nemo": "Focos techo centro comedor",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 63,
                "nemo": "Focos techo laterales comedor",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 64,
                "nemo": "Focos techo pasillo sala tv",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 40,
                "nemo": "Led Bar",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 45,
                "nemo": "Barra Bar",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 48,
                "nemo": "Focos techo distribuidor",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 41,
                "nemo": "Focos techo sala cine",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 42,
                "nemo": "Led sala cine",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 65,
                "nemo": "Focos techo vestibulo sala tv",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 66,
                "nemo": "Focos techo sala TV",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 69,
                "nemo": "Focos techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 70,
                "nemo": "Espejo techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 51,
                "nemo": "Led techo cocina",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 52,
                "nemo": "Focos techo Armario Frigorifico",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 53,
                "nemo": "Focos techo comedor cocina Alejandro",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 49,
                "nemo": "Focos techo cocina",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 50,
                "nemo": "Led techo cocina",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 54,
                "nemo": "Focos techo Vestibulo Coc./Ent.",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 55,
                "nemo": "Focos techo Ropero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 56,
                "nemo": "Focos techo Despensa",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 21,
                "nemo": "Focos techo Vestibulo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 22,
                "nemo": "Focos Techo Cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 23,
                "nemo": "Focos Techo Habitacion",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 24,
                "nemo": "Led Habitacion",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 25,
                "nemo": "Focos Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 26,
                "nemo": "Focos Techo Inodoro",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 27,
                "nemo": "Focos Techo Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 28,
                "nemo": "Focos techo jacuzzi Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 29,
                "nemo": "Led jacuzzi Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 30,
                "nemo": "Led vestidor",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 37,
                "nemo": "Led Armarios",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 31,
                "nemo": "Focos techo Habitacion",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 32,
                "nemo": "Focos Techo Escritorio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 33,
                "nemo": "Focos Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 34,
                "nemo": "Led Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 36,
                "nemo": "Focos techo terraza",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 39,
                "nemo": "Led Terraza",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 57,
                "nemo": "Focos techo puertas",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 58,
                "nemo": "Focos techo pasillo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 60,
                "nemo": "Focos techo zona juegos",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 1,
                "nemo": "Cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 2,
                "nemo": "Armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 3,
                "nemo": "Escritorio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 4,
                "nemo": "Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 5,
                "nemo": "Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 6,
                "nemo": "Cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 7,
                "nemo": "Armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 8,
                "nemo": "Escritorio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 9,
                "nemo": "Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 10,
                "nemo": "Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 11,
                "nemo": "cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 12,
                "nemo": "Armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 13,
                "nemo": "Escritorio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 14,
                "nemo": "Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 15,
                "nemo": "Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 16,
                "nemo": "Cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 17,
                "nemo": "Armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 18,
                "nemo": "Escritorio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 19,
                "nemo": "Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 20,
                "nemo": "Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 71,
                "nemo": "Led perimetro exterior entrada principal",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 72,
                "nemo": "Led entrada principal",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 46,
                "nemo": "Focos techo biblioteca",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 47,
                "nemo": "Led techo biblioteca",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              }
            ]
          }
        ],
        "climate": null,
        "blinds": [
          {
            "id": 183,
            "nemo": "Bajar Todo",
            "status": 1,
            "type": 0,
            "blinds": []
          },
          {
            "id": 184,
            "nemo": "Subir Todo",
            "status": 0,
            "type": 1,
            "blinds": []
          }
        ],
        "iot": null,
        "louvers": null,
        "fancoils": null
      },
      "ambientsEnabled": 1,
      "ambients": [
        {
          "id": null,
          "nemo": "Ambiente1",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente2",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente3",
          "status": 0,
          "elements": null
        }
      ],
      "routinesEnabled": 1,
      "routines": null,
      "sleep": null
    },
    {
      "id": 3,
      "nemo": "Sotano",
      "icon": "fas fa-seedling",
      "groups": [
        {
          "id": 6,
          "nemo": "Instalaciones",
          "icon": "fas fa-wrench",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 33,
              "nemo": "Sala Maq./Pisc. Int.",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 113,
                  "nemo": "Sala depuracion",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 34,
              "nemo": "Sala clima",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 35,
              "nemo": "Deshumectadora",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 36,
              "nemo": "Room Manager",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 37,
              "nemo": "Trastero",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 0,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": null,
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 7,
          "nemo": "WellNess",
          "icon": "fas fa-spa",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 38,
              "nemo": "Gimnasio",
              "image": "vivienda/1/gimnasio.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 106,
                  "nemo": "Focos techo",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 107,
                  "nemo": "Led techo",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": [
                {
                  "id": 2,
                  "status": 0,
                  "nemo": "Gimnasio",
                  "temperature": null,
                  "value": 22,
                  "speed": 0,
                  "sleep": 0
                }
              ],
              "iotStatus": null,
              "iot": [
                {
                  "id": 33,
                  "nemo": "Enchufe TV",
                  "status": 1
                }
              ],
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 76,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 106,
                        "nemo": "Focos techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 107,
                        "nemo": "Led techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 77,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 106,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 107,
                        "nemo": "Led techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 78,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 106,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 107,
                        "nemo": "Led techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 39,
              "nemo": "Baño Turco",
              "image": "vivienda/1/banoturco.jpeg",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 5,
              "id": 40,
              "nemo": "Piscina Interior",
              "image": "vivienda/1/piscinainterior.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 1,
              "temperatureEnabled": 1,
              "lightsMode": null,
              "lights": [
                {
                  "id": 101,
                  "nemo": "Led perimetro techo",
                  "status": 0,
                  "intensity": 100,
                  "color": "255,255,255",
                  "temperature": "0"
                },
                {
                  "id": 102,
                  "nemo": "Led hamacas",
                  "status": 0,
                  "intensity": 100,
                  "color": "255,255,255",
                  "temperature": "0"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": [
                {
                  "id": 32,
                  "nemo": "Enchufe zona hamacas",
                  "status": 1
                }
              ],
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [
                {
                  "id": 1,
                  "nemo": "PISCINA INTERIOR",
                  "temperature": null,
                  "ph": null,
                  "redox": null,
                  "status_depuration": null,
                  "status_light": null,
                  "cobertor": null
                }
              ],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 79,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 101,
                        "nemo": "Led perimetro techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 102,
                        "nemo": "Led hamacas",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 80,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 101,
                        "nemo": "Led perimetro techo",
                        "status": 1,
                        "intensity": 100,
                        "color": "255$255$255",
                        "temperature": "0"
                      },
                      {
                        "id": 102,
                        "nemo": "Led hamacas",
                        "status": 1,
                        "intensity": 100,
                        "color": "255$255$255",
                        "temperature": "0"
                      }
                    ]
                  },
                  {
                    "id": 81,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 101,
                        "nemo": "Led perimetro techo",
                        "status": 1,
                        "intensity": 50,
                        "color": "255$255$255",
                        "temperature": "0"
                      },
                      {
                        "id": 102,
                        "nemo": "Led hamacas",
                        "status": 1,
                        "intensity": 50,
                        "color": "255$255$255",
                        "temperature": "0"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 41,
              "nemo": "Baño 1 piscina interior",
              "image": "vivienda/1/bano1piscinainterior.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 98,
                  "nemo": "Focos techo",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 99,
                  "nemo": "Led Espejo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 82,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 98,
                        "nemo": "Focos techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 99,
                        "nemo": "Led Espejo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 83,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 98,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 99,
                        "nemo": "Led Espejo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 84,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 98,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 99,
                        "nemo": "Led Espejo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 42,
              "nemo": "Baño 2 piscina interior",
              "image": "vivienda/1/bano2piscinainterior.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 100,
                  "nemo": "Focos techo",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 103,
                  "nemo": "Led espejo",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 85,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 100,
                        "nemo": "Focos techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 103,
                        "nemo": "Led espejo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 86,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 100,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 103,
                        "nemo": "Led espejo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 87,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 100,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 103,
                        "nemo": "Led espejo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 1,
          "temperatureEnabled": 1,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 1,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 151,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 106,
                    "nemo": "Focos techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 107,
                    "nemo": "Led techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 101,
                    "nemo": "Led perimetro techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 102,
                    "nemo": "Led hamacas",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 98,
                    "nemo": "Focos techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 99,
                    "nemo": "Led Espejo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 100,
                    "nemo": "Focos techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 103,
                    "nemo": "Led espejo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 152,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 106,
                    "nemo": "Focos techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 107,
                    "nemo": "Led techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 101,
                    "nemo": "Led perimetro techo",
                    "status": 1,
                    "intensity": 100,
                    "color": "255$255$255",
                    "temperature": "0"
                  },
                  {
                    "id": 102,
                    "nemo": "Led hamacas",
                    "status": 1,
                    "intensity": 100,
                    "color": "255$255$255",
                    "temperature": "0"
                  },
                  {
                    "id": 98,
                    "nemo": "Focos techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 99,
                    "nemo": "Led Espejo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 100,
                    "nemo": "Focos techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 103,
                    "nemo": "Led espejo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 8,
          "nemo": "Habitaciones",
          "icon": "fas fa-bed",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 43,
              "nemo": "Luna",
              "image": "vivienda/1/habitacionluna.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 90,
                  "nemo": "Focos techo armario",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 91,
                  "nemo": "Focos techo cabecero",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 92,
                  "nemo": "Focos techo baño",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 93,
                  "nemo": "Espejo baño",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": 1,
              "blinds": [
                {
                  "id": 12,
                  "nemo": "Hab. Luna",
                  "position": null,
                  "level": 100
                }
              ],
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 88,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 90,
                        "nemo": "Focos techo armario",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 91,
                        "nemo": "Focos techo cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 92,
                        "nemo": "Focos techo baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 93,
                        "nemo": "Espejo baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 89,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 90,
                        "nemo": "Focos techo armario",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 91,
                        "nemo": "Focos techo cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 92,
                        "nemo": "Focos techo baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 93,
                        "nemo": "Espejo baño",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 90,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 90,
                        "nemo": "Focos techo armario",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 91,
                        "nemo": "Focos techo cabecero",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 92,
                        "nemo": "Focos techo baño",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 93,
                        "nemo": "Espejo baño",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 44,
              "nemo": "Sol",
              "image": "vivienda/1/habitacionsol.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 86,
                  "nemo": "Focos techo armario",
                  "status": 0,
                  "intensity": 100,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 87,
                  "nemo": "Focos techo cabecero",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": 1,
              "blinds": [
                {
                  "id": 13,
                  "nemo": "Hab. Sol Dcha",
                  "position": null,
                  "level": 100
                },
                {
                  "id": 14,
                  "nemo": "Hab. Sol Izq",
                  "position": null,
                  "level": 0
                }
              ],
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 91,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 86,
                        "nemo": "Focos techo armario",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 87,
                        "nemo": "Focos techo cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 92,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 86,
                        "nemo": "Focos techo armario",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 87,
                        "nemo": "Focos techo cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 93,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 86,
                        "nemo": "Focos techo armario",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 87,
                        "nemo": "Focos techo cabecero",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": [
                  {
                    "id": 122,
                    "nemo": "Bajar Todo",
                    "status": 1,
                    "type": 0,
                    "blinds": []
                  },
                  {
                    "id": 123,
                    "nemo": "Subir Todo",
                    "status": 0,
                    "type": 1,
                    "blinds": []
                  }
                ],
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 45,
              "nemo": "Habitación Invitados",
              "image": "vivienda/1/habitacioninvitados.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 108,
                  "nemo": "Cabecero",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 109,
                  "nemo": "Armario",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 110,
                  "nemo": "Escritorio",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 111,
                  "nemo": "Techo Baño",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 112,
                  "nemo": "Espejo Baño",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": [
                {
                  "id": 21,
                  "status": 1,
                  "nemo": "habitacion invitados",
                  "temperature": 22,
                  "value": 19,
                  "humidity": null,
                  "co2": null
                }
              ],
              "climateStatus": 1,
              "temperature": 22,
              "humidity": null,
              "co2": null,
              "value": 19,
              "fancoil": null,
              "iotStatus": null,
              "iot": [
                {
                  "id": 34,
                  "nemo": "Enchufe tv",
                  "status": 1
                },
                {
                  "id": 35,
                  "nemo": "Enchufe cabecero Derecho",
                  "status": 1
                },
                {
                  "id": 36,
                  "nemo": "Enchufe Cabecero Izquiero",
                  "status": 1
                },
                {
                  "id": 37,
                  "nemo": "Usos varios",
                  "status": 1
                }
              ],
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": 1,
              "blinds": [
                {
                  "id": 15,
                  "nemo": "Hab. invitados",
                  "position": null,
                  "level": 0
                }
              ],
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 94,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 108,
                        "nemo": "Cabecero",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 109,
                        "nemo": "Armario",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 110,
                        "nemo": "Escritorio",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 111,
                        "nemo": "Techo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 112,
                        "nemo": "Espejo Baño",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 95,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 108,
                        "nemo": "Cabecero",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 109,
                        "nemo": "Armario",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 110,
                        "nemo": "Escritorio",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 111,
                        "nemo": "Techo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 112,
                        "nemo": "Espejo Baño",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 96,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 108,
                        "nemo": "Cabecero",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 109,
                        "nemo": "Armario",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 110,
                        "nemo": "Escritorio",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 111,
                        "nemo": "Techo Baño",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 112,
                        "nemo": "Espejo Baño",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 46,
              "nemo": "Baño Común",
              "image": "vivienda/1/banocomun.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 88,
                  "nemo": "Focos techo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 89,
                  "nemo": "Espejo",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 97,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 88,
                        "nemo": "Focos techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 89,
                        "nemo": "Espejo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 98,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 88,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 89,
                        "nemo": "Espejo",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 99,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 88,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 89,
                        "nemo": "Espejo",
                        "status": 1,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 1,
          "climateStatus": 1,
          "blindsEnabled": 1,
          "iotEnabled": 1,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 153,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 90,
                    "nemo": "Focos techo armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 91,
                    "nemo": "Focos techo cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 92,
                    "nemo": "Focos techo baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 93,
                    "nemo": "Espejo baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 86,
                    "nemo": "Focos techo armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 87,
                    "nemo": "Focos techo cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 108,
                    "nemo": "Cabecero",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 109,
                    "nemo": "Armario",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 110,
                    "nemo": "Escritorio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 111,
                    "nemo": "Techo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 112,
                    "nemo": "Espejo Baño",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 88,
                    "nemo": "Focos techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 89,
                    "nemo": "Espejo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 154,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 90,
                    "nemo": "Focos techo armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 91,
                    "nemo": "Focos techo cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 92,
                    "nemo": "Focos techo baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 93,
                    "nemo": "Espejo baño",
                    "status": 1,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 86,
                    "nemo": "Focos techo armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 87,
                    "nemo": "Focos techo cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 108,
                    "nemo": "Cabecero",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 109,
                    "nemo": "Armario",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 110,
                    "nemo": "Escritorio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 111,
                    "nemo": "Techo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 112,
                    "nemo": "Espejo Baño",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 88,
                    "nemo": "Focos techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 89,
                    "nemo": "Espejo",
                    "status": 1,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": [
              {
                "id": 179,
                "nemo": "Bajar Todo",
                "status": 1,
                "type": 0,
                "blinds": []
              },
              {
                "id": 180,
                "nemo": "Subir Todo",
                "status": 0,
                "type": 1,
                "blinds": []
              }
            ],
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 9,
          "nemo": "Salas",
          "icon": "fas fa-video",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 47,
              "nemo": "Sala Exposiciones",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 48,
              "nemo": "Sala Masajes",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 97,
                  "nemo": "Focos techo Vestibulo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": [
                {
                  "id": 1,
                  "status": 0,
                  "nemo": "Piscina Interior",
                  "temperature": null,
                  "value": 22,
                  "speed": 0,
                  "sleep": 0
                }
              ],
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 49,
              "nemo": "Sala Juegos",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 50,
              "nemo": "Salon Cocina",
              "image": "vivienda/1/saloncocina.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 95,
                  "nemo": "Focos techo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 96,
                  "nemo": "Exterior escaleras servicio",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 100,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 95,
                        "nemo": "Focos techo",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 96,
                        "nemo": "Exterior escaleras servicio",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 101,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 95,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 96,
                        "nemo": "Exterior escaleras servicio",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 102,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 95,
                        "nemo": "Focos techo",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 96,
                        "nemo": "Exterior escaleras servicio",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 155,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 97,
                    "nemo": "Focos techo Vestibulo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 95,
                    "nemo": "Focos techo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 96,
                    "nemo": "Exterior escaleras servicio",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 156,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 97,
                    "nemo": "Focos techo Vestibulo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 95,
                    "nemo": "Focos techo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 96,
                    "nemo": "Exterior escaleras servicio",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 10,
          "nemo": "Otras Dependencias",
          "icon": "fas fa-cogs",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 51,
              "nemo": "Garaje",
              "image": "vivienda/1/garaje.jpeg",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 52,
              "nemo": "Vinoteca",
              "image": "vivienda/1/vinoteca.jpeg",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 53,
              "nemo": "Entrada",
              "image": "vivienda/1/entradaservicio.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 94,
                  "nemo": "Focos techo vestibulo",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 54,
              "nemo": "Lavanderia",
              "image": "vivienda/1/lavanderia.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 104,
                  "nemo": "Pasillo Lavanderia",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 105,
                  "nemo": "Lavanderia",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 103,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 104,
                        "nemo": "Pasillo Lavanderia",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 105,
                        "nemo": "Lavanderia",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 104,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 104,
                        "nemo": "Pasillo Lavanderia",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 105,
                        "nemo": "Lavanderia",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 105,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 104,
                        "nemo": "Pasillo Lavanderia",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 105,
                        "nemo": "Lavanderia",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 157,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 94,
                    "nemo": "Focos techo vestibulo",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 104,
                    "nemo": "Pasillo Lavanderia",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 105,
                    "nemo": "Lavanderia",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 158,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 94,
                    "nemo": "Focos techo vestibulo",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 104,
                    "nemo": "Pasillo Lavanderia",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 105,
                    "nemo": "Lavanderia",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        }
      ],
      "rooms": null,
      "lightsStatus": 0,
      "lightsEnabled": 1,
      "intensityEnabled": 1,
      "colorEnabled": 1,
      "temperatureEnabled": 1,
      "climateEnabled": 1,
      "climateStatus": 1,
      "blindsEnabled": 1,
      "iotEnabled": 1,
      "iotStatus": 0,
      "pumpsEnabled": 0,
      "pumpsStatus": 0,
      "louversEnabled": 0,
      "scenesEnabled": 1,
      "scenes": {
        "lights": [
          {
            "id": 167,
            "nemo": "Apagar",
            "status": 1,
            "type": 0,
            "lights": [
              {
                "id": 113,
                "nemo": "Sala depuracion",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 106,
                "nemo": "Focos techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 107,
                "nemo": "Led techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 101,
                "nemo": "Led perimetro techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 102,
                "nemo": "Led hamacas",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 98,
                "nemo": "Focos techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 99,
                "nemo": "Led Espejo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 100,
                "nemo": "Focos techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 103,
                "nemo": "Led espejo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 90,
                "nemo": "Focos techo armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 91,
                "nemo": "Focos techo cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 92,
                "nemo": "Focos techo baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 93,
                "nemo": "Espejo baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 86,
                "nemo": "Focos techo armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 87,
                "nemo": "Focos techo cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 108,
                "nemo": "Cabecero",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 109,
                "nemo": "Armario",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 110,
                "nemo": "Escritorio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 111,
                "nemo": "Techo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 112,
                "nemo": "Espejo Baño",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 88,
                "nemo": "Focos techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 89,
                "nemo": "Espejo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 97,
                "nemo": "Focos techo Vestibulo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 95,
                "nemo": "Focos techo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 96,
                "nemo": "Exterior escaleras servicio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 94,
                "nemo": "Focos techo vestibulo",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 104,
                "nemo": "Pasillo Lavanderia",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 105,
                "nemo": "Lavanderia",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              }
            ]
          },
          {
            "id": 168,
            "nemo": "Maxima",
            "status": 0,
            "type": 1,
            "lights": [
              {
                "id": 113,
                "nemo": "Sala depuracion",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 106,
                "nemo": "Focos techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 107,
                "nemo": "Led techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 101,
                "nemo": "Led perimetro techo",
                "status": 1,
                "intensity": 100,
                "color": "255$255$255",
                "temperature": "0"
              },
              {
                "id": 102,
                "nemo": "Led hamacas",
                "status": 1,
                "intensity": 100,
                "color": "255$255$255",
                "temperature": "0"
              },
              {
                "id": 98,
                "nemo": "Focos techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 99,
                "nemo": "Led Espejo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 100,
                "nemo": "Focos techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 103,
                "nemo": "Led espejo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 90,
                "nemo": "Focos techo armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 91,
                "nemo": "Focos techo cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 92,
                "nemo": "Focos techo baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 93,
                "nemo": "Espejo baño",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 86,
                "nemo": "Focos techo armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 87,
                "nemo": "Focos techo cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 108,
                "nemo": "Cabecero",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 109,
                "nemo": "Armario",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 110,
                "nemo": "Escritorio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 111,
                "nemo": "Techo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 112,
                "nemo": "Espejo Baño",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 88,
                "nemo": "Focos techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 89,
                "nemo": "Espejo",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 97,
                "nemo": "Focos techo Vestibulo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 95,
                "nemo": "Focos techo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 96,
                "nemo": "Exterior escaleras servicio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 94,
                "nemo": "Focos techo vestibulo",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 104,
                "nemo": "Pasillo Lavanderia",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 105,
                "nemo": "Lavanderia",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              }
            ]
          }
        ],
        "climate": null,
        "blinds": [
          {
            "id": 185,
            "nemo": "Bajar Todo",
            "status": 1,
            "type": 0,
            "blinds": []
          },
          {
            "id": 186,
            "nemo": "Subir Todo",
            "status": 0,
            "type": 1,
            "blinds": []
          }
        ],
        "iot": null,
        "louvers": null,
        "fancoils": null
      },
      "ambientsEnabled": 1,
      "ambients": [
        {
          "id": null,
          "nemo": "Ambiente1",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente2",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente3",
          "status": 0,
          "elements": null
        }
      ],
      "routinesEnabled": 1,
      "routines": null,
      "sleep": null
    },
    {
      "id": 4,
      "nemo": "Escaleras",
      "icon": "fas fa-bed",
      "groups": [],
      "rooms": [
        {
          "model": 2,
          "id": 55,
          "nemo": "Escalera Servicio",
          "image": "vivienda/1/escaleraservicio.jpeg",
          "lightStatus": null,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "lightsMode": null,
          "lights": [
            {
              "id": 59,
              "nemo": "Focos Escalera servicio",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            }
          ],
          "climate": null,
          "climateStatus": null,
          "temperature": null,
          "humidity": null,
          "co2": null,
          "value": null,
          "fancoil": null,
          "iotStatus": null,
          "iot": null,
          "pumpStatus": null,
          "pumps": null,
          "blindStatus": null,
          "blinds": null,
          "louverStatus": null,
          "louvers": null,
          "multimediaStatus": null,
          "multimedia": null,
          "depuration": null,
          "pool": [],
          "programmingEnabled": 0,
          "programming": null,
          "scenesEnabled": 1,
          "scenes": null,
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "roomMode": null,
          "distribution_panel": [
            {
              "id": 1,
              "nemo": "HABITACION INVITADOS",
              "dimension": "2x12",
              "automatics": [
                {
                  "id": 1,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Automatico General",
                  "type": 4,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 2,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Alumbrado",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 3,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Usos Varios",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 4,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Maniobra",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 5,
                  "fila": 2,
                  "nemofila": "",
                  "description": null,
                  "nemo": "",
                  "type": -1,
                  "status": null,
                  "status_enable": null
                }
              ]
            }
          ]
        },
        {
          "model": 2,
          "id": 56,
          "nemo": "Escalera Caracol Oeste",
          "image": "",
          "lightStatus": null,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "lightsMode": null,
          "lights": [
            {
              "id": 85,
              "nemo": "Alumbrado",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            }
          ],
          "climate": null,
          "climateStatus": null,
          "temperature": null,
          "humidity": null,
          "co2": null,
          "value": null,
          "fancoil": null,
          "iotStatus": null,
          "iot": null,
          "pumpStatus": null,
          "pumps": null,
          "blindStatus": null,
          "blinds": null,
          "louverStatus": null,
          "louvers": null,
          "multimediaStatus": null,
          "multimedia": null,
          "depuration": null,
          "pool": [],
          "programmingEnabled": 0,
          "programming": null,
          "scenesEnabled": 1,
          "scenes": null,
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "roomMode": null,
          "distribution_panel": [
            {
              "id": 1,
              "nemo": "HABITACION INVITADOS",
              "dimension": "2x12",
              "automatics": [
                {
                  "id": 1,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Automatico General",
                  "type": 4,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 2,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Alumbrado",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 3,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Usos Varios",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 4,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Maniobra",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 5,
                  "fila": 2,
                  "nemofila": "",
                  "description": null,
                  "nemo": "",
                  "type": -1,
                  "status": null,
                  "status_enable": null
                }
              ]
            }
          ]
        },
        {
          "model": 2,
          "id": 57,
          "nemo": "Escalera Caracol Este",
          "image": "",
          "lightStatus": null,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "lightsMode": null,
          "lights": [
            {
              "id": 78,
              "nemo": "Focos Escalera caracol este",
              "status": 0,
              "intensity": 75,
              "color": null,
              "temperature": "-1"
            }
          ],
          "climate": null,
          "climateStatus": null,
          "temperature": null,
          "humidity": null,
          "co2": null,
          "value": null,
          "fancoil": null,
          "iotStatus": null,
          "iot": null,
          "pumpStatus": null,
          "pumps": null,
          "blindStatus": null,
          "blinds": null,
          "louverStatus": null,
          "louvers": null,
          "multimediaStatus": null,
          "multimedia": null,
          "depuration": null,
          "pool": [],
          "programmingEnabled": 0,
          "programming": null,
          "scenesEnabled": 1,
          "scenes": null,
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "roomMode": null,
          "distribution_panel": [
            {
              "id": 1,
              "nemo": "HABITACION INVITADOS",
              "dimension": "2x12",
              "automatics": [
                {
                  "id": 1,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Automatico General",
                  "type": 4,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 2,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Alumbrado",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 3,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Usos Varios",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 4,
                  "fila": 2,
                  "nemofila": "Fila 2",
                  "description": null,
                  "nemo": "Maniobra",
                  "type": 2,
                  "status": null,
                  "status_enable": -1
                },
                {
                  "id": 5,
                  "fila": 2,
                  "nemofila": "",
                  "description": null,
                  "nemo": "",
                  "type": -1,
                  "status": null,
                  "status_enable": null
                }
              ]
            }
          ]
        }
      ],
      "lightsStatus": 0,
      "lightsEnabled": 1,
      "intensityEnabled": 1,
      "colorEnabled": 0,
      "temperatureEnabled": 0,
      "climateEnabled": 0,
      "climateStatus": 0,
      "blindsEnabled": 0,
      "iotEnabled": 0,
      "iotStatus": 0,
      "pumpsEnabled": 0,
      "pumpsStatus": 0,
      "louversEnabled": 0,
      "scenesEnabled": 1,
      "scenes": {
        "lights": [
          {
            "id": 169,
            "nemo": "Apagar",
            "status": 1,
            "type": 0,
            "lights": [
              {
                "id": 59,
                "nemo": "Focos Escalera servicio",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 85,
                "nemo": "Alumbrado",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 78,
                "nemo": "Focos Escalera caracol este",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              }
            ]
          },
          {
            "id": 170,
            "nemo": "Maxima",
            "status": 0,
            "type": 1,
            "lights": [
              {
                "id": 59,
                "nemo": "Focos Escalera servicio",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 85,
                "nemo": "Alumbrado",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 78,
                "nemo": "Focos Escalera caracol este",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              }
            ]
          }
        ],
        "climate": null,
        "blinds": null,
        "iot": null,
        "louvers": null,
        "fancoils": null
      },
      "ambientsEnabled": 1,
      "ambients": [
        {
          "id": null,
          "nemo": "Ambiente1",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente2",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente3",
          "status": 0,
          "elements": null
        }
      ],
      "routinesEnabled": 1,
      "routines": null,
      "sleep": null
    },
    {
      "id": 5,
      "nemo": "Exterior",
      "icon": "fas fa-lightbulb",
      "groups": [
        {
          "id": 11,
          "nemo": "Alumbrado Exterior",
          "icon": "fas fa-lightbulb",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 58,
              "nemo": "Terraza sala cine/bar",
              "image": "vivienda/1/terraza_salacinebar.jpg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 43,
                  "nemo": "Focos techo exterior",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 44,
                  "nemo": "Led exterior",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 106,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 43,
                        "nemo": "Focos techo exterior",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 44,
                        "nemo": "Led exterior",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 107,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 43,
                        "nemo": "Focos techo exterior",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 44,
                        "nemo": "Led exterior",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 108,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 43,
                        "nemo": "Focos techo exterior",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 44,
                        "nemo": "Led exterior",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 2,
              "id": 59,
              "nemo": "Terraza Sala Tv",
              "image": "vivienda/1/terrazasalatv.jpeg",
              "lightStatus": null,
              "intensityEnabled": 1,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 67,
                  "nemo": "Focos terraza sala TV",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                },
                {
                  "id": 68,
                  "nemo": "Led terraza sala TV",
                  "status": 0,
                  "intensity": 75,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": {
                "lights": [
                  {
                    "id": 109,
                    "nemo": "Apagar",
                    "status": 1,
                    "type": 0,
                    "lights": [
                      {
                        "id": 67,
                        "nemo": "Focos terraza sala TV",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 68,
                        "nemo": "Led terraza sala TV",
                        "status": 0,
                        "intensity": -1,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 110,
                    "nemo": "Maxima",
                    "status": 0,
                    "type": 1,
                    "lights": [
                      {
                        "id": 67,
                        "nemo": "Focos terraza sala TV",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 68,
                        "nemo": "Led terraza sala TV",
                        "status": 1,
                        "intensity": 100,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  },
                  {
                    "id": 111,
                    "nemo": "Standard",
                    "status": 0,
                    "type": 2,
                    "lights": [
                      {
                        "id": 67,
                        "nemo": "Focos terraza sala TV",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      },
                      {
                        "id": 68,
                        "nemo": "Led terraza sala TV",
                        "status": 1,
                        "intensity": 50,
                        "color": null,
                        "temperature": "-1"
                      }
                    ]
                  }
                ],
                "climate": null,
                "blinds": null,
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 1,
          "intensityEnabled": 1,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": {
            "lights": [
              {
                "id": 159,
                "nemo": "Apagar",
                "status": 1,
                "type": 0,
                "lights": [
                  {
                    "id": 43,
                    "nemo": "Focos techo exterior",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 44,
                    "nemo": "Led exterior",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 67,
                    "nemo": "Focos terraza sala TV",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 68,
                    "nemo": "Led terraza sala TV",
                    "status": 0,
                    "intensity": -1,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              },
              {
                "id": 160,
                "nemo": "Maxima",
                "status": 0,
                "type": 1,
                "lights": [
                  {
                    "id": 43,
                    "nemo": "Focos techo exterior",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 44,
                    "nemo": "Led exterior",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 67,
                    "nemo": "Focos terraza sala TV",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  },
                  {
                    "id": 68,
                    "nemo": "Led terraza sala TV",
                    "status": 1,
                    "intensity": 100,
                    "color": null,
                    "temperature": "-1"
                  }
                ]
              }
            ],
            "climate": null,
            "blinds": null,
            "iot": null,
            "louvers": null,
            "fancoils": null
          },
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        },
        {
          "id": 12,
          "nemo": "Piscinas, fuentes y lagos",
          "icon": "fas fa-leaf",
          "subgroups": [],
          "rooms": [
            {
              "model": 7,
              "id": 60,
              "nemo": "Fuente interior entrada",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 116,
                  "nemo": "Alumbrado",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": [
                {
                  "id": 2,
                  "nemo": "Bomba fuente",
                  "status": 1
                }
              ],
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 1,
              "programming": [
                {
                  "id": 92,
                  "nemo": "Luz116",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-04-01",
                  "end_date": null,
                  "init_hour": "00:20",
                  "end_hour": "00:21",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": [
                    {
                      "status": 1,
                      "intensity": -1,
                      "color": null,
                      "temperature": "-1",
                      "nemo": "Alumbrado",
                      "id": 116
                    }
                  ],
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": null,
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                },
                {
                  "id": 93,
                  "nemo": "Bomba2",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-04-02",
                  "end_date": null,
                  "init_hour": "23:41",
                  "end_hour": "10:41",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": null,
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": [
                    {
                      "id": 2,
                      "nemo": "Bomba fuente",
                      "status": 1
                    }
                  ],
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                }
              ],
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 7,
              "id": 61,
              "nemo": "Fuente entrada exterior",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 115,
                  "nemo": "Alumbrado",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": [
                {
                  "id": 1,
                  "nemo": "Bomba fuente",
                  "status": 0
                }
              ],
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 1,
              "programming": [
                {
                  "id": 94,
                  "nemo": "Bomba1",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-03-29",
                  "end_date": null,
                  "init_hour": "21:44",
                  "end_hour": "21:45",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": null,
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": [
                    {
                      "id": 1,
                      "nemo": "Bomba fuente",
                      "status": 1
                    }
                  ],
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                },
                {
                  "id": 96,
                  "nemo": "Luz115",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-04-01",
                  "end_date": null,
                  "init_hour": "23:21",
                  "end_hour": "00:21",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": [
                    {
                      "status": 1,
                      "intensity": -1,
                      "color": null,
                      "temperature": "-1",
                      "nemo": "Alumbrado",
                      "id": 115
                    }
                  ],
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": null,
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                }
              ],
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 7,
              "id": 62,
              "nemo": "Fuente terraza sala cine",
              "image": "",
              "lightStatus": 1,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 117,
                  "nemo": "Alumbrado",
                  "status": 1,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": [
                {
                  "id": 3,
                  "nemo": "Bomba fuente",
                  "status": 0
                }
              ],
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 1,
              "programming": [
                {
                  "id": 98,
                  "nemo": "Luz117",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-03-29",
                  "end_date": null,
                  "init_hour": "21:46",
                  "end_hour": "11:46",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": [
                    {
                      "status": 1,
                      "intensity": -1,
                      "color": null,
                      "temperature": "-1",
                      "nemo": "Alumbrado",
                      "id": 117
                    }
                  ],
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": null,
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                },
                {
                  "id": 99,
                  "nemo": "Bomba3",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-03-29",
                  "end_date": null,
                  "init_hour": "11:56",
                  "end_hour": "22:46",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": null,
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": [
                    {
                      "id": 3,
                      "nemo": "Bomba fuente",
                      "status": 1
                    }
                  ],
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                }
              ],
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 7,
              "id": 63,
              "nemo": "Lago Jardin",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 118,
                  "nemo": "Alumbrado",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": [
                {
                  "id": 4,
                  "nemo": "Bomba chorros",
                  "status": 0
                },
                {
                  "id": 5,
                  "nemo": "Bomba cascada",
                  "status": 0
                }
              ],
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 1,
              "programming": [
                {
                  "id": 95,
                  "nemo": "Bomba4",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-03-29",
                  "end_date": null,
                  "init_hour": "11:48",
                  "end_hour": "11:56",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": null,
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": [
                    {
                      "id": 4,
                      "nemo": "Bomba chorros",
                      "status": 1
                    },
                    {
                      "id": 5,
                      "nemo": "Bomba cascada",
                      "status": 1
                    }
                  ],
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                },
                {
                  "id": 97,
                  "nemo": "Luz118",
                  "status": 1,
                  "notifications": 0,
                  "schedule": [
                    "6",
                    "5",
                    "4",
                    "3",
                    "2",
                    "1",
                    "0"
                  ],
                  "init_date": "2023-03-29",
                  "end_date": null,
                  "init_hour": "21:47",
                  "end_hour": "22:47",
                  "init_type": 0,
                  "end_type": 0,
                  "lights": [
                    {
                      "status": 1,
                      "intensity": -1,
                      "color": null,
                      "temperature": "-1",
                      "nemo": "Alumbrado",
                      "id": 118
                    }
                  ],
                  "lights_scenes": null,
                  "climate": null,
                  "climate_scenes": null,
                  "iot": null,
                  "iot_scenes": null,
                  "blinds": null,
                  "blinds_scenes": null,
                  "louvers": null,
                  "louvers_scenes": null,
                  "pumps": null,
                  "pumps_scenes": null,
                  "fancoils": null,
                  "fancoils_scenes": null
                }
              ],
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 5,
              "id": 64,
              "nemo": "Piscina Exterior",
              "image": "vivienda/1/piscinaexterior.jpeg",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": [
                {
                  "id": 114,
                  "nemo": "Piscina Exterior",
                  "status": 0,
                  "intensity": -1,
                  "color": null,
                  "temperature": "-1"
                }
              ],
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [
                {
                  "id": 2,
                  "nemo": "PISCINA EXTERIOR",
                  "temperature": null,
                  "ph": null,
                  "redox": null,
                  "status_depuration": null,
                  "status_light": null,
                  "cobertor": null
                }
              ],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 1,
          "lightsEnabled": 1,
          "intensityEnabled": 0,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 1,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 0,
          "scenes": null,
          "ambientsEnabled": 0,
          "ambients": null,
          "routinesEnabled": 0,
          "routines": null,
          "sleep": null
        },
        {
          "id": 13,
          "nemo": "Riego",
          "icon": "fas fa-tint",
          "subgroups": [],
          "rooms": [
            {
              "model": 3,
              "id": 65,
              "nemo": "Riego",
              "image": "",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 0,
          "intensityEnabled": 0,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 0,
          "scenes": null,
          "ambientsEnabled": 0,
          "ambients": null,
          "routinesEnabled": 0,
          "routines": null,
          "sleep": null
        },
        {
          "id": 14,
          "nemo": "Zonas Exteriores",
          "icon": "fas fa-seedling",
          "subgroups": [],
          "rooms": [
            {
              "model": 2,
              "id": 66,
              "nemo": "Garita Vigilante",
              "image": "vivienda/1/garita.jpeg",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 0,
              "scenes": null,
              "ambientsEnabled": 0,
              "ambients": null,
              "routinesEnabled": 0,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            },
            {
              "model": 6,
              "id": 67,
              "nemo": "Pista Padel",
              "image": "vivienda/1/padel.jpeg",
              "lightStatus": null,
              "intensityEnabled": 0,
              "colorEnabled": 0,
              "temperatureEnabled": 0,
              "lightsMode": null,
              "lights": null,
              "climate": null,
              "climateStatus": null,
              "temperature": null,
              "humidity": null,
              "co2": null,
              "value": null,
              "fancoil": null,
              "iotStatus": null,
              "iot": null,
              "pumpStatus": null,
              "pumps": null,
              "blindStatus": null,
              "blinds": null,
              "louverStatus": null,
              "louvers": null,
              "multimediaStatus": null,
              "multimedia": null,
              "depuration": null,
              "pool": [],
              "programmingEnabled": 0,
              "programming": null,
              "scenesEnabled": 1,
              "scenes": null,
              "ambientsEnabled": 1,
              "ambients": [
                {
                  "id": null,
                  "nemo": "Ambiente1",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente2",
                  "status": 0,
                  "elements": null
                },
                {
                  "id": null,
                  "nemo": "Ambiente3",
                  "status": 0,
                  "elements": null
                }
              ],
              "routinesEnabled": 1,
              "routines": null,
              "roomMode": null,
              "distribution_panel": [
                {
                  "id": 1,
                  "nemo": "HABITACION INVITADOS",
                  "dimension": "2x12",
                  "automatics": [
                    {
                      "id": 1,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Automatico General",
                      "type": 4,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 2,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Alumbrado",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 3,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Usos Varios",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 4,
                      "fila": 2,
                      "nemofila": "Fila 2",
                      "description": null,
                      "nemo": "Maniobra",
                      "type": 2,
                      "status": null,
                      "status_enable": -1
                    },
                    {
                      "id": 5,
                      "fila": 2,
                      "nemofila": "",
                      "description": null,
                      "nemo": "",
                      "type": -1,
                      "status": null,
                      "status_enable": null
                    }
                  ]
                }
              ]
            }
          ],
          "lightsStatus": 0,
          "lightsEnabled": 0,
          "intensityEnabled": 0,
          "colorEnabled": 0,
          "temperatureEnabled": 0,
          "climateEnabled": 0,
          "climateStatus": 0,
          "blindsEnabled": 0,
          "iotEnabled": 0,
          "iotStatus": 0,
          "pumpsEnabled": 0,
          "pumpsStatus": 0,
          "louversEnabled": 0,
          "scenesEnabled": 1,
          "scenes": null,
          "ambientsEnabled": 1,
          "ambients": [
            {
              "id": null,
              "nemo": "Ambiente1",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente2",
              "status": 0,
              "elements": null
            },
            {
              "id": null,
              "nemo": "Ambiente3",
              "status": 0,
              "elements": null
            }
          ],
          "routinesEnabled": 1,
          "routines": null,
          "sleep": null
        }
      ],
      "rooms": null,
      "lightsStatus": 1,
      "lightsEnabled": 1,
      "intensityEnabled": 1,
      "colorEnabled": 0,
      "temperatureEnabled": 0,
      "climateEnabled": 0,
      "climateStatus": 0,
      "blindsEnabled": 0,
      "iotEnabled": 0,
      "iotStatus": 0,
      "pumpsEnabled": 1,
      "pumpsStatus": 0,
      "louversEnabled": 0,
      "scenesEnabled": 1,
      "scenes": {
        "lights": [
          {
            "id": 171,
            "nemo": "Apagar",
            "status": 0,
            "type": 0,
            "lights": [
              {
                "id": 43,
                "nemo": "Focos techo exterior",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 44,
                "nemo": "Led exterior",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 67,
                "nemo": "Focos terraza sala TV",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 68,
                "nemo": "Led terraza sala TV",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 116,
                "nemo": "Alumbrado",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 115,
                "nemo": "Alumbrado",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 117,
                "nemo": "Alumbrado",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 118,
                "nemo": "Alumbrado",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 114,
                "nemo": "Piscina Exterior",
                "status": 0,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              }
            ]
          },
          {
            "id": 172,
            "nemo": "Maxima",
            "status": 0,
            "type": 1,
            "lights": [
              {
                "id": 43,
                "nemo": "Focos techo exterior",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 44,
                "nemo": "Led exterior",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 67,
                "nemo": "Focos terraza sala TV",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 68,
                "nemo": "Led terraza sala TV",
                "status": 1,
                "intensity": 100,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 116,
                "nemo": "Alumbrado",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 115,
                "nemo": "Alumbrado",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 117,
                "nemo": "Alumbrado",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 118,
                "nemo": "Alumbrado",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              },
              {
                "id": 114,
                "nemo": "Piscina Exterior",
                "status": 1,
                "intensity": -1,
                "color": null,
                "temperature": "-1"
              }
            ]
          }
        ],
        "climate": null,
        "blinds": null,
        "iot": null,
        "louvers": null,
        "fancoils": null
      },
      "ambientsEnabled": 1,
      "ambients": [
        {
          "id": null,
          "nemo": "Ambiente1",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente2",
          "status": 0,
          "elements": null
        },
        {
          "id": null,
          "nemo": "Ambiente3",
          "status": 0,
          "elements": null
        }
      ],
      "routinesEnabled": 1,
      "routines": null,
      "sleep": null
    }
  ],
  "irrigation": {
    "calendar": [],
    "modes": [],
    "programs": [],
    "elements": []
  },
  "depuration": {
    "calendar": [],
    "modes": [],
    "programs": [],
    "elements": [
      {
        "id": 1,
        "nemo": "Piscina Exterior"
      }
    ]
  },
  "secure": {
    "camara": [
      {
        "nemo": "Camara Interior 1",
        "tipo": 3,
        "user": "user_1",
        "pass": "room_1",
        "audio": 0
      },
      {
        "nemo": "Camara Interior 2",
        "tipo": 3,
        "user": "user_2",
        "pass": "room_2",
        "audio": 1
      },
      {
        "nemo": "Camara Exterior",
        "tipo": 1,
        "path": "https://secure.hometech.red/"
      }
    ],
    "intercom": []
  },
  "ekeeper": {
    "code": 2
  },
  "token": {
    "tipo": 7,
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2ODA2Nzk1MzIsImRhdGEiOiJxbUpVZGhac04rSDYyQkFNS05vNDVSWUdIOURDZGE1WnFuTnBvcGdrT0pwb3pJRnNXMXQ5UkR6dlwvd1BCT3lxbWZIVEIyOVZCVGFBQUtwZm1YRCtXUlRYWng2enVWWGRmRDNnS0xObEl6cGhqWXIwVGVkZDhBaDdJTE9hT0RuZW9mYkJxSzlBXC9ycFpKdkl6bHRiVTRRd0JwWTY4b3djMzJXemh3djcxZ0Q2ND0ifQ.98AkMsuEYTJaO77HhUMlH4JlRelCnAWekRwbTgg43EA",
    "refresh_token": "26e9ad3371c4a16eca301a35a306c115f392568ab7866289fa"
  },
  "distributionPanel": [
    {
      "id": 1,
      "nemo": "HABITACION INVITADOS",
      "dimension": "2x12",
      "automatics": [
        {
          "id": 1,
          "fila": 2,
          "nemofila": "Fila 2",
          "description": null,
          "nemo": "Automatico General",
          "type": 4,
          "status": null,
          "status_enable": -1
        },
        {
          "id": 2,
          "fila": 2,
          "nemofila": "Fila 2",
          "description": null,
          "nemo": "Alumbrado",
          "type": 2,
          "status": null,
          "status_enable": -1
        },
        {
          "id": 3,
          "fila": 2,
          "nemofila": "Fila 2",
          "description": null,
          "nemo": "Usos Varios",
          "type": 2,
          "status": null,
          "status_enable": -1
        },
        {
          "id": 4,
          "fila": 2,
          "nemofila": "Fila 2",
          "description": null,
          "nemo": "Maniobra",
          "type": 2,
          "status": null,
          "status_enable": -1
        },
        {
          "id": 5,
          "fila": 2,
          "nemofila": "",
          "description": null,
          "nemo": "",
          "type": -1,
          "status": null,
          "status_enable": null
        }
      ]
    }
  ],
  "rcs": [
    {
      "1": "1",
      "id": 1,
      "token_id": "u_4003",
      "nemo": "Cocina",
      "estado": null
    },
    {
      "1": "1",
      "id": 2,
      "token_id": "u-4012",
      "nemo": "Sotano",
      "estado": null
    }
  ],
  "airConditioning": [
    {
      "id": 1,
      "nemo": "Ala Norte",
      "valor": "0"
    },
    {
      "id": 2,
      "nemo": "Ala Sur",
      "valor": "0"
    }
  ],
  "permissions": {
    "modulos": [
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1"
    ],
    "estancias": [
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1"
    ]
  }
}
```







## getConfigThermostat 

<B>Data/getConfigThermostat</B>
 These parameters are necessary POST:
   location_id (id ubicacion)
```php

   @return object(
      code
      floors      [{
            rooms {               
               model 
               id
               nemo
               image 
               lightStatus  
               intensityEnabled      
               colorEnabled         
               temperatureEnabled    
               lightsMode            
               lights

               climate              
               climateStatus         
               temperature          
               humidity              
               co2                   
               value  

               fancoil           
               iotStatus     

               iot  

               pumpStatus         
               pumps       

               blindStatus       
               blinds       

               louverStatus      
               louvers      

               multimediaStatus  
               multimedia    

               depuration    

               pool      

               programmingEnabled 
               programming     

               scenesEnabled     
               scenes            

               ambientsEnabled    
               ambients          

               routinesEnabled    
               routines       

               roomMode           
               distribution_panel 
            }
            lights_status      
            lights_enabled      
            intensity_enabled  
            color_enabled       
            temperature_enabled 
 
            climate_enabled    
            climate_status    
 
            blinds_enabled    
 
            iot_enabled       
            iot_status       
 
            pumps_enabled     
            pumps_status     

            louvers_enabled    
 
            scenes_enabled    
            scenes            

            ambients_enabled  
            ambients          
 
            routines_enabled   
            routines          
            sleep            
         
         }]  
```


## Data/changeProjectPhoto 

<B>Data/changeProjectPhoto</B>

 These parameters are necessary POST:
   id (id proyecto)
   photo (url)
    
```php
@return object(
          code
         households: [{ id:,nemo,status, weathercode,soaTs,apiJs, previewHome }],
         project { id,nemo,photo }
      )
```

Cambia la imagen del proyecto.