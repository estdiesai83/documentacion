import { CalendarioComponent } from './calendario.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatFormFieldModule, MatInputModule, MatSelectModule} from '@angular/material';
import { MatNativeDateModule, MatSliderModule, DateAdapter} from '@angular/material';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { IgxCalendarModule } from 'igniteui-angular';
import { ReactiveFormsModule } from '@angular/forms';
import { registerLocaleData } from '@angular/common';

import localeEs from '@angular/common/locales/es';

registerLocaleData(localeEs);

@NgModule({
   imports: [
      CommonModule, 
      FormsModule,
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
   declarations: [CalendarioComponent],
   exports: [CalendarioComponent]
})
export class CalendarioModule { }
