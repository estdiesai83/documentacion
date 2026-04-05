### luces -> lights:

cambiarModoAlumbradoPeriodico(id, estado) -> changePeriodicLightingMode (id, status)

cambiarHoraAlumbradoPeriodico(id, hora) -> changePeriodicLightingTime(id, hour)

cambiarModoAlumbradoGrupoPeriodico -> changePeriodicLightingGroupMode

cambiarHoraAlumbradoGrupoPeriodico -> changePeriodicLightingGroupTime



### estor -> blind:

leerAuto(id) -> readAuto(id)

borrarAuto(id) -> deleteAuto(id)

crearAuto() -> createAuto()

leerDespertador(id) -> readAlarmClock(id)

activarDespertador(id, id_estor) -> activateAlarmClock(id, blind_id)

desactivarDespertador(id, id_estor) -> desactivateAlarmClock(id, blind_id)

borrarDespertador(id, id_estor) -> deleteAlarmClock(id, blind_id)

modificarDespertador(id, hora, nivel, estado, diasemana) -> modifyAlarmClock(id, hour, level, status, day_week)

modificarDespertador(id, id_estor, hora, nivel, estado, diasemana) -> modifyAlarmClock(id, blind_id, hour, level, status, day_week)

crearDespertador(id, hora, nivel, estado, diasemana) -> createAlarmClock(id, hour, level, status, day_week)



