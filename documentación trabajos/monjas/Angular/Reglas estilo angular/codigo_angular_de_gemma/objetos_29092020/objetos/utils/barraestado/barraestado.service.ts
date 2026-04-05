import { Injectable } from '@angular/core';
import { Globals } from '@app/globals';
import { GlobalsEdit } from '@app/globals';
import { StatusBar } from '@ionic-native/status-bar';

@Injectable({
  providedIn: 'root'
})
export class BarraestadoService {

   constructor( private statusBar: StatusBar ) { }

   establecerBarraEstiloDefecto() {
      this.statusBar.overlaysWebView(false);
      this.statusBar.styleDefault();
      this.statusBar.backgroundColorByHexString("#F5F5F5");
   }

   establecerBarraEstiloPersonal(light: boolean, color: string) {
      this.statusBar.overlaysWebView(false);
      if ( light ) {
         this.statusBar.styleLightContent();
      } else {
         this.statusBar.styleDefault();
      }
      this.statusBar.backgroundColorByHexString(color);
   }

   arregloViewport() {
      this.statusBar.hide();
      this.statusBar.show();
   }
   arregloCambioOrientacion() {
      this.statusBar.show();
      this.statusBar.hide();
   }
}
