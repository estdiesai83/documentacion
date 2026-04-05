import { Component, OnInit, AfterViewInit, ViewChild, ElementRef, ChangeDetectorRef, Input, Output, EventEmitter} from '@angular/core';
import { IgxCalendarComponent } from "igniteui-angular";
import { DatePipe } from '@angular/common';

declare var jquery: any;
declare var $: any;

@Component({
   selector: 'app-calendario-multiple',
   templateUrl: './calendario-multiple.component.html',
   styleUrls: ['./calendario-multiple.component.less'],
   providers: [DatePipe]
})
export class CalendariomultipleComponent implements OnInit, AfterViewInit {
   @Input() textoOk = 'OK';
   @Input() dias; // ME LLEGA EL ARRAY DE DIAS NO DISPONIBLE
   @Input() dias_selecionados; // ME LLEGA EL ARRAY DE DIAS selecionados
   @Output() cerrar_cal = new EventEmitter();  
   @Output() terminardatoscalendario = new EventEmitter(); 

   @ViewChild("calendar", { static: false }) public calendar: IgxCalendarComponent;   
   @ViewChild('contenedorCalendario', {static: false}) contenedorCalendario: ElementRef;

   v_texto1: string;
   
   fechas_selec: any=[];
   range = [];
   locale: string;
   formatOptions: any;
   formatViews: any;

   tipo_seleccion_check;
   tipo_seleccion_calendar;

   calendario_height;
   mostrar_calendario = true;
   mes_calendario;
   mes_calendario_numero;
   
   constructor(private datePipe: DatePipe, private cdRef: ChangeDetectorRef, public elementRef: ElementRef) {
      // PARA SABER SI MUEVO EL CALENDARIO o picko !!imprencindible
      const hammertime = new Hammer(elementRef.nativeElement, {});
      hammertime.on('swipe', (ev) => {
         this.mes_calendario = '';
         setTimeout(() => {
            this.mes_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:first').html(); // NOMBRE DEL MES
            if (this.mes_calendario !== undefined) {
               this.recogerMes(this.mes_calendario); //  NUMERO DEL MES DE LA VISTA
               if (this.dias !== undefined && this.dias.length !== 0){
                  this.leerDiasNoDisponibles();
               }
               if (this.dias_selecionados !== undefined){
                  this.leerDiasSeleccionados(); // LEO LOS DIAS NO DISPONIBLES;
               }
               this.pulsarFlechas(); // INICIO EL CLICK DE FLECHAS PARA QUE ESTE DISPONIBLE
            }
         }, 200);
        this.cdRef.detectChanges();
      });
      hammertime.on('tap', (ev) => {
         this.mes_calendario = '';
         setTimeout(() => {
            this.mes_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:first').html(); // NOMBRE DEL MES
            if (this.mes_calendario !== undefined) {
               this.recogerMes(this.mes_calendario); //  NUMERO DEL MES DE LA VISTA
               if (this.dias !== undefined && this.dias.length !== 0){
                  this.leerDiasNoDisponibles();
               }
               if (this.dias_selecionados !== undefined){
                  this.leerDiasSeleccionados(); // LEO LOS DIAS NO DISPONIBLES;
               }
               this.pulsarFlechas(); // INICIO EL CLICK DE FLECHAS PARA QUE ESTE DISPONIBLE
            }
         }, 200);
        // this.cdRef.detectChanges();
      });
   }

   ngOnInit() {
      console.log(this.dias);

      this.tipo_seleccion_check = 0;
      // @ts-ignore
      this.tipo_seleccion_calendar = 'multi';
      
      this.formatOptions = { day: "2-digit", month: "long", year: "numeric" };
      this.formatViews = { day: true, month: true, year: true };
   }
   ngAfterViewInit() {
      this.calendario_height = this.contenedorCalendario.nativeElement.getBoundingClientRect().height;

      this.mes_calendario = '';
      this.mes_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:first').html(); // NOMBRE DEL MES
      if( this.mes_calendario !== undefined) {
         this.recogerMes(this.mes_calendario); //  NUMERO DEL MES DE LA VISTA
         if (this.dias !== undefined && this.dias.length !== 0){
            this.leerDiasNoDisponibles();
         }
         if (this.dias_selecionados !== undefined){
            // this.leerDiasSeleccionados(); // LEO LOS DIAS NO DISPONIBLES;
         }
         this.pulsarFlechas(); // INICIO EL CLICK DE FLECHAS PARA QUE ESTE DISPONIBLE
      }

      this.marcarDiasSeleccionados();

      this.cdRef.detectChanges();

      // setTimeout(() => {
      //    console.log(this.calendar);
      //    this.calendar.selectDate(new Date(2020, 3, 4));
      // }, 1000);
   }

   cambiarTipoSeleccion() {
      if ( this.tipo_seleccion_check ) {
         // @ts-ignore
         this.tipo_seleccion_calendar = 'range';
      } else {
         // @ts-ignore
         this.tipo_seleccion_calendar = 'multi';
      }
   }

   seleccionardias(dates: Date[]) {
      this.range = dates;
   }
   cerrarCalendario(){
      this.mostrar_calendario = false;
      this.cdRef.detectChanges();

      this.cerrar_cal.emit(1);
   }
   guardarValores() {
      this.mostrar_calendario = false;
      this.cdRef.detectChanges();

      let fecha;
      let fecha_mostrar;
      let fechas_mostrar = [];
      let temp: any =[];
      this.fechas_selec.length=0;

      this.range.forEach(element => {
         fecha = new Date(element);
         
         fecha = this.datePipe.transform(fecha, 'yyyy-MM-dd');
         fecha_mostrar = this.datePipe.transform(fecha, 'dd-MM-yyyy');

         this.fechas_selec.push(fecha);
         fechas_mostrar.push(fecha_mostrar);
      });

      temp = [{dias: this.fechas_selec, fechas_mostrar: fechas_mostrar}];

      //this.terminardatoscalendario.emit(this.fechas_selec);
      this.terminardatoscalendario.emit(temp[0]);
   }     

   pulsarFlechas() {
      // CLICK EN FLECHAS DEL CALENDARIO
      $('.igx-calendar-picker').find('.igx-calendar-picker__prev').click(() => {
         this.mes_calendario = '';
         this.mes_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:first').html(); // NOMBRE DEL MES
         this.recogerMes(this.mes_calendario); //  NUMERO DEL MES DE LA VISTA
         if (this.dias !== undefined && this.dias.length !== 0){
            this.leerDiasNoDisponibles();
         }
         if (this.dias_selecionados !== undefined){
            this.leerDiasSeleccionados(); // LEO LOS DIAS NO DISPONIBLES;
         }
      });

      $('.igx-calendar-picker').find('.igx-calendar-picker__next').click(() => {
         this.mes_calendario = '';
         this.mes_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:first').html(); // NOMBRE DEL MES
         this.recogerMes(this.mes_calendario); //  NUMERO DEL MES DE LA VISTA
         if (this.dias !== undefined && this.dias.length !== 0){
            this.leerDiasNoDisponibles();
         }
         
         if (this.dias_selecionados !== undefined){
            this.leerDiasSeleccionados(); // LEO LOS DIAS NO DISPONIBLES;
         }
      });
      // this.cdRef.detectChanges();
   }
   recogerMes(mes) {
      let messinespacios = mes.trim();
      let numero;
      switch(messinespacios) {
         case 'enero':
         case 'January':
            numero = 0;
            this.mes_calendario_numero = numero;
            break;
         case 'febrero':
         case 'February':
            numero = 1;
            this.mes_calendario_numero = numero;
            break;
         case 'marzo':
         case 'March':
            numero = 2;
            this.mes_calendario_numero = numero;
            break;
         case 'abril':
         case 'April':
            numero = 3;
            this.mes_calendario_numero = numero;
            break;
         case 'mayo':
         case 'May':
            numero = 4;
            this.mes_calendario_numero = numero;
            break;
         case 'junio':
         case 'June':
            numero = 5;
            this.mes_calendario_numero = numero;
            break;
         case 'julio':
         case 'July':
            numero = 6;
            this.mes_calendario_numero = numero;
            break;
         case 'agosto':
         case 'August':
            numero = 7;
            this.mes_calendario_numero = numero;
            break;
         case 'septiembre':
         case 'September':
            numero = 8;
            this.mes_calendario_numero = numero;
            break;
         case 'octubre':
         case 'October':
            numero = 9;
            this.mes_calendario_numero = numero;
            break;
         case 'noviembre':
         case 'November':
            numero = 10;
            this.mes_calendario_numero = numero;
            break;
         case 'diciembre':
         case 'December':
            numero = 11;
            this.mes_calendario_numero = numero;
            break;
      }
   }
   leerDiasNoDisponibles() {
      let item;
      let mes_calendario;
      mes_calendario = this.mes_calendario_numero;
      for (item of this.dias) { // LEO LOS DIAS
         let partir;
         let diapartir;
         let mespartir;
         partir = item.split('-'); // PARTO LOS DIAS
         diapartir = Number(partir[0]);
         mespartir = Number(partir[1]) - 1;
         $('.igx-calendar').find('.igx-calendar__date').each(function() { // RECORRO EL CALENDARIO DEL MES POSICIONADO
            let str;
            str = $(this).find('span').html(); // COJO EL DIA
            str.trim(); // QUITO EL ESPACIO QUE VIENE
            if ( (Number(str) === diapartir) && (mespartir === mes_calendario)) { // COMPRUBO LOS DIAS Y MES DEL CALENDARIO CON EL ARRAY
               $(this).addClass('diadisponible'); // PONGO LA CLASE DISPONIBLE
            }
         });
      }
      this.cdRef.detectChanges();
   }
   leerDiasSeleccionados() {
      // let item;
      // let mes_calendario;
      // mes_calendario = this.mes_calendario_numero;

      // for (item of this.dias_selecionados) { // LEO LOS DIAS
      //    let partir;
      //    let diapartir;
      //    let mespartir;
      //    partir = item.split('-'); // PARTO LOS DIAS
      //    diapartir = Number(partir[0]);
      //    mespartir = Number(partir[1]) - 1;
      //    // $('.igx-calendar__date').removeClass('igx-calendar__date--selected');
      //    $('.igx-calendar').find('.igx-calendar__date').each(function() { // RECORRO EL CALENDARIO DEL MES POSICIONADO
      //       let str;
      //       str = $(this).find('span').html(); // COJO EL DIA
      //       str.trim(); // QUITO EL ESPACIO QUE VIENE

      //       if ( (Number(str) === diapartir) && (mespartir === mes_calendario)) { // COMPRUBO LOS DIAS Y MES DEL CALENDARIO CON EL ARRAY
      //          console.log('aqui');
      //          // igx-calendar__date igx-calendar__date--single ng-star-inserted igx-calendar__date--selected
      //          $(this).addClass('igx-calendar__date--selected'); // PONGO LA CLASE NO DISPONIBLE
      //       }
      //    });
      // }
      // this.cdRef.detectChanges();
   }

   marcarDiasSeleccionados() {
      if ( this.dias_selecionados !== undefined ) {
         for (let item of this.dias_selecionados) {
            this.range.push(new Date(Number(item.split('-')[2]), Number(item.split('-')[1]) - 1, Number(item.split('-')[0])));
            this.calendar.selectDate(this.range[this.range.length - 1]);
         }
      }
   }
}
