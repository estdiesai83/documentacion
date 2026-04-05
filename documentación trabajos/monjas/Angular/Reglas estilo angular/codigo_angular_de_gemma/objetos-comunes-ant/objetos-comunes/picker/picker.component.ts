import { Component, OnInit, AfterViewInit, Output, EventEmitter, ViewChild, ElementRef, Input} from '@angular/core';
declare var jquery: any;
declare var $: any;
@Component({
  selector: 'app-picker',
  templateUrl: './picker.component.html',
  styleUrls: ['./picker.component.less']
})
export class PickerComponent implements OnInit, AfterViewInit {
  @Input() fecha;
  @ViewChild('fecha', {static: false}) fechascroll: ElementRef;//TODO: 27012020
  @Output() cambiarfecha = new EventEmitter();

  fechaselecionada;
  constructor() {
   
   }
   ngAfterViewInit() {
     
   }
  ngOnInit() {
  
    $('#demo_date').mobiscroll().date({
      theme: 'ios',     // Specify theme like: theme: 'ios' or omit setting to use default 
      display: 'bottom',
      buttons: [
         {
            text: 'Cancelar',
            handler: 'cancel',
            cssClass: 'dwb2 dwb-e dwb',
         } ,
         {
            text: 'Aceptar',
            cssClass: 'dwb2 dwb-e dwb' ,
            handler: (event, inst) => {
                  
               let fechaselecionado;
               let partir;
               let anioselecionado;
               let messelecionado;
               let diaselecionado;

               fechaselecionado = inst._value;
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
               this.fechaselecionada = anioselecionado + '/' + messelecionado + '/' + diaselecionado;
               this.cambiarfecha.emit(this.fechaselecionada);
               $('.dw-bottom').hide();
               $('.dw-bottom').remove();
            }
         }
      ]
  });
    this.fechascroll.nativeElement.click();
  }

}
