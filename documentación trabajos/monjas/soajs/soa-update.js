var net = require('net');
var io = require('socket.io')();
const { StringDecoder } = require('string_decoder');
const decoder = new StringDecoder('utf8');

let soa_update = {};
soa_update.io = io;

var people = [];

let watchTimeout = {};
var watchTime = 1500; // 1500ms

/*
 * SOCKET
 */

// Creacion del socket
var server = net.createServer(function(socket) {
   socket.pipe(socket);

   // Evento de recepcion de datos
   socket.on('data', function(data){
      const msg = decoder.write(Buffer.from(data));
      watchTimeout[msg] !== undefined ? clearTimeout(watchTimeout[msg]) : null;
	  
      //console.log('*Aviso desde soa -> ', msg);
      // Esperamos por si vienen mas datos para no enviar el mensaje al cliente.
      // De esta manera solo enviamos el mensaje en el ultimo dato recibido
      watchTimeout[msg] = setTimeout(() => {
	 console.log('-> Aviso clientes -> ', msg);
         // Se envia mensaje a cada participante
         people.forEach(item => {
            io.to( item.socket ).emit('data_updated', msg);   // Websocket
         })
      }, watchTime);
   });
   socket.on('error', function () {
   	console.log('error');
   });
});

// Inicio de la escucha del socket
server.listen(1504, '0.0.0.0');

/*
 * WEBSOCKET
 */

// Conexion del socket
io.on('connection', (socket) => {
   // Introducimos el participante en la tabla people
   people.push( {'socket': socket.id} );

   // Desconexion del socket
   socket.on('disconnect', () => {
      // Eliminamos usuario de la lista de conectados
      people = people.filter(item => item.socket !== socket.id);
   });
});

module.exports = soa_update;
