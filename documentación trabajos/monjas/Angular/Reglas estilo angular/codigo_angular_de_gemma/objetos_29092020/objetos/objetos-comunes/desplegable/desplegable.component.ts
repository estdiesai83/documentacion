import { Component, OnInit, OnDestroy, Input, ChangeDetectorRef, Output, EventEmitter } from '@angular/core';
import { DesplegableService } from './desplegable.service';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';
import { Globals } from '@app/globals';

@Component({
   selector: 'app-desplegable',
   templateUrl: './desplegable.component.html',
   styleUrls: ['./desplegable.component.less'],
   animations: [
      trigger('inOutOpciones', [
         transition('void => 0', [
            style({transform: 'translateX(-20px)', opacity: '0'}),
            animate('300ms ease', style({transform: 'translateX(0)', opacity: '1'}))
         ]),
         transition('0 => void', [
            animate('300ms ease', style({transform: 'translateX(-20px)', opacity: '0'}))
         ]),
         transition('void => 1', [
            style({transform: 'translateX(20px)', opacity: '0'}),
            animate('300ms ease', style({transform: 'translateX(0)', opacity: '1'}))
         ]),
         transition('1 => void', [
            animate('300ms ease', style({transform: 'translateX(20px)', opacity: '0'}))
         ]),
         transition('void => 2', [
            style({transform: 'translateY(-20px)', opacity: '0'}),
            animate('300ms ease', style({transform: 'translateY(0)', opacity: '1'}))
         ]),
         transition('2 => void', [
            animate('300ms ease', style({transform: 'translateY(-20px)', opacity: '0'}))
         ]),
         transition('void => 3', [
            style({transform: 'translateY(20px)', opacity: '0'}),
            animate('300ms ease', style({transform: 'translateY(0)', opacity: '1'}))
         ]),
         transition('3 => void', [
            animate('300ms ease', style({transform: 'translateY(20px)', opacity: '0'}))
         ])
      ])
   ]
})
export class DesplegableComponent implements OnInit, OnDestroy {

   // llega id nemo icono
   @Input() opciones: any = [];
   // 0 izda 1 dcha 2 arriba 3 abajo
   @Input() indicador: number = 0;
   @Output() seleccion = new EventEmitter();
   @Output() eventoCerrar = new EventEmitter();

   capa_deshabilitadora = true;

   sub: any = {};
   inhibir: any = {};
   show: boolean = false;

   API = Globals.BASE_API_URL;
   BASE_FILE = Globals.BASE_FILE_URL;

   constructor( 
      private servicioDesplegable: DesplegableService,
      private cdRef: ChangeDetectorRef,
   ) { }

   ngOnInit() {
      this.inhibir.desplegar = true;
      this.show = true;
   }
   ngOnDestroy() {}

   clickedOutside() {
      if ( !this.inhibir.desplegar ) {
         this.show = false;

         setTimeout(() => {
            this.eventoCerrar.emit();
         }, 300);
      }
      this.inhibir.desplegar = false;
   }

   seleccionar(opcion) {
      this.seleccion.emit(opcion.id);
      this.show = false;

      setTimeout(() => {
         this.eventoCerrar.emit();
      }, 300);
   }
}
   