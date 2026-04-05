import { Component, OnInit, Input, Output, EventEmitter, AfterViewInit, ChangeDetectorRef } from '@angular/core';
import { AlertService } from '@app/utils/alert/alert.service';

@Component({
  selector: 'app-alerta-tipo4',
  templateUrl: './alerta-tipo4.component.html',
  styleUrls: ['./alerta-tipo4.component.less']
})
export class AlertaTipo4Component implements OnInit, AfterViewInit {

   @Input() icono;
   @Input() texto;
   @Input() mostraralerta;
   @Input() botontextoaceptar;
   @Input() botontextocancelar;
   @Input() mostrarboton = true;

   @Output() eventobotonaceptar  = new EventEmitter();
   @Output() eventobotoncancelar  = new EventEmitter();

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
      this.eventobotonaceptar.emit();      
   }

   cerrarAlerta() {
      this.servicioAlerta.emitirEvento(0);
      this.eventobotoncancelar.emit();
   }
}
