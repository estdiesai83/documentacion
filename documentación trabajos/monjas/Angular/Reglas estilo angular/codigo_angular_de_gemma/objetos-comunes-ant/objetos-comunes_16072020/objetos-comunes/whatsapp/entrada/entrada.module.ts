import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { EntradaComponent } from './entrada.component';

@NgModule({
   declarations: [ EntradaComponent ],
   imports: [
      CommonModule,
      FormsModule
   ],
   exports: [ EntradaComponent ]
})
export class EntradaModule { }
