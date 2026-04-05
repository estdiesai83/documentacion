import { Component, OnInit, Input } from '@angular/core';

@Component({
   selector: 'app-notificacion',
   templateUrl: './notificacion.component.html',
   styleUrls: ['./notificacion.component.less']
})
export class NotificacionComponent implements OnInit {

   /*
    * 0 -> Aviso
    */
    
   @Input() tipo: number;
   @Input() titulo: string;
   @Input() resumen: string;
   // @Input() mensaje: string;
   @Input() fecha: string;

   constructor() { }

   ngOnInit() {
   }

}
