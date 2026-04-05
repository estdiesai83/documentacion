import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PizarraComponent } from './pizarra.component';
import { FormsModule } from '@angular/forms';
import { AlertaConfirmacion2Module } from '@app/objetos-comunes/alerta-confirmacion2/alerta-confirmacion2.module';
@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    AlertaConfirmacion2Module
  ],
  declarations: [PizarraComponent],
  exports: [PizarraComponent]
})
export class PizarraModule { }
