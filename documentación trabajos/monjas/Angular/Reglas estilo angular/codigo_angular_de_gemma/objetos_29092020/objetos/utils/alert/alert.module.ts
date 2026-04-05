import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AlertComponent } from './alert.component';

import { AlertaTipo3Module } from '@app/objetos/alertas/alerta-tipo3/alerta-tipo3.module';
import { AlertaTipo4Module } from '@app/objetos/alertas/alerta-tipo4/alerta-tipo4.module';
import { AlertaTipo5Module } from '@app/objetos/alertas/alerta-tipo5/alerta-tipo5.module';

@NgModule({
   declarations: [ AlertComponent ],
   imports: [
      CommonModule,
      AlertaTipo3Module,
      AlertaTipo4Module,
      AlertaTipo5Module
   ],
   exports: [ AlertComponent ]
})
export class AlertModule { }
