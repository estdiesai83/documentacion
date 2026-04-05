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
      "id": 2,
      "nemo": "Planta Principal",
      "icon": "fas fa-couch",
      "groups": [
        {
          "id": 3,
          "nemo": "Habitaciones Principales",
          "icon": "fas fa-bed",
          "subgroups": [
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
                    },
                  ],
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
                    ],
                    "climate": null,
                    "blinds": [
                      {
                        "id": 120,
                        "nemo": "Bajar Todo",
                        "status": 1,
                        "type": 0,
                        "blinds": [
                          {
                            "id": "9",
                            "nemo": "Hab. Izq",
                            "position": null,
                            "level": "0"
                          },
                          {
                            "id": "10",
                            "nemo": "Hab. centro",
                            "position": null,
                            "level": "0"
                          },
                        ]
                      },
                      {
                        "id": 121,
                        "nemo": "Subir Todo",
                        "status": 0,
                        "type": 1,
                        "blinds": [
                            {
                                "id": "9",
                                "nemo": "Hab. Izq",
                                "position": null,
                                "level": "100"
                            },
                            {
                                "id": "10",
                                "nemo": "Hab. centro",
                                "position": null,
                                "level": "100"
                            },
                        ]
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
                    ]
                  },
                ],
                "climate": null,
                "blinds": [
                  {
                    "id": 173,
                    "nemo": "Bajar Todo",
                    "status": 1,
                    "type": 0,
                    "blinds": [
                      {
                        "id": "9",
                        "nemo": "Hab. Izq",
                        "position": null,
                        "level": "0"
                      },
                      {
                        "id": "10",
                        "nemo": "Hab. centro",
                        "position": null,
                        "level": "0"
                      },
                    ]
                  },
                  {
                    "id": 174,
                    "nemo": "Subir Todo",
                    "status": 0,
                    "type": 1,
                    "blinds": [
                        {
                            "id": "9",
                            "nemo": "Hab. Izq",
                            "position": null,
                            "level": "100"
                        },
                        {
                            "id": "10",
                            "nemo": "Hab. centro",
                            "position": null,
                            "level": "100"
                        },
                    ]
                  }
                ],
                "iot": null,
                "louvers": null,
                "fancoils": null
              },
              "ambientsEnabled": 1,
              "ambients": [ idem ambients
              ],
              "routinesEnabled": 1,
              "routines": null,
              "sleep": null
            },
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
        },
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
            ],
          },
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