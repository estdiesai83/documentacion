import { Component, OnInit, Input, Output, EventEmitter, AfterViewInit, ChangeDetectorRef } from '@angular/core';
import { AlertService } from '@app/utils/alert/alert.service';

@Component({
  selector: 'app-alerta-tipo1',
  templateUrl: './alerta-tipo1.component.html',
  styleUrls: ['./alerta-tipo1.component.less']
})
export class AlertaTipo1Component implements OnInit, AfterViewInit {

   @Input() icono;
   @Input() texto;
   @Input() mostraralerta;
   @Input() botontexto;
   @Input() mostrarboton = true;

   @Output() eventobotonalerta  = new EventEmitter();

   show: boolean;

   constructor( 
     private cdRef: ChangeDetectorRef,
     private servicioAlerta: AlertService ) { }

   ngOnInit() {
   }

   ngAfterViewInit(): void {
      setTimeout(() => {
         this.show = true;
         this.cdRef.detectChanges();
      }, 50);
   }

   cerrarAlerta() {
      this.servicioAlerta.emitirEvento(2);
      this.eventobotonalerta.emit(0);
   }
}
