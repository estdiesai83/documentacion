import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { PizarraComponent } from './pizarra.component';
import { GaleriaModule } from '@app/objetos-comunes/galeria/galeria.module';

import { MatInputModule } from '@angular/material';
import { MatFormFieldModule } from '@angular/material/form-field';

@NgModule({
   declarations: [ PizarraComponent ],
   imports: [ 
      CommonModule, 
      FormsModule, 
      GaleriaModule, 
      MatInputModule,
      MatFormFieldModule 
   ],
   exports: [ PizarraComponent ]
})
export class PizarraModule { }
