import { Component, OnInit, Input, Output , EventEmitter} from '@angular/core';
import { trigger, transition, style, animate } from '@angular/animations';

export enum OpcionTipo {Peticion, Cambio, Especial, Confirmada, Anulada, Nota}
export enum OpcionFecha {Fija, Rango, Mes}


@Component({
  selector: 'app-filtros',
  templateUrl: './filtros.component.html',
  styleUrls: ['./filtros.component.less'],
  animations: [
   trigger('inOutMenu', [
      transition(':enter', [
      style({transform: 'translateY(-20px)', opacity: '0'}),
         animate('300ms ease', style({transform: 'translateY(0)', opacity: '1'}))
      ]),
      transition(':leave', [
         animate('300ms ease', style({transform: 'translateY(-20px)', opacity: '0'}))
      ])
   ]),
]
})
export class FiltrosComponent implements OnInit {
  
   seleccion_tipo: OpcionTipo;
   seleccion_fecha: OpcionFecha;

   texto;

   OpcionTipo = OpcionTipo;
   OpcionFecha = OpcionFecha;
   @Input() posicion_indicativo;
   @Input() con_buscar = true;
   @Input() con_tipo = true;
   @Input() con_fecha = true;
   @Output() eventoFiltro = new EventEmitter();

  constructor() { }

  ngOnInit() {
  }
   seleccionarTipo(opcion: OpcionTipo){
      console.log(opcion);
      this.seleccion_tipo = opcion;
   }
   seleccionarFecha(opcion: OpcionFecha){
      this.seleccion_fecha = opcion;
   }
   emitirFiltro() {
      this.eventoFiltro.emit({ texto: this.texto });
   }
}
