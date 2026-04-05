import { Component, OnInit, Output, EventEmitter, ChangeDetectorRef, ViewChild, ElementRef } from '@angular/core';
import { WhatsappService } from '../whatsapp.service';

@Component({
  selector: 'app-entrada',
  templateUrl: './entrada.component.html',
  styleUrls: ['./entrada.component.less']
})
export class EntradaComponent implements OnInit {

   @Output() otrosAdjuntos = new EventEmitter();
   @Output() camara = new EventEmitter();
   @Output() cambioHeight = new EventEmitter();
   @Output() envioTexto = new EventEmitter();
   @Output() startGrabacion = new EventEmitter();
   @Output() stopGrabacion = new EventEmitter();
   @Output() mostrarMail = new EventEmitter();

   @ViewChild('input', {static: false}) input: ElementRef;
   @ViewChild('contenidoEntrada', {static: false}) contenidoEntrada: ElementRef;

   input_text: string;
   grabando: boolean = false;

   sub: any = {};

   tiempoGrabado;

   constructor( private cdRef: ChangeDetectorRef, private servicioWhatsapp: WhatsappService ) { }

   ngOnInit() {
      this.sub.recordingTime = this.servicioWhatsapp.recordingTime.subscribe(data => {
         this.tiempoGrabado = data;
      });
   }
   ngOnDestroy() {
      this.sub.recordingTime.unsubscribe();
   }

   redimensionarTextarea() {
      if ( this.input_text !== '' ) {
         this.input.nativeElement.style.height = '1px';
         const lines = (this.input.nativeElement.scrollHeight - 20) / 20;

         if ( lines < 8 ) {
            const height = 20 + (Number(Math.floor(lines) * 20));
            this.input.nativeElement.style.height = height + 'px';
            this.contenidoEntrada.nativeElement.style.height = (height + 20) + 'px';
         } else {
            this.input.nativeElement.style.height = 'calc(100% - 10px)';
         }
      } else {
         this.input.nativeElement.style.height = '1px';
         this.input.nativeElement.style.height = '40px';
         this.contenidoEntrada.nativeElement.style.height = '60px';
      }

      this.cambioHeight.emit(this.contenidoEntrada.nativeElement.style.height);

      this.cdRef.detectChanges();
   }

   hayTexto() {
      return this.input_text !== undefined && this.input_text !== '';
   }

   enviar() {
      // Vuelvo a poner el focus en el teclado
      setTimeout(() => {
         this.input.nativeElement.focus();
      });
      this.refocus();

      this.envioTexto.emit(this.input_text);

      this.input_text = undefined;

      this.cdRef.detectChanges();
   }

   refocus() {
      this.input.nativeElement.focus();

      setTimeout(() => {
         this.input.nativeElement.focus();
      }, 1);
      setTimeout(() => {
         this.input.nativeElement.focus();
      }, 2);
      setTimeout(() => {
         this.input.nativeElement.focus();
      }, 5);
      setTimeout(() => {
         this.input.nativeElement.focus();
      }, 10);
   }

   startRecording() {
      if (!this.grabando) {
         this.grabando = true;

         this.startGrabacion.emit();
      }
   }
   stopRecording() {
      this.grabando = false;

      this.stopGrabacion.emit();
   }
}
