import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
   selector: 'app-fechahora-picker',
   templateUrl: './fechahora-picker.component.html',
   styleUrls: ['./fechahora-picker.component.less']
})
export class FechahoraPickerComponent implements OnInit {

   @Input() titulo: string = '';

   /*
    * Esta variable configura el objeto para
    * elegir solo fecha, solo hora, o fecha y hora
    *
    * 0 -> Fecha y Hora
    * 1 -> Solo Fecha
    * 2 -> Solo Hora
    */
   @Input() modo: number = 0;

   /* 
    * Configuracion del calendario
    */
   @Input() ver_dia: Date;
   @Input() multi = false;
   @Input() dias_marcados: Date[];
   @Input() dias_disponibles: Date[];
   @Input() dias_seleccionados: Date[];
   @Input() dias_nuevos: Date[];
   @Input() color_nuevo;
   @Input() deselect: boolean = false;

   /*
    * Configuracion de la hora
    */
   @Input() hora;
   @Input() intervalo = 1;
   @Input() horas = [];
   @Input() hora_inicio = 0;
   @Input() hora_fin = 24;
   @Input() hora_min;
   @Input() minuto_min;

   @Output() eventoCerrar = new EventEmitter();
   @Output() eventoValidado = new EventEmitter();

   seleccion: any = {};

   constructor() { }

   ngOnInit() {}

   diaSeleccionado($event) {
      this.seleccion.dia = $event;
   }
   horaSeleccionada($event) {
      this.hora = $event;
      this.seleccion.hora = $event;
   }

   validar() {
      this.eventoValidado.emit(this.seleccion);
   }
}
