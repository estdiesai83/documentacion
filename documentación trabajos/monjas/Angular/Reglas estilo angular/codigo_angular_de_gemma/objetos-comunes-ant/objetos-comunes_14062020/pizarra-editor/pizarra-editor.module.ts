import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { PizarraEditorComponent } from './pizarra-editor.component';
import { GaleriaModule } from '@app/objetos-comunes/galeria/galeria.module';

@NgModule({
   declarations: [ PizarraEditorComponent ],
   imports: [ CommonModule, FormsModule, GaleriaModule ],
   exports: [ PizarraEditorComponent ]
})
export class PizarraEditorModule { }
