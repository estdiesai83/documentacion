import { Component, OnInit, OnDestroy, Input, Output, EventEmitter, ChangeDetectorRef } from '@angular/core';
import { PostitService } from '../postit.service';

@Component({
  selector: 'app-post',
  templateUrl: './post.component.html',
  styleUrls: ['./post.component.less']
})
export class PostComponent implements OnInit, OnDestroy {
   @Input() sitio;

   texto: string;
   sub: any = {};
   estado: any = {};
   estadofoco: boolean;
   quienes: boolean;
   resultado: number;
   validado;
   cursor: boolean;
   MAX_CARACTERES = 140;

   constructor( 
      private servicePost: PostitService,
      private cdRef: ChangeDetectorRef ) {
   }

   ngOnInit() {
      if ( this.sitio !== undefined) {
         this.cursor = false;
         document.getElementById('txt_textarea_post_postit_teho').focus();
      } else {
         this.cursor = true;
      }
      this.resultado = this.MAX_CARACTERES;
      this.sub.leerEstadoFoco = this.servicePost.leerFocoTextarea.subscribe(valor => {
         this.leerEstadoFoco();
      });

      this.sub.fLimpiarQue = this.servicePost.fLimpiarQue.subscribe(valor => {
         this.texto = '';
         this.estado.caracteresrojo = false;
         this.estado.caracteresparapedeo = false;
         this.resultado = this.MAX_CARACTERES;
         this.servicePost.setQue(this.texto);
         this.validado = false;
      });

      this.sub.fValidarQue = this.servicePost.fValidarQue.subscribe(valor => {
         // this.cogerTexto();
      });

      this.sub.caracteresrojo = this.servicePost.estadoFocoRojo.subscribe(valor => this.estado.caracteresrojo = valor);
      this.sub.caracteresparapedeo = this.servicePost.estadoFocoParpadeo.subscribe(valor => this.estado.caracteresparapedeo = valor);
      this.sub.que = this.servicePost.vQue.subscribe(
         texto => {
            this.texto = texto;
            // this.cdRef.detectChanges();
         }
      );
      this.sub.vQuienes = this.servicePost.vQuienes.subscribe(quienes => {
         if (quienes.length) {
            this.quienes = true;
            this.validado = false;
         }
         else {
            this.quienes = false;
         }
      });
   }

   ngOnDestroy() {
      this.sub.caracteresrojo.unsubscribe();
      this.sub.caracteresparapedeo.unsubscribe();
      this.sub.leerEstadoFoco.unsubscribe();
      this.sub.fLimpiarQue.unsubscribe();
      this.sub.fValidarQue.unsubscribe();
      this.sub.que.unsubscribe();
      this.sub.vQuienes.unsubscribe();
   }

   calcularCaracteresRestantes($event) {
   

      this.validado = false;
      this.resultado = this.MAX_CARACTERES - $event.srcElement.textLength;
      console.log(this.resultado);
      // if ( this.resultado <140 ){
      //    this.validado = true;
      // } else {
      //    this.validado = false;
      // }
      if (this.resultado <= 30 && this.resultado > 5) {
         this.estado.caracteresrojo = false;
         this.estado.caracteresparapedeo = true;
      } else if ( this.resultado <= 5 ) {
         this.estado.caracteresrojo = true;
         this.estado.caracteresparapedeo = false;
      } else {
         this.estado.caracteresrojo = false;
         this.estado.caracteresparapedeo = false;
      }
   }

   leerEstadoTexto(valor) {
      this.texto = valor.texto;
      this.resultado = valor.resultado;
   }

   leerEstadoFoco() {
      document.getElementById('txt_textarea_post_postit_teho').focus();
   }

   cogerTexto() {
      this.servicePost.setQue(this.texto);

      // if ( this.texto !== '' && this.texto !== null && this.texto !== undefined ) {
         this.servicePost.validarQue();
         this.validado = true;
      // }
   }

   establecerFoco(estado) {
      this.estadofoco = estado;
      this.servicePost.mostrarAlerta(false);

      // if ( !estado ) {
      //    this.cogerTexto();
      // }
   }
}
