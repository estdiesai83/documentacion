import { Component, OnInit, OnDestroy, Input, Output, EventEmitter } from '@angular/core';
import { PostitService } from '../postit.service';

@Component({
  selector: 'app-que',
  templateUrl: './que.component.html',
  styleUrls: ['./que.component.less']
})
export class QueComponent implements OnInit , OnDestroy {

   texto: string;
   sub: any = {};

   constructor( private servicePost: PostitService ) { }

   ngOnInit() {
      this.sub.que = this.servicePost.vQue.subscribe(texto => this.texto = texto);
   }
   ngOnDestroy() {
      this.sub.que.unsubscribe();
   }

   vaciarTexto() {
      this.servicePost.limpiarQue();
      this.texto = '';
      this.servicePost.mostrarAlerta(false);

   }

   activarFocoTextarea() {
      this.servicePost.fjActivarFocoTextarea();
      this.servicePost.mostrarAlerta(false);
   }
}
