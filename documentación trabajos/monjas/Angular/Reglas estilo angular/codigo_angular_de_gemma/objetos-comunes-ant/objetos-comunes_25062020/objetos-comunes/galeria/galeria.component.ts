import { Component, OnInit, Input } from '@angular/core';
import { AdjuntosService } from '@app/utils/adjuntos/adjuntos.service';
import { Globals } from '@app/globals';

@Component({
   selector: 'app-galeria',
   templateUrl: './galeria.component.html',
   styleUrls: ['./galeria.component.less']
})
export class GaleriaComponent implements OnInit {

   @Input() adjuntos;
   @Input() eliminable = false;
   @Input() imprimible = false;
   @Input() descargable = false;
   @Input() readonly = false;

   BASE_FILE = Globals.BASE_FILE_URL;

   constructor( private servicioAdjuntos: AdjuntosService ) { }

   ngOnInit() { }

   mostrarOpciones($event, item, itemIndex) {
      this.servicioAdjuntos.desplegarMenu({
         'clickEvent': $event, 
         'adjunto': item, 
         'eliminable': this.eliminable,
         'imprimible': this.imprimible,
         'descargable': this.descargable,
      });
   }
   cerrarOpciones(){
      this.servicioAdjuntos.cerrarVistas(1);
   }
}
