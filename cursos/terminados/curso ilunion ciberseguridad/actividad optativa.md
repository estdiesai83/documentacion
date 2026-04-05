# Protección contra el malware



**Malware**: Acrónimo del inglés **mal**icius soft**ware**, llamado también software malicioso y cuya traducción literal es código malicioso. Se infiltra en los sistemas para dañar o robar datos e información. Ejecutan acciones no deseadas en un sistema informático.

Su principal diferencia es en la manera en que se propaga:

1. infecciosos mas reconocidos: 

   1. **gusanos**: Programa que se duplica a si mismo con la intención de dañar a una red en concreto, pasando de ordenador en ordenador. El gusano no necesita de un usuario para ser ejecutado, mientras que el virus si.

      Objetivo: Dañar e infectar a la mayor cantidad de usuarios posible.

   2. **virus**: Programa que tiene que ser ejecutado por otra persona para que pueda ponerse en funcionamiento. Estos pueden tener un payload o conjunto de datos transmitidos, que genera acciones maliciosas.

      Objetivo: Infectar software dentro del ordenador infectado.

      Tipos de virus:

      - De sector de arranque: se encargan de modificar el arranque del ordenador. Lo realizan cambiando el arranque original por una versión propia, para que al iniciar sesión, ésta lo haga con la versión manipulada e infectada.

      - De programa ejecutable: Se trata del virus más peligroso, es capaz de infectar archivos como .com, .exe,.. tiene la capacidad de dejar el ordenador inutilizable.

        Se puede ubicar o no en la memoria: desde la memoria puede controlar el sistema entero en el momento que lo precise y, desde fuera, sólo pueden ser ejecutados al iniciar el programa en concreto.

      - De correo electrónico: Se transmite de manera adjunta al correo electrónico. En el momento en el que esté activado puede suponer unos riesgos muy significativos dentro del sistema.

      - Residente en memoria: Se encuentran alojados en la memoria RAM del ordenador. Objetivo: es infectar los ficheros y programas justo cuando estos empiezan a ser ejecutados, hasta el momento en que se apaga el ordenador. Una de sus características principales es que sigue las pautas de la persona que lo desarrolló. 

2. Oculto: El ocultamiento es necesario para llevarse a cabo. Los mas conocidos son:

   1. **Rootkits**: Programa que se encarga de modificar el sistema operativo del ordenador, de forma que el malware pueda mantenerse oculto de cara al usuario. Mantiene su presencia oculta, para que los administradores no puedan saber que el sistema ha sido manipulado e infectado.

      Ejemplo: Sony BMG Music Entertaiment incluyó el software Extended Copy Protection (XCP) y MediaMax CD-3 en el programa de protección de copias sin que nadie lo supiese, no podía ser visto por antivirus ni antispyware. Éste enviaba información sobre el cliente, abrió la puerta a otros malware. No se podía eliminar , pues dañaba al SO.

   2. **Troyanos**: En principio parece inofensivo. Capaz de borrar archivos o instalar programas dañinos. Puede ser confundido con un virus, pero mientras que el virus trata de dañar, el troyano puede, simplemente, conseguir hacerse con el control del ordenador sin ser descubierto y sin tener por qué necesariamente generar daños.

   3. **Backdoors**: "Puertas traseras", trata de romper con los procesos habituales de autenticación, para mejorar el acceso al atacante.

      Los ciberdelincuentes que utilizan este sistema de puertas traseras son denominados como crackers. Las instalan intentando pasar desapercibidos ante una inspección y así tener el control del equipo infectado. Este concepto de puerta trasera es muy similar , en términos de funcionabilidad, al utilizado por muchos sistemas de administración y distribuidos por desarrolladores legítimos.

   4. **Drive-by download**: Descarga involuntaria de software de ordenador que proviene de internet: 

      Autorizada por una persona que no conoce las consecuencias.

      Descargas realizadas sin el conocimiento de estar siendo realizadas.

      Puede darse visitando un sitio web, haciendo click sobre una ventana emergente, en un correo electrónico.

      En todos estos casos el propietario de los elementos puede decir que el usuario consintió la descarga al acceder o hacer click, aunque fuera de manera inconsciente al haber autorizado la descarga.

3. Para obtener beneficios: Puede dar al usuario una serie de beneficios como su utilización como una fuente de ingresos, se puede dar con las técnicas:

   - Mostrar publicidad con programas: 

     - **Spyware**: Objetivo: Controlar la actividad, en páginas webs o emails de los usuarios, y con ello, poder mandarla a agencias de publicidad a través de la técnica conocida como spam.

       El usuario no es consciente de que se está recopilando información acerca de él. 

       Suelen ser instalados en forma de troyanos, mediante cookies o con las barras de herramientas de los navegadores.

       Cabe destacar que los que llevan a cabo el spyware se presentan en todo momento como empresas de publicidad, lo que les hace actuar de forma legal, aunque el usuario no sea consciente de lo que está aceptando. 

     - **Adware**: Estos programas muestran publicidad de forma intrusiva a los usuarios para que esto produzca un beneficio. Se suele utilizar la técnica de pop-up o ventanas emergentes, que genera una sensación muy molesta

       Visto en un Video: La solución Bloqueadores de publicidad, su funcionamiento es analizar los sitios webs en busca de códigos de anuncios y evitan que puedan cargarse en un navegador. Se trata de software que se instala en los navegadores, de forma gratuita, los beneficios de un bloqueo de publicidad son varios:

       - los contenidos se cargan más rápidamente.
       - se desperdicia menos recursos de nuestro equipo.
       - se visualiza de forma más limpia el contenido de la página web. 

       - Además se tiene mayor privacidad, por que se excluyen los sistemas de creación y seguimiento de perfiles de usuarios de la web.
       - Menor probabilidad de infección

       Aunque lo ideal es evitar las webs con demasiada publicidad, pero si vamos a entrar en conveniente utilizar un bloqueador de publicidad, esto ayuda a evitar los molestos banners. 

     - Hijacking: Se dedican a realizar cambios dentro de las configuraciones del navegador web en cuestión. Modificar la página de inicio, redireccionar  los resultados de los buscadores hacia los anuncios que ellos deseen , que suelen ser anuncios de pago.

   - Suplantación de identidad: **Phishing**: Obtener información privada de forma ilegal. Hacerse pasar por alguien de confianza, mediante correos electrónicos, sistemas de mensajería o llamadas de teléfono. Es una técnica no presencial.

     Es una de las estafas más comunes en internet. Ej: recibes un email de tu banco para pedir datos personales,... o una confirmación de una tienda online a través de un enlace y si clickeas sobre él, éste instalará un troyano que instalará un capturador de escritura, este capturador guardará todo lo que escribas con tu teclado, incluyendo usuarios y contraseñas. El enlace puede llevarte tambien a una página web falsa y pedirte introducir tus datos personales, ésta página falsa tendrá una apariencia prácticamente igual a la verdadera. 

     Consejos para evitar el phishing:

     1. Las empresas no tienen costumbre de enviar correos pidiendo información personal, o financiera. Llama a la empresa para verificar si son ellos.
     2. No pulses en un enlace que te pida información confidencial o de pagos.
     3. verifica la dirección, normalmente se asemeja a la original. Utilizan normalmente un cero en lugar de una O, y un 1 en lugar de una l. Utilizar el logo de la web original también es muy común
     4. No utilizar la misma contraseña del banco para otros sitios web.   

4. Para robar información: Los malwere, se utiliza sobre todo para robar información personal o bancaria

   - **Keyloggers**: 

     ¿Que Hace? Analizan y registran las pulsaciones sobre el teclado, de forma que esta información pueda ser enviada a través de internet.

     ¿Para que se usa? Es muy común  frente a situaciones en las que el usuario introduce contraseñas o números de tarjeta de crédito. De esta forma puede manipular e incluso realizar pagos de forma fácil sin el consentimiento del usuario.

   - **Stealers**:

     ¿Que Hace?  Roba la información que se encuentra guardada previamente en el equipo.

     ¿Para que se usa? En aquellas ocasiones en las que el atacante quiere robar información privada del usuario y utilizarla en su propio beneficio sin su consentimiento.

   - **Dialers**:

     ¿Que Hace?  Se trata de un programa capaz de realizar llamadas con un coste adicional gracias al módem del ordenador.

     ¿Para que se usa? Se utiliza para obtener dinero de forma fraudulenta por medio de llamadas realizadas a un número de teléfono del alto coste. 

   - **Ransonware**:

     ¿Que hace? Se trata de programas que bloquean el ordenador, el cual no puede ser desbloqueado hasta que se consigue su objetivo.

     ¿Para que se usa? Son programas que cifran los archivos mas importantes, con la intención de que éstos no puedan ser autorizados por nadie. Acto seguido, solicitan una especie de "rescate" para obtener la contraseña que le permita recuperar los archivos.

     Ejemplo: WannaCry. En Septiembre de 2018, el departamento de justicia de Estados Unidos inculpó al norcoreano Park Jin Hyok der ser el creador de WannaCry y haber acometido el ataque informático de alcance mundial en 2017. Afectó a 150 paises, en hospitales, renault, nissan,... Pedía pagar bitcoins para poder regresar a antes del ataque, atacó a ordenadores de microsoft. 



Ideas para protegernos ante el malware

1. Mantener el software actualizado:
   - ¿Qué hacer? Mantener actualizados el sistema operativo y todas las aplicaciones y programas instalados en tus dispositivos.
   - ¿Qué evitar? Ignorar las actualizaciones o posponerlas, ya que las actualizaciones suelen incluir correcciones de seguridad esenciales.
2. Instalar un antivirus y antimalware
   - ¿Qué hacer? Tener instalado, actualizado y configurado correctamente un software de seguridad en tus dispositivos
   - ¿Qué evitar? Ignorar las actualizaciones y los escaneos del sistema o unidades externas que vayamos a utiilizar. (USB) o desactivar el antivirus
3. Instalar un firewall.  
   - ¿Qué hacer? Instalar y configurar el firewall correctamente y mantenerlo activado para controlar y bloquear el acceso no autorizado a redes privadas mediante un conjunto de reglas, supervisando los datos entrantes y salientes.
   - ¿Qué evitar? Aceptar conexiones de sitios desconocidos
4. Cuidado al abrir emails o descargar archivos adjuntos
   - ¿Qué hacer? Verificar que los emails o archivos adjuntos pertenecen a fuentes fiables.
   - ¿Qué evitar? Abrir cualquier email o archivo adjunto que recibamos
5. Conectarnos a URLs de confianza
   - ¿Qué hacer? Navegar por URLs que sean https o tengan certificado SSL/TLS (aparecen con un candado)
   - ¿Qué evitar? Navegar por cualquier URL libremente y pulsar sobre cualquier enlace que nos aparezca en la web.
6. Mantén tu información personal segura
   - ¿Qué hacer? Utilizar contraseñas seguras, encriptar o cifrar la información, cerrar sesion.
   - ¿Qué evitar? Compartir información sensible por la red, subir información a las redes sociales, utilizar contraseñas poco seguras, dejar sesiones abiertas
7. Para evitar los malware en los smartphone, tablets
   - ¿Qué hacer? Desactivar las redes wifi o Bluetooth cuando no  las vayamos a utilizar
   - ¿Qué evitar? Conectarnos a redes wifi públicas
8. Realizar copias de seguridad
   - ¿Qué hacer? Realizar periódicamente copias de seguridad de la información mas importante, utilizar los sistemas cloud. 
   - ¿Qué evitar? No tener cuidado al deshacernos de la información (Ej al tirar un disco duro ), se puede utilizar un aplicación específica para borrado de datos.
9. Tener cuidado al hacer compras online
   - ¿Qué hacer? Comprar desde páginas web que inspiren confianza (https), que aparezca información sobre el administrados, a ser posible utilizar un método de pago seguro (Ej: tarjeta exclusiva para realizar pagos online, como tarjeta prepago)
   - ¿Qué evitar? hacer uso de ofertas muy atractivas que pueden ser estafas