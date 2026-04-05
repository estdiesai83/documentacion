import { Component, OnInit, OnChanges, AfterViewInit, Input, Output, ChangeDetectorRef, ViewChild, EventEmitter, ElementRef } from '@angular/core';
import { IgxCalendarComponent } from "igniteui-angular";

declare var jquery: any;
declare var $: any;

@Component({
   selector: 'app-calendario',
   templateUrl: './calendario.component.html',
   styleUrls: ['./calendario.component.less']
})
export class CalendarioComponent implements OnInit, OnChanges, AfterViewInit {

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

   @Output() diaSeleccionado = new EventEmitter();

   @ViewChild('calendar', {static: false}) public calendar: IgxCalendarComponent;

   locale = 'es';
   formatOptions = { day: "2-digit", month: "long", year: "numeric" };
   formatViews = { day: true, month: true, year: true };

   anio_calendario;
   mes_calendario;
   mes_calendario_numero;

   seleccion: string;

   constructor( private cdRef: ChangeDetectorRef, public elementRef: ElementRef ) {
      const hammertime = new Hammer(elementRef.nativeElement, {});
      hammertime.on('swipe', (ev) => {
         this.mes_calendario = '';
         setTimeout(() => {
            this.actualizarEstadoCalendario();
            this.capturarClickFlechas();
         }, 200);
        this.cdRef.detectChanges();
      });
      hammertime.on('tap', (ev) => {
         this.mes_calendario = '';
         setTimeout(() => {
            this.actualizarEstadoCalendario();
            this.capturarClickFlechas();
         }, 200);
        this.cdRef.detectChanges();
      });
   }

   ngOnInit() {
      if ( !this.rango ) {
         this.seleccion = this.multi ? 'multi' : 'single';
      } else {
         this.seleccion = 'range';
      }
   }

   ngOnChanges(changes) {
      this.mostrarDiasMarcados();
      this.mostrarDiasSeleccionados();
      this.mostrarDiasDisponibles();
      this.mostrarDiasNuevos();

      if ( changes.deselect !== undefined && changes.deselect.currentValue === true ) {
         this.deselectDates();
      }

      if ( changes.ver_dia !== undefined && changes.ver_dia.currentValue !== undefined ) {
         this.calendar.selectDate(changes.ver_dia.currentValue);
         this.diaSeleccionado.emit(changes.ver_dia.currentValue);
      }
   }

   ngAfterViewInit() {
      setTimeout(() => {
         this.actualizarEstadoCalendario();
         this.capturarClickFlechas();

         this.mostrarDiaSeleccionados();
      }, 200);
      this.cdRef.detectChanges();
   }

   deselectDates() {
      let calendar = this.calendar;
      let anio_calendario = this.anio_calendario;
      let mes_calendario = this.mes_calendario_numero;

      $('.igx-calendar').find('.igx-calendar__date').each(function() {
         let str;
         str = $(this).find('span').html(); 
         str.trim(); 

         calendar.deselectDate(new Date(Number(anio_calendario), Number(mes_calendario), Number(str)));
      });
   }

   capturarClickFlechas() {
      $('.igx-calendar-picker').find('.igx-calendar-picker__prev').click(() => {
         this.actualizarEstadoCalendario();
      });

      $('.igx-calendar-picker').find('.igx-calendar-picker__next').click(() => {
         this.actualizarEstadoCalendario();
      });
   }

   actualizarEstadoCalendario() {
      this.anio_calendario = '';
      this.anio_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:nth-child(2)').html();
      this.mes_calendario = '';
      this.mes_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:first').html();

      this.recogerMes(this.mes_calendario);
      
      this.mostrarDiasMarcados();
      this.mostrarDiasSeleccionados();
      this.mostrarDiasDisponibles();
      this.mostrarDiasNuevos();
   }

   recogerMes(mes) {
      let messinespacios = mes.trim();
      let numero;

      switch(messinespacios) {
         case 'enero':
         case 'Enero':
         case 'ENERO':
            this.mes_calendario_numero = 0;
            break;
         case 'febrero':
         case 'Febrero':
         case 'FEBRERO':
            this.mes_calendario_numero = 1;
            break;
         case 'marzo':
         case 'Marzo':
         case 'MARZO':
            this.mes_calendario_numero = 2;
            break;
         case 'abril':
         case 'Abril':
         case 'ABRIL':
            this.mes_calendario_numero = 3;
            break;
         case 'mayo':
         case 'Mayo':
         case 'MAYO':
            this.mes_calendario_numero = 4;
            break;
         case 'junio':
         case 'Junio':
         case 'JUNIO':
            this.mes_calendario_numero = 5;
            break;
         case 'julio':
         case 'Julio':
         case 'JULIO':
            this.mes_calendario_numero = 6;
            break;
         case 'agosto':
         case 'Agosto':
         case 'AGOSTO':
            this.mes_calendario_numero = 7;
            break;
         case 'septiembre':
         case 'Septiembre':
         case 'SEPTIEMBRE':
            this.mes_calendario_numero = 8;
            break;
         case 'octubre':
         case 'Octubre':
         case 'OCTUBRE':
            this.mes_calendario_numero = 9;
            break;
         case 'noviembre':
         case 'Noviembre':
         case 'NOVIEMBRE':
            this.mes_calendario_numero = 10;
            break;
         case 'diciembre':
         case 'Diciembre':
         case 'DICIEMBRE':
            this.mes_calendario_numero = 11;
            break;
      }
   }

   mostrarDiasMarcados() {
      if ( this.dias_marcados !== undefined ) {
         let item;
         let anio_calendario = Number(this.anio_calendario);
         let mes_calendario;
         mes_calendario = this.mes_calendario_numero;

         $('.igx-calendar').find('.igx-calendar__date').each(function() {
            $(this).removeClass('diamarcado'); 
         });

         for (item of this.dias_marcados) {
            let partir;
            let dia = item.getDate();
            let mes = item.getMonth();
            let anio = item.getFullYear();

            $('.igx-calendar').find('.igx-calendar__date').each(function() {
               let str;
               str = $(this).find('span').html(); 
               str.trim(); 
               
               if ( (Number(str) === dia) && (mes === mes_calendario) && (anio === anio_calendario)) {
                  $(this).addClass('diamarcado'); 
               }
            });
         }
         this.cdRef.detectChanges();
      }
   }
   mostrarDiaSeleccionados() {
      if ( this.ver_dia !== undefined && this.calendar !== undefined ) {
         this.calendar.selectDate(this.ver_dia);
         this.diaSeleccionado.emit(this.ver_dia);
      }
   }
   mostrarDiasSeleccionados() {
      if ( this.dias_seleccionados !== undefined && this.calendar !== undefined ) {
         this.dias_seleccionados.map(item => this.calendar.selectDate(item));
      }
   }
   mostrarDiasDisponibles() {
      if ( this.dias_disponibles !== undefined ) {
         let item;
         let anio_calendario = Number(this.anio_calendario);
         let mes_calendario;
         mes_calendario = this.mes_calendario_numero;

         $('.igx-calendar').find('.igx-calendar__date').each(function() {
            $(this).removeClass('diadisponible'); 
         });

         for (item of this.dias_disponibles) {
            let partir;
            let dia = item.getDate();
            let mes = item.getMonth();
            let anio = item.getFullYear();

            $('.igx-calendar').find('.igx-calendar__date').each(function() {
               let str;
               str = $(this).find('span').html(); 
               str.trim(); 

               if ( (Number(str) === dia) && (mes === mes_calendario) && (anio === anio_calendario)) {
                  $(this).addClass('diadisponible'); 
               }
            });
         }
         this.cdRef.detectChanges();
      } else {
         $('.igx-calendar').find('.igx-calendar__date').each(function() {
            $(this).addClass('diadisponible'); 
         });
      }
   }
   mostrarDiasNuevos() {
      if ( this.dias_nuevos !== undefined ) {
         let item;
         let anio_calendario = Number(this.anio_calendario);
         let mes_calendario;
         mes_calendario = this.mes_calendario_numero;
         const color_nuevo = this.color_nuevo;

         $('.igx-calendar').find('.igx-calendar__date').each(function() {
            $(this).removeClass('dianuevo'); 
            $(this).removeClass('tono-azul'); 
            $(this).removeClass('tono-naranja'); 

            switch ( color_nuevo ) {
               case 'azul':
                  $(this).addClass('tono-azul'); 
               break;
               case 'naranja': 
                  $(this).addClass('tono-naranja'); 
               break;
            }
         });

         for (item of this.dias_nuevos) {
            let partir;
            let dia = item.getDate();
            let mes = item.getMonth();
            let anio = item.getFullYear();

            $('.igx-calendar').find('.igx-calendar__date').each(function() {
               let str;
               str = $(this).find('span').html(); 
               str.trim(); 
               
               if ( (Number(str) === dia) && (mes === mes_calendario) && (anio === anio_calendario)) {
                  $(this).addClass('dianuevo'); 
               }
            });
         }
         this.cdRef.detectChanges();
      }
   }
}
