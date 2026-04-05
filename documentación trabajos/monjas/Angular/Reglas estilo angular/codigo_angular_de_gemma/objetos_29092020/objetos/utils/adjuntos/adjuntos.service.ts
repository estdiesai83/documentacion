import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Subject } from 'rxjs';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { map, tap } from 'rxjs/operators';

import { Globals } from '@app/globals';

import { IOSFilePicker } from '@ionic-native/file-picker';
import { ImagePicker, ImagePickerOptions } from '@ionic-native/image-picker';
import { FileChooser } from '@ionic-native/file-chooser';
import { FilePath } from '@ionic-native/file-path';
import { Camera, CameraOptions } from '@ionic-native/camera';
import { MediaCapture, CaptureImageOptions } from '@ionic-native/media-capture';
import { FileOpener } from '@ionic-native/file-opener';
import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
import { File } from '@ionic-native/file';

@Injectable({
   providedIn: 'root'
})
export class AdjuntosService {

   private API = Globals.BASE_API_URL;

   private visor_abierto = false;

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

   fileTransfer: FileTransferObject = this.transfer.create();

   constructor(
      private filePicker: IOSFilePicker,
      private fileChooser: FileChooser,
      private filePath: FilePath,
      private fileOpener: FileOpener,
      private file: File,
      private camera: Camera,
      private mediaCapture: MediaCapture,
      private imagePicker: ImagePicker,
      private transfer: FileTransfer,
      private http: HttpClient
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

   desplegarMenu(datos) {
      this._desplegar.next(datos);
   }
   cerrarVistas(datos) {
      this._cerrar.next(datos);
   }

   eliminarItem(item) {
      this._eliminar.next(item);
   }
   subirArchivo(codigo, curso, tipo, modulo, adjunto, rutaApi) {
      const parametros: any = {};
      parametros.modulo = modulo;
      parametros.codigo = codigo;
      parametros.curso = curso;
      
      switch ( tipo ) {
         case 'imagen': parametros.tipo = 0; break;
         case 'video': parametros.tipo = 1; break;
         case 'documento': parametros.tipo = 3; break;
         default: parametros.tipo = tipo; break;
      }

      const options: FileUploadOptions = {
         fileKey: 'userfile',
         // tslint:disable-next-line:max-line-length
         fileName: adjunto.split('/').pop().split('?')[0],
         params: parametros
      };

      this.fileTransfer.upload(adjunto, this.API + rutaApi, options)
      .then((data) => {
         console.log(data);
         this._archivoSubido.next(data);
      }, (err) => {
         console.log(err);
         this._archivoSubido.next(err);
      });
   }

   adjuntoCamara() {
      const options: CaptureImageOptions = { limit: 1 };
      this.mediaCapture.captureImage(options)
      .then(
         (data) => {
            this._archivo.next({'tipo': 'imagen', 'adjunto': data[0].fullPath, 'local': true});
         },
         (err) => console.error(err)
      );
   }
   adjuntoVideo() {
      const options: CaptureImageOptions = { limit: 1 };
      this.mediaCapture.captureVideo(options)
      .then(
         (data) => {
            this._archivo.next({'tipo': 'video', 'adjunto': data[0].fullPath, 'local': true});
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
               const extension = data.substr( (data.lastIndexOf('.') + 1) );

               switch (extension) {
                  case 'jpg':
                  case 'JPG':
                  case 'png':
                  case 'PNG':
                  case 'gif':
                  case 'GIF':
                  case 'jpeg':
                  case 'JPEG':
                     this._archivo.next({'tipo': 'imagen', 'adjunto': data, 'local': true});
                  break;
                  case 'mp4':
                  case 'MP4':
                  case 'mov':
                  case 'MOV':
                     this._archivo.next({'tipo': 'video', 'adjunto': data, 'local': true});
                  break;
               }
            },
            (err) => console.error(err)
         );
      } else {
         this.camera.getPicture(cameraOptions).then(
            (data) => {
               console.log(data);

               this.filePath.resolveNativePath(data)
               .then(filePath => {
                  console.log(filePath);

                  let extension = filePath.substr( (filePath.lastIndexOf('.') + 1) );
                  extension = extension.split('?')[0];

                  switch (extension) {
                     case 'JPG':
                     case 'jpg':
                     case 'png':
                     case 'PNG':
                     case 'gif':
                     case 'GIF':
                     case 'jpeg':
                     case 'JPEG':
                        this._archivo.next({'tipo': 'imagen', 'adjunto': filePath, 'local': true});
                     break;
                     case 'mp4':
                     case 'MP4':
                        this._archivo.next({'tipo': 'video', 'adjunto': filePath, 'local': true});
                     break;
                     default:
                        this._archivo.next({'tipo': 'documento', 'adjunto': filePath, 'local': true});
                     break;
                  }

               })
               .catch(e => {
                  console.log('File path error', e);
               })
            },
            (err) => console.error(err)
         );
      }
      //    const options: ImagePickerOptions = {
      //       maximumImagesCount: 1,
      //       quality: 100,
      //       outputType: 0
      //    };

      //    this.imagePicker.getPictures(options).then((results) => {
      //       console.log(results);

      //       for (let i = 0; i < results.length; i++) {
      //          const extension = results[i].substr( (results[i].lastIndexOf('.') + 1) );

      //          switch (extension) {
      //             case 'jpg':
      //             case 'JPG':
      //             case 'png':
      //             case 'PNG':
      //             case 'gif':
      //             case 'GIF':
      //             case 'jpeg':
      //             case 'JPEG':
      //                this._archivo.next({'tipo': 'imagen', 'adjunto': results[i], 'local': true});
      //             break;
      //             case 'mp4':
      //             case 'MP4':
      //             case 'mov':
      //             case 'MOV':
      //                this._archivo.next({'tipo': 'video', 'adjunto': results[i], 'local': true});
      //             break;
      //          }
      //       }
      //    }, (err) => { console.error(err) });
      // }
   }
   adjuntoDocumento() {
      // @ts-ignore
      if ( device.platform === "iOS" ) {
         this.filePicker.pickFile()
         .then(data => {
            console.log(data);

            let extension = data.substr( (data.lastIndexOf('.') + 1) );
            extension = extension.split('?')[0];

            switch (extension) {
               case 'JPG':
               case 'jpg':
               case 'png':
               case 'PNG':
               case 'gif':
               case 'GIF':
               case 'jpeg':
               case 'JPEG':
                  this._archivo.next({'tipo': 'imagen', 'adjunto': data, 'local': true});
               break;
               case 'mp4':
               case 'MP4':
                  this._archivo.next({'tipo': 'video', 'adjunto': data, 'local': true});
               break;
               default:
                  this._archivo.next({'tipo': 'documento', 'adjunto': data, 'local': true});
               break;
            }

         })
         .catch(err => console.log('Error', err));
      } else {

         this.fileChooser.open()
         .then(data => {
            console.log(data);

            this.filePath.resolveNativePath(data)
            .then(filePath => {
               console.log(filePath);

               let extension = filePath.substr( (filePath.lastIndexOf('.') + 1) );
               extension = extension.split('?')[0];

               switch (extension) {
                  case 'JPG':
                  case 'jpg':
                  case 'png':
                  case 'PNG':
                  case 'gif':
                  case 'GIF':
                  case 'jpeg':
                  case 'JPEG':
                     this._archivo.next({'tipo': 'imagen', 'adjunto': filePath, 'local': true});
                  break;
                  case 'mp4':
                  case 'MP4':
                     this._archivo.next({'tipo': 'video', 'adjunto': filePath, 'local': true});
                  break;
                  default:
                     this._archivo.next({'tipo': 'documento', 'adjunto': filePath, 'local': true});
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
         codigousuario: localStorage.getItem('userId')
      }, { withCredentials: true })
      .pipe(
         map(data => {
            return data;
         })
      );
   }
}
