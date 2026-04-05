import { CalendariomultipleComponent } from './calendario-multiple.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatFormFieldModule, MatInputModule, MatSelectModule} from '@angular/material';
import { MatNativeDateModule, MatSliderModule, DateAdapter} from '@angular/material';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { Btn1TextoModule } from '../../objetos/botones/texto/btn1-texto/btn1-texto.module';
import { IgxCalendarModule } from 'igniteui-angular';
import { ReactiveFormsModule } from '@angular/forms';
import { registerLocaleData } from '@angular/common';

import localeEs from '@angular/common/locales/es';

registerLocaleData(localeEs);

@NgModule({
   imports: [
      CommonModule, 
      FormsModule,
      Btn1TextoModule,
      MatFormFieldModule,
      MatInputModule,
      MatSelectModule,
      MatDatepickerModule,
      MatNativeDateModule ,
      MatCheckboxModule,
      BrowserAnimationsModule,
      IgxCalendarModule,
      ReactiveFormsModule
   ],
   providers: [  
      MatDatepickerModule,  
   ],
   declarations: [CalendariomultipleComponent],
   exports: [CalendariomultipleComponent]
})
export class CalendariomultipleModule { }
