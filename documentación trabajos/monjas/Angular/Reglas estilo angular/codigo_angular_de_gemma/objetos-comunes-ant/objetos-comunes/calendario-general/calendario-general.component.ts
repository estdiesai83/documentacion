

import { Component, OnInit, AfterViewInit, Output, EventEmitter, ViewChild, ElementRef, Input} from '@angular/core';
declare var jquery: any;
declare var $: any;

@Component({
  selector: 'app-calendario-general',
  templateUrl: './calendario-general.component.html',
  styleUrls: ['./calendario-general.component.less']
})
export class CalendarioGeneralComponent implements OnInit {
   @Input() fecha;
   
   mostrar: any = [];
   fechaselecionada: string;
   @ViewChild('calendar', {static: false}) calendarscroll: ElementRef;//TODO: 27012020
   @Output() cambiarfecha = new EventEmitter();
   @Output() cambiartitulo = new EventEmitter();

  
   constructor() { }

   guardarValores(){
      console.log("en guardarvalores al pulsar boton set");
   }
   ngOnInit() {
      console.log("ngOnit calendariogeneral");
      $('#demo_calendar').mobiscroll().calendar({
         //CALENDARIO ORIGINAL
         // theme: 'ios',
         // display: 'inline', // Specify display mode like: display: 'bottom' or omit setting to use default 
         // firstSelectDay: 1,
         // firstDay: 1,// pone el dia que queremos por el que empieze la semana
         // touchUi: true,//Cuando se establece en falso, el componente se muestra adecuado para pantallas más grandes e interacción con el puntero, mientras que si se configura como verdadero lo hace adecuado para pantallas táctiles
         //FIN CALENDARIO ORIGINAL
         //TODO: ini 28012020
         //theme: 'ios', //establece la apariencia visual del componente, si se pone auto se elige automaticamente dependiendo de la plataforma en la que nos encontremos
         display: 'inline', //Controla el posicionamiento del componente: display: inline: se acopla  segun el div, center: se coloca en el centro como una ventana emergente
         firstSelectDay: 1,
         firstDay: 1,// pone el dia que queremos por el que empieze la semana
         touchUi: true,//Cuando se establece en falso, el componente se muestra adecuado para pantallas más grandes e interacción con el puntero, mientras que si se configura como verdadero lo hace adecuado para pantallas táctiles
         /*colors: [
            { d: new Date(2020,1,1), background: 'pink' },
            { d: new Date(2020,1,2), background: 'green' },
            { d: '2020/01/1', background: 'red' }
         ],*/
         /*marked: [ // Initially marked days
            new Date(2020, 1, 1),
            new Date(2020, 1, 2)
         ],*/
         themeVariant: 'light',  
         select: 'multiple',
         selectType: 'day',
         counter: true,
         color: [              // More info about marked: https://docs.mobiscroll.com/4-10-2/eventcalendar#opt-marked
            //{ d: '1/1', color: '#ffc400' },
            //{ d: '2/1', color: '#ffee00' },
            { d: '13/1', color: 'red' },
            { d: new Date(2020,1,10), color: 'pink'},
            { d: new Date(2020,1,5), color: 'pink'},
            { d: new Date(2020,1,10), color: 'pink'},
         ],
         lang: 'es',
         //controls:['date','calendar'],//se puede seleccionar fecha, calendario y/o hora         
         /*buttons: [ 
            'set',
            { 
               text: 'Custom',
               icon: 'checkmark',
               cssClass: 'my-btn', 
               handler: function (event, inst) {
                  console.log("dentro de boton set");
                  this.guardarvalores();
               } 
            },
            'cancel'
         ],*/
         /*buttons: [
            'set',
            { 
               text: 'Hide',
               handler: 'cancel',
               icon: 'close',
               cssClass: 'my-btn'
            }
         ],*/
         //TODO: fin 28012020
         onInit: () =>  {
            let partir;
            let fechaselecionado;
            let mesletra;
            fechaselecionado = this.fecha;
            console.log("en ngOn Init calendario-general fechaselecionado",fechaselecionado);
            partir = fechaselecionado.split('/');
            const mesok = new Array(12);
            mesok[0] = 'Enero';
            mesok[1] = 'Febrero';
            mesok[2] = 'Marzo';
            mesok[3] = 'Abril';
            mesok[4] = 'Mayo';
            mesok[5] = 'Junio';
            mesok[6] = 'Julio';
            mesok[7] = 'Agosto';
            mesok[8] = 'Septiembre';
            mesok[9] = 'Octubre';
            mesok[10] = 'Noviembre';
            mesok[11] = 'Diciembre';
            mesletra = mesok[Number(partir[1]) - 1];
            
            $('#demo_calendar').mobiscroll('setVal', new Date(partir[0], Number(partir[1])-1, partir[2]), true, true, false, 10);
            $('.nemo-titulo').html(mesletra + ' ' + partir[0]);            
         },
        
         onDayChange: (event, inst)=> {
            console.log("en calendario-general.component.ts dentro de OnDayChange");           
            setTimeout (() => {
               let fechaselecionado;
               let partir;
               let anioselecionado;
               let messelecionado;
               let diaselecionado;

               fechaselecionado = this.calendarscroll.nativeElement.value;
               console.log("onDayChange fechaseleccionado ",fechaselecionado);
               
               partir = fechaselecionado.split('/');
      
               messelecionado = Number(partir[0]);
               diaselecionado = Number(partir[1]);
               anioselecionado = Number(partir[2]);
      
               if (messelecionado < 10) {
                  messelecionado = '0' + messelecionado;
               }
               if (diaselecionado < 10) {
                  diaselecionado = '0' + diaselecionado;
               }
               this.fechaselecionada = diaselecionado + '-' + messelecionado + '-' + anioselecionado;
               console.log("dia seleccionador ",this.fechaselecionada);
               //TODO: ini 28012020               
               let valores: any[];
               //$('#demo_calendar').mobiscroll('setVal', new Date(anioselecionado, Number(partir[0]),Number(partir[1])+1));
               //console.log("onDayChange  fechaseleccionada ",this.fechaselecionada);
               //inst.settings.marked(fechaselecionado);//TODO: 28012020
               //inst.settings.colors(fechaselecionado,);//TODO: 28012020
               //TODO: fin 28012020
               //this.cambiarfecha.emit(this.fechaselecionada);//ORIGINAL
            }, 100);
        },
      });
   }

   pasar() {
      setTimeout (() => {
         let fecha;
         fecha = $('.dw-aria').html();
         //console.log(fecha)
         $('.nemo-titulo').html(fecha);
      }, 600);
   }   
}