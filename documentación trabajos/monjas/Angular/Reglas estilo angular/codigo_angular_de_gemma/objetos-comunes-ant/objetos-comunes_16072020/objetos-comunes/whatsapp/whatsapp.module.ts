import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { WhatsappComponent } from './whatsapp.component';

import { EntradaModule } from './entrada/entrada.module';
import { MensajeriaModule } from './mensajeria/mensajeria.module';
import { MailModule } from './mail/mail.module';

@NgModule({
   declarations: [ WhatsappComponent ],
   imports: [
      CommonModule,
      EntradaModule,
      MensajeriaModule,
      FormsModule,
      MailModule
   ],
   exports: [ WhatsappComponent ]
})
export class WhatsappModule { }
