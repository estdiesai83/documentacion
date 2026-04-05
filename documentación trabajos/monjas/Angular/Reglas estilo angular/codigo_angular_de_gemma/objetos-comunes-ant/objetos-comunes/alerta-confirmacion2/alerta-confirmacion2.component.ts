import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-alerta-confirmacion2',
  templateUrl: './alerta-confirmacion2.component.html',
  styleUrls: ['./alerta-confirmacion2.component.less']
})
export class AlertaConfirmacion2Component implements OnInit {
  @Input() texto1: any;
  @Input() textoboton: any;
  @Output() cerrar = new EventEmitter();
  @Output() confirmar = new EventEmitter();
  constructor() { }

  ngOnInit() {
  }

}
