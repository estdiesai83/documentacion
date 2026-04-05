import { Component, OnInit, OnDestroy, Output, EventEmitter, ChangeDetectorRef } from '@angular/core';
import { AdjuntosService } from '@app/utils/adjuntos/adjuntos.service';
import { BarraestadoService } from '@app/utils/barraestado/barraestado.service';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';

@Component({
   selector: 'app-mail',
   templateUrl: './mail.component.html',
   styleUrls: ['./mail.component.less'],
   animations: [
      trigger('inOutMenu', [
         transition(':enter', [
         style({transform: 'translateX(-20px)', opacity: '0'}),
            animate('300ms ease', style({transform: 'translateX(0)', opacity: '1'}))
         ]),
         transition(':leave', [
            animate('300ms ease', style({transform: 'translateX(-20px)', opacity: '0'}))
         ])
      ])
   ]
})
export class MailComponent implements OnInit, OnDestroy {

   @Output() eventoCerrar = new EventEmitter();
   @Output() eventoTerminar = new EventEmitter();

   asunto;
   comentario;
   adjuntos: any = [];

   desplegable: boolean = false;

   mostrar: any = {};

   sub: any = {};

   constructor( 
      private cdRef: ChangeDetectorRef,
      private barra: BarraestadoService,
      private servicioAdjuntos: AdjuntosService
   ) { }

   ngOnInit() {
      this.sub.archivo = this.servicioAdjuntos.archivo.subscribe(data => {
         console.log(data);
         
         if ( data !== undefined ) {
            if ( this.adjuntos === undefined ) {
               this.adjuntos = [];
            }

            this.adjuntos.push(data);
            this.cdRef.detectChanges();
            this.servicioAdjuntos.clean();
         }
      });
      this.sub.eliminarAdjunto = this.servicioAdjuntos.eliminar.subscribe(data => {
         if ( data !== undefined && this.adjuntos !== undefined ) {
            this.adjuntos = this.adjuntos.filter(item => item.adjunto !== data.adjunto);
            this.servicioAdjuntos.clean();
         }
      });

      // this.adjuntos.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.adjuntos.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.adjuntos.push({'tipo': 'video', 'adjunto': 'http://techslides.com/demos/sample-videos/small.mp4', local: true});
      // this.adjuntos.push({'tipo': 'documento', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.pdf', local: true});
      // this.adjuntos.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.adjuntos.push({'tipo': 'imagen', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg', local: true});
      // this.adjuntos.push({'tipo': 'video', 'adjunto': 'http://techslides.com/demos/sample-videos/small.mp4', local: true});
      // this.adjuntos.push({'tipo': 'documento', 'adjunto': 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.pdf', local: true});
   }
   ngOnDestroy() {
      this.sub.archivo.unsubscribe();
      this.sub.eliminarAdjunto.unsubscribe();
   }

   mostrarAsunto() {
      this.mostrar.asunto = true;

      if ( this.mostrar.asunto ) {
         setTimeout(() => {
            this.barra.establecerBarraEstiloPersonal(true, '#000');
         }, 350);
      }

      this.cdRef.detectChanges();
   }
   mostrarComentario() {
      this.mostrar.comentario = true;

      if ( this.mostrar.comentario ) {
         setTimeout(() => {
            this.barra.establecerBarraEstiloPersonal(true, '#000');
         }, 350);
      }

      this.cdRef.detectChanges();
   }
   mostrarDesplegable() {
      this.desplegable = true;
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

   anotarTexto($event) {
      if ( this.mostrar.asunto ) {
         this.asunto = $event.texto;
      } else if ( this.mostrar.comentario ) {
         this.comentario = $event.texto;
      }

      this.cerrarPizarra()
      this.cdRef.detectChanges();
   }
   cerrarPizarra() {
      this.barra.establecerBarraEstiloPersonal(false, '#F0F0F0');
      this.mostrar.asunto = false;
      this.mostrar.comentario = false;
   }

   terminar() {
      this.eventoTerminar.emit({ 'asunto': this.asunto, 'comentario': this.comentario, 'adjuntos': this.adjuntos });
   }
}
