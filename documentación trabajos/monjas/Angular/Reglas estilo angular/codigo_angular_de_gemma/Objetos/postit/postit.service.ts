import { Globals } from '@app/globals';
import { GlobalsEdit } from '@app/globals';

import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Subject } from 'rxjs';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class PostitService {
   private API = Globals.BASE_API_URL;

   constructor( private http: HttpClient ) { }

   private _vQue = new BehaviorSubject<string>('');
   vQue = this._vQue.asObservable();

   private _vQuienes = new BehaviorSubject<any>([]);
   vQuienes = this._vQuienes.asObservable();

   private _vCuando = new BehaviorSubject<any>({});
   vCuando = this._vCuando.asObservable();

   private _fLimpiarQue = new Subject();
   fLimpiarQue = this._fLimpiarQue.asObservable();

   private _fValidarQue = new Subject();
   fValidarQue = this._fValidarQue.asObservable();

   private _fLimpiarQuienes = new Subject();
   fLimpiarQuienes = this._fLimpiarQuienes.asObservable();

   private _fLimpiarCuando = new Subject();
   fLimpiarCuando = this._fLimpiarCuando.asObservable();

   private _fLimpiarEnviar = new Subject();
   fLimpiarEnviar = this._fLimpiarEnviar.asObservable();

   private _fRealizarEnvio = new Subject();
   fRealizarEnvio = this._fRealizarEnvio.asObservable();

   private _fRealizarEnvioSinDestinatarios = new Subject();
   fRealizarEnvioSinDestinatarios = this._fRealizarEnvioSinDestinatarios.asObservable();

   private _fDeshabilitar = new Subject();
   fDeshabilitar = this._fDeshabilitar.asObservable();

   private _fMostrarAlerta = new Subject();
   fMostrarAlerta = this._fMostrarAlerta.asObservable();

   private _abrirPuertas = new BehaviorSubject<boolean>(false);

   private _estadoFocoRojo = new BehaviorSubject<boolean>(false);
   private _estadoQuienes = new BehaviorSubject<boolean>(false);
   private _estadoFocoParpadeo = new BehaviorSubject<boolean>(false);
   private _estadoInfo = new BehaviorSubject<boolean>(false);
   private _estadoSeleccionadoPost = new BehaviorSubject<boolean>(false);

   private _girarPostit = new Subject();

   private _leerEstadoTexto = new Subject();
   private _leerFocoTextarea = new Subject();
   private _leerInfo = new Subject();

   estadoFocoRojo = this._estadoFocoRojo.asObservable();
   estadoQuienes = this._estadoQuienes.asObservable();
   estadoInfo = this._estadoInfo.asObservable();
   estadoFocoParpadeo = this._estadoFocoParpadeo.asObservable();
   estadoSeleccionadoPost = this._estadoSeleccionadoPost.asObservable();
   abrirPuertas = this._abrirPuertas.asObservable();
   leerEstadoTexto = this._leerEstadoTexto.asObservable();
   leerFocoTextarea = this._leerFocoTextarea.asObservable();
   leerInfo = this._leerInfo.asObservable();
   girarPostit = this._girarPostit.asObservable();

   setQue(que: string) {
      this._vQue.next(que);
   }

   setQuienes(quienes: any) {
      this._vQuienes.next(quienes);
   }

   setCuando(cuando: any) {
      this._vCuando.next(cuando);
   }

   limpiarQue() {
      this.setQue('');
      this._fLimpiarQue.next();
   }

   validarQue() {
      this._fValidarQue.next();
   }

   limpiarQuienes() {
      this.setQuienes([]);
      this._fLimpiarQuienes.next();
   }

   limpiarEnviar() {
      this._fLimpiarEnviar.next();
   }

   realizarEnvio() {
      this._fRealizarEnvio.next();
   }

   realizarEnvioSinDestinatarios() {
      this._fRealizarEnvioSinDestinatarios.next();
   }

   limpiarCuando() {
      this._fLimpiarCuando.next();
   }

   mostrarAlerta(estado) {
      this._fMostrarAlerta.next(estado);
   }

   nuevo() {
      this.limpiarQue();
      this.limpiarQuienes();
      this.limpiarEnviar();
      this.limpiarCuando();
      this.deshabilitar(false);
      this.mostrarAlerta(false);
   }
   nuevoSinQuienes() {
      this.limpiarQue();
      this.limpiarEnviar();
      this.limpiarCuando();
      this.deshabilitar(false);
      this.mostrarAlerta(false);
   }

   deshabilitar(estado) {
      this._fDeshabilitar.next(estado);
   }

   setestadoFocoRojo(estado: boolean) {
      this._estadoFocoRojo.next(estado);
   }

   setestadoQuienes(estado: boolean) {
      this._estadoQuienes.next(estado);
   }

   setestadoSeleccionadoPost(estado: boolean) {
      this._estadoSeleccionadoPost.next(estado);
   }

   setestadoInfo(estado: boolean) {
      this._estadoInfo.next(estado);
   }

   setestadoFocoParpadeo(estado: boolean) {
      this._estadoFocoParpadeo.next(estado);
   }

   setAbrirPuertas(estado: boolean) {
      this._abrirPuertas.next(estado);
   }

   cambiarEstado(tipo: Number) {
      switch (tipo) {
         case 0:
            this.setestadoFocoParpadeo(false);
            this.setestadoFocoRojo(false);
         break;
         case 1:
            this.setestadoFocoParpadeo(false);
            this.setestadoFocoRojo(true);
         break;
         case 2:
            this.setestadoFocoParpadeo(true);
            this.setestadoFocoRojo(false);
         break;
      }
   }

   fjleerTexto(valor) {
      this._leerEstadoTexto.next(valor);
   }

   fjActivarFocoTextarea() {
      this._leerFocoTextarea.next();
   }

   fjLeerInfo(valor) {
      this._leerInfo.next(valor);
   }

   fjgirarPostit(valor) {
      this._girarPostit.next(valor);
   }

   puertas (tipo: Number) {
      switch (tipo) {
         case 0:
            this.setAbrirPuertas(false);
         break;
         case 1:
            this.setAbrirPuertas(true);
         break;
      }
   }

   leerQuienDestinos() {
      return this.http.post<any>(this.API + '/Post/Post/leerQuienDestinos', { key: GlobalsEdit.API_KEY }, { withCredentials: true })
      .pipe(map(data => {
        return data;
      }));
   }

   leerPostEnviados() {
      return this.http.post<any>(this.API + '/Post/Post/leerHistoricoPost', { 
         emisor: localStorage.getItem('userId'),
         key: GlobalsEdit.API_KEY 
      }, { withCredentials: true })
      .pipe(map(data => {
         return data;
      }));
   }

   leerPostEnviadosFiltrado(dia_d, mes_d, anio_d, dia_h, mes_h, anio_h, usuarios) {
      return this.http.post<any>(this.API + '/Post/Post/leerPostFiltrado', {
         emisor: localStorage.getItem('userId'),
         dia_d: dia_d,
         mes_d: mes_d,
         anio_d: anio_d,
         dia_h: dia_h,
         mes_h: mes_h,
         anio_h: anio_h,
         usuarios: usuarios,
         key: GlobalsEdit.API_KEY
      }, { withCredentials: true })
      .pipe(map(data => {
         return data;
      }));
   }

   leerUsuariosDePost(ids: string) {
      return this.http.post<any>(this.API + '/Post/Post/leerUsuariosDePost', {
         ids: ids,
         key: GlobalsEdit.API_KEY
      }, { withCredentials: true })
      .pipe(map(data => {
         return data;
      }));
   }

   escribirEnvio(que: string, quien: any, cuando: any)  {
      if ( cuando === undefined || !Object.keys(cuando).length ) {
         return this.http.post<any>(this.API + '/Post/Post/escribirPostInmediato', {
            emisor: localStorage.getItem('userId'),
            receptores: quien,
            que: que,
            key: GlobalsEdit.API_KEY
         }, { withCredentials: true })
         .pipe(map(data => {}));
      } else {
         const dia = cuando.fecha.split('-')[2];
         const mes = cuando.fecha.split('-')[1];
         const anio = cuando.fecha.split('-')[0];
         const hora = cuando.hora.split(':')[0];
         const minuto = cuando.hora.split(':')[1];

         return this.http.post<any>(this.API + '/Post/Post/escribirPostProgramado', {
            emisor: localStorage.getItem('userId'),
            receptores: quien,
            que: que,
            dia: dia,
            mes: mes,
            anio: anio,
            hora: hora,
            minuto: minuto,
            key: GlobalsEdit.API_KEY
         }, { withCredentials: true })
         .pipe(map(data => {}));
      }
   }

   eliminarPost(ids: string)  {
      return this.http.post<any>(this.API + '/Post/Post/eliminarPostHistorico', {
         ids: ids,
         key: GlobalsEdit.API_KEY
      }, { withCredentials: true })
      .pipe(map(data => {})).subscribe();
   }

   desactivarPostHistorico(ids: string)  {
      return this.http.post<any>(this.API + '/Post/Post/desactivarPostHistorico', {
         ids: ids,
         key: GlobalsEdit.API_KEY
      }, { withCredentials: true })
      .pipe(map(data => {
         return data; }
      ));
   }

   activarPostHistorico(ids: string)  {
      return this.http.post<any>(this.API + '/Post/Post/activarPostHistorico', {
         ids: ids,
         key: GlobalsEdit.API_KEY
      }, { withCredentials: true })
      .pipe(map(data => {
         return data; }
      ));
   }

   leerHistoricoProceso(id: string) {
      return this.http.post<any>(this.API + '/Post/Post/leerHistoricoProceso', {
         id: id,
         key: GlobalsEdit.API_KEY
      }, { withCredentials: true })
      .pipe(map(data => {
         return data; }
      ));
   }
}
