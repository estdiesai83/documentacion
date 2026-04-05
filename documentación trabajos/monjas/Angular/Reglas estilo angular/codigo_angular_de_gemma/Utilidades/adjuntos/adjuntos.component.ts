import { Component, OnInit, OnDestroy, Input, ChangeDetectorRef, HostListener } from '@angular/core';
import { AdjuntosService } from './adjuntos.service';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';
import { Globals } from '@app/globals';
import { FileOpener } from '@ionic-native/file-opener/ngx';
import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer/ngx';
import { HTTP } from '@ionic-native/http/ngx';
import { File } from '@ionic-native/file/ngx';
import { AlertService } from '@app/utils/alert/alert.service';
import { BarraestadoService } from '@app/utils/barraestado/barraestado.service';

@Component({
   selector: 'app-adjuntos',
   templateUrl: './adjuntos.component.html',
   styleUrls: ['./adjuntos.component.less'],
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
export class AdjuntosComponent implements OnInit, OnDestroy {

   capa_deshabilitadora = true;

   x = 0;
   y = 0;
   adjunto;

   sub: any = {};
   inhibir: any = {};
   mostrar: any = {};

   eliminable: boolean;
   imprimible: boolean;
   descargable: boolean;

   API = Globals.BASE_API_URL;
   BASE_FILE = Globals.BASE_FILE_URL;

   tipo_archivo: number;

   fileTransfer: FileTransferObject = this.transfer.create();

   @HostListener('document:backbutton', ['$event'])
   onBackButton() {
      this.mostrar.opciones = false;
      this.servicioAdjuntos.setEstadoDesplegable(false);
      this.cdRef.detectChanges();
   }

   constructor( 
      private servicioAdjuntos: AdjuntosService,
      private fileOpener: FileOpener,
      private file: File, 
      private transfer: FileTransfer,
      private nativeHttp: HTTP,
      private barra: BarraestadoService,
      private servicioAlerta: AlertService,
      private cdRef: ChangeDetectorRef,
   ) { }

   ngOnInit() {
      this.sub.desplegar = this.servicioAdjuntos.desplegar.subscribe(data => {
         console.log(data);

         let alto_dinamico = 0;

         // @ts-ignore
         this.adjunto = data.adjunto;
         // @ts-ignore
         this.eliminable = data.eliminable;
         // @ts-ignore
         this.imprimible = data.imprimible;
         // @ts-ignore
         this.descargable = data.descargable;

         // Sabemos que siempre se debe ver la opción de ver,
         // por lo tanto lo añadimos automáticamente
         alto_dinamico += 50;

         if ( this.eliminable ) {
            alto_dinamico += 50;
         }
         // @ts-ignore
         if ( this.imprimible && data.adjunto.tipo !== 'video' ) {
            alto_dinamico += 50;
         }
         if ( this.descargable ) {
            alto_dinamico += 50;
         }

         // Establecemos el alto que va a tener el desplegable
         // marcamos siempre 30 puntos de margen
         // @ts-ignore
         this.y = data.clickEvent.clientY - (30 + alto_dinamico);

         // @ts-ignore
         this.x = data.clickEvent.clientX - 64;

         this.inhibir.desplegar = true;
         this.mostrar.opciones = true;

         this.servicioAdjuntos.setEstadoDesplegable(true);
      });

      this.sub.cerrar = this.servicioAdjuntos.cerrar.subscribe(data => {
         if ( data === 1 ) {
            this.mostrar.opciones = false;
            this.servicioAdjuntos.setEstadoDesplegable(false);
         } else if ( data === 2) {
            this.mostrar.archivo = false;
            this.servicioAdjuntos.setEstadoVisor(false);
         } else {
            this.mostrar.opciones = false;
            this.servicioAdjuntos.setEstadoDesplegable(false);
            this.mostrar.archivo = false;
            this.servicioAdjuntos.setEstadoVisor(false);
         }

         this.cdRef.detectChanges();
      });
   }
   ngOnDestroy() {
      this.sub.desplegar.unsubscribe();
      this.sub.cerrar.unsubscribe();
   }

   clickedOutside() {
      if ( !this.inhibir.desplegar ) {
         this.mostrar.opciones = false;
         this.servicioAdjuntos.setEstadoDesplegable(false);
      }

      this.inhibir.desplegar = false;
   }

   ver() {
      this.mostrar.opciones = false;
      this.servicioAdjuntos.setEstadoDesplegable(false);

      switch( this.adjunto.tipo ) {
         case 'imagen': 
            this.tipo_archivo = 0;

            if ( this.adjunto.local ) {
               this.adjunto.src = this.adjunto.adjunto;
            } else {
               this.adjunto.src = this.BASE_FILE + this.adjunto.adjunto;
            }

            this.mostrar.archivo = true;
            this.servicioAdjuntos.setEstadoVisor(true);
         break;
         case 'video': 
            this.tipo_archivo = 1;

            if ( this.adjunto.local ) {
               this.adjunto.src = this.adjunto.adjunto;
            } else {
               this.adjunto.src = this.BASE_FILE + this.adjunto.adjunto;
            }

            this.mostrar.archivo = true;
            this.servicioAdjuntos.setEstadoVisor(true);
         break;
         case 'documento': 
            if ( this.adjunto.local ) {
               this.fileOpener.open(this.adjunto.fullPath, 'application/pdf')
               .then(() => console.log('File is opened'))
               .catch(e => console.log('Error opening file', e));
            } else {
               const url = this.BASE_FILE + this.adjunto.adjunto;

               // Descargar adjunto primero
               this.nativeHttp.downloadFile(url, {}, {}, this.file.dataDirectory + this.adjunto.adjunto.split('/').pop())
                  .then(response => {

                     this.fileOpener.open(response.toURL(), 'application/pdf')
                        .then(() => console.log('File is opened'))
                        .catch(e => console.log('Error opening file', e));
                  })
                  .catch(error => {
                     console.log(error);
                  });
            }
            
         break;
      }
   }

   imprimir() {
      this.mostrar.opciones = false;
      this.servicioAdjuntos.setEstadoDesplegable(false);

      if ( this.adjunto.local ) {
         this.imprimirArchivo(this.adjunto.tipo, this.adjunto.adjunto);
      } else {
         this.servicioAdjuntos.imprimir(this.adjunto.adjunto);
      }

      this.servicioAlerta.mostrarAlerta(6, {texto: 'El archivo se ha mandado al centro de impresión.', botontexto: 'OK', icono: 'fas fa-print'})
   }
   imprimirArchivo(tipo, adjunto) {
      const parametros: any = {};

      switch ( tipo ) {
         case 'imagen': parametros.tipo = 0; break;
         case 'documento': parametros.tipo = 3; break;
      }

      const options: FileUploadOptions = {
         fileKey: 'userfile',
         // tslint:disable-next-line:max-line-length
         fileName: adjunto.split('/').pop(),
         params: parametros
      };

      this.fileTransfer.upload(adjunto, this.API + '/Imprimir/Imprimir/subirImprimir', options)
      .then((data) => {
         console.log(data);
      }, (err) => {
         console.log(err);
      });
   }

   eliminar() {
      this.mostrar.opciones = false;
      this.servicioAdjuntos.setEstadoDesplegable(false);

      this.servicioAdjuntos.eliminarItem(this.adjunto);
   }

   cerrarVisor() {
      // this.barra.establecerBarraEstiloDefecto();
      this.mostrar.archivo = false;
      this.servicioAdjuntos.setEstadoVisor(false);
   }
}
