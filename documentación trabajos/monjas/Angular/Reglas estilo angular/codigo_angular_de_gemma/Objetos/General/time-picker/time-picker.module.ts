import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TimePickerComponent } from './time-picker.component';
import { ClickOutsideModule } from 'ng4-click-outside';

@NgModule({
   declarations: [ TimePickerComponent ],
   imports: [
      CommonModule,
      ClickOutsideModule
   ],
   exports: [ TimePickerComponent ]
})
export class TimePickerModule { }
