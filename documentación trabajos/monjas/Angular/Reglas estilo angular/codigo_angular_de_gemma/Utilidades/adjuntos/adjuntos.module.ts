import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AdjuntosComponent } from './adjuntos.component';
import { ClickOutsideModule } from 'ng4-click-outside';
import { VisorMediaModule } from '@app/objetos-comunes/visor-media/visor-media.module';

@NgModule({
   declarations: [ AdjuntosComponent ],
   imports: [
      CommonModule,
      ClickOutsideModule,
      VisorMediaModule
   ],
   exports: [ AdjuntosComponent ]
})
export class AdjuntosModule { }
