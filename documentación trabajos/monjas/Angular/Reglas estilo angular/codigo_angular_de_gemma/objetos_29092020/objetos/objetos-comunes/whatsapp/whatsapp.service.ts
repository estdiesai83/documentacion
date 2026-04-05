import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { map } from 'rxjs/operators';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { File } from '@ionic-native/file';
import * as moment from 'moment';
import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
import { Media } from '@ionic-native/media';
import { Globals } from '@app/globals';

@Injectable({
   providedIn: 'root'
})
export class WhatsappService {

   private API = Globals.BASE_API_URL;

   private _recordingTime = new BehaviorSubject<string>('00:00');
   recordingTime = this._recordingTime.asObservable();

   private _audioGrabado  = new BehaviorSubject(undefined);
   audioGrabado = this._audioGrabado.asObservable();

   archivoGrabado: any;
   interval;
   startTime;
   nombreArchivo;

   fileTransfer: FileTransferObject = this.transfer.create();

   constructor(
      private http: HttpClient,
      private media: Media,
      private transfer: FileTransfer,
      private file: File
   ) { }

   setRecordedTime(time) {
      this._recordingTime.next(time);
   }
   startRecording() {
      // Tiempo de grabado
      this._recordingTime.next('00:00');

      // Genero nombre del archivo
      const date = new Date().valueOf();
      let text = '';
      const possibleText = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      for (let i = 0; i < 5; i++) {
         text += possibleText.charAt(Math.floor(Math.random() * possibleText.length));
      }
      // Replace extension according to your media type
      const audioName = date + '-' + text + '.mp3';

      this.nombreArchivo = audioName;

      this.file.createFile(this.file.externalApplicationStorageDirectory, audioName, true).then(() => {
         this.archivoGrabado = this.media.create(this.file.externalApplicationStorageDirectory + audioName);
         this.archivoGrabado.startRecord();

         this.startTime = moment();
         this.interval = setInterval(() => {
            const currentTime = moment();
            const diffTime = moment.duration(currentTime.diff(this.startTime));
            // const time = this.toString(diffTime.minutes()) + ':' + this.toString(diffTime.seconds());
            const time = diffTime.minutes().toString() + ':' + diffTime.seconds().toString();
            this.setRecordedTime(time);
         }, 1000);
      });
   }
   stopRecording(audio) {
      this.archivoGrabado.stopRecord();

      clearInterval(this.interval);

      const parametros: any = {};

      parametros.tipo = 5;

      const options: FileUploadOptions = {
         fileKey: 'userfile',
         // tslint:disable-next-line:max-line-length
         fileName: this.archivoGrabado._objectInstance.src.substring(this.archivoGrabado._objectInstance.src.lastIndexOf('/') + 1, this.archivoGrabado._objectInstance.src.length),
         params: parametros
      };

      this.fileTransfer.upload(this.archivoGrabado._objectInstance.src, this.API + '/Adjuntos/Adjuntos/subirArchivo', options)
      .then((data) => {
         console.log(data);
         this._audioGrabado.next({'id': audio.random_id, 'archivo': data.response});

      }, (err) => {
         console.log(err);
      });
   }
}
