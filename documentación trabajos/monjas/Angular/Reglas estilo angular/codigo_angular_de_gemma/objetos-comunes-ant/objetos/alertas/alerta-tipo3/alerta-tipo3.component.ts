import { Component, OnInit, Input, Output, EventEmitter, AfterViewInit, ChangeDetectorRef } from '@angular/core';
import { AlertService } from '@app/utils/alert/alert.service';

@Component({
  selector: 'app-alerta-tipo3',
  templateUrl: './alerta-tipo3.component.html',
  styleUrls: ['./alerta-tipo3.component.less']
})
export class AlertaTipo3Component implements OnInit, AfterViewInit {

   @Input() texto;
   @Input() botontexto;
   @Input() mostrarboton = true;

   @Output() eventobotonalerta = new EventEmitter();
   @Output() eventobotoncerrar = new EventEmitter();
   @Output() eventoclickfuera = new EventEmitter();

   show: boolean;

   constructor( private cdRef: ChangeDetectorRef, private servicioAlerta: AlertService ) { }

   ngOnInit() {
   }

   ngAfterViewInit(): void {
      setTimeout(() => {
         this.show = true;
         this.cdRef.detectChanges();
      }, 50);
   }

   onClickedOutside() {
      if ( this.show ) {
         this.eventoclickfuera.emit();
         this.cerrarAlerta();
      }
   }

   aceptarAlerta() {
      this.servicioAlerta.emitirEvento(2);
      this.eventobotonalerta.emit();      
   }

   cerrarAlerta() {
      this.servicioAlerta.emitirEvento(0);
      this.eventobotoncerrar.emit();
   }
}
