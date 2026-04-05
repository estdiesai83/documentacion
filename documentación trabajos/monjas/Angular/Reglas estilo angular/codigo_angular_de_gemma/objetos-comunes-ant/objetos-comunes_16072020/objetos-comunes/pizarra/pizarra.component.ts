import { Component, OnInit, OnDestroy, AfterViewInit, Input, Output, EventEmitter, ChangeDetectorRef, ViewChild, ElementRef } from '@angular/core';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';
import { AdjuntosService } from '@app/utils/adjuntos/adjuntos.service';
import { AlertService } from '@app/utils/alert/alert.service';

export enum Formato {
   Extenso,
   Corto
}

@Component({
   selector: 'app-pizarra',
   templateUrl: './pizarra.component.html',
   styleUrls: ['./pizarra.component.less'],
   animations: [
      trigger('inOutMenu', [
         transition(':enter', [
         style({transform: 'translateX(-20px)', opacity: '0'}),
            animate('300ms ease', style({transform: 'translateX(0)', opacity: '1'}))
         ]),
         transition(':leave', [
            animate('300ms ease', style({transform: 'translateX(-20px)', opacity: '0'}))
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
export class PizarraComponent implements OnInit, OnDestroy, AfterViewInit {


   /********************************/
   /* Estos inputs habra que borrarlos
   /* a medida que actualizamos todas
   /* las pizarras
   /********************************/
   @Input() texto_escribir;
   @Input() adjuntos_escribir;
   @Input() datos;
   @Input() tipo;
   @Input() directo;
   @Input() validado;
   @Input() boton: number;
   @Input() tipoconfirm: number;
   @Input() enviarpizarra: number;
   /********************************/
   
   @Input() formato: Formato = Formato.Extenso;
   @Input() limite: number = 10000;
   @Input() texto = undefined;
   @Input() titulo = undefined;
   @Input() titulo_secundario = undefined;
   @Input() cesta_adjuntos: any = [];
   @Input() adjuntos = true;
   @Input() readonly = false;
   @Input() nullable = true;
   @Input() placeholder: string = 'Escribe...';
   @Input() icono_adicional: string = undefined;
   @Output() eventoTerminado = new EventEmitter();
   @Output() eventoAdicional = new EventEmitter();
   @Output() eventoCerrar = new EventEmitter();

   Formato = Formato;

   @ViewChild('pizarra', {static: false}) pizarra: ElementRef;

   cesta_adjuntos_interno: any = [];

   sub: any = {};

   desplegable: boolean;
   show: boolean = false;
   alerta: number;

   device_height = localStorage.getItem('deviceHeight');
   viewportHeight;
   resultado_height;

   constructor( 
      private cdRef: ChangeDetectorRef,
      private servicioAdjuntos: AdjuntosService,
      private servicioAlerta: AlertService ) { }

   ngOnInit() {
      if ( this.cesta_adjuntos !== undefined && this.cesta_adjuntos.length ) {
         this.cesta_adjuntos_interno = JSON.parse(JSON.stringify(this.cesta_adjuntos));
      }

      window.addEventListener('resize', () => { this.resize() }, false);

      // Adjuntos
      this.sub.archivo = this.servicioAdjuntos.archivo.subscribe(data => {
         if ( data !== undefined ) {
            if ( this.cesta_adjuntos_interno === undefined ) {
               this.cesta_adjuntos_interno = [];
            }

            this.cesta_adjuntos_interno.push(data);
            this.cdRef.detectChanges();
            this.servicioAdjuntos.clean();
         }
      });
      // Alertas
      this.sub.alerta = this.servicioAlerta.eventoAlerta.subscribe(data => {
         if ( this.alerta === 1 && data === 2 ) {
            this.cesta_adjuntos_interno = [];
            this.texto = undefined;

            this.cdRef.detectChanges();
         }

         this.alerta = 0;
      });
      // Eliminar adjunto
      this.sub.eliminarAdjunto = this.servicioAdjuntos.eliminar.subscribe(data => {
         if ( data !== undefined && this.cesta_adjuntos_interno !== undefined ) {
            this.cesta_adjuntos_interno = this.cesta_adjuntos_interno.filter(item => item.adjunto !== data.adjunto);
         }
      });

      setTimeout(() => {
         this.show = true;
      }, 50);

      // this.cesta_adjuntos_interno.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.cesta_adjuntos_interno.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.cesta_adjuntos_interno.push({'tipo': 'video', 'adjunto': 'http://techslides.com/demos/sample-videos/small.mp4', local: true});
      // this.cesta_adjuntos_interno.push({'tipo': 'documento', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.pdf', local: true});
      // this.cesta_adjuntos_interno.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.cesta_adjuntos_interno.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.cesta_adjuntos_interno.push({'tipo': 'video', 'adjunto': 'http://techslides.com/demos/sample-videos/small.mp4', local: true});
      // this.cesta_adjuntos_interno.push({'tipo': 'documento', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.pdf', local: true});
   }
   ngOnDestroy() {
      this.sub.archivo.unsubscribe();
      this.sub.alerta.unsubscribe();
      this.sub.eliminarAdjunto.unsubscribe();
      
      window.removeEventListener('resize', () => { this.resize() }, false);
   }
   ngAfterViewInit() {
      setTimeout(() => {
         this.pizarra.nativeElement.focus();
      }, 100);
   }

   comprobarEliminar() {
      return (this.texto !== undefined && this.texto !== '') || (this.cesta_adjuntos_interno !== undefined && this.cesta_adjuntos_interno.length);
   }

   resize() {
      this.viewportHeight = window.innerHeight;
      this.resultado_height = Number(this.viewportHeight);
      this.cdRef.detectChanges();
   }

   adjuntoCamara($event) {
      $event.stopPropagation();
      this.desplegable = false;
      
      this.servicioAdjuntos.adjuntoCamara();
   }
   adjuntoVideo($event) {
      $event.stopPropagation();
      this.desplegable = false;

      this.servicioAdjuntos.adjuntoVideo();
   }
   adjuntoGaleria($event) {
      $event.stopPropagation();
      this.desplegable = false;

      this.servicioAdjuntos.adjuntoGaleria();
   }
   adjuntoDocumento($event) {
      $event.stopPropagation();
      this.desplegable = false;

      this.servicioAdjuntos.adjuntoDocumento();
   }

   alertaEliminar() {
      this.alerta = 1;
      this.servicioAlerta.mostrarAlerta(4, {
         texto: '¿Quieres eliminar todos los datos?', 
         botontextoaceptar: 'SI',
         botontextocancelar: 'NO',
      });
   }
   terminar() {
      let ok = false;

      if ( this.nullable ) {
         ok = true;
      } else {
         if ( (this.texto === '' || this.texto === undefined) && (this.cesta_adjuntos_interno === undefined || !this.cesta_adjuntos_interno.length) ) {
            ok = false;
         } else {
            ok = true;
         }
      }

      if ( ok ) {
         this.show = false;

         setTimeout(() => {
            this.eventoTerminado.emit({ 'texto': this.texto, 'adjuntos': this.cesta_adjuntos_interno });
         }, 400);
      } else {
         // TODO: mostrar alerta
         this.servicioAlerta.mostrarAlerta(3, {texto: 'No has introducido ningún dato', botontexto: 'Entiendo'});
      }
   }
   cerrar() {
      this.show = false;

      setTimeout(() => {
         this.eventoCerrar.emit()
      }, 400);
   }
   emitirAdicional() {
      this.show = false;

      setTimeout(() => {
         this.eventoAdicional.emit();
      }, 400);
   }

   mostrarDesplegableAdjuntos() {
      if ( !this.readonly && !this.cesta_adjuntos_interno.length ) {
         this.desplegable = true;
      }
   }
}
