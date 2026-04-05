import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { BarraestadoService } from '@app/utils/barraestado/barraestado.service';

@Component({
   selector: 'app-visor-media',
   templateUrl: './visor-media.component.html',
   styleUrls: ['./visor-media.component.less']
})
export class VisorMediaComponent implements OnInit {

   @Input() tipo = 0;
   @Input() archivo;
   @Input() imgComprimido;
   @Output() eventoCerrar = new EventEmitter();

   video_playing: boolean = false;

   constructor( private barra: BarraestadoService ) { }

   ngOnInit() {
      if ( this.tipo === 0 ) {
         if ( !this.imgComprimido ) {
            this.archivo = this.archivo 
         } else {
            this.archivo = this.archivo + '.comp';
         }
      }

      setTimeout(() => {
         this.barra.establecerBarraEstiloPersonal(true, '#141414');
      }, 400);
   }

   playPauseVideo($event) {
      if ($event.path[0].paused) {
         $event.path[0].play();
         this.video_playing = true;
      } else {
         $event.path[0].pause();
         this.video_playing = false;
      }
   }

}
