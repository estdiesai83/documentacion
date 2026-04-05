import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Subject } from 'rxjs';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { HTTP } from '@ionic-native/http/ngx';
import { map, tap } from 'rxjs/operators';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';

import { Globals } from '@app/globals';

import { IOSFilePicker } from '@ionic-native/file-picker/ngx';
import { ImagePicker, ImagePickerOptions } from '@ionic-native/image-picker/ngx';
import { FileChooser } from '@ionic-native/file-chooser/ngx';
import { FilePath } from '@ionic-native/file-path/ngx';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
import { MediaCapture, CaptureImageOptions } from '@ionic-native/media-capture/ngx';
import { FileOpener } from '@ionic-native/file-opener/ngx';
// import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer/ngx';
import { File, FileEntry } from '@ionic-native/file/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';

@Injectable({
   providedIn: 'root'
})
export class AdjuntosService {

   private API = Globals.BASE_API_URL;

   private visor_abierto = false;
   private desplegable_abierto = false;

   private _archivo = new BehaviorSubject<any>(undefined);
   archivo = this._archivo.asObservable();

   private _eliminar = new BehaviorSubject<any>(undefined);
   eliminar = this._eliminar.asObservable();

   private _desplegar  = new Subject();
   desplegar = this._desplegar.asObservable();

   private _cerrar  = new Subject();
   cerrar = this._cerrar.asObservable();

   private _archivoSubido  = new Subject();
   archivoSubido = this._archivoSubido.asObservable();

   // fileTransfer: FileTransferObject = this.transfer.create();

   constructor(
      private filePicker: IOSFilePicker,
      private fileChooser: FileChooser,
      private filePath: FilePath,
      private fileOpener: FileOpener,
      private file: File,
      private camera: Camera,
      private mediaCapture: MediaCapture,
      private imagePicker: ImagePicker,
      // private transfer: FileTransfer,
      private http: HttpClient,
      private nativeHttp: HTTP,
      private webview: WebView,
      // private backgroundMode: BackgroundMode,
      private domSanitizer: DomSanitizer
   ) { }

   clean() {
      this._archivo.next(undefined);
      this._eliminar.next(undefined);
   }

   setEstadoVisor(estado) {
      this.visor_abierto = estado;
   }
   getEstadoVisor() {
      return this.visor_abierto;
   }

   setEstadoDesplegable(estado) {
      this.visor_abierto = estado;
   }
   getEstadoDesplegable() {
      return this.visor_abierto;
   }

   desplegarMenu(datos) {
      this._desplegar.next(datos);
   }
   cerrarVistas(datos) {
      this._cerrar.next(datos);
   }

   eliminarItem(item) {
      this._eliminar.next(item);
   }
   subirArchivo(tipos, rutas, rutaApi, codigo?, curso?) {
      const parametros: any = {};
      parametros.codigo = codigo;
      parametros.curso = curso;
      parametros.tipos = [];

      console.log(tipos);
      console.log(rutas);

      // Genero tipos
      for ( let tipo of tipos ) {
         switch ( tipo ) {
            case 'imagen': parametros.tipos.push(0); break;
            case 'video': parametros.tipos.push(1); break;
            case 'audio': parametros.tipos.push(2); break;
            case 'documento': parametros.tipos.push(3); break;
            default: parametros.tipos.push(tipo); break;
         }
      }

      // Genero nombres
      const nombres = [];
      for ( let ruta of rutas ) {
         ruta = ruta.replace(/ /g, '%20');
         nombres.push(ruta.split('/').pop().split('?')[0]);
      }

      // Subo los archivos
      this.nativeHttp.uploadFile(this.API + rutaApi, {
         codigo: String(parametros.codigo),
         curso: String(parametros.curso),
         tipos: JSON.stringify(parametros.tipos)
      }, {}, rutas, nombres)
      .then(data => {
         console.log(data);

         console.log(data.status);
         console.log(data.data); // data received by server
         console.log(data.headers);

         this._archivoSubido.next(data);

      })
      .catch(error => {
         console.log(error);

         console.log(error.status);
         console.log(error.error); // error message as string
         console.log(error.headers);

         this._archivoSubido.next(error);
      });
   }

   adjuntoCamara() {
      // @ts-ignore
      if ( device.platform === "iOS" ) { 
         const cameraOptions: CameraOptions = {
            quality: 100,
            destinationType: this.camera.DestinationType.FILE_URI,
            encodingType: this.camera.EncodingType.JPEG,
            sourceType: this.camera.PictureSourceType.CAMERA,
            mediaType: this.camera.MediaType.PICTURE
         };

         this.camera.getPicture(cameraOptions).then(
            (data) => {
               console.log(data);

               data = data.replace("/private", "file://");

               const tempFilename = data.substr(data.lastIndexOf('/') + 1);
               const tempBaseFilesystemPath = data.substr(0, data.lastIndexOf('/') + 1);
               const newBaseFilesystemPath = this.file.dataDirectory;

               this.file.copyFile(tempBaseFilesystemPath, tempFilename, newBaseFilesystemPath, tempFilename)
               .then(
                  (f) => {
                     const storedPhoto = newBaseFilesystemPath + tempFilename;
                     const displayImage = this.webview.convertFileSrc(storedPhoto);
                     const safeImg = this.domSanitizer.bypassSecurityTrustResourceUrl(displayImage);

                     const file = safeImg;

                     this._archivo.next({'tipo': 'imagen', 'adjunto': file, 'fullPath': storedPhoto, 'local': true});
                  },
                  (err) => console.error(err)
               );
            },
            (err) => console.error(err)
         );

      } else {
         const options: CaptureImageOptions = { limit: 1 };
         this.mediaCapture.captureImage(options)
         .then(
            (data) => {
               const safeImg = this.domSanitizer.bypassSecurityTrustUrl(this.webview.convertFileSrc(data[0].fullPath));
               const file = safeImg;
               this._archivo.next({'tipo': 'imagen', 'adjunto': file, 'fullPath': data[0].fullPath, 'local': true});
            },
            (err) => {
               console.log(err);
            }
         );
      }
   }
   adjuntoVideo() {
      const options: CaptureImageOptions = { limit: 1 };
      this.mediaCapture.captureVideo(options)
      .then(
         (data) => {
            data[0].fullPath = data[0].fullPath.replace("/private", "file://");
            const safeImg = this.domSanitizer.bypassSecurityTrustUrl(this.webview.convertFileSrc(data[0].fullPath));
            const file = safeImg;
            this._archivo.next({'tipo': 'video', 'adjunto': file, 'fullPath': data[0].fullPath, 'local': true});
         },
         (err) => console.error(err)
      );
   }
   adjuntoGaleria() {
      const cameraOptions: CameraOptions = {
         quality: 100,
         destinationType: this.camera.DestinationType.FILE_URI,
         encodingType: this.camera.EncodingType.JPEG,
         sourceType: this.camera.PictureSourceType.PHOTOLIBRARY,
         mediaType: this.camera.MediaType.PICTURE
      };

      // @ts-ignore
      if ( device.platform === "iOS" ) { 
         this.camera.getPicture(cameraOptions).then(
            (data) => {
               console.log(data);

               data = data.replace("/private", "file://");

               const extension = data.substr( (data.lastIndexOf('.') + 1) );

               const tempFilename = data.substr(data.lastIndexOf('/') + 1);
               const tempBaseFilesystemPath = data.substr(0, data.lastIndexOf('/') + 1);
               const newBaseFilesystemPath = this.file.dataDirectory;

               this.file.copyFile(tempBaseFilesystemPath, tempFilename, newBaseFilesystemPath, tempFilename)
               .then(
                  (f) => {
                     const storedPhoto = newBaseFilesystemPath + tempFilename;
                     const displayImage = this.webview.convertFileSrc(storedPhoto);
                     const safeImg = this.domSanitizer.bypassSecurityTrustResourceUrl(displayImage);

                     const file = safeImg;

                     switch (extension) {
                        case 'jpg':
                        case 'JPG':
                        case 'png':
                        case 'PNG':
                        case 'gif':
                        case 'GIF':
                        case 'jpeg':
                        case 'JPEG':
                           this._archivo.next({'tipo': 'imagen', 'adjunto': file, 'fullPath': storedPhoto, 'local': true});
                        break;
                        case 'mp4':
                        case 'MP4':
                        case 'mov':
                        case 'MOV':
                           this._archivo.next({'tipo': 'video', 'adjunto': file, 'fullPath': storedPhoto, 'local': true});
                        break;
                     }
                  },
                  (err) => console.error(err)
               );
            },
            (err) => console.error(err)
         );
      } else {
         this.camera.getPicture(cameraOptions).then(
            (data) => {
               // Concateno file:// si no viene
               data.substring(0, 7) !== 'file://' ? data = 'file://' + data : null;

               console.log(data);

               let extension = data.substr( (data.lastIndexOf('.') + 1) );
               extension = extension.split('?')[0];

               const displayImage = this.webview.convertFileSrc(data);
               const safeImg = this.domSanitizer.bypassSecurityTrustUrl(displayImage);

               const file = safeImg;

               switch (extension) {
                  case 'JPG':
                  case 'jpg':
                  case 'png':
                  case 'PNG':
                  case 'gif':
                  case 'GIF':
                  case 'jpeg':
                  case 'JPEG':
                     this._archivo.next({'tipo': 'imagen', 'adjunto': file, 'fullPath': data, 'local': true});
                  break;
                  case 'mp4':
                  case 'MP4':
                     this._archivo.next({'tipo': 'video', 'adjunto': file, 'fullPath': data, 'local': true});
                  break;
                  default:
                     this._archivo.next({'tipo': 'documento', 'adjunto': file, 'fullPath': data, 'local': true});
                  break;
               }
            },
            (err) => console.error(err)
         );
      }
   }
   adjuntoDocumento() {
      // @ts-ignore
      if ( device.platform === "iOS" ) {
         this.filePicker.pickFile()
         .then(data => {
            console.log(data);

            data = data.replace("/private", "file://");
            data = data.replace(/ /g, '%20');

            const safeImg = this.domSanitizer.bypassSecurityTrustUrl(this.webview.convertFileSrc(data));
            const file = safeImg;
            this._archivo.next({'tipo': 'documento', 'adjunto': file, 'fullPath': data, 'local': true});
         })
         .catch(err => console.log('Error', err));
      } else {

         this.fileChooser.open()
         .then(data => {
            console.log(data);

            data = data.replace(/ /g, '%20');

            this.filePath.resolveNativePath(data)
            .then(filePath => {
               console.log(filePath);

               let extension = filePath.substr( (filePath.lastIndexOf('.') + 1) );
               extension = extension.split('?')[0];

               const displayImage = this.webview.convertFileSrc(filePath);
               const safeImg = this.domSanitizer.bypassSecurityTrustUrl(displayImage);

               // @ts-ignore
               const file = safeImg.changingThisBreaksApplicationSecurity !== undefined ? safeImg.changingThisBreaksApplicationSecurity : safeImg;

               switch (extension) {
                  case 'JPG':
                  case 'jpg':
                  case 'png':
                  case 'PNG':
                  case 'gif':
                  case 'GIF':
                  case 'jpeg':
                  case 'JPEG':
                     this._archivo.next({'tipo': 'imagen', 'adjunto': file, 'fullPath': filePath, 'local': true});
                  break;
                  case 'mp4':
                  case 'MP4':
                     this._archivo.next({'tipo': 'video', 'adjunto': file, 'fullPath': filePath, 'local': true});
                  break;
                  default:
                     this._archivo.next({'tipo': 'documento', 'adjunto': file, 'fullPath': filePath, 'local': true});
                  break;
               }
 
            })
            .catch(e => {
               console.log('File path error', e);
            })
         })
         .catch(e => console.log(e));
      }
   }

   imprimir( archivo ) {
      return this.http.post<any>(this.API + '/Imprimir/Imprimir/imprimir', {
         ruta: archivo,
         codigousuario: sessionStorage.getItem('userId')
      }, { withCredentials: true })
      .pipe(
         map(data => {
            return data;
         })
      );
   }
}
