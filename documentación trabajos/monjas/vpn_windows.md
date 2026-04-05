## VPN windows

1. Configuración Red -> Recursos compartidos (abajo de la pantalla a la derecha en la barra de herramientas)

2. VPN

   1. Agregar conexion VPN

   2. Proveedor: el que viene

   3. Nombre conexion: el que queramos  (oficina)

   4. Nombre Servidor o de direccion: IP servidor (77.230.94.186)

   5. Tipo de VPN: L2TP/IPsec con clave previamente compartida

   6. Clave previamente compartida: Me la envia Robert

   7. Tipo de informacion de inicio de sesión

   8. Nombre ususario: el que corresponda (Ej: esther)

   9. contraseña: el que corresponda (Ej: est42021)

      

3. Cambiar opciones de adaptador

   1. Pulsar botón derecho sobre la VPN que hemos creado

   2. Propiedades: pestaña seguridad

   3. Activar permitir protocolos y seleccionar (CHAP y MS_CHAP)

      

4. Ejecutar comando que stack como administrador en powershell (abajo busco powershell, boton derecho, ejecutar como administrador)

   

5. Ir al Firewall de Windows

   1. Configuración avanzada

   2. Redes de entrada -> click derecho -> Nueva Regla

      1. Puerto -> siguiente

      2. UPP -> añado en puestos locales especificos [50, 500, 1701, 4500] -> Siguiente

      3. Permitir las conexiones seguras -> Siguiente -> Siguiente -> Siguiente->Siguiente

      4. Nombre: VPN -> Finalizar

         

6. Reiniciar ordenador (con esta configuración deberia de funcionar)

7. Conectar VPN y si conecta esta todo OK (conectar donde las redes wifi,..)

8. Si hubiese que modificar el usuario y contraseña

   1. VPN-> Borrar
   2. Y cuando se pulse en Conectar pongo el usuario y contraseña que se necesite.







Para meternos en la carpeta compartida:

1. Red -> Conectar Unidad Red
2. Unidad: Y
3. Carpeta: \\\192.168.42.1\Secretaria
4. contraseña: (no se cual es) 