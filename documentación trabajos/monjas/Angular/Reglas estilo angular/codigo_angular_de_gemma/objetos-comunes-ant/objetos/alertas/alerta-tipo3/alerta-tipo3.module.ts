import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AlertaTipo3Component } from './alerta-tipo3.component';
import { ClickOutsideModule } from 'ng4-click-outside';

@NgModule({
  imports: [
    CommonModule,
    ClickOutsideModule
  ],
  declarations: [ AlertaTipo3Component ],
  exports: [ AlertaTipo3Component ]
})
export class AlertaTipo3Module { }
