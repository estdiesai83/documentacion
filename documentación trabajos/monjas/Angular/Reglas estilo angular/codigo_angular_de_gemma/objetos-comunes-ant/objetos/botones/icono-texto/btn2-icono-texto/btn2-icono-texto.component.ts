import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-btn2-icono-texto',
  templateUrl: './btn2-icono-texto.component.html',
  styleUrls: ['./btn2-icono-texto.component.less']
})
export class Btn2IconoTextoComponent implements OnInit {
  @Input() icono;
  @Input() texto;
  @Output() eventobotonvolver = new EventEmitter();
  constructor() { }

  ngOnInit() {
  }

  activarBoton() {
    this.eventobotonvolver.emit(1);
  }

}
