import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CalendarioGeneralComponent } from '@app/objetos-comunes/calendario-general/calendario-general.component';

import { PickerModule } from '@app/objetos-comunes/picker/picker.module';

@NgModule({
   imports: [
      CommonModule,
      PickerModule
   ],
   declarations: [CalendarioGeneralComponent], 
   exports: [CalendarioGeneralComponent]
})
export class CalendarioGeneralModule { }
