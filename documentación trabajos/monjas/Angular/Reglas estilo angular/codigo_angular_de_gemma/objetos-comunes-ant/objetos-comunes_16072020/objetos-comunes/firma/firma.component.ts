import { Component, OnInit, AfterViewInit, Output, EventEmitter, ChangeDetectorRef, ViewChild, ElementRef } from '@angular/core';
import { Globals } from '@app/globals';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';

@Component({
   selector: 'app-firma',
   templateUrl: './firma.component.html',
   styleUrls: ['./firma.component.less'],
   animations: [
      trigger('inOutFade', [
         transition(':enter', [
         style({opacity: '0'}),
            animate('400ms', style({opacity: '1'}))
         ]),
         transition(':leave', [
            animate('400ms', style({opacity: '0'}))
         ])
      ]),
      trigger('inOutFromBottom', [
         transition(':enter', [
            style({transform: 'translateY(100%)'}),
            animate('400ms ease', style({transform: 'translateY(0%)'}))
         ]),
         transition(':leave', [
            animate('400ms ease', style({transform: 'translateY(100%)'}))
         ])
      ]),
   ]
})
export class FirmaComponent implements OnInit, AfterViewInit {

   @Output() eventoCorrecto = new EventEmitter();
   @Output() eventoCerrar = new EventEmitter();

   @ViewChild('digito', {static: false}) digito: ElementRef;

   show: boolean = false;

   clave;
   error;
   correcto;
   BASE_APP = Globals.BASE_APP_URL;

   digito_heigth;

   constructor(  private cdRef: ChangeDetectorRef,) { }

   ngOnInit() {
      this.correcto = 0;
      this.clave = '';

      setTimeout(() => {
         this.show = true;
         this.cdRef.detectChanges();
         this.cdRef.reattach();
      }, 50);
   }
   ngAfterViewInit() {
      setTimeout(() => {
         this.digito_heigth = this.digito.nativeElement.offsetWidth - 30;
      }, 100);
   }

   pulsarDigito(digito) {
      if (this.clave.length < 4) {
         this.clave  = this.clave + digito;
         if (this.clave.length === 4) {
            if (this.clave === '5555') {
               this.correcto = 1;
               this.error = 0;

               this.eventoCorrecto.emit();
               this.cerrar();
            } else {
               this.correcto = 0;
               this.error = 1;
            }
         }
      }

      this.cdRef.detectChanges();
   }

   borrarDigito() {
      let numero; 
      numero = this.clave.length;
      this.correcto = 0;
      this.error = 0;
       if (numero === 4) {
        let letra = this.clave.substring(0, 3);
        
        this.clave = letra;
        
        } else if (numero === 3) {
           let letra = this.clave.substring(0, 2);
           this.clave = letra;
           
  
        } else if (numero === 2) {
            let letra = this.clave.substring(0, 1);
            this.clave = letra;
        } else if (numero === 1) {
           let letra = this.clave.substring(0, 0);
           this.clave = letra;
        }
        this.cdRef.detectChanges();
   }
   borrarTodo() {
      this.correcto = 0;
      this.error = 0;
      this.clave = '';
   }

   cerrar() {
      this.show = false;

      setTimeout(() => {
         this.eventoCerrar.emit()
      }, 400);
   }
}
