import { Component, OnInit, ElementRef, ViewChild, ChangeDetectorRef, AfterViewInit , HostListener, Output, EventEmitter} from '@angular/core';
declare var jquery: any;
declare var $: any;
declare var Swiper1: any;
import * as Hammer from 'hammerjs';
import Swiper from 'swiper';

@Component({
  selector: 'app-calendario-anios',
  templateUrl: './calendario-anios.component.html',
  styleUrls: ['./calendario-anios.component.less']
})
export class CalendarioAniosComponent implements OnInit {
  @Output() cambiarfecha = new EventEmitter();
  mySwiperAnios: Swiper;
   anios: any =[];
   constructor(public elementRef: ElementRef,private cdRef: ChangeDetectorRef) {
      const hammertime = new Hammer(elementRef.nativeElement, {});
   }

   ngOnInit() {
      this.anios = [
         {'anio' :  2018},
         {'anio' :  2019},
         {'anio' :  2020},
         {'anio' :  2021},
         {'anio' :  2022},
         {'anio' :  2023},
         {'anio' :  2024},
         {'anio' :  2025},
         {'anio' :  2026},
      ];
      
      this.mySwiperAnios = new Swiper('.swiper-container1', {
         initialSlide : 1 ,
         speed: 80,
         spaceBetween: 80,
         observer: true,
         lazy: true,
      });
      setTimeout (() => {
         $('.calendar').calendar({
            startYear: '2019',
         });
         this.clickDays();
      }, 100);
   
  }



   restar() {
      let anio ;
      anio  = Number($('.nemo-titulo').html()) + 1;
      $('.nemo-titulo').html(anio);
      if(this.mySwiperAnios.isEnd) {
         this.anios.push({'anio': anio});
         this.ponerContenido(anio);
         this.mySwiperAnios.update();
      } else {
         //this.ponerContenido(anio);
      }
  
   }

   ponerContenido(anio) {
      setTimeout (() => {
         $('.calendar').calendar({
            startYear: '2019',
         });
         this.clickDays();
      }, 50);
   }
   sumar() {
      let anio ;
      anio  = Number($('.nemo-titulo').html()) - 1;
      $('.nemo-titulo').html(anio);
      if(this.mySwiperAnios.isEnd){
         this.anios.unshift({'anio': anio});
         this.ponerContenido(anio);
          this.mySwiperAnios.update();
      } else {
         //this.ponerContenido(anio);
      }
      this.mySwiperAnios.update();
    
   }

  clickDays() {
   $('.jqyc-month').bind('click', (event) => {
      let messelecionado;
      let anioselecionado;
      let diaselecionado;
      messelecionado = $(event.target).data('month');
      anioselecionado =  $(event.target).data('year');
      diaselecionado =  $(event.target).data('day-of-month');
      console.log(diaselecionado);
      if (diaselecionado === undefined) {
         diaselecionado =  1;
      }
      console.log(messelecionado)
      this.cambiarfecha.emit(anioselecionado + '/' + messelecionado + '/' + diaselecionado);
   });
  }
}


