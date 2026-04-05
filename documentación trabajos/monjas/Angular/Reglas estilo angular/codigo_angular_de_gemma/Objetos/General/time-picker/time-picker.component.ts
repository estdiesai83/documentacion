import { Component, OnInit, OnChanges, AfterViewInit, Input, Output, EventEmitter, ViewChild, ElementRef, ChangeDetectorRef } from '@angular/core';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';

@Component({
   selector: 'app-time-picker',
   templateUrl: './time-picker.component.html',
   styleUrls: ['./time-picker.component.less'],
   animations: [
      trigger('inOutDesplegable', [
         transition('void => 0', [
            style({
               transform: 'scale(0.8) translateY(-80px) perspective(80px) rotateX(10deg)', 
               opacity: '0',
            }),
            animate('250ms ease', style({
               transform: 'scale(1) translateY(0) perspective(80px) rotateX(0deg)', 
               opacity: '1'
            }))
         ]),
         transition('0 => void', [
            animate('250ms ease', style({
               transform: 'scale(0.8) translateY(-80px) perspective(80px) rotateX(10deg)', 
               opacity: '0'
            }))
         ]),
         transition('void => 1', [
            style({
               transform: 'scale(0.8) translateY(80px) perspective(80px) rotateX(-10deg)', 
               opacity: '0',
            }),
            animate('250ms ease', style({
               transform: 'scale(1) translateY(0) perspective(80px) rotateX(0deg)', 
               opacity: '1'
            }))
         ]),
         transition('1 => void', [
            animate('250ms ease', style({
               transform: 'scale(0.8) translateY(80px) perspective(80px) rotateX(-10deg)', 
               opacity: '0'
            }))
         ])
      ]),
   ]
})
export class TimePickerComponent implements OnInit, OnChanges, AfterViewInit {

   @ViewChild("labelHora", {static: false}) labelHora: ElementRef;

   @Input() hora;
   @Input() intervalo = 1;
   @Input() horas = [];
   @Input() hora_inicio = 0;
   @Input() hora_fin = 24;
   @Input() hora_min;
   @Input() minuto_min;
   @Input() refresh_desplegable: boolean = false;
   @Input() refresh_desplegable_top: boolean = false;
   @Input() refresh_desplegable_left: boolean = false;
   @Input() toggle: boolean = false;
   @Input() ajusteTop: number = 0;
   @Input() ajusteLeft: number = 0;
   @Input() posicionManual: boolean = false;
   @Output() eventoSeleccion = new EventEmitter();

   desplegable: boolean = false;
   desplegable_top;
   desplegable_bottom;
   desplegable_left;

   inhibir: any = {};

   /*
    * En esta variable se guarda la direccion
    * en la que se desplegarael desplegable
    * se calcula automaticamente
    *
    * 0 -> Despliega hacia abajo
    * 1 -> Despliega hacia arriba
    */
   direccion_desplegable: number = 0;

   constructor( private cdRef: ChangeDetectorRef ) { }

   ngOnInit() {
      this.inicializarHoras();
      
   }
   ngOnChanges(changes) {
      if ( changes.hora_min !== undefined || changes.minuto_min !== undefined ) {
         this.horas = [];
         this.inicializarHoras();
      }

      if ( changes.refresh_desplegable !== undefined && changes.refresh_desplegable.currentValue === true ) {
         this.calcularPosicionDesplegable();
      }

      if ( changes.refresh_desplegable_top !== undefined && changes.refresh_desplegable_top.currentValue === true ) {
         this.calcularPosicionDesplegableSoloTop();
      }

      if ( changes.refresh_desplegable_left !== undefined && changes.refresh_desplegable_left.currentValue === true ) {
         this.calcularPosicionDesplegableSoloLeft();
      }

      if ( changes.toggle !== undefined && changes.toggle.currentValue === true ) {
         this.abrirDesplegable();
      }
   }
   ngAfterViewInit() {
      this.calcularPosicionDesplegable();
   }

   calcularPosicionDesplegable() {
      const labelTop = this.labelHora.nativeElement.getBoundingClientRect().top + this.ajusteTop;
      const labelLeft = this.labelHora.nativeElement.getBoundingClientRect().left + this.ajusteLeft;
      const labelWidth = this.labelHora.nativeElement.getBoundingClientRect().width;
      const labelHeight = this.labelHora.nativeElement.getBoundingClientRect().height;

      if ( !this.posicionManual ) {
         if ( (window.innerHeight - (labelTop + labelHeight)) <= 300 ) {
            this.direccion_desplegable = 1;
            this.desplegable_bottom = (window.innerHeight - labelTop) + 5 + 'px';
         } else {
            this.direccion_desplegable = 0;
            this.desplegable_top = (labelTop + labelHeight) + 5 + 'px';
         }

         const m1 = labelLeft + ( labelWidth / 2 );
         const m2 = 150 / 2;

         this.desplegable_left = m1 - m2 + 'px';

         this.cdRef.detectChanges();
      } else {
         if ( (window.innerHeight - (labelTop + labelHeight)) <= 300 ) {
            this.desplegable_top = 'initial';
         } else {
            this.desplegable_bottom = 'initial';
         }
      }
   }

   calcularPosicionDesplegableSoloTop() {
      const labelTop = this.labelHora.nativeElement.getBoundingClientRect().top + this.ajusteTop;
      const labelHeight = this.labelHora.nativeElement.getBoundingClientRect().height;

      if ( (window.innerHeight - (labelTop + labelHeight)) <= 300 ) {
         this.direccion_desplegable = 1;
         this.desplegable_bottom = (window.innerHeight - labelTop) + 5 + 'px';

      } else {
         this.direccion_desplegable = 0;
         this.desplegable_top = (labelTop + labelHeight) + 5 + 'px';
      }

      this.cdRef.detectChanges();
   }
   calcularPosicionDesplegableSoloLeft() {
      const labelLeft = this.labelHora.nativeElement.getBoundingClientRect().left + this.ajusteLeft;
      const labelWidth = this.labelHora.nativeElement.getBoundingClientRect().width;

      const m1 = labelLeft + ( labelWidth / 2 );
      const m2 = 150 / 2;

      this.desplegable_left = m1 - m2 + 'px';

      this.cdRef.detectChanges();
   }

   inicializarHoras() {
      // Si no me viene dado un array de horas, lo genero
      // con todas la horas y minutos del dia cada 5 min
      if ( !this.horas.length ) {
         for ( let h = this.hora_inicio; h < this.hora_fin; h++ ) {
            for ( let m = 0; m < 60; m = m + this.intervalo ) {
               if ( this.hora_min === undefined ) {
                  this.horas.push( ('0' + h).slice(-2) + ':' + ('0' + m).slice(-2) );
               } else if ( Number(this.hora_min) === h && Number(this.minuto_min) <= m ) {
                  this.horas.push( ('0' + h).slice(-2) + ':' + ('0' + m).slice(-2) );
               } else if ( Number(this.hora_min) < h ) {
                  this.horas.push( ('0' + h).slice(-2) + ':' + ('0' + m).slice(-2) );
               }
            }
         }
      }
   }

   seleccion( hora ) {
      this.desplegable = false;
      this.cdRef.detectChanges();
      this.eventoSeleccion.emit(hora);
   }

   abrirDesplegable() {
      this.inhibir.desplegable = true;
      this.desplegable = true;
   }
   cerrarDesplegable($event) {
      $event.stopPropagation();
      this.desplegable = false;
   }

   clickedOutside() {
      if ( !this.inhibir.desplegable ) {
         this.desplegable = false;
      }

      this.inhibir.desplegable = false;
   }
}
