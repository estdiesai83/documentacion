import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MensajeriaComponent } from './mensajeria.component';

import { GaleriaModule } from '@app/objetos-comunes/galeria/galeria.module';

@NgModule({
   declarations: [ MensajeriaComponent ],
   imports: [
      CommonModule,
      GaleriaModule
   ],
   exports: [ MensajeriaComponent ]
})
export class MensajeriaModule { }
