/*
* INCLUIR EN EL INDEX.HTML
      <link href="assets/css/calendario.css" rel="stylesheet">
      <link href="assets/css/material.css" rel="stylesheet">

* INCLUIR EN EL ANGULAR.JSON
   "styles": [
              "node_modules/minireset.css/minireset.css", 
              "node_modules/igniteui-angular/styles/igniteui-angular.css"
            ],
* METER EN EL PACKGE.JSON
      "minireset.css": "~0.0.4",
      "igniteui-angular": "^8.2.16",

*  EN EL LESS :
         igx-day-item{
               &.dianodisponible{ * PARA DESHABILITAR LOS DIAS NO DISPONIBLES
                  pointer-events: none;
                  color: #999;
               }
               &.igx-calendar__date--weekend{ * PARA DESHABILITAR LOS FINDES DE SEMANA EN 
                  pointer-events: none;
                  }
            }

        EN EL OBJETO DONDE SE LLAMA AL CALENDARIO
        <app-calendario  [dias]="array_diasnodisponible"></app-calendario>    
**/

import { Component, OnInit, AfterViewInit, ViewChild, ElementRef, ChangeDetectorRef, Input, Output, EventEmitter, SimpleChanges} from '@angular/core';
import { IgxCalendarComponent } from "igniteui-angular";
import { DatePipe } from '@angular/common';
import * as Hammer from 'hammerjs';
declare var jquery: any;
declare var $: any;

@Component({
   selector: 'app-calendario',
   templateUrl: './calendario.component.html',
   styleUrls: ['./calendario.component.less'],
   providers: [DatePipe]
})
export class CalendarioComponent implements OnInit, AfterViewInit {
   @Input() textoOk = 'OK';
   @Input() cabecera;
   @Input() dias;
   @Input() dias_marcados;
   @Input() espaciado: false;
   @Input() dia_seleccionado; // ME LLEGA EL ARRAY DE DIAS selecionados
   @Output() cerrar_cal = new EventEmitter();
   @Output() terminardatoscalendario = new EventEmitter();
   @Output() eventoHeight = new EventEmitter();

   v_texto1: string;
   
   fechas_selec: any =  [];
   range = undefined;
   locale: string;
   formatOptions: any;
   formatViews: any;

   tipo_seleccion_check;
   tipo_seleccion_calendar;

   calendario_height;
   mostrar_calendario = true;
   mes_calendario;
   mes_calendario_numero;
   
   constructor(private datePipe: DatePipe, private cdRef: ChangeDetectorRef,  public elementRef: ElementRef,) {
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
               if (this.dias_marcados !== undefined && this.dias_marcados.length !== 0){
                  this.leerDiasMarcados();
               }
               if (this.dia_seleccionado !== undefined){
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
               if (this.dias_marcados !== undefined && this.dias_marcados.length !== 0){
                  this.leerDiasMarcados();
               }
               if (this.dia_seleccionado !== undefined){
                  this.leerDiasSeleccionados(); // LEO LOS DIAS NO DISPONIBLES;
               }
               this.pulsarFlechas(); // INICIO EL CLICK DE FLECHAS PARA QUE ESTE DISPONIBLE
            }
         }, 200);
        // this.cdRef.detectChanges();
      });
   }

   @ViewChild("calendar", { static: true }) public calendar: IgxCalendarComponent;   
   @ViewChild('contenedorCalendario', {static: false}) contenedorCalendario: ElementRef;
   @ViewChild('calendar', {static: false}) calendarObjeto: ElementRef;

   
   ngOnInit() {
      this.locale = 'es';
      this.tipo_seleccion_check = 0;
      // @ts-ignore
      this.tipo_seleccion_calendar = 'single';
      this.formatOptions = { day: "2-digit", month: "long", year: "numeric" };
      this.formatViews = { day: true, month: true, year: true };
   }

   ngAfterViewInit() {
      this.mes_calendario = '';
      this.mes_calendario =  $('.igx-calendar-picker').find('.igx-calendar-picker__date:first').html(); // NOMBRE DEL MES
      if( this.mes_calendario !== undefined) {
         this.recogerMes(this.mes_calendario); //  NUMERO DEL MES DE LA VISTA
         if (this.dias !== undefined && this.dias.length !== 0){
            this.leerDiasNoDisponibles();
         }
         if (this.dias_marcados !== undefined && this.dias_marcados.length !== 0){
            this.leerDiasMarcados();
         }
         if (this.dia_seleccionado !== undefined){
            this.leerDiasSeleccionados(); // LEO LOS DIAS NO DISPONIBLES;
         }

         this.pulsarFlechas(); // INICIO EL CLICK DE FLECHAS PARA QUE ESTE DISPONIBLE
      }

      this.marcarDiasSeleccionados();

      this.cdRef.detectChanges();

      setTimeout(() => {
         this.calendario_height = this.contenedorCalendario.nativeElement.getBoundingClientRect().height;
         this.eventoHeight.emit(this.calendario_height);
      }, 200);
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
         if (this.dias_marcados !== undefined && this.dias_marcados.length !== 0){
            this.leerDiasMarcados();
         }
         if (this.dia_seleccionado !== undefined){
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
         if (this.dias_marcados !== undefined && this.dias_marcados.length !== 0){
            this.leerDiasMarcados();
         }
         if (this.dia_seleccionado !== undefined){
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
            numero = 0;
            this.mes_calendario_numero = numero;
            break;
         case 'febrero':
            numero = 1;
            this.mes_calendario_numero = numero;
            break;
         case 'marzo':
            numero = 2;
            this.mes_calendario_numero = numero;
            break;
         case 'abril':
            numero = 3;
            this.mes_calendario_numero = numero;
            break;
         case 'mayo':
            numero = 4;
            this.mes_calendario_numero = numero;
            break;
         case 'junio':
            numero = 5;
            this.mes_calendario_numero = numero;
            break;
         case 'julio':
            numero = 6;
            this.mes_calendario_numero = numero;
            break;
         case 'agosto':
            numero = 7;
            this.mes_calendario_numero = numero;
            break;
         case 'septiembre':
            numero = 8;
            this.mes_calendario_numero = numero;
            break;
         case 'octubre':
            numero = 9;
            this.mes_calendario_numero = numero;
            break;
         case 'noviembre':
            numero = 10;
            this.mes_calendario_numero = numero;
            break;
         case 'diciembre':
            numero = 11;
            this.mes_calendario_numero = numero;
            break;
      }
   }
   leerDiasMarcados() {
      let item;
      let mes_calendario;
      mes_calendario = this.mes_calendario_numero;
      for (item of this.dias_marcados) { // LEO LOS DIAS
         let partir;
         let diapartir;
         let mespartir;
         partir = item.dia.split('-'); // PARTO LOS DIAS
         diapartir = Number(partir[0]);
         mespartir = Number(partir[1]) - 1;
         $('.igx-calendar').find('.igx-calendar__date').each(function() { // RECORRO EL CALENDARIO DEL MES POSICIONADO
            let str;
            str = $(this).find('span').html(); // COJO EL DIA
            str.trim(); // QUITO EL ESPACIO QUE VIENE
            if ( (Number(str) === diapartir) && (mespartir === mes_calendario)) { // COMPRUBO LOS DIAS Y MES DEL CALENDARIO CON EL ARRAY
               $(this).addClass('diamarcado'); // PONGO LA CLASE NO DISPONIBLE
            }
         });
      }
      this.cdRef.detectChanges();
   }
   leerDiasNoDisponibles() {
      let item;
      let mes_calendario;
      mes_calendario = this.mes_calendario_numero;
      for (item of this.dias) { // LEO LOS DIAS
         let partir;
         let diapartir;
         let mespartir;
         partir = item.dia.split('-'); // PARTO LOS DIAS
         diapartir = Number(partir[0]);
         mespartir = Number(partir[1]) - 1;
         $('.igx-calendar').find('.igx-calendar__date').each(function() { // RECORRO EL CALENDARIO DEL MES POSICIONADO
            let str;
            str = $(this).find('span').html(); // COJO EL DIA
            str.trim(); // QUITO EL ESPACIO QUE VIENE
            if ( (Number(str) === diapartir) && (mespartir === mes_calendario)) { // COMPRUBO LOS DIAS Y MES DEL CALENDARIO CON EL ARRAY
               $(this).addClass('diadisponible'); // PONGO LA CLASE NO DISPONIBLE
            }
         });
      }
      this.cdRef.detectChanges();
   }

   leerDiasSeleccionados() {
      // let item;
      // let mes_calendario;
      // mes_calendario = this.mes_calendario_numero;
      // for (item of this.dia_seleccionado) { // LEO LOS DIAS
      //    let partir;
      //    let diapartir;
      //    let mespartir;
      //    partir = item.fecha.split('-'); // PARTO LOS DIAS
      //    diapartir = Number(partir[0]);
      //    mespartir = Number(partir[1]) - 1;
      //    $('.igx-calendar__date').removeClass('igx-calendar__date--selected');
      //    $('.igx-calendar').find('.igx-calendar__date').each(function() { // RECORRO EL CALENDARIO DEL MES POSICIONADO
      //       let str;
      //       str = $(this).find('span').html(); // COJO EL DIA
      //       str.trim(); // QUITO EL ESPACIO QUE VIENE
      //       if ( (Number(str) === diapartir) && (mespartir === mes_calendario)) { // COMPRUBO LOS DIAS Y MES DEL CALENDARIO CON EL ARRAY
      //          $(this).addClass('selecionado'); // PONGO LA CLASE NO DISPONIBLE
      //       }
      //    });
      // }
      // this.cdRef.detectChanges();
   }

   seleccionardias(dates: Date[]) {
      this.range = dates;
      this.guardarValores();
   }
   cerrarCalendario(){
      this.mostrar_calendario = false;
      this.cdRef.detectChanges();

      this.cerrar_cal.emit(1);
   }
   guardarValores() {

      let fecha;
      let fecha_mostrar;
      let fechas_mostrar = [];
      let temp;
      this.fechas_selec.length = 0;
      fecha = new Date(this.range);
         
      fecha = this.datePipe.transform(fecha, 'yyyy-MM-dd');
      fecha_mostrar = this.datePipe.transform(fecha, 'dd-MM-yyyy');
      
      //temp = [{dias: this.fechas_selec, fechas_mostrar: fechas_mostrar}];

      //this.terminardatoscalendario.emit(this.fechas_selec);
      this.terminardatoscalendario.emit(fecha_mostrar);

      this.cdRef.detectChanges();
   }  

   marcarDiasSeleccionados() {
      if ( this.dia_seleccionado !== undefined ) {
         this.range = new Date(Number(this.dia_seleccionado.split('-')[2]), Number(this.dia_seleccionado.split('-')[1]) - 1, Number(this.dia_seleccionado.split('-')[0]));
         this.calendar.selectDate(this.range);
      }
   }
}
