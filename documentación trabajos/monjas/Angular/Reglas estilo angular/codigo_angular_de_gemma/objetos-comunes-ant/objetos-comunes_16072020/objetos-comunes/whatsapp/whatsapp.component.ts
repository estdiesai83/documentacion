import { Component, OnInit, OnDestroy, ChangeDetectorRef } from '@angular/core';
import { AdjuntosService } from '@app/utils/adjuntos/adjuntos.service';
import { trigger, transition, style, animate } from '@angular/animations';
import { WhatsappService } from './whatsapp.service';

@Component({
   selector: 'app-whatsapp',
   templateUrl: './whatsapp.component.html',
   styleUrls: ['./whatsapp.component.less'],
   animations: [
      trigger('inOutOtrosAdjuntos', [
         transition(':enter', [
         style({transform: 'translateY(160%)'}),
            animate('400ms ease', style({transform: 'translateY(0%)'}))
         ]),
         transition(':leave', [
            animate('400ms ease', style({transform: 'translateY(160%)'}))
         ])
      ]),
      trigger('inOutFromBottom', [
         transition(':enter', [
         style({transform: 'translateY(160%)'}),
            animate('400ms ease', style({transform: 'translateY(0%)'}))
         ]),
         transition(':leave', [
            animate('400ms ease', style({transform: 'translateY(160%)'}))
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
export class WhatsappComponent implements OnInit, OnDestroy {

   sub: any = {};

   heightEntrada: string = '60px';

   otros_adjuntos: boolean = false;
   mail: boolean = false;

   mensajes: any = [];
   bajarScroll: boolean = false;
      
   constructor( private cdRef: ChangeDetectorRef, private servicioAdjuntos: AdjuntosService, private servicioWhatsapp: WhatsappService ) { }

   ngOnInit() {
      // Adjuntos
      this.sub.adjunto = this.servicioAdjuntos.archivo.subscribe(data => {
         if ( data !== undefined ) {

            // Genero hora del mensaje
            let d = new Date();
            let h = ("0" + d.getHours()).slice(-2);
            let m = ("0" + d.getMinutes()).slice(-2);

            const id = this.generarId();

            let tipoadjunto;

            switch (data.tipo) {
               case "imagen":
                  tipoadjunto = 0;
                  break;
               case "video":
                  tipoadjunto = 1;
                  break;
               case "documento":
                  tipoadjunto = 3;
                  break;
            }

            // Genero el mensaje
            const adjunto = {
               'hora': h + ':' + m,
               'tipo': 1,
               'tipoadjunto': tipoadjunto,
               'cargando': true,
               'random_id': id,
            };

            // Inserto el mensaje localmente
            this.mensajes.push(adjunto);

            // Muevo la lista de mensajes arriba
            this.bajarScroll = true;
            this.cdRef.detectChanges();
            this.bajarScroll = false;
            this.cdRef.detectChanges();

            this.cdRef.detectChanges();
            this.servicioAdjuntos.clean();

            // TODO: enviar
         }
      });

      this.sub.audioGrabado = this.servicioWhatsapp.audioGrabado.subscribe(data => {
         this.mensajes.map(item => {
            if ( item.random_id === data.id ) {
               item.audio = data.archivo;
               item.adjunto = data.archivo;
               item.cargando = false;

               // TODO: enviar
            }
         });
      });
   }
   ngOnDestroy() {
      this.sub.adjunto.unsubscribe();
   }

   mostrarOtrosAdjuntos() {
      this.otros_adjuntos = true;
   }

   adjuntoCamara($event) {
      $event.stopPropagation();
      this.otros_adjuntos = false;

      this.servicioAdjuntos.adjuntoCamara();
   }
   adjuntoVideo($event) {
      $event.stopPropagation();
      this.otros_adjuntos = false;

      this.servicioAdjuntos.adjuntoVideo();
   }
   adjuntoGaleria($event) {
      $event.stopPropagation();
      this.otros_adjuntos = false;

      this.servicioAdjuntos.adjuntoGaleria();
   }
   adjuntoDocumento($event) {
      $event.stopPropagation();
      this.otros_adjuntos = false;

      this.servicioAdjuntos.adjuntoDocumento();
   }

   cambioHeightEntrada($event) {
      this.heightEntrada = $event;
   }
   envioTexto($event) {

      // Genero hora del mensaje
      let d = new Date();
      let h = ("0" + d.getHours()).slice(-2);
      let m = ("0" + d.getMinutes()).slice(-2);

      // Genero el mensaje
      const mensaje = {
         'texto': $event,
         'hora': h + ':' + m,
         'tipo': 0,
      };

      // Inserto el mensaje localmente
      this.mensajes.push(mensaje);

      console.log(this.mensajes);
     
      // Muevo la lista de mensajes arriba
      this.bajarScroll = true;
      this.cdRef.detectChanges();
      this.bajarScroll = false;
      this.cdRef.detectChanges();

      // TODO: enviar
   }
   envioMail($event) {
      // Genero hora del mensaje
      let d = new Date();
      let h = ("0" + d.getHours()).slice(-2);
      let m = ("0" + d.getMinutes()).slice(-2);

      // Añado atributos al mensaje
      $event.hora = h + ':' + m;
      $event.tipo = 2;
      // Genero un id para mas tarde poder identificar el mensaje
      // en caso de que haya que subir adjuntos
      $event.random_id = this.generarId();

      // Guardo todo el mail para mas tarde subir los archivos
      if ( $event.adjuntos.length ) {
         $event.cargando = true;
      }

      // Inserto el mensaje localmente
      this.mensajes.push($event);

      // Cierro el objeto del mail
      this.mail = false;

      // Muevo la lista de mensajes arriba
      this.bajarScroll = true;
      this.cdRef.detectChanges();
      this.bajarScroll = false;
      this.cdRef.detectChanges();

      // TODO: enviar
   }

   generarId() {
      // Math.random should be unique because of its seeding algorithm.
      // Convert it to base 36 (numbers + letters), and grab the first 9 characters
      // after the decimal.
      return '_' + Math.random().toString(36).substr(2, 9);
   };

   obtenerBottomOtrosAdjuntos() {
      return this.heightEntrada;
   }

   mostrarMail() {
      this.mail = true;
   }
}
