import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { AlertService } from '@app/utils/alert/alert.service';

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
   @Input() rango = false;
   @Input() dias_marcados: Date[];
   @Input() dias_disponibles: Date[];
   @Input() dias_seleccionados: Date[];
   @Input() dias_nuevos: Date[];
   @Input() color_nuevo;
   @Input() deselect: boolean = false;
   @Input() weekend: boolean = false;

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
   @Input() focus: string;

   @Output() eventoCerrar = new EventEmitter();
   @Output() eventoValidado = new EventEmitter();

   seleccion: any = {};
   error: any = {};

   constructor( private servicioAlertas: AlertService ) { }

   ngOnInit() {
      this.seleccion.dia = this.ver_dia;
      this.seleccion.hora = this.hora;
   }

   diaSeleccionado($event) {
      this.error.dia = false;
      this.seleccion.dia = $event;
   }
   horaSeleccionada($event) {
      this.error.hora = false;
      this.hora = $event;
      this.seleccion.hora = $event;
   }

   validar() {
      this.error.dia = this.seleccion.dia === undefined ? true : false;
      this.error.hora = this.seleccion.hora === undefined ? true : false;

      if ( this.error.dia && this.error.hora ) {
         this.servicioAlertas.mostrarAlerta(3, {'texto': 'Tienes que seleccionar dia y hora', 'botontexto': 'Entiendo'});
      } else if ( this.error.dia ) {
         this.servicioAlertas.mostrarAlerta(3, {'texto': 'Tienes que seleccionar dia', 'botontexto': 'Entiendo'});
      } else if ( this.error.hora ) {
         this.servicioAlertas.mostrarAlerta(3, {'texto': 'Tienes que seleccionar horar', 'botontexto': 'Entiendo'});
      }

      if ( !this.error.dia && !this.error.hora ) {
         this.eventoValidado.emit(this.seleccion);
      }
   }
}
