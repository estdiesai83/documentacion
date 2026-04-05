import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

import { Globals } from '@app/globals';

@Injectable({
   providedIn: 'root'
})
export class DesplegableService {

   private API = Globals.BASE_API_URL;

   private _desplegar  = new Subject();
   desplegar = this._desplegar.asObservable();

   private _cerrar  = new Subject();
   cerrar = this._cerrar.asObservable();

   constructor(
   ) { }

   desplegarMenu(datos) {
      this._desplegar.next(datos);
   }
   cerrarVistas(datos) {
      this._cerrar.next(datos);
   }
}
