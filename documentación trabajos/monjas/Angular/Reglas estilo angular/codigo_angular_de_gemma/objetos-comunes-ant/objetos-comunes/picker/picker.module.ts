import { PickerComponent } from './picker.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [PickerComponent],
  exports: [PickerComponent]
})
export class PickerModule { }
