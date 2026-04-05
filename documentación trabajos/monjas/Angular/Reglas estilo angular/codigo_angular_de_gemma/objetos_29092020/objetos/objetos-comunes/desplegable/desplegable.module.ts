import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DesplegableComponent } from './desplegable.component';
import { ClickOutsideModule } from 'ng4-click-outside';

@NgModule({
  declarations: [
     DesplegableComponent
  ],
  imports: [
    CommonModule,
   ClickOutsideModule,
  ],
  exports: [ DesplegableComponent ]
})
export class DesplegableModule { }

