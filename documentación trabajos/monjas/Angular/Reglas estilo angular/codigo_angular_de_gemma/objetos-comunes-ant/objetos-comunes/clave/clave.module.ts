import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ClaveComponent } from '@app/objetos-comunes/clave/clave.component';
@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [ClaveComponent],
  exports: [ClaveComponent]
})
export class ClaveModule { }
