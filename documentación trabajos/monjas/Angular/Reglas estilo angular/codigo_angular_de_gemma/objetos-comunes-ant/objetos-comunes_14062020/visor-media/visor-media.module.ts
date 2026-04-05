import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PinchZoomModule } from 'ngx-pinch-zoom';
import { FallimgModule } from '@app/utils/fallimg/fallimg.module';

import { VisorMediaComponent } from './visor-media.component';
 
@NgModule({
   declarations: [ VisorMediaComponent ],
   imports: [
      CommonModule,
      PinchZoomModule,
      FallimgModule
   ],
   exports: [ VisorMediaComponent ]
})
export class VisorMediaModule { }
