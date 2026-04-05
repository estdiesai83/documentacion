import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
   selector: 'app-clave',
   templateUrl: './clave.component.html',
   styleUrls: ['./clave.component.less']
})
export class ClaveComponent implements OnInit {
   clave: string;
   alerta: number;
   @Output() cerrar = new EventEmitter();
   @Output() enviar = new EventEmitter();
   constructor() { }

   ngOnInit() {
      this.clave = '';
      this.alerta = 0;
   }

   pulsarDigito(digito) {
      if (digito === 'limpiar') {
         this.limpiarClave();
      } else  if (digito === 'salir') {
         this.cerrarAlerta();
      } else {
         this.clave  = this.clave + digito;
         if (this.clave.length === 4) {
            this.enviar.emit(this.clave);
         }
      }
   }

   cerrarAlerta() {
      this.clave = '';
      this.cerrar.emit();
   }

   limpiarClave() {
      this.alerta = 0;
      this.clave = '';
   }
}
