import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NotificacionComponent } from './notificacion.component';

@NgModule({
   imports: [
      CommonModule
   ],
   declarations: [ NotificacionComponent ],
   exports: [ NotificacionComponent ]
})
export class NotificacionModule { }
