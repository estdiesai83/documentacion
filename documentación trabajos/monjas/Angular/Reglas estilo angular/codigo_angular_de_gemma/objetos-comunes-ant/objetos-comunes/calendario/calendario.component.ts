import { Component, OnInit, AfterViewInit, Output, EventEmitter, ViewChild, ElementRef} from '@angular/core';
declare var jquery: any;
declare var $: any;
@Component({
   selector: 'app-calendario',
   templateUrl: './calendario.component.html',
   styleUrls: ['./calendario.component.less']
})
export class CalendarioComponent implements OnInit, AfterViewInit {
   fecha: string;
   anios: any = [];
   mostrar: any = [];
   mes;
   anio;
   fechaselecionada: string;
   @Output() cambiarfecha = new EventEmitter();
   @Output() cerrar = new EventEmitter();

   @ViewChild('fecha', {static: false}) fechascroll: ElementRef;//TODO:27012020
   
  
   constructor() { }

   ngAfterViewInit() {
      this.recogerFecha();
   }
   ngOnInit() {
      console.log("en ngOnInit calendario");
      this.fechaselecionada = '';
      this.mostrar.meses = 0;
      this.mostrar.anio = 0;
      this.mostrar.capa = 0;
      
      $('.responsive-calendar').responsiveCalendar({
         monthChangeAnimation: true,
         translateMonths: ["ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"],
         time: this.fecha,
         onDayClick: () => {
            this.clickDias();
         }
      });

      

      this.anios = [
         {'anio': '2017'},
         {'anio': '2018'},
         {'anio': '2019'},
         {'anio': '2020'},
         {'anio': '2021'},
         {'anio': '2022'},
      ];
      
   }
   clickDias() {
      console.log("en calendario clickDias");
      $('.day').bind('click', (event) => {
         let diaselecionado;
         let messelecionado;
         let anioselecionado;


         diaselecionado = $(event.target).data('day');
         messelecionado = $(event.target).data('month');
         anioselecionado =  $(event.target).data('year');

         console.log("en calendario clickDias diaseleccionado",diaselecionado);
         if (messelecionado < 10) {
            messelecionado = '0' + messelecionado;
         }
         if (diaselecionado < 10) {
            diaselecionado = '0' + diaselecionado;
         }
         this.fechaselecionada = diaselecionado + '-' + messelecionado + '-' + anioselecionado;
         //this.cambiarfecha.emit(this.fechaselecionada);
      });
   }
   recogerFecha() {
      const today = new Date();
      let anio_elegido;
      let mes_elegido;

      this.mes = today.getMonth() + 1;
      this.anio = today.getFullYear();
      anio_elegido = today.getFullYear();
      if ( mes_elegido < 10 ) {
         mes_elegido =  0 + mes_elegido;
      }
      this.fecha = anio_elegido + '-' + mes_elegido;

      console.log("recogerFecha de calendario fechaactual???",this.fecha)
   }


   mostrarMeses() {
      console.log("mostrarMeses en calendario");
      $('#date1').scroller({ 
         display: 'inline',
         selectiion:'multiple',//TODO: 27012020
         theme: 'ios',  // options: ios / ios-classic / android-ics / android-ics light / android / sense-ui
         //lang: 'zh_CN',  options: zh_CN (default: Englishhhh)
         preset: 'date', // options  date / time / datetime
         onClose: function(){},
         onSelect: function(){},
         onCancel: function(){},
      });
      this.mostrar.capa = 1;
      
      this.fechascroll.nativeElement.click();
   }


   mostrarAnio() {
      $('#date1').scroller({ 
         display: 'inline',
         theme: 'ios',  // options: ios / ios-classic / android-ics / android-ics light / android / sense-ui
         //lang: 'zh_CN',  options: zh_CN (default: Englishhhh)
         preset: 'date', // options  date / time / datetime
         onClose: function(){},
         onSelect: function(){},
         onCancel: function(){},
      });
      this.mostrar.capa = 1;
      this.fechascroll.nativeElement.click();
   }


   cambiarMes(mes) {
      let fecha;
      this.mes = mes;
      if ( mes < 10) {
         mes = '0' + mes;
      }
      fecha = this.anio + '-' + mes;
      $('.responsive-calendar').responsiveCalendar(this.anio + '-' + mes);
      this.mostrar.capa = 0;
      this.mostrar.meses = 0;
   }


   cambiarAnios(anio) {
      let fecha;
      this.anio = anio;
      if ( anio < 10) {
         anio = '0' + anio;
      }
      fecha = anio + '-' + this.mes;
      $('.responsive-calendar').responsiveCalendar(anio + '-' + this.mes);
      this.mostrar.capa = 0;
      this.mostrar.anio = 0;
   }

   sumarMesCalendarioMovimiento(){
      $('.responsive-calendar').responsiveCalendar('next');
   }

   restarMescalendarioMovimiento(){
      $('.responsive-calendar').responsiveCalendar('prev');
   }
   
   cerrarCapas() {
      this.mostrar.capa = 0;
      this.mostrar.anio = 0;
      this.mostrar.meses = 0;
   }

}
