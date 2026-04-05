import { Component, OnInit, Input } from '@angular/core';
import { Globals } from '@app/globals';

@Component({
   selector: 'app-cargando',
   templateUrl: './cargando.component.html',
   styleUrls: ['./cargando.component.less']
})
export class CargandoComponent implements OnInit {

   @Input() texto;

   BASE_APP = Globals.BASE_APP_URL;
   
   constructor() { }

   ngOnInit() {
   }

}
