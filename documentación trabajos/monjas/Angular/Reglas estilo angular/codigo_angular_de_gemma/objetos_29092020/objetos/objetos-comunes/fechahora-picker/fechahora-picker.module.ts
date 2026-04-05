import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FechahoraPickerComponent } from './fechahora-picker.component';

import { CalendarioComponent } from './calendario/calendario.component';
import { IgxCalendarModule } from 'igniteui-angular';
import { TimePickerModule } from '@app/objetos-comunes/time-picker/time-picker.module';

@NgModule({
   declarations: [ FechahoraPickerComponent, CalendarioComponent ],
   imports: [
      CommonModule,
      IgxCalendarModule,
      TimePickerModule
   ],
   exports: [ FechahoraPickerComponent ]
})
export class FechahoraPickerModule { }
