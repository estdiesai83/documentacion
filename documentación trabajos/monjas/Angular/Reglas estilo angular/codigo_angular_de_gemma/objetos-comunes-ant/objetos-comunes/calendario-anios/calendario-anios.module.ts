import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CalendarioAniosComponent} from '@app/objetos-comunes/calendario-anios/calendario-anios.component';
@NgModule({
  imports: [
    CommonModule
  ],
  declarations: [CalendarioAniosComponent],
  exports: [CalendarioAniosComponent]
})
export class CalendarioAniosModule { }
