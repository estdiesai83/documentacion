import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
selector: 'app-alerta-error',
templateUrl: './alerta-error.component.html',
styleUrls: ['./alerta-error.component.less']
})
export class AlertaErrorComponent implements OnInit {
   @Output() cerrar = new EventEmitter();
   constructor() { }

   ngOnInit() {
   }

}
