import { Component, OnInit, OnChanges, Input, ChangeDetectorRef, ViewChild, ElementRef } from '@angular/core';
import { trigger, transition, style, animate } from '@angular/animations';

@Component({
   selector: 'app-mensajeria',
   templateUrl: './mensajeria.component.html',
   styleUrls: ['./mensajeria.component.less'],
   animations: [
      trigger('inOutIndicarivoScroll', [
         transition(':enter', [
         style({transform: 'translateX(100%)'}),
            animate('400ms ease', style({transform: 'translateX(0%)'}))
         ]),
         transition(':leave', [
            animate('400ms ease', style({transform: 'translateX(100%)'}))
         ])
      ]),
   ]
})
export class MensajeriaComponent implements OnInit, OnChanges {

   @Input() mensajes: any = [];
   @Input() bajarScroll: boolean = false;
   @Input() heightEntrada: string;   

   @ViewChild('mensajeria', {static: false}) mensajeria: ElementRef;

   LOCAL_USER_ID = Number(sessionStorage.getItem('codigousuario'));

   scroll_detached: boolean = false;

   constructor( private cdRef: ChangeDetectorRef ) { }

   ngOnInit() {
   }
   ngOnChanges(changes) {
      if ( changes.bajarScroll !== undefined && changes.bajarScroll.currentValue === true ) {
         this.forzarScrollMensajeriaAbajo();
      }
   }

   scrollMensajeriaAbajo() {
      if ( !this.scroll_detached ) {
         this.cdRef.detectChanges();
         this.mensajeria.nativeElement.scrollTop = this.mensajeria.nativeElement.scrollHeight;
      }
   }
   forzarScrollMensajeriaAbajo() {
      this.cdRef.detectChanges();
      this.mensajeria.nativeElement.scrollTop = this.mensajeria.nativeElement.scrollHeight;
   }

   eventoScrollMensajeria($event) {
      const clientHeight = this.mensajeria.nativeElement.clientHeight;
      const scrollTop = this.mensajeria.nativeElement.scrollTop;
      const scrollHeight = this.mensajeria.nativeElement.scrollHeight;

      if ( scrollHeight - scrollTop < ( clientHeight + 50 ) ) {
         this.scroll_detached = false;
      } else {
         this.scroll_detached = true;
      }
   }

   obtenerBottomIndicativo() {
      return 'calc(20px + ' + this.heightEntrada + ')';
   }
}
