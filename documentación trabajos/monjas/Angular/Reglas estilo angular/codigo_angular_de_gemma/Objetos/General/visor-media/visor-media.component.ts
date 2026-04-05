import { Component, OnInit, Input, Output, EventEmitter,ChangeDetectorRef, ViewChild, ElementRef } from '@angular/core';
import { BarraestadoService } from '@app/utils/barraestado/barraestado.service';
import { ScreenOrientation } from '@ionic-native/screen-orientation/ngx';

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

   @ViewChild('video') videoPlayer: ElementRef;

   video_playing: boolean = false;

   constructor( 
      private screenOrientation: ScreenOrientation,
      private barra: BarraestadoService,
      private cdRef: ChangeDetectorRef
      ) 
   { }

   ngOnInit() {
      this.screenOrientation.unlock();
      this.cdRef.detectChanges();

      if ( this.tipo === 0 ) {
         if ( !this.imgComprimido ) {
            this.archivo = this.archivo ;
         } else {
            this.archivo = this.archivo + '.comp';
         }
      }

      setTimeout(() => {
         this.barra.establecerBarraEstiloPersonal(true, '#141414');
      }, 400);
      window.addEventListener("orientationchange", () => this.arregloOrientacion());

   }

   ngOnDestroy() {
      window.removeEventListener("orientationchange", () => this.arregloOrientacion());

      this.screenOrientation.lock(this.screenOrientation.ORIENTATIONS.PORTRAIT);
   }
   playPauseVideo($event) {
      console.log($event);

      if ( !this.video_playing ) {
         this.video_playing = true;
         // @ts-ignore
         device.platform === "iOS" ? this.videoPlayer.nativeElement.play() : $event.path[0].play();
      } else {
         this.video_playing = false;
         // @ts-ignore
         device.platform === "iOS" ? this.videoPlayer.nativeElement.pause() : $event.path[0].pause();
      }
   }
   arregloOrientacion() {
      this.barra.arregloCambioOrientacion();
   }
}
