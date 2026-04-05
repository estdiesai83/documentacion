import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FiltrosComponent } from './filtros.component';

@NgModule({
  declarations: [
   FiltrosComponent
  ],
  imports: [
    CommonModule
   ],
   exports: [ FiltrosComponent ]
})
export class FiltrosModule { }
 