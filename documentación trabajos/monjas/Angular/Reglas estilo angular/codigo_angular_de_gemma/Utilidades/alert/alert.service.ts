import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AlertService {

   private alerta_abierta = false;

   private _alerta = new BehaviorSubject({});
   alerta = this._alerta.asObservable();

   private _eventoAlerta = new Subject();
   eventoAlerta = this._eventoAlerta.asObservable();

   constructor() { }

   mostrarAlerta(tipo: number, datos: any) {
      this._alerta.next({'tipo': tipo, 'datos': datos});
   }

   /*
    * 0 -> cerrar
    * 1 -> outside
    * 2 -> aceptar
    * 3 -> cancelar
    */

   emitirEvento( event ) {
      this._eventoAlerta.next(event);
   }

   setEstadoAlerta(estado) {
      this.alerta_abierta = estado;
   }
   getEstadoAlerta() {
      return this.alerta_abierta;
   }
}
