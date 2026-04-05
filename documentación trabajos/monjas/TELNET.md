TELNET

# libtelnet - biblioteca de manejo de protocolos TELNET

http://github.com/seanmiddleditch/libtelnet

Sean Middleditch y colaboradores

El autor o los autores de este código dedican todos y cada uno de los derechos de autor de este código al dominio público. Hacemos esta dedicación en beneficio del público en general y en detrimento de nuestros herederos y sucesores. Pretendemos que esta dedicación sea un acto manifiesto de renuncia a perpetuidad de todos los derechos presentes y futuros de este código según la ley de derechos de autor.

## I. Introducción

libtelnet proporciona un manejo seguro y correcto del protocolo principal de TELNET. Además del protocolo TELNET base, libtelnet también implementa el método Q de negociación de opciones TELNET. libtelnet se puede utilizar para escribir servidores, clientes o proxies.

Para obtener más información sobre los estándares TELNET compatibles con libtelnet, visite los siguientes sitios web:

- http://www.faqs.org/rfcs/rfc854.html
- http://www.faqs.org/rfcs/rfc855.html
- http://www.faqs.org/rfcs/rfc1091.html
- http://www.faqs.org/rfcs/rfc1143.html
- http://www.faqs.org/rfcs/rfc1408.html
- http://www.faqs.org/rfcs/rfc1572.html

## II. API

La API de libtelnet contiene varias partes distintas. La primera parte son las rutinas básicas de inicialización y desinicialización. La segunda parte es una función única para enviar los datos recibidos al procesador telnet. La tercera parte son las funciones de salida de libtelnet, que generan comandos TELNET y garantizan que los datos estén formateados correctamente antes de enviarlos por cable. La parte final es la interfaz del controlador de eventos.

Este documento cubre solo las funciones más básicas. Consulte las páginas del manual de libtelnet o la documentación HTML para obtener una referencia completa.

#### IIa. Inicialización

El uso de libtelnet requiere la inicialización de una estructura telnet_t que almacena todo el estado actual de una única conexión TELNET.

La inicialización de una estructura telnet_t requiere varios datos. Uno de ellos es la tabla de soporte de telopt, que especifica qué opciones de TELNET admite su aplicación tanto de forma local como remota. Esta tabla se compone de estructuras telnet_telopt_t, una para cada opción admitida. Cada entrada especifica la opción admitida, si la opción es admitida de forma local o remota.

```
struct telnet_telopt_t {
    short telopt;
    unsigned char us;
    unsigned char him;
};
```

El campo us indica si su aplicación admite el telopt localmente. Debe establecerse en TELNET_WILL si lo admite y en TELNET_WONT si no lo es. El campo him denota si el telopt es compatible con el extremo remoto, y debería ser TELNET_DO si es así y TELNET_DONT si no.

Cuando defina la tabla telopt, debe incluir una entrada de marcador final, que es simplemente una entrada con telopt establecido en -1. Por ejemplo:

```
static const telnet_telopt_t my_telopts[] = {
    { TELNET_TELOPT_ECHO,      TELNET_WILL, TELNET_DONT },
    { TELNET_TELOPT_TTYPE,     TELNET_WILL, TELNET_DONT },
    { TELNET_TELOPT_COMPRESS2, TELNET_WONT, TELNET_DO   },
    { TELNET_TELOPT_ZMP,       TELNET_WONT, TELNET_DO   },
    { TELNET_TELOPT_MSSP,      TELNET_WONT, TELNET_DO   },
    { TELNET_TELOPT_BINARY,    TELNET_WILL, TELNET_DO   },
    { TELNET_TELOPT_NAWS,      TELNET_WILL, TELNET_DONT },
    { -1, 0, 0 }
};
```

Si necesita modificar dinámicamente las opciones admitidas por conexión, entonces puede usar una tabla diferente (asignada dinámicamente si es necesario) por llamada a telnet_init () o compartir una única tabla constante como el ejemplo anterior entre todas las conexiones si admite un conjunto fijo de opciones. La mayoría de las aplicaciones solo admitirán un conjunto fijo de opciones.

- `telnet_t *telnet_init(const telnet_telopts_t *telopts, telnet_event_handler_t handler, unsigned char flags, void *user_data);`

  La función telnet_init () es responsable de asignar memoria e inicializar los datos en una estructura telnet_t. Debe llamarse inmediatamente después de establecer una conexión y antes de que se realicen otras llamadas a la API de libtelnet.

  El campo telopts es la tabla de soporte telopt como se describe arriba.

  El parámetro del controlador debe ser una función que coincida con la definición de telnet_event_handler_t. Se puede encontrar más información sobre eventos en la sección IId.

  El parámetro user_data se pasa al controlador de eventos siempre que se invoca. Por lo general, será un contenedor de estructura con información sobre la conexión, incluido un descriptor de socket para implementar el manejo de eventos TELNET_EV_SEND.

  El parámetro de banderas puede ser cualquiera de las siguientes constantes de banderas bit-or'd juntas, o 0 para dejar todas las opciones deshabilitadas.

  TELNET_FLAG_PROXY Funciona en modo proxy. Esto deshabilita la compatibilidad con RFC1143 y habilita la detección automática de flujos COMPRESS2.

  TELNET_FLAG_NVT_EOL Recibe datos con traducción de las secuencias TELNET NVT CR NUL y CR LF especificadas en RFC854 a C retorno de carro (\ r) y C nueva línea (\ n), respectivamente.

  Si telnet_init () no puede asignar la memoria requerida, el puntero devuelto será cero.

- `void telnet_free(telnet_t *telnet);`

  Libera cualquier memoria interna asignada por libtelnet para el puntero telnet dado. Esto se debe llamar cada vez que se cierra una conexión, o incurrirá en pérdidas de memoria. El puntero pasado ya no se puede utilizar posteriormente.

#### IIb. Recibiendo información

- `void telnet_recv(telnet_t *telnet, const char *buffer, unsigned int size, void *user_data);`

  Cuando su aplicación recibe datos a través del socket desde el extremo remoto, debe pasar los bytes recibidos a esta función.

  A medida que se analiza el flujo de TELNET, los eventos se generarán y pasarán al controlador de eventos dado a telnet_init (). De particular interés para la recepción de datos es el evento TELNET_EV_DATA, que se activa para cualquier dato regular, como la entrada del usuario o la salida del proceso del servidor.

#### IIc. Enviando datos

Todas las funciones de salida invocarán el evento TELNET_EV_SEND.

Nota: es muy importante que TODOS los datos enviados al extremo remoto de la conexión se pasen a través de libtelnet. Toda la entrada del usuario o la salida del proceso que desee enviar a través del cable debe asignarse a una de las siguientes funciones. ¡NO envíe ni almacene directamente datos de salida sin procesar!

- `void telnet_iac(telnet_t *telnet, unsigned char cmd);`

  Envía un único comando TELNET "simple", como los comandos GO-AHEAD (255 249).

- `void telnet_negotiate(telnet_t *telnet, unsigned char cmd, unsigned char opt);`

  Envía un comando de negociación TELNET. El parámetro cmd debe ser uno de TELNET_WILL, TELNET_WONT, TELNET_DO o TELNET_DONT. El parámetro opt es la opción de negociar.

  A menos que esté en modo PROXY, el soporte de RFC1143 puede retrasar o eludir la solicitud por completo, según corresponda. Ignorará las invocaciones duplicadas, como pedir WILL NAWS cuando los NAWS ya están activados o están esperando una respuesta del extremo remoto.

- `void telnet_send(telnet_t *telnet, const char *buffer, size_t size);`

  Envía datos sin procesar, que serían la salida del proceso de un servidor o la entrada del usuario de un cliente.

  Para enviar texto normal, puede ser más conveniente usar telnet_printf ().

- `void telnet_send_text(telnet_t *telnet, const char *buffer, size_t size);`

  Envía caracteres de texto con traducción de líneas nuevas C (\ n) a CR LF y retornos de carro C (\ r) a CR NUL, como lo requiere RFC854, a menos que se haya negociado la transmisión en modo BINARIO.

  Para enviar texto normal, puede ser más conveniente usar telnet_printf ().

- `void telnet_begin_sb(telnet_t *telnet, unsigned char telopt);`

  Envía el encabezado de un comando de subnegociación TELNET para la opción especificada. Todos los datos enviados después de este comando serán parte de los datos de subnegociación hasta que se realice una llamada a telnet_finish_subnegotiation ().

  No debe utilizar telnet_printf () para enviar datos de subnegociación, ya que realizará traducciones de nueva línea que normalmente no es necesario realizar para los datos de subnegociación y pueden causar problemas.

- `void telnet_finish_sb(telnet_t *telnet);`

  Envía el marcador de fin para un comando de subnegociación TELNET. Esto se debe llamar después (y solo después) de que se haya realizado una llamada a telnet_begin_subnegotiation () y se haya enviado cualquier dato de negociación.

- `void telnet_subnegotiation(telnet_t *telnet, unsigned char telopt, const char *buffer, unsigned int size);`

  Envía un comando de subnegociación TELNET. El parámetro telopt es la opción de subnegociación.

  Tenga en cuenta que esta función es solo una abreviatura de:

  ```
   telnet_begin_sb(telnet, telopt);
   telnet_send(telnet, buffer, size);
   telnet_end_sb(telnet);
  ```

  Para algunas subnegociaciones que implican el envío de una gran cantidad de datos formateados complejos, puede ser más fácil realizar llamadas tanto a telnet_begin_sb () como a telnet_finish_sb () y usar telnet_send () o telnet_printf2 () para formatear los datos.

  NOTA: telnet_subnegotiation () tiene un comportamiento especial en el modo PROXY, ya que en ese modo esta función detectará automáticamente el marcador COMPRESS2 y habilitará la compresión zlib.

- `int telnet_printf(telnet_t *telnet, const char *fmt, ...);`

  Esto funciona de manera muy similar a fprintf, excepto que la salida se envía a través de libtelnet para su procesamiento. Los bytes de IAC se escapan correctamente, las líneas nuevas de C (\ n) se traducen a CR LF y los retornos de carro de C (\ r) se traducen a CR NUL, todo según lo requiere RFC854. El código de retorno es la longitud del texto formateado.

  NOTA: debido a un detalle de implementación interna, la longitud máxima del texto formateado es de 4096 caracteres.

#### IId. Manejo de eventos

libtelnet se basa en un mecanismo de manejo de eventos para procesar el flujo del protocolo TELNET analizado, así como para almacenar en búfer y enviar datos de salida.

Cuando inicializaba una estructura telnet_t con telnet_init (), tenía que pasar una función de controlador de eventos. Esta función debe cumplir con el siguiente prototipo:

```
void (telnet_t *telnet, telnet_event_t *event, void *user_data);
```

La estructura del evento se detalla a continuación. El valor de user_data es el puntero que se pasa a telnet_init ().

El siguiente es un resumen de las partes más importantes del tipo de datos telnet_event_t. Consulte las páginas del manual de libtelnet o el documento HTML para obtener una referencia completa.

```
union telnet_event_t {
  enum telnet_event_type_t type;

  struct data_t {
    enum telnet_event_type_t _type;
    const char *buffer;
    size_t size;
  } data;

  struct error_t {
    enum telnet_event_type_t _type;
    const char *file;
    const char *func;
    const char *msg;
    int line;
    telnet_error_t errcode;
  } error;

  struct iac_t {
    enum telnet_event_type_t _type;
    unsigned char cmd;
  } iac;

  struct negotiate_t {
    enum telnet_event_type_t _type;
    unsigned char telopt;
  } neg;

  struct subnegotiate_t {
    enum telnet_event_type_t _type;
    const char *buffer;
    size_t size;
    unsigned char telopt;
  } sub;
};
```

Los valores de enumeración de telnet_event_type_t se describen en detalle a continuación. Siempre que se invoca el controlador de eventos, la aplicación debe mirar el valor de evento-> tipo y realizar el procesamiento necesario.

El único evento que DEBE implementarse es TELNET_EV_SEND. La mayoría de las aplicaciones también siempre querrán implementar el evento TELNET_EV_DATA.

A continuación se muestra un ejemplo de implementación de un controlador de eventos que incluye controladores para varios eventos importantes.

```
void my_event_handler(telnet_t *telnet, telnet_event_t *ev,
    void *user_data) {
  struct user_info *user = (struct user_info *)user_data;

  switch (ev->type) {
  case TELNET_EV_DATA:
    process_user_input(user, event->data.buffer, event->data.size);
    break;
  case TELNET_EV_SEND:
    write_to_descriptor(user, event->data.buffer, event->data.size);
    break;
  case TELNET_EV_ERROR:
    fatal_error("TELNET error: %s", event->error.msg);
    break;
  }
}
```

- TELNET_EV_DATA

  El evento DATA se activa siempre que se reciben datos regulares (que no forman parte de ningún comando especial de TELNET). Para un cliente, esto será un proceso de salida del servidor. Para un servidor, esto será ingresado por el usuario.

  El valor event-> data.buffer contendrá los bytes recibidos y el valor event-> data.size contendrá el número de bytes recibidos. Tenga en cuenta que event-> data.buffer no tiene terminación NUL.

  NOTA: no hay garantía de que la entrada del usuario o la salida del servidor se recibirán en líneas completas. Si desea procesar los datos una línea a la vez, ¡usted mismo es responsable de almacenar los datos en búfer y verificar si hay terminadores de línea!

- TELNET_EV_SEND

  Este evento se envía siempre que libtelnet haya generado datos que deben enviarse por el cable hasta el final de eliminación. Generalmente, eso significa llamar a send () o agregar los datos al búfer de salida de su aplicación.

  El valor event-> data.buffer contendrá los bytes a enviar y el valor event-> data.size contendrá el número de bytes a enviar. Tenga en cuenta que event-> data.buffer no tiene terminación NUL y puede incluir caracteres NUL en sus datos, por lo que siempre use event-> data.size!

  NOTA: Su controlador de eventos SEND debe enviar o almacenar en búfer los datos en su forma sin procesar según lo provisto por libtelnet. Si desea realizar algún tipo de preprocesamiento de los datos que desea enviar a la otra

- TELNET_EV_IAC

  El evento IAC se activa cada vez que se recibe un comando IAC simple, como el comando IAC EOR (fin de registro, también llamado seguir adelante o GA).

  El comando recibido está en el valor event-> iac.cmd.

  El procesamiento necesario depende de los comandos específicos; consulte TELNET RFC para obtener más información.

- TELNET_EV_WILL / TELNET_EV_DO

  Los eventos WILL y DO se envían cuando se recibe un comando de negociación TELNET del mismo nombre.

  Los eventos WILL son enviados por el extremo remoto cuando desean que se les permita activar una opción en su extremo, o en confirmación después de que les haya enviado un comando DO.

  Los eventos DO son enviados por el extremo remoto cuando desean que active una opción en su extremo, o en confirmación después de que les haya enviado un comando WILL.

  En cualquier caso, la opción TELNET en negociación estará en el campo event-> neg.telopt.

  libtelnet gestiona la mayoría de las particularidades de la negociación por usted. Para obtener información sobre el método de negociación de libtelnet, consulte:

  http://www.faqs.org/rfcs/rfc1143.html

  Tenga en cuenta que en el modo PROXY, libtelnet no realizará ningún procesamiento por usted.

- TELNET_EV_WONT / TELNET_EV_DONT

  Los eventos WONT y DONT se envían cuando el extremo remoto de la conexión desea deshabilitar una opción, cuando se niega a admitir una opción que usted solicitó o en la confirmación de una opción que solicitó deshabilitar.

  Por lo general, los eventos WONT y DONT se envían como rechazos de funciones que solicitó mediante el envío de eventos DO o WILL. Recibir estos eventos significa que la opción TELNET no es o no será compatible con el extremo remoto, así que ríndete.

  A veces se enviará WONT o DONT para las opciones de TELNET que ya están habilitadas, pero el extremo remoto desea dejar de usar. No puedes declinar. Estos eventos son demandas que se deben cumplir. libtelnet siempre enviará la respuesta adecuada sin consultar su aplicación. Estos eventos se envían para permitir que su aplicación desactive su propio uso de las funciones.

  En cualquier caso, la opción TELNET en negociación estará en el campo event-> neg.telopt.

  Tenga en cuenta que en el modo PROXY, libtelnet no realizará ningún procesamiento por usted.

- TELNET_EV_SUBNEGOTIATION

  Se activa cada vez que se recibe una subnegociación TELNET. Las subnegociaciones incluyen la opción NAWS para comunicar el tamaño del terminal a un servidor, las opciones NEW-ENVIRON y TTYPE para negociar las características del terminal y protocolos centrados en MUD como ZMP, MSSP y MCCP2.

  El valor event-> sub-> telopt es la opción en subnegociación. Los datos restantes (si los hay) se pasan en event-> sub.buffer y event-> sub.size. Tenga en cuenta que la mayoría de los comandos de subnegociación pueden incluir bytes NUL incrustados en los datos de subnegociación, y el evento de datos-> sub.buffer no tiene terminación NUL, por lo que siempre use el valor event-> sub.size.

  El significado y el procesamiento necesario para las subnegociaciones se definen en varias RFC de TELNET y otras especificaciones informales. Nunca se debe enviar una subnegociación a menos que se haya habilitado la opción específica mediante el uso de la función de negociación de telnet.

  SOPORTE TTYPE / ENVIRON / NEW-ENVIRON / MSSP / ZMP: libtelnet analiza estos comandos de subnegociación. Se enviará un evento especial para cada uno, después de que se envíe el evento SUBNEGOTIATION. Excepto en circunstancias especiales, el evento SUBNEGOTIATION debe ignorarse para estas opciones y los eventos especiales deben manejarse explícitamente.

- TELNET_EV_COMPRESS

  El evento COMPRESS notifica a la aplicación que la compresión COMPRESS2 / MCCP2 ha comenzado o finalizado. Solo los servidores pueden enviar datos comprimidos y, por lo tanto, solo los clientes recibirán datos comprimidos.

  El evento-> valor del comando será 1 si la compresión ha comenzado y será 0 si la compresión ha terminado.

- TELNET_EV_ZMP

  El campo event-> zmp.argc es el número de parámetros ZMP, incluido el nombre del comando, que se han recibido. El campo event-> zmp.argv es una matriz de cadenas, una para cada parámetro ZMP. El nombre del comando estará en event-> zmp.argv [0].

- TELNET_EV_TTYPE

  El campo event-> ttype.cmd será TELNET_TTYPE_SEND, TELNET_TTYPE_IS, TELNET_TTYPE_INFO.

  El tipo de terminal real estará en event-> ttype.name.

- TELNET_EV_ENVIRON

  El campo event-> environment.cmd será TELNET_ENVIRON_IS, TELNET_ENVIRON_SEND o TELNET_ENVIRON_INFO.

  La variable de entorno real enviada o solicitada se enviará en el campo event-> environment.values. Esta es una matriz de estructuras con el siguiente formato:

  ```
    struct telnet_environ_t {
      unsigned char type;
      const char *var;
      const char *value;
    };
  ```

  El número de entradas en la matriz event-> environment.values se almacena en event-> environment.count.

  Tenga en cuenta que libtelnet no admite el byte ESC para ENVIRON / NEW-ENVIRON. Los datos que utilizan bytes de escape no se analizarán correctamente.

- TELNET_EV_MSSP

  El campo event-> mssp.values es una matriz de estructuras telnet_environ_t. El campo cmd de cada entrada tendrá un valor no especificado, mientras que los campos var y value siempre se establecerán en la variable MSSP y el valor que se establezca. Para las variables MSSP de varios valores, habrá varias entradas en la matriz de valores para cada valor, cada una con el mismo conjunto de nombres de variable.

  El número de entradas en la matriz event-> mssp.values se almacena en event-> mssp.count.

- TELNET_EV_WARNING

  El evento WARNING se envía siempre que algo ha salido mal dentro de libtelnet (posiblemente debido a datos mal formados enviados por el otro extremo) pero cuya recuperación es (probablemente) posible. Puede ser seguro seguir usando la conexión, pero es posible que algunos datos se hayan perdido o se hayan interpretado incorrectamente.

  El campo event-> error.msg contendrá una cadena terminada en NUL que explica el error.

- TELNET_EV_ERROR

  Similar al evento ADVERTENCIA, el evento ERROR se envía siempre que algo ha salido mal. Sin embargo, los eventos ERROR no son recuperables y la aplicación debe cerrar la conexión inmediatamente. Lo que sea que haya sucedido probablemente solo resultará en basura de libtelnet. Es más probable que esto suceda cuando falla un flujo de COMPRESS2, pero pueden ocurrir otros problemas.

  El campo event-> error.msg contendrá una cadena terminada en NUL que explica el error.

## III. Integrando libtelnet con lodos comunes

FIXME: complete algunas notas sobre cómo empalmar en libtelnet con Diku / Merc / Circle / etc comunes. Bases de código MUD.

## IV. Consideraciones de seguridad y corrección

Su aplicación existente puede hacer un uso intensivo de sus propios comandos de transmisión y almacenamiento en búfer de salida, incluidas las rutinas hechas a mano para enviar comandos TELNET y solicitudes de subnegociación. A veces hay problemas sutiles que deben manejarse cuando se comunican a través del protocolo TELNET, entre los que se destaca la necesidad de escapar de cualquier valor de byte 0xFF con un comando TELNET especial.

Por estas razones, es muy importante que las aplicaciones que utilizan libtelnet siempre hagan uso de las funciones de salida de libtelnet para todos los datos que se envían a través de la conexión TELNET.

En particular, si está escribiendo un cliente, toda la entrada del usuario debe pasar a telnet_send (). Esto también incluye cualquier entrada generada automáticamente por scripts, activadores o macros.

Para un servidor, todos y cada uno de los resultados, incluidos los códigos de escape ANSI / VT100, el texto normal, las nuevas líneas, etc., deben pasarse a telnet_send ().

Todos los comandos TELNET que se envíen deben enviarse a uno de los siguientes: telnet_iac, telnet_negotiate o telnet_subnegotiation ().

Si está intentando habilitar COMPRESS2 / MCCP2, debe usar la función telnet_begin_compress2 ().

## V. Compresión MCCP2

La extensión TELNET MCCP2 (COMPRESS2) permite la compresión de todo el tráfico enviado desde el servidor al cliente. Para más información:

http://www.mudbytes.net/index.php?a=articles&s=mccp

Para que libtelnet admita MCCP2, zlib debe estar instalado y habilitado al compilar libtelnet. Use -DHAVE_ZLIB para habilitar zlib al compilar libtelnet.cy pase -lz al vinculador para vincular en la biblioteca compartida de zlib.

libtelnet es compatible de forma transparente con MCCP2. Para que un servidor admita MCCP2, la aplicación debe comenzar la negociación de la opción COMPRESS2 usando telnet_negotiate (), por ejemplo:

```
telnet_negotiate(&telnet, TELNET_WILL, TELNET_OPTION_COMPRESS2, user_data);
```

Si el cliente envía un DO COMPRESS2 favorable, la aplicación del servidor puede comenzar la compresión en cualquier momento llamando a telnet_begin_compress2 ().

Si una conexión está en modo PROXY y el soporte COMPRESS2 está habilitado, libtelnet detectará automáticamente el inicio de un flujo COMPRESS2, ya sea en la dirección de envío o recepción.

## VI. Compatibilidad con el protocolo Zenith MUD (ZMP)

El protocolo Zenith MUD permite que las aplicaciones envíen mensajes a través de la conexión TELNET fuera del flujo normal de datos de entrada / salida del usuario. libtelnet ofrece un soporte limitado para recibir y enviar comandos ZMP para facilitar la implementación de una pila ZMP completa. Para obtener más información sobre ZMP:

http://zmp.sourcemud.org/

Para que un servidor habilite ZMP, debe enviar la negociación WILL ZMP:

```
telnet_negotiate(&telnet, TELNET_WILL, TELNET_TELOPT_ZMP);
```

Para que un cliente admita ZMP, debe incluir ZMP en la tabla telopt pasada a telnet_init (), con el campo him configurado en TELNET_DO:

```
{ TELNET_TELOPT_ZMP, TELNET_WONT, TELNET_DO },
```

Tenga en cuenta que, si bien ZMP es un protocolo bidireccional, solo se habilita en el extremo del servidor de la conexión. Esto habilita automáticamente al cliente para enviar comandos ZMP. El cliente nunca debe intentar negociar ZMP directamente usando telnet_negotiate ().

Una vez que ZMP está habilitado, cualquier comando ZMP recibido se enviará automáticamente a la función del controlador de eventos con el código de evento TELNET_EV_SUBNEGOTIATION. El comando se analizará automáticamente y los parámetros de ZMP se colocarán en la matriz event-> argv y el número de parámetros se colocará en el campo event-> argc.

NOTA: si se produjo un error al analizar el comando ZMP porque estaba mal formado, el campo event-> argc será igual a 0 y el campo event-> argv será NULL. Siempre debe verificar esto antes de intentar acceder a la matriz de parámetros.

Para enviar comandos ZMP al extremo remoto, use telnet_send_zmp () o telnet_send_zmpv ().

- `int telnet_send_zmp(telnet_t *telnet, size_t argv, const char **argv);`

  Envía un comando ZMP al extremo remoto. El parámetro argc es el número de parámetros ZMP (¡incluido el nombre del comando!) Que se enviarán. El parámetro argv es una matriz de cadenas que contiene los parámetros. El elemento en argv [0] es el nombre del comando en sí. La matriz argv debe tener al menos tantos elementos como el valor argc.

## VII. Compatibilidad con el protocolo de estado del servidor MUD (MSSP)

MSSP permite a los rastreadores u otros clientes consultar la lista de funciones admitidas de un servidor MUD. Esto permite que los estados de listas de MUD se mantengan automáticamente actualizados con las funciones de MUD y no requieren que los administradores de MUD actualicen manualmente los sitios de listas para su MUD. Para obtener más información sobre MSSP:

http://tintin.sourceforge.net/mssp/

## VIII. Utilidad de proxy Telnet

La utilidad telnet-proxy es una pequeña aplicación que sirve como banco de pruebas para libtelnet y como una poderosa herramienta de depuración para servidores y clientes TELNET.

Para usar telnet-proxy, primero debe compilarlo usando:

```
 $ (mkdir -p build && cd build && cmake .. && make)
```

Si no tiene zlib instalado y desea deshabilitar la compatibilidad con MCCP2, primero debe editar el Makefile y eliminar el -DHAVE_ZLIB y el -lz de los indicadores de compilación.

Para ejecutar telnet-proxy, simplemente proporcione el nombre de host del servidor o la dirección IP, el número de puerto del servidor y el número de puerto en el que telnet-proxy debe escuchar. Por ejemplo, para conectarse al servidor en mud.example.com puerto 7800 y escuchar en el puerto 5000, ejecute:

```
 $ ./build/util/telnet-proxy mud.example.com 7800 5000
```

A continuación, puede conectarse al host en el que se ejecuta telnet-proxy (por ejemplo, 127.0.0.1) en el puerto 5000 y automáticamente se le redirigirá a mud.example.com.

telnet-proxy mostrará información de estado sobre los datos que pasan por ambos extremos del túnel. telnet-proxy solo puede admitir un solo túnel a la vez. Continuará ejecutándose hasta que se produzca un error o se envíe una señal de terminación al proceso de proxy.