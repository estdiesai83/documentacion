# Configuracion keepalive

Codigo en nodejs que lo utilizamos para que se reincie el proceso que necesitemos, en este ejemplo el soa automaticamente y envie una notificacion a las personas que configuremos, bien sea por sms o por la aplicacion ifttt

Crear una carpeta con :

Archivo app.js

```javascript
var exec = require('child_process').exec;
var axios = require('axios');

const VALUE1 = 'NAME1';// Ejemplo: 'MONJAS'
const VALUE2 = 'NAME2';// Ejemplo: 'Kernelsoa Pruebas Somosaguas'
const VALUE3 = 'NAME3';// Ejemplo: 'kernelsoa pr_somosaguas'

const PHONE = '34PHONE';// el telefono tiene que tener el 34 delante para que funcione

// const SCRIPT_NAME = 'pgrep soaraspberry';// Ejemplo soaraspberry
const SCRIPT_NAME = 'pgrep kernelsoa -a';// Ejemplo kernelsoa

// const EXEC_PATH = '/home/soa/soaraspberry/soaraspberry';// Ejemplo soaraspberry
const EXEC_PATH = '/home/soa/sistemas/soa/kernelsoa/kernelsoa/kernel/kernelsoa pr_somosaguas'; // Ejemplo lanzar kernelsoa

const DATA = {
   'api_key':"ef16c132e87d4c2f958a5065a1f16233",
   'concat':1,
   'messages':[
      {
         'from':'Unique Home',
         'to': PHONE,
         'text':VALUE3+' se ha iniciado'
      }
   ]
};

setInterval(function() {
   checkProcess();
}, 10000)


function checkProcess() {
   exec(SCRIPT_NAME, function(err, stdout, stderr) {
      let processOk = true;

  if ( !stdout.length ) {
     processOk = false;
  } else if ( !stdout.includes(VALUE3) ) {
     processOk = false;
  }

  if ( !processOk ) {
     // Robert
     /*axios
        .post('https://maker.ifttt.com/trigger/killed/with/key/fhH29ySVSb2qZD2omeSz2tq2Qn00JsI3CHA28YF0STa', {
        value1: VALUE1,
        value2: VALUE2
        })
        .then(res => {})
        .catch(error => {
        console.error(error)
        })

     // Gemma
     axios
        .post('https://maker.ifttt.com/trigger/killed/with/key/VKzXkV2su7aCJFCfKVhf6', {
        value1: VALUE1,
        value2: VALUE2
        })
        .then(res => {})
        .catch(error => {
        console.error(error)
        })
     */
     // Esther
     axios
     .post('https://maker.ifttt.com/trigger/killed/with/key/dKyywZTYRzn7LHyxKK1IJi', {
        value1: VALUE1,
        value2: VALUE2
        })
        .then(res => {})
        .catch(error => {
        console.error(error)
     })

  // sms Fernando
  const headers = {
     'Content-Type': 'application/json',
     'Authorization': 'key=ef16c132e87d4c2f958a5065a1f16233'
  }

  axios.post('https://api.gateway360.com/api/3.0/sms/send', DATA, {
     headers: headers
     })
     .then((response) => {
        // dispatch({
        //    type: FOUND_USER,
        //    data: response.data[0]
        // })
     })
     .catch((error) => {
        dispatch({
           type: ERROR_FINDING_USER
        })
     })
     runProcess();
  }
     });
}

function runProcess() {
   exec(EXEC_PATH, function(err, stdout, stderr) {});
}
```

Copy

Archivo ecosystem.config.js:

En este archivo esta la ruta donde se encuenta el archivo app.js que es donde va estar la informacion del proceso que queremos iniciar y las notificaciones que se quieren enviar

Este archivo es el que hay que lanzar con pm2 para que se quede ejecutandose como un demonio

```javascript
module.exports = {
  apps : [{
    name: "keepalive-soa-pr-somosaguas",
    cwd: "/home/esther/sistemas/keepalive/kernelsoa_pr_somosaguas/",
    script: "/home/esther/sistemas/keepalive/kernelsoa_pr_somosaguas/app.js"
  }]
}
```