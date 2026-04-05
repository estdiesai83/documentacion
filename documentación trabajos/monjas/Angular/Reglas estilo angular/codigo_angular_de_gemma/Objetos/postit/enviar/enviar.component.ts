import { Component, OnInit, OnDestroy, Input } from '@angular/core';
import { PostitService } from '../postit.service';
import { trigger , transition , animate , state , style } from '@angular/animations';
import { Globals } from '@app/globals';

@Component({
  selector: 'app-enviar',
  templateUrl: './enviar.component.html',
  styleUrls: ['./enviar.component.less'],
  animations: [
    trigger('slideInOut', [
      transition(':enter', [
        style({transform: 'translateY(100%)'}),
        animate('300ms ease-out', style({transform: 'translateY(0%)'}))
      ]),
    ])
  ]
})
export class EnviarComponent implements OnInit, OnDestroy {

   BASE_APP = Globals.BASE_APP_URL;

   texto;
   quienes: any = [];
   cuando: any = {};
   sub: any = {};
   puertas: boolean;
   flip: boolean;
   activo: boolean;

   constructor( private servicePost: PostitService ) {
   }

   ngOnInit() {
      this.activo = true;
      this.sub.vQue = this.servicePost.vQue.subscribe(texto => this.texto = texto);
      this.sub.vQuienes = this.servicePost.vQuienes.subscribe(quienes => {
         this.quienes = quienes;

         if (quienes.length) {
            this.activo = true;
         } else {
            this.activo = false;
         }
      });
      this.sub.vCuando = this.servicePost.vCuando.subscribe(cuando => this.cuando = cuando);

      this.sub.limpiarEnviar = this.servicePost.fLimpiarEnviar.subscribe(() => {
         this.flip = false;
         this.puertas = false;
         this.activo = false;
      });

      this.sub.realizarEnvio = this.servicePost.fRealizarEnvio.subscribe(() => {
         this.abrirPuertasEnvio();
      });

      this.sub.realizarEnvioSinDestinatarios = this.servicePost.fRealizarEnvioSinDestinatarios.subscribe(() => {
         console.log('aqui');
         this.abrirPuertasEnvioSinDestinatarios();
      });
   }
   ngOnDestroy() {
      this.sub.vQue.unsubscribe();
      this.sub.vQuienes.unsubscribe();
      this.sub.vCuando.unsubscribe();
      this.sub.limpiarEnviar.unsubscribe();
      this.sub.realizarEnvio.unsubscribe();
      this.sub.realizarEnvioSinDestinatarios.unsubscribe();
   }

   reutilizarEnvio() {
      this.flip = false;
      this.puertas = false;
      this.servicePost.deshabilitar(false);
   }

   abrirPuertasEnvio() {
      if (this.quienes.length) {
         this.servicePost.escribirEnvio(this.texto, this.quienes, this.cuando).subscribe();
         this.puertas = true;

         setTimeout(() => {
            this.flip = true;
            this.servicePost.deshabilitar(true);
         }, 1000);
      } else {
         this.servicePost.mostrarAlerta(true);
      }
   }

   abrirPuertasEnvioSinDestinatarios() {
      this.servicePost.escribirEnvio(this.texto, null, this.cuando).subscribe();
      this.puertas = true;

      setTimeout(() => {
         this.flip = true;
         this.servicePost.deshabilitar(true);
      }, 1000);
   }

}
