import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MailComponent } from './mail.component';

import { GaleriaModule } from '@app/objetos-comunes/galeria/galeria.module';
import { PizarraModule } from '@app/objetos-comunes/pizarra/pizarra.module';

@NgModule({
   imports: [
      CommonModule,
      GaleriaModule,
      PizarraModule
   ],
   declarations: [ MailComponent ],
   exports: [ MailComponent ]
})
export class MailModule { }
