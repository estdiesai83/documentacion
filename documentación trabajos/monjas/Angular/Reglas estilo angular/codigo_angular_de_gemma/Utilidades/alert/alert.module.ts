import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AlertComponent } from './alert.component';

import { AlertaTipo1Module } from '@app/objetos/alertas/alerta-tipo1/alerta-tipo1.module';
import { AlertaTipo2Module } from '@app/objetos/alertas/alerta-tipo2/alerta-tipo2.module';
import { AlertaTipo3Module } from '@app/objetos/alertas/alerta-tipo3/alerta-tipo3.module';
import { AlertaTipo4Module } from '@app/objetos/alertas/alerta-tipo4/alerta-tipo4.module';
import { AlertaTipo5Module } from '@app/objetos/alertas/alerta-tipo5/alerta-tipo5.module';
import { AlertaTipo6Module } from '@app/objetos/alertas/alerta-tipo6/alerta-tipo6.module';

@NgModule({
   declarations: [ AlertComponent ],
   imports: [
      CommonModule,
      AlertaTipo1Module,
      AlertaTipo2Module,
      AlertaTipo3Module,
      AlertaTipo4Module,
      AlertaTipo5Module,
      AlertaTipo6Module
   ],
   exports: [ AlertComponent ]
})
export class AlertModule { }
