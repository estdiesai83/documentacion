import { Component, OnInit, OnDestroy, Input, Output, EventEmitter, ChangeDetectorRef } from '@angular/core';
import { AlertService } from '@app/utils/alert/alert.service';
import { Globals } from '@app/globals';

import { PostitService } from './postit.service';
import { trigger, transition, style, animate } from '@angular/animations';

@Component({
  selector: 'app-postit',
  templateUrl: './postit.component.html',
  styleUrls: ['./postit.component.less'],
  animations: [
   trigger('inOutFromBottom', [
      transition(':enter', [
         style({transform: 'translateY(100%)'}),
         animate('400ms ease', style({transform: 'translateY(0%)'}))
      ]),
      transition(':leave', [
         animate('400ms ease', style({transform: 'translateY(100%)'}))
      ])
   ]),
   trigger('inOutFade', [
      transition(':enter', [
         style({opacity: '0'}),
         animate('400ms', style({opacity: '1'}))
      ]),
      transition(':leave', [
         animate('400ms', style({opacity: '0'}))
      ])
   ]),
]
})
export class PostitComponent implements OnInit, OnDestroy {
   @Input() sitio;
   @Output() eventoCerrar = new EventEmitter();

   sub: any = {};
   flip: boolean;
   flip_nuevo: boolean;
   deshabilitar: boolean;
   quienes: any;
   cuando;
   validar: boolean;
   validado: boolean;
   alerta;
   enviado;
   enviando;
   transfer: any = [];
   BASE_APP = Globals.BASE_APP_URL;
   texto: string;
   opciones_fecha: any = [
      {'id': 1, 'nemo': 'Inmediato', 'icono': 'fas fa-clock'},
      {'id': 2, 'nemo': 'Elegir fecha', 'icono': 'fas fa-calendar'},
   ];

   fecha: any;

   mostrar: number = 0;
   constructor( 
      private servicePost: PostitService,
      private cdRef: ChangeDetectorRef,
      private servicioAlertas: AlertService ) {

   }

   ngOnInit() {
      this.servicePost.nuevo();
      this.empezarNuevo();
      this.sub.deshabilitar = this.servicePost.fDeshabilitar.subscribe(estado => {
         this.deshabilitar = Boolean(estado);
         this.flip_nuevo = Boolean(estado);
      });

      this.sub.mostrarAlerta = this.servicePost.fMostrarAlerta.subscribe(estado => {
         this.alerta = estado;
      });

      this.sub.girarPost = this.servicePost.girarPostit.subscribe(data => {
         // @ts-ignore
         this.flip = Boolean(data.estado);
      });

      this.sub.fValidarQue = this.servicePost.fValidarQue.subscribe(valor => {
        if (this.quienes.length){
         this.activarTransfer();
         this.validar = true;
         }
         this.validado = true;
      });
      
      this.sub.fLimpiarQue = this.servicePost.fLimpiarQue.subscribe(valor => {
         this.transfer.end = false;
         this.transfer.show = false;
         this.transfer.animate = false;
      });

      this.sub.vQuienes = this.servicePost.vQuienes.subscribe(quienes => {
         this.quienes = quienes;

         if (quienes.length) {
            // if (this.validado)
            // {
            //    this.validar=true;
            // }
            this.transfer.end = true;
         } else {
            this.validar = false;
         }
         console.log(this.quienes);
      });
      this.sub.que = this.servicePost.vQue.subscribe(
         texto => {
            this.texto = texto;
            // this.cdRef.detectChanges();
         }
      );
      this.sub.cuando = this.servicePost.vCuando.subscribe(cuando => this.cuando = cuando);

      if ( this.sitio !== undefined ) {
         this.servicePost.leerQuienDestinos().subscribe(data => {
            const aux = [];
            const idx = data.listadoquienes.findIndex(item => Number(item.id) === Number(this.sitio.id) + 1);

            // tslint:disable-next-line:max-line-length
            aux.push({'id': data.listadoquienes[idx].id, 'nombre': data.listadoquienes[idx].nombre, 'nemo': data.listadoquienes[idx].nemo});

            this.servicePost.setQuienes(aux);
         });
      }
     

   }

   ngOnDestroy() {
      this.servicePost.nuevo();
      this.sub.deshabilitar.unsubscribe();
      this.sub.mostrarAlerta.unsubscribe();
      this.sub.fValidarQue.unsubscribe();
      this.sub.fLimpiarQue.unsubscribe();
      this.sub.vQuienes.unsubscribe();
      this.sub.que.unsubscribe();
      this.sub.cuando.unsubscribe();
   }

   girarContenidoPost() {
      this.flip = true;
   }

   empezarNuevo() {
      this.flip = false;
      this.flip_nuevo = false;
      this.enviando = false;
      this.enviado = false;
      this.validar = false;
      if ( this.sitio === undefined ) {
         this.servicePost.nuevo();
      } else {
         this.servicePost.nuevoSinQuienes();
      }
   }
   reutilizarEnvio() {
      this.enviando = false;
      this.enviado = false;
      this.servicePost.deshabilitar(false);
   }

   girarPostit(valor) {
      if (valor.estado) {
         this.flip = true;
      } else {
         this.flip = false;
      }
   }

   activarTransfer() {
      this.transfer.show = true;
      this.transfer.animate = false;
      this.transfer.end = false;
      this.cdRef.detectChanges();
      setTimeout(() => {
         this.transfer.animate = true;
         this.cdRef.detectChanges();
      }, 10);

      setTimeout(() => {
         this.transfer.show = false;
         this.transfer.animate = false;
         this.transfer.end = true;
         this.cdRef.detectChanges();
      }, 420);
   }
   procesoEnviar() {
      
      this.realizarEnvio();
      this.enviando = true;
      this.servicePost.deshabilitar(true);
      setTimeout(() => {
         this.enviando = false;
         this.enviado = true;
      }, 2000);
   }
   realizarEnvio() {
      // this.servicePost.realizarEnvio();

      console.log(this.texto);
      console.log(this.quienes);
      console.log(this.cuando);

      if (this.quienes.length) {
         this.servicePost.escribirEnvio(this.texto, this.quienes, this.cuando).subscribe();

         setTimeout(() => {
            this.servicePost.deshabilitar(true);
         }, 1000);
      } else {
         this.servicePost.mostrarAlerta(true);
      }
   }

   realizarEnvioSinDestinatario() {
      this.servicePost.mostrarAlerta(true);
      // this.alerta = false;
      // this.cdRef.detectChanges();
      // this.servicePost.realizarEnvioSinDestinatarios();

      this.servicePost.escribirEnvio(this.texto, null, this.cuando).subscribe();

      setTimeout(() => {
         this.servicePost.deshabilitar(true);
      }, 1000);
   }
   //Cuando
   seleccionFecha($event) {
      if ( $event === 2 ) {
         this.mostrar = 3;
         
         this.fecha = this.opciones_fecha.filter(item => item.id === $event)[0];
         if (this.fecha.hora === '' || this.fecha.hora === undefined){
            this.fecha.hora = '00:00';
         }
      } else {
         if ( this.fecha.date !== undefined ) {
            delete this.fecha.date;
            //delete this.fecha.hora;
            delete this.fecha.dia;
            delete this.fecha.mes;
            delete this.fecha.anio;
         }

         this.fecha = undefined;
      }
   }

   fechaElegida($event) {
      this.fecha.date = $event.dia;
      this.fecha.hora = $event.hora;

      this.fecha.dia = $event.dia.getDate();
      this.fecha.mes = $event.dia.getMonth() + 1;
      this.fecha.anio = $event.dia.getFullYear();

      this.mostrar = 0;
   }
}
