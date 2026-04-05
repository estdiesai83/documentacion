import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { PizarraComponent } from './pizarra.component';
import { GaleriaModule } from '@app/objetos-comunes/galeria/galeria.module';

@NgModule({
   declarations: [ PizarraComponent ],
   imports: [ CommonModule, FormsModule, GaleriaModule ],
   exports: [ PizarraComponent ]
})
export class PizarraModule { }
