import { CalendarioComponent } from './calendario.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@NgModule({
   imports: [
      CommonModule,
      FormsModule,
   ],
   declarations: [ CalendarioComponent], 
   exports: [CalendarioComponent]
})
export class CalendarioModule { }
