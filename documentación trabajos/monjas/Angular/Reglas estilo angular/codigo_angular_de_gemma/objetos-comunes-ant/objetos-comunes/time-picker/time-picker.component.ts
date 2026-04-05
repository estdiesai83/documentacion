import { Component, OnInit, OnChanges, AfterViewInit, Input, Output, EventEmitter, ViewChild, ElementRef, ChangeDetectorRef } from '@angular/core';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';

@Component({
   selector: 'app-time-picker',
   templateUrl: './time-picker.component.html',
   styleUrls: ['./time-picker.component.less'],
   animations: [
      trigger('inOutDesplegable', [
         transition(':enter', [
            style({
               transform: 'scale(0.8) translateY(-80px) perspective(80px) rotateX(10deg)', 
               opacity: '0',
            }),
            animate('250ms ease', style({
               transform: 'scale(1) translateY(0) perspective(80px) rotateX(0deg)', 
               opacity: '1'
            }))
         ]),
         transition(':leave', [
            animate('250ms ease', style({
               transform: 'scale(0.8) translateY(-80px) perspective(80px) rotateX(10deg)', 
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
   @Output() eventoSeleccion = new EventEmitter();

   desplegable: boolean = false;
   desplegable_top;
   desplegable_left;

   constructor( private cdRef: ChangeDetectorRef ) { }

   ngOnInit() {
      this.inicializarHoras();
      
   }
   ngOnChanges(changes) {
      if ( changes.hora_min !== undefined || changes.minuto_min !== undefined ) {
         this.horas = [];
         this.inicializarHoras();
      }
   }
   ngAfterViewInit() {
      const labelTop = this.labelHora.nativeElement.getBoundingClientRect().top;
      const labelLeft = this.labelHora.nativeElement.getBoundingClientRect().left;
      const labelWidth = this.labelHora.nativeElement.getBoundingClientRect().width;
      const labelHeight = this.labelHora.nativeElement.getBoundingClientRect().height;

      // console.log(labelTop, labelHeight);
      // console.log(labelLeft, labelWidth);

      this.desplegable_top = (labelTop + labelHeight) + 5 + 'px';

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
}
