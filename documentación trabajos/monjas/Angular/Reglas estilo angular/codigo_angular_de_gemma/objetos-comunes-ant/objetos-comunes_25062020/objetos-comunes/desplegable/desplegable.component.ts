
import { Component, OnInit, OnDestroy, Input, ChangeDetectorRef, Output, EventEmitter } from '@angular/core';
import { DesplegableService } from './desplegable.service';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';
import { Globals } from '@app/globals';
import { FileOpener } from '@ionic-native/file-opener';
import { File } from '@ionic-native/file';
import { BarraestadoService } from '@app/utils/barraestado/barraestado.service';
import { emit } from 'cluster';
@Component({
   selector: 'app-desplegable',
   templateUrl: './desplegable.component.html',
   styleUrls: ['./desplegable.component.less'],
   animations: [
      trigger('inOutOpciones', [
         transition(':enter', [
         style({transform: 'translateY(20px)', opacity: '0'}),
            animate('300ms ease', style({transform: 'translateY(0)', opacity: '1'}))
         ]),
         transition(':leave', [
            animate('300ms ease', style({transform: 'translateY(20px)', opacity: '0'}))
         ])
      ]),
      trigger('inOutFromBottom', [
         transition(':enter', [
            style({transform: 'translateY(100%)'}),
            animate('400ms ease', style({transform: 'translateY(0%)'}))
         ]),
         transition(':leave', [
            animate('400ms ease', style({transform: 'translateY(100%)'}))
         ])
      ]),
   ]
})
export class DesplegableComponent implements OnInit, OnDestroy {

   // llega id nemo icono
   @Input() opciones: any = [];
   // 0 izda 1 dcha 2 arriba 3 abajo
   @Input() indicador: number;
   @Output() seleccion = new EventEmitter();
   @Output() eventoCerrar = new EventEmitter();

   capa_deshabilitadora = true;

   x = 0;
   y = 0;

   sub: any = {};
   inhibir: any = {};
   mostrar: any = {};

   API = Globals.BASE_API_URL;
   BASE_FILE = Globals.BASE_FILE_URL;



   constructor( 
      private servicioDesplegable: DesplegableService,
      private cdRef: ChangeDetectorRef,
   ) { }

   ngOnInit() {
      let alto_dinamico = 0;
      // Sabemos que siempre se debe ver la opción de ver,
      // por lo tanto lo añadimos automáticamente
      alto_dinamico += 50;
      // Establecemos el alto que va a tener el desplegable
      // marcamos siempre 30 puntos de margen
      // @ts-ignore
      // this.y = data.clickEvent.clientY - (30 + alto_dinamico);
      // // @ts-ignore
      // this.x = data.clickEvent.clientX - 64;
      this.inhibir.desplegar = true;
      this.mostrar.opciones = true;
   }
   ngOnDestroy() {
   }
   clickedOutside() {
      if ( !this.inhibir.desplegar ) {
         this.mostrar.opciones = false;
         this.eventoCerrar.emit();
      }
      this.inhibir.desplegar = false;
   }
}
   