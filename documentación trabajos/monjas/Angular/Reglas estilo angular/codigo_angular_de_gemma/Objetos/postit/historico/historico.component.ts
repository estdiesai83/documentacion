import { Component, OnInit, OnDestroy, Input, OnChanges } from '@angular/core';
import { PostitService } from '../postit.service';
import { trigger , transition , animate , state , style } from '@angular/animations';


@Component({
   selector: 'app-historico',
   templateUrl: './historico.component.html',
   styleUrls: ['./historico.component.less'],
   animations: [
      // the fade-in/fade-out animation.
      trigger('simpleFadeAnimation', [
         // the "in" style determines the "resting" state of the element when it is visible.
         state('in', style({opacity: 1})),
         // fade in when created. this could also be written as transition('void => *')
         transition(':enter', [
            style({opacity: 0}),
            animate(200)
         ]),
         // fade out when destroyed. this could also be written as transition('void => *')
         transition(':leave',
         animate(200, style({opacity: 0})))
      ]),
      trigger('slideInOut', [
         transition(':enter', [
            style({transform: 'translateY(-100%)'}),
            animate('200ms ease-in-out', style({transform: 'translateY(0%)'}))
         ]),
         transition(':leave', [
            animate('200ms ease-in-out', style({transform: 'translateY(-100%)'}))
         ])
      ])
   ]
})
export class HistoricoComponent implements OnInit, OnDestroy, OnChanges {
   @Input() actualizar;

   postit: any;
   postitNuevos: any = [];
   sub: any = {};
   estado: any = {};
   nombre;
   texto;
   fecha;
   id: string;
   estadoPostSe;
   destinatarios: number;
   mostrar: any = {};
   abrir: boolean;
   quienes: any;
   quienesNuevos: any = [];
   quienesEnvio: any = [];
   v_textoalerta: string;
   alerta: number;
   usuarios: any = [];
   lenguetaquienes: boolean;
   proceso: any = {};

   outside_abierto: any = {};

   filtro_desde: any = {};
   filtro_hasta: any = {};
   filtrado_quien: any = [];

   historico_proceso: any = [];

   constructor(
      private servicePost: PostitService
   ) {}

   ngOnInit() {
      this.inicializar();
      this.sub.selecionadopost = this.servicePost.estadoSeleccionadoPost.subscribe(valor => this.estado.selecionadopost = valor);

      // this.servicePost.leerPostEnviados().subscribe(data => {
      //    this.postit = data.posts;
      //    for (const items of this.postit) {
      //       this.postitNuevos.push({
      //          'id': items._idpost,
      //          'nombre': items.nombre,
      //          'texto': items.texto,
      //          'fecha': items.fecha,
      //          'receptor': items.idreceptor,
      //          'estado': false
      //       });
      //    }
      // });

      this.leerQuienDestinosFiltro();
   }

   ngOnDestroy() {
      this.estado.selecionadopost = false;
      this.nombre = '';
      this.texto = '';
      this.fecha = '';
      this.id = '';
      this.sub.selecionadopost.unsubscribe();
      this.destinatarios = 0;
      this.alerta = 0;
   }

   ngOnChanges() {
      if ( this.actualizar ) {
         this.inicializar();
         this.servicePost.leerPostEnviados().subscribe(data => {
            this.postitNuevos = [];

            this.postit = data.posts;
            for (const items of this.postit) {
               this.postitNuevos.push({
                  'id': items._idpost,
                  'nombre': items.nombre,
                  'texto': items.texto,
                  'fecha': items.fecha,
                  'receptor': items.idreceptor,
                  'estado': false
               });
            }
         });
      }
   }

   inicializar() {
      this.filtro_desde.dia = 0;
      this.filtro_desde.mes = 0;
      this.filtro_desde.anio = 0;
      this.filtro_hasta.dia = 0;
      this.filtro_hasta.mes = 0;
      this.filtro_hasta.anio = 0;
      this.filtrado_quien = [];
      this.lenguetaquienes = false;
      this.v_textoalerta = 'Estas seguro';
      this.destinatarios = 0;
      this.alerta = 0;
      this.estado.selecionadopost = false;
   }

   volverAtrasGirar() {
      this.alerta = 0;
      this.destinatarios = 0;
      const valor = {'estado': false};
      this.servicePost.fjgirarPostit(valor);
      this.estado.selecionadopost = false;
   }

   selecionarPost(nombre, texto, fecha, id, estado) {
      this.lenguetaquienes = false;
      this.alerta = 0;
      const index_id: number = this.functionToGetTheIndexId(id);
      this.nombre = nombre;
      this.texto = texto;
      this.fecha = fecha;
      this.id = id;
      this.estado.selecionadopost = true;

      for (const items of this.postitNuevos) {
         if ( items.id === index_id) {
            if (items.estado === true) {
               items.estado = false;
            } else {
               items.estado = true;
            }
         } else {
            items.estado = false;
         }
      }
   }

   mostrarOjo() {
      console.log(this.id);
      if (this.lenguetaquienes === false) {
         this.leerUsuariosDePost(this.id);
         this.lenguetaquienes = true;
      } else {
         this.lenguetaquienes = false;
      }
   }
   cerrarPost() {
      this.estado.selecionadopost = false;
      this.nombre = '';
      this.texto = '';
      this.fecha = '';
      this.id = '';
      this.lenguetaquienes = false;

      for (const items of this.postitNuevos) {
         items.estado = false;
      }
   }

   leerQuienDestinosFiltro() {
      this.servicePost.leerQuienDestinos().subscribe(data => {
         this.quienes = data.listadoquienes;

         for (const items of this.quienes) {
            this.quienesNuevos.push({'id': items.id, 'nombre': items.nombre, 'nemo': items.nemo, 'estado': false});
         }
      });
   }

   leerUsuariosDePost(id) {
      this.servicePost.leerUsuariosDePost(id).subscribe(data => {
         this.usuarios = data.usuarios;
      });
   }

   eliminarPostSeleccionado(id) {
      this.outside_abierto.alerta = true;
      this.alerta = 1;
   }

   AceptarAlerta($event) {
      this.alerta = $event;
      this.servicePost.eliminarPost(this.id);
      document.getElementById('item-post' + this.id).remove();
      this.estado.selecionadopost = false;
   }

   cerrarAlerta($event) {
      this.alerta = $event;
   }

   procesoDesactivar(id, nemo) {
      this.proceso.abierto = true;
      this.proceso.tipo = 'actdesact';
      this.proceso.modo = 'desactivar';
      this.proceso.id = id;
      this.proceso.nemo = nemo;
   }

   procesoActivar(id, nemo) {
      this.proceso.abierto = true;
      this.proceso.tipo = 'actdesact';
      this.proceso.modo = 'activar';
      this.proceso.id = id;
      this.proceso.nemo = nemo;
   }

   ejecutarProceso_actdesact() {
      if ( this.proceso.modo === 'activar' ) {
         this.servicePost.activarPostHistorico(this.proceso.id).subscribe(data => {
            this.leerUsuariosDePost(this.id);
         });
      } else if ( this.proceso.modo === 'desactivar' ) {
         this.servicePost.desactivarPostHistorico(this.proceso.id).subscribe(data => {
            this.leerUsuariosDePost(this.id);
         });
      }

      this.proceso.tipo = undefined;
   }

   leerHistoricoProceso(id) {
      this.servicePost.leerHistoricoProceso(id).subscribe(data => {
         this.historico_proceso = [];

         for (const item of data) {
            this.historico_proceso.push({
               'fecha': item[0],
               'estado': item[1],
            });
         }
      });
   }

   buscarPorTexto($event) {
      this.cerrarPost();

      let input, filter, ul, li, a, i;
      input = document.getElementById('cp_buscar_filtro_historico_post_postit_teho');
      filter = input.value.toUpperCase();
      ul = document.getElementById('lista_historico_post_postit_teho');
      li = ul.getElementsByTagName('li');
      for (i = 0; i < li.length; i++) {
         a = li[i].getElementsByClassName('texto')[0];
         if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
               li[i].style.display = '';
         } else {
               li[i].style.display = 'none';
         }
      }
   }

   selecionarDespegableDestinatarios() {
      this.destinatarios = 1;
   }

   // FUNCION QUE COGE EL ID BUSCADO DENTRO DE UN ARRAY
   functionToGetTheIndexId(id) {
      for (let  i = 0; i < this.postitNuevos.length; i++) {
         if (this.postitNuevos[i].id === id) {
            return id;
         }
      }
   }
   functionToGetTheIndex(id) {
      for (let  i = 0; i < this.postitNuevos.length; i++) {
         if (this.postitNuevos[i].id === id) {
            return i;
         }
      }
   }

   onClickedOutside(e: Event) {
      if ( !this.abrir ) {
         if ( this.mostrar.lista ) {
            this.mostrar.lista = false;
         }
      }
      this.abrir = false;
   }

   setFiltroFechaDesde($event) {
      console.log($event.srcElement.value);
      if ( $event.srcElement.value !== undefined && $event.srcElement.value !== null && $event.srcElement.value !== '' ) {
         this.filtro_desde.dia = $event.srcElement.value.split('-')[2];
         this.filtro_desde.mes = $event.srcElement.value.split('-')[1];
         this.filtro_desde.anio = $event.srcElement.value.split('-')[0];
      } else {
         this.filtro_desde.dia = 0;
         this.filtro_desde.mes = 0;
         this.filtro_desde.anio = 0;
      }

      this.filtrar();
   }

   setFiltroFechaHasta($event) {
      if ( $event.srcElement.value !== undefined && $event.srcElement.value !== null && $event.srcElement.value !== '' ) {
         this.filtro_hasta.dia = $event.srcElement.value.split('-')[2];
         this.filtro_hasta.mes = $event.srcElement.value.split('-')[1];
         this.filtro_hasta.anio = $event.srcElement.value.split('-')[0];
      } else {
         this.filtro_hasta.dia = 0;
         this.filtro_hasta.mes = 0;
         this.filtro_hasta.anio = 0;
      }

      this.filtrar();
   }

   filtrar() {
      this.cerrarPost();
      this.filtrado_quien = [];

      for ( const quien of this.quienesNuevos ) {
         if (quien.estado) {
            this.filtrado_quien.push(quien);
         }
      }

      this.servicePost.leerPostEnviadosFiltrado(
         this.filtro_desde.dia,
         this.filtro_desde.mes,
         this.filtro_desde.anio,
         this.filtro_hasta.dia,
         this.filtro_hasta.mes,
         this.filtro_hasta.anio,
         this.filtrado_quien
      ).subscribe( data => {
         this.postit = data.posts;
         this.postitNuevos = [];
         for (const items of this.postit) {
            this.postitNuevos.push({
               'id': items._idpost,
               'nombre': items.nombre,
               'texto': items.texto,
               'fecha': items.fecha,
               'estado': false
            });
         }
      });
   }

   reutilizar() {
      const postit = this.postitNuevos[this.functionToGetTheIndex(this.id)];

      this.servicePost.setQue(postit.texto);

      const receptores = postit.receptor.split(', ');
      const dependenciasQuienes = [];
      for ( const receptor of receptores ) {
         dependenciasQuienes.push({'id': receptor});
      }
      this.servicePost.setQuienes(dependenciasQuienes);

      const valor = {'estado': false};
      this.servicePost.fjgirarPostit(valor);
   }
}
