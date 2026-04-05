import { Component, OnInit } from '@angular/core';
import { AlertService } from './alert.service';

@Component({
   selector: 'app-alert',
   templateUrl: './alert.component.html',
   styleUrls: ['./alert.component.less']
})
export class AlertComponent implements OnInit {

   show: any = [];
   sub: any = [];

   constructor( private servicioAlerta: AlertService ) {}

   ngOnInit() {
      this.servicioAlerta.alerta.subscribe(valor => {
         // @ts-ignore
         if ( valor.tipo !== undefined ) {

            // @ts-ignore
            switch( valor.tipo ) {
               case 1:
               case 2:
               case 3:
                  // @ts-ignore
                  this.show.texto = valor.datos.texto; 
                  // @ts-ignore
                  this.show.botontexto = valor.datos.botontexto;
               break;
               case 4:
                  // @ts-ignore
                  this.show.texto = valor.datos.texto;
                  // @ts-ignore
                  this.show.botontextoaceptar = valor.datos.botontextoaceptar;
                  // @ts-ignore
                  this.show.botontextocancelar = valor.datos.botontextocancelar;
               break;
               case 5: 
                  // @ts-ignore
                  this.show.texto1 = valor.datos.texto1;
                  // @ts-ignore
                  this.show.texto2 = valor.datos.texto2;
                  // @ts-ignore
                  this.show.texto3 = valor.datos.texto3;
                  // @ts-ignore
                  this.show.botontextoaceptar = valor.datos.botontextoaceptar;
                  // @ts-ignore
                  this.show.botontextocancelar = valor.datos.botontextocancelar;
               break;
               case 6:
                  // @ts-ignore
                  this.show.texto = valor.datos.texto; 
                  // @ts-ignore
                  this.show.botontexto = valor.datos.botontexto;
                  // @ts-ignore
                  this.show.icono = valor.datos.icono;
               break;
            }

            // @ts-ignore
            this.show.alerta = valor.tipo;
            this.servicioAlerta.setEstadoAlerta(true);
         }
      });

      this.servicioAlerta.eventoAlerta.subscribe(event => {
         this.show.alerta = 0;
         this.servicioAlerta.setEstadoAlerta(false);
      });
   }

}
