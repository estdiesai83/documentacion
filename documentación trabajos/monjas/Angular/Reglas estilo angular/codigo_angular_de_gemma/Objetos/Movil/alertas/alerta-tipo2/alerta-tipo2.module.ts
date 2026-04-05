import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AlertaTipo2Component } from './alerta-tipo2.component';
import { ClickOutsideModule } from 'ng4-click-outside';

@NgModule({
  imports: [
    CommonModule,
    ClickOutsideModule
  ],
  declarations: [ AlertaTipo2Component ],
  exports: [ AlertaTipo2Component ]
})
export class AlertaTipo2Module { }
