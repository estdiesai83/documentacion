
/*
 * obtenerFechaHoraActual
 * 
 * Devuelve la fecha y la hora actual del sistema
 * Esta función deberá incluirse en app.service.ts
 * para que sea accesible desde todo el proyecto
 */

obtenerFechaHoraActual() {
   const today = new Date();

   let options1 = {day: '2-digit', month: 'long'};
   let options2 = {weekday: 'long'};
   let options3 = {hour: '2-digit', minute: '2-digit'};

   let fecha_prov = today.toLocaleDateString("es-ES", options1);
   //convierte la primera letra del mes a mayuscula
   let fecha = fecha_prov.slice(0,6) + fecha_prov.charAt(6).toUpperCase() + fecha_prov.slice(7);
   let diasemana = today.toLocaleDateString("es-ES", options2).toUpperCase();
   let reloj = today.toLocaleTimeString("es-ES", options3);

   return { 'fecha': fecha, 'diasemana': diasemana, 'reloj': reloj }
}
