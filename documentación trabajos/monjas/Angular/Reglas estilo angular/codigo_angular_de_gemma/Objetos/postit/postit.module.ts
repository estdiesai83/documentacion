import { AlertaTipo4Module } from './../../objetos/alertas/alerta-tipo4/alerta-tipo4.module';
import { AlertaTipo2Module } from './../../objetos/alertas/alerta-tipo2/alerta-tipo2.module';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PostComponent } from './post/post.component';
import { QuienComponent } from './quien/quien.component';
import { QueComponent } from './que/que.component';
import { CuandoComponent } from './cuando/cuando.component';
import { EnviarComponent } from './enviar/enviar.component';
import { HistoricoComponent } from './historico/historico.component';
import { PostitComponent } from './postit.component';
import { ClickOutsideModule } from 'ng4-click-outside';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { FechahoraPickerModule } from '@app/objetos-comunes/fechahora-picker/fechahora-picker.module';
import { DesplegableModule } from '@app/objetos-comunes/desplegable/desplegable.module';
import { CargandoModule } from '@app/objetos-comunes/cargando/cargando.module';

import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
// import { DialogoModule } from '../../objetos/dialogo/dialogo.module';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    ClickOutsideModule,
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    FormsModule,
    NgbModule,
   //  DialogoModule,
    ClickOutsideModule,
    AlertaTipo4Module,
    AlertaTipo2Module,
    FechahoraPickerModule,
    DesplegableModule,
    CargandoModule
  ],
  declarations: [PostitComponent,
    PostComponent,
    QuienComponent, QueComponent, CuandoComponent, EnviarComponent, HistoricoComponent
  ],

  exports : [PostitComponent],

  
})
export class PostitModule { }
