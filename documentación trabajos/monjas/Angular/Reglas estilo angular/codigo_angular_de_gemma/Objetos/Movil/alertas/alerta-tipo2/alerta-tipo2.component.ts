import { Component, OnInit, Input, Output, EventEmitter, AfterViewInit, ChangeDetectorRef } from '@angular/core';
import { AlertService } from '@app/utils/alert/alert.service';

@Component({
  selector: 'app-alerta-tipo2',
  templateUrl: './alerta-tipo2.component.html',
  styleUrls: ['./alerta-tipo2.component.less']
})
export class AlertaTipo2Component implements OnInit, AfterViewInit {

   @Input() icono;
   @Input() texto;
   @Input() mostraralerta;
   @Input() botontexto;
   @Input() mostrarboton = true;

   @Output() eventobotonalerta  = new EventEmitter();
   @Output() eventocerraralerta = new EventEmitter();

   show: boolean;

   constructor( 
      private cdRef: ChangeDetectorRef,
      private servicioAlerta: AlertService ) { }

   ngOnInit() {}

   ngAfterViewInit(): void {
      setTimeout(() => {
         this.show = true;
         this.cdRef.detectChanges();
      }, 50);
   }

   aceptarAlerta() {
      this.servicioAlerta.emitirEvento(2);
      this.eventobotonalerta.emit(0);      
   }

   cerrarAlerta() {
      this.servicioAlerta.emitirEvento(0);
      this.eventocerraralerta.emit();
   }

   onClickedOutside() {
      if ( this.show ) {
         this.servicioAlerta.emitirEvento(1);
         this.eventocerraralerta.emit();
      }
   }
}
