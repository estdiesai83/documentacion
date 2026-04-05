import { Component, OnInit, AfterViewInit, Input, Output, EventEmitter, ViewChild, ElementRef, ChangeDetectorRef } from '@angular/core';
import { trigger, transition, animate, style, query, group, keyframes, state } from '@angular/animations';

@Component({
   selector: 'app-item-picker',
   templateUrl: './item-picker.component.html',
   styleUrls: ['./item-picker.component.less'],
   animations: [
      trigger('inOutDesplegable', [
         transition(':enter', [
            style({
               transform: 'scale(0.8) translateY(-80px) perspective(80px) rotateX(10deg)', 
               opacity: '0',
            }),
            animate('250ms ease', style({
               transform: 'scale(1) translateY(0) perspective(80px) rotateX(0deg)', 
               opacity: '1'
            }))
         ]),
         transition(':leave', [
            animate('250ms ease', style({
               transform: 'scale(0.8) translateY(-80px) perspective(80px) rotateX(10deg)', 
               opacity: '0'
            }))
         ])
      ]),
   ]
})
export class ItemPickerComponent implements OnInit, AfterViewInit {

   @ViewChild("labelHora", {static: false}) labelHora: ElementRef;

   @Input() elemento;
   @Input() elementos;
   @Output() eventoSeleccion = new EventEmitter();

   desplegable: boolean = false;
   desplegable_top;
   desplegable_left;

   constructor( private cdRef: ChangeDetectorRef ) { }

   ngOnInit() {}

   ngAfterViewInit() {
      const labelTop = this.labelHora.nativeElement.getBoundingClientRect().top;
      const labelLeft = this.labelHora.nativeElement.getBoundingClientRect().left;
      const labelWidth = this.labelHora.nativeElement.getBoundingClientRect().width;
      const labelHeight = this.labelHora.nativeElement.getBoundingClientRect().height;

      // console.log(labelTop, labelHeight);
      // console.log(labelLeft, labelWidth);

      this.desplegable_top = (labelTop + labelHeight) + 5 + 'px';

      const m1 = labelLeft + ( labelWidth / 2 );
      const m2 = 150 / 2;

      this.desplegable_left = m1 - m2 + 'px';

      this.cdRef.detectChanges();
   }

   seleccion( elemento ) {
      this.desplegable = false;
      this.cdRef.detectChanges();
      this.eventoSeleccion.emit(elemento);
   }
}
