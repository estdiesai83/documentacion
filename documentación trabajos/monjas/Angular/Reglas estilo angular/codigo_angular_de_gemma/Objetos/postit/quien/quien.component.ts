import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { trigger , transition , animate , state , style } from '@angular/animations';
import { PostitService } from '../postit.service';

@Component({
   selector: 'app-quien',
   templateUrl: './quien.component.html',
   styleUrls: ['./quien.component.less'],
   animations: [
      trigger('slideInOut', [
         transition(':enter', [
            style({transform: 'translateY(100%)'}),
            animate('300ms ease', style({transform: 'translateY(0%)'}))
         ]),
         transition(':leave', [
            animate('300ms ease', style({transform: 'translateY(100%)'}))
         ])
      ])
   ]
})

export class QuienComponent implements OnInit, OnDestroy {
   estado: any = {};
   abrir: boolean;
   mostrar: any = {};
   sub: any = {};
   quienes: any;
   quienesNuevos: any = [];
   dependenciasQuienes: any = [];
   error: boolean;
   errorquienes: boolean;
   constructor( private servicePost: PostitService ) {
   }

   ngOnInit() {
      this.dependenciasQuienes = [];
      this.servicePost.setQuienes(this.dependenciasQuienes);

      this.servicePost.leerQuienDestinos().subscribe(data => {
         this.quienes = data.listadoquienes;
         for (const items of this.quienes) {
            this.quienesNuevos.push({'id': items.id, 'nombre': items.nombre, 'nemo': items.nemo, 'estado': false});
         }
      });

      this.sub.fLimpiarQuienes = this.servicePost.fLimpiarQuienes.subscribe(valor => {
         this.dependenciasQuienes = [];
         for (const items of this.quienesNuevos) {
            items.estado = false;
            this.estado.todos = false;
         }

         this.servicePost.setQuienes(this.dependenciasQuienes);
      });

      this.sub.vQuienes = this.servicePost.vQuienes.subscribe(quienes => {
         this.quienes = quienes;

         // console.log(this.quienes);
         // console.log(this.quienesNuevos);

         this.dependenciasQuienes = [];

         for ( const quien of quienes ) {
            for ( const persona of this.quienesNuevos ) {
               if ( persona.id === quien.id ) {
                  persona.estado = true;
                  this.dependenciasQuienes.push({'id': persona.id, 'nombre': persona.nombre, 'nemo': persona.nemo});
               }
            }
         } 
      });
      this.sub.fValidarQue = this.servicePost.fValidarQue.subscribe(valor => {
         console.log( this.dependenciasQuienes);
         if ( this.dependenciasQuienes === undefined || this.dependenciasQuienes.length === 0 ){
            this.errorquienes = true;
         }
      });
      this.sub.fMostrarAlerta = this.servicePost.fMostrarAlerta.subscribe(data => {
         if ( data ) {
            this.error = true;
         } else {
            this.error = false;
         }
      });
   }

   ngOnDestroy() {
      this.sub.fLimpiarQuienes.unsubscribe();
      this.sub.fMostrarAlerta.unsubscribe();
      this.sub.vQuienes.unsubscribe();
      this.sub.fValidarQue.unsubscribe();
   }

   despeglarQuienes() {
      // this.error = false;

      if ( !this.estado.quienes ) {
         this.abrir = true;
         this.mostrar.lista = true;
         this.estado.quienes = true;
      } else {
         this.abrir = false;
         this.mostrar.lista = false;
         this.estado.quienes = false;
      }

      this.servicePost.mostrarAlerta(false);
   }

   cerrarDespeglarQuienes() {
      this.mostrar.lista = false;
      this.estado.quienes = false;

      this.servicePost.mostrarAlerta(false);
   }

   onClickedOutside(e: Event) {
      if ( !this.abrir ) {
         if ( this.mostrar.lista ) {
            this.mostrar.lista = false;
            this.estado.quienes = false;
         }
      }
      this.abrir = false;
   }

   // FUNCION QUE SELECIONA LOS QUIENES Y LOS METE EN UN ARRAY
   seleccionarDependencia(nombre, nemo , id, estado) {
      const index_id: number = this.functionToGetTheIndexId(id);
      const index: number = this.functionToGetTheIndex(id);
      for (const items of this.quienesNuevos) {
         if ( items.id === index_id) {
            if (items.estado === true) {
               items.estado = false;
            } else {
               items.estado = true;
            }
         }
      }
      this.errorquienes = false;

      if (estado === false) {
         this.dependenciasQuienes.push({'id': id, 'nombre': nombre, 'nemo': nemo});

      } else {
         this.dependenciasQuienes.splice(index, 1);
      }

      const comprobarCheck: number = this.functionSelectAllQuienes();
      if (comprobarCheck === 1) {
         this.estado.todos = true;
         
      } else {
         this.estado.todos = false;
      }

      this.servicePost.setQuienes(this.dependenciasQuienes);
   }

   // FUNCION QUE QUITA LOS QUIENES  SELECCIONADOS
   quitarQuienes(id) {
      const index_id: number = this.functionToGetTheIndexId(id);
      const index: number = this.functionToGetTheIndex(id);

      for (const items of this.quienesNuevos) {
         if ( items.id === index_id) {
            if (items.estado === true) {
               items.estado = false;
            } else {
               items.estado = true;
            }
         }
      }
      this.dependenciasQuienes.splice(index, 1);

      const comprobarCheck: number = this.functionSelectAllQuienes();
      if (comprobarCheck === 1) {
         this.estado.todos = true;
      } else {
         this.estado.todos = false;
      }

      this.servicePost.setQuienes(this.dependenciasQuienes);
   }

   // FUNCION SELECCIONA TODOS LOS QUIENES O LOS DESELECCIONA Y LOS METE O LOS BORRA DEL ARRAY
   seleccionarTodosQuienes() {
      this.abrir = true;
      this.mostrar.lista = true;

      if (!this.estado.todos) {
         for (const items of this.quienesNuevos) {
            if (items.estado === false) {
               items.estado = true;
               this.estado.todos = true;
               this.dependenciasQuienes.push({'id': items.id, 'nombre': items.nombre, 'nemo': items.nemo});
            }
         }
      } else {
         this.dependenciasQuienes = [];
         for (const items of this.quienesNuevos) {
            items.estado = false;
            this.estado.todos = false;
         }
      }

      this.servicePost.setQuienes(this.dependenciasQuienes);
   }
   deseleccionarTodosQuienes() {
      this.abrir = true;
      this.mostrar.lista = true;
      
      this.dependenciasQuienes = [];
      for (const items of this.quienesNuevos) {
         items.estado = false;
         this.estado.todos = false;
      }

      this.servicePost.setQuienes(this.dependenciasQuienes);
   }

   // FUNCION QUE COGE EL ID BUSCADO DENTRO DE UN ARRAY
   functionToGetTheIndexId(id) {
      for (let  i = 0; i < this.quienesNuevos.length; i++) {
         if (this.quienesNuevos[i].id === id) {
            return id;
         }
      }
   }
   // FUNCION QUE COGE EL INDEX BUSCADO DENTRO DE UN ARRAY
   functionToGetTheIndex(id) {
      for (let  i = 0; i < this.dependenciasQuienes.length; i++) {
         if (this.dependenciasQuienes[i].id === id) {
            return i;
         }
      }
   }


   // FUNCION QUE COMPRUEBA SI ESTAN TODOS SELECCIONADOS
   functionSelectAllQuienes() {
      const numeroArray = this.quienesNuevos.length;
      const numeroSeleccionados = this.dependenciasQuienes.length;

      if (numeroArray === numeroSeleccionados) {
         return 1;
      } else {
         return 0;
      }
   }
}
