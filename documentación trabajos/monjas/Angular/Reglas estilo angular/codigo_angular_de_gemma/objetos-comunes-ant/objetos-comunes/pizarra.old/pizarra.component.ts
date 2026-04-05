import { Component, OnInit, OnDestroy, AfterViewInit, Output, EventEmitter , Input, ViewChild, ElementRef, ChangeDetectorRef,HostListener, OnChanges, SimpleChanges} from '@angular/core';
import { Globals } from '@app/globals';
import { trigger, transition, style, animate, state } from '@angular/animations';
import { Camera, CameraOptions } from '@ionic-native/camera';
import { MediaCapture, CaptureImageOptions } from '@ionic-native/media-capture';
import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
import { DomSanitizer } from '@angular/platform-browser';
import { File } from '@ionic-native/file';
import { AlertService } from '@app/utils/alert/alert.service';

@Component({
   selector: 'app-pizarra',
   templateUrl: './pizarra.component.html',
   styleUrls: ['./pizarra.component.less'],
   animations: [
      trigger('slideLeftOut', [
         transition(':enter', [
            style({transform: 'translateX(-100%)'}),
            animate('300ms ease-out', style({transform: 'translateX(0%)'}))
         ]),
         transition(':leave', [
            animate('300ms ease-out', style({transform: 'translateX(-100%)'}))
         ])
      ])
   ]
})
export class PizarraComponent implements OnDestroy , OnInit, OnChanges, AfterViewInit{
   @Output() validar = new EventEmitter();
   @Output() mostrarconfirm = new EventEmitter();
   @Output() cerrar = new EventEmitter();
   @Output() mostrarclave = new EventEmitter();
   @Input() texto_escribir;
   @Input() adjuntos_escribir;
   @Input() datos;
   @Input() tipo;
   @Input() directo;
   @Input() adjuntos = true;
   @Input() readonly = false;
    // PIZARRA
   @Input() boton: number;
   @Input() tipoconfirm: number;
   @Input() enviarpizarra: number;
   texto;
   textoalerta;
   textoboton;
   mostrar: any = [];
   @ViewChild('pizarra', {static: false}) pizarra: ElementRef;

   video_playing: boolean;

   src_imagen_visualizar;
   src_video_visualizar;
   src_doc_visualizar;

   rutasadjuntos: any = [];
   rutas: any = [];
   base64Image: string;
   enviada;
   fileTransfer: FileTransferObject = this.transfer.create();

   sub: any = {};
   alerta;

   deviceHeight: number = Number(localStorage.getItem('deviceHeight'));
   viewportHeight: number;

   @HostListener('document:backbutton', ['$event'])
   onBackButton() {
     this.limpiarPizarra();
     this.cerrar.emit();
     this.cdRef.detectChanges();
   }
   constructor( private camera: Camera,
      private cdRef: ChangeDetectorRef,
      private mediaCapture: MediaCapture,
      private file: File,
      public sanitizer: DomSanitizer,
      private transfer: FileTransfer,
      private servicioAlerta: AlertService) { }


   ngOnChanges(changes: SimpleChanges) {
     if ( this.enviarpizarra === 0) {
     } else {
      this.enviarPizarra();
     }
   }
   ngOnInit() {
      this.enviada = 0;
      this.textoalerta = '¿ Seguro de borrar la nota ?';
      this.textoboton = 'Borrar';
      this.mostrar.confirm = 0;
      this.texto = this.texto_escribir;
      this.mostrar.adjuntos = false;

      this.mostrar.documento = 0;
      this.mostrar.video = 0;
      this.mostrar.imagen = 0;
      // EMPLO
      this.rutasadjuntos = [];
      if ( this.adjuntos_escribir !== undefined) {
         this.rutasadjuntos = this.adjuntos_escribir;
      }

      this.sub.alerta = this.servicioAlerta.eventoAlerta.subscribe(event => {
         if ( this.alerta === 1 && event === 2 ) {
            
         }

         this.alerta = 0;
      })
     
      window.addEventListener('resize', () => {
         this.resize();
      }, false);
   }

   ngAfterViewInit() {
      this.pizarra.nativeElement.focus();
   }

   cerrarTexto() {
       this.texto = '';
       this.cerrar.emit();
   }

   ngOnDestroy() {
      this.sub.alerta.unsubscribe();
      this.texto = '';
      this.enviada = 0;
      this.rutasadjuntos = [];

      window.removeEventListener('resize', () => {
         this.resize();
      }, false);
   }

   resize() {
      this.viewportHeight = window.innerHeight;

      console.log(this.viewportHeight);

      this.cdRef.detectChanges();

      // alert('viewport: ' + this.viewportHeight);
      // alert('device: ' + this.deviceHeight);
   }

   validarPizarra() {
      if (this.texto !== '' && this.texto !== undefined) {
         this.validar.emit({'texto': this.texto, 'adjuntos': this.rutasadjuntos});
      } else {
         this.alerta = 1;
         this.servicioAlerta.mostrarAlerta(3, {texto: 'Debes introducir texto para poder enviar una nota.', botontexto: 'OK'}); 
      }
   }

   mostrarConfirmClave() {
      if (this.texto !== '' && this.texto !== undefined) {
         if ( this.tipoconfirm === 1) {
            this.mostrarconfirm.emit();
         } else if ( this.tipoconfirm === 2) {
            this.mostrarclave.emit();
         }
      } else {
         this.pizarra.nativeElement.focus();
      }
   }

   enviarPizarra() {
      this.validar.emit({'tipo' : this.tipo, 'texto': this.texto, 'adjuntos': this.rutasadjuntos});
      this.enviada = 1;
      setTimeout(() => {
         this.enviada = 2;
      }, 1400);
   }

   mostrarAlerta() {
      if (this.mostrar.confirm  === 0) {
         this.mostrar.confirm = 1;
      } else {
         this.mostrar.confirm = 0;
      }
   }
   limpiarPizarra() {
      this.mostrar.adjuntos  = false;
      this.texto = '';
      this.mostrar.confirm = 0;
      this.rutasadjuntos = [];
      this.reiniciarCapas();
      this.validar.emit({'texto': this.texto, 'adjuntos': this.rutasadjuntos});
   }


   escribirVideo() {
      this.mostrar.adjuntos  = false;
      const options: CaptureImageOptions = { limit: 1 };
      this.mediaCapture.captureVideo(options)
      .then(
         (data) => {
            this.rutasadjuntos.push({'tipo': 'video', 'adjunto': data[0].fullPath});
         },
         (err) => console.error(err)
      );

      this.reiniciarCapas();
   }

   escribirCamara() {
      this.mostrar.adjuntos  = false;
      const options: CaptureImageOptions = { limit: 1 };
      this.mediaCapture.captureImage(options)
      .then(
         (data) => {
            this.rutasadjuntos.push({'tipo': 'imagen', 'adjunto': data[0].fullPath});
         },
         (err) => console.error(err)
      );

      this.reiniciarCapas();
   }

   cogerGaleria() {
      this.mostrar.adjuntos  = false;
      const cameraOptions = {
         quality: 100,
         destinationType: this.camera.DestinationType.FILE_URI,
         correctOrientation: true,
         allowEdit: false,
         sourceType: this.camera.PictureSourceType.PHOTOLIBRARY,
         mediaType: this.camera.MediaType.ALLMEDIA
       };

       this.camera.getPicture(cameraOptions).then(
            (data) => {
               const extension = data.substr( (data.lastIndexOf('.') + 1) );

               switch (extension) {
                  case 'JPG':
                     this.rutasadjuntos.push({'tipo': 'imagen', 'adjunto': data});
                  break;
                  case 'jpg':
                     this.rutasadjuntos.push({'tipo': 'imagen', 'adjunto': data});
                  break;
                  case 'png':
                        this.rutasadjuntos.push({'tipo': 'imagen', 'adjunto': data});
                  break;
                  case 'gif':
                        this.rutasadjuntos.push({'tipo': 'imagen', 'adjunto': data});
                  break;
                  case 'jpeg':
                     this.rutasadjuntos.push({'tipo': 'imagen', 'adjunto': data});
                  break;
                  case 'JPEG':
                     this.rutasadjuntos.push({'tipo': 'imagen', 'adjunto': data});
                  break;
                  case 'mp4':
                     this.rutasadjuntos.push({'tipo': 'video', 'adjunto': data});
                  break;
                  case 'pdf':
                     this.rutasadjuntos.push({'tipo': 'documento', 'adjunto': data});
                  break;
               }

            },
            (err) => console.error(err)
         );
   }

   eliminarImagenAdjunto() {
      this.rutasadjuntos = this.rutasadjuntos.filter(item => item.adjunto !== this.src_imagen_visualizar);
      this.reiniciarCapas();
   }
   eliminarVideoAdjunto() {
      this.rutasadjuntos = this.rutasadjuntos.filter(item => item.adjunto !== this.src_video_visualizar);
      this.reiniciarCapas();
   }
   eliminarDocAdjunto() {
      this.rutasadjuntos = this.rutasadjuntos.filter(item => item.adjunto !== this.src_doc_visualizar);
      this.reiniciarCapas();
   }

   mostrarImagen(imagen) {
      this.mostrar.imagen = 1;
      this.src_imagen_visualizar = imagen;
   }
   mostrarVideo(video) {
      this.mostrar.video = 1;
      this.src_video_visualizar = video;
   }

   playPauseVideo($event) {
      if ($event.path[0].paused) {
         $event.path[0].play();
         this.video_playing = true;
      } else {
         $event.path[0].pause();
         this.video_playing = false;
      }
   }

   mostrarAdjuntos() {
      this.mostrar.adjuntos = !this.mostrar.adjuntos;
   }

   mostrarDocumento(doc) {
      this.mostrar.documento = 1;
      this.src_doc_visualizar = 'https://docs.google.com/gview?embedded=true&url=' + doc;
   }


   reiniciarCapas() {
      this.mostrar.documento = 0;
      this.mostrar.video = 0;
      this.mostrar.imagen = 0;
      this.video_playing = false;
      this.src_video_visualizar = '';
      this.src_imagen_visualizar = '';
      this.src_doc_visualizar = '';
   }

}
