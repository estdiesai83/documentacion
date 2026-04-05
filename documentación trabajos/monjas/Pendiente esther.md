Pendiente esther:

1. Modificaciones para clima
   1. Añadir tdatos en tabla relacion_clima (rb_valvula, codigo_tp_valvula) los tdatos que tenemos (rb_estado, codigo_tp_estado) los dejamos para las salidas de las bombillas (en todas las bds) **HECHO**
   2. Generar entidades **HECHO**
   3. Escribir en los casos existentes de relacion_clima , en rb_estado y codigo_tp_estado los codigos de la salida de la bombilla y en rb_valvula y codigo_tp_valvula los codigos de las salidas de las valvulas **HECHO**
   4. Para que desde la api se encienda la bombilla y/o valvula añadir que lea rb_valvula y codigo_tp_valvula
   5. Coser en los th de salida y de entrada de la bombilla los sockets del clima (el socket de la salida lo envia la api actualmente)
   6. Volver a probar funcionalidad de las funciones de th_pulsador y th_consigna una vez realizados los cambios anteriores
   7. Modificar en el soajs incluir cuando lee del clima que le tb los tdatos nuevo para que si hay una rutina con encender clima, encienda bombilla y/o valvula
3. trigger escenas version 2, trigger ambientes (de rutinas se dijo que no iba a haber)
3. Probar multimedia
4. Probar dali temperatura color
5. sms con lo que último que me paso gemma
6. tratar datos de trb sungrow
7. crear archivos trbs nuevos en el soa, para que robert prepare las tramas
8. Incluir todo lo que falta en el LOA