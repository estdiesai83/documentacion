import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ItemPickerComponent } from './item-picker.component';

@NgModule({
   declarations: [ ItemPickerComponent ],
   imports: [
      CommonModule
   ],
   exports: [ ItemPickerComponent ]
})
export class ItemPickerModule { }
