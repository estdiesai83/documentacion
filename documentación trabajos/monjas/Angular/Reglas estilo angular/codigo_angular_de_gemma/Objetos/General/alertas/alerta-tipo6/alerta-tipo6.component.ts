import { Component, OnInit, Input, Output, EventEmitter, AfterViewInit, ChangeDetectorRef } from '@angular/core';
import { AlertService } from '@app/utils/alert/alert.service';

@Component({
  selector: 'app-alerta-tipo6',
  templateUrl: './alerta-tipo6.component.html',
  styleUrls: ['./alerta-tipo6.component.less']
})
export class AlertaTipo6Component implements OnInit, AfterViewInit {

   @Input() icono;
   @Input() texto;
   @Input() mostraralerta;
   @Input() botontexto;
   @Input() mostrarboton = true;

   @Output() eventoboton  = new EventEmitter();

   show: boolean;

   constructor( 
      private cdRef: ChangeDetectorRef,
      private servicioAlerta: AlertService
   ) { }

   ngOnInit() {
   }

   ngAfterViewInit(): void {
      setTimeout(() => {
         this.show = true;
         this.cdRef.detectChanges();
      }, 50);
   }

   aceptarAlerta() {
      this.servicioAlerta.emitirEvento(2);
      this.eventoboton.emit();      
   }
   cerrarAlerta() {
      this.servicioAlerta.emitirEvento(0);
   }
}
