import { Component, OnInit, OnDestroy, ElementRef, ViewChild, ChangeDetectorRef } from '@angular/core';
import { trigger , transition , animate , state , style } from '@angular/animations';
import { PostitService } from '../postit.service';

@Component({
   selector: 'app-cuando',
   templateUrl: './cuando.component.html',
   styleUrls: ['./cuando.component.less'],
   animations: [
      trigger('slideInOut', [
         transition(':enter', [
         style({transform: 'translateY(100%)'}),
         animate('300ms ease-out', style({transform: 'translateY(0%)'}))
         ]),
         transition(':leave', [
         animate('300ms ease-out', style({transform: 'translateY(100%)'}))
         ])
      ]),
      trigger('popIn', [
         transition(':enter', [
            style({
               transform: 'scale(.5)',
               opacity: 0
            }),
            animate('100ms ease-out', style({
               transform: 'scale(1)',
               opacity: 1
            }))
         ]),
         transition(':leave', [
            animate('300ms ease-out', style({
               transform: 'translateY(40%)',
               opacity: 0
            }))
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
      trigger('inOutFade', [
         transition(':enter', [
            style({opacity: '0'}),
            animate('400ms', style({opacity: '1'}))
         ]),
         transition(':leave', [
            animate('400ms', style({opacity: '0'}))
         ])
      ]),
   ]
})

export class CuandoComponent implements OnInit, OnDestroy {

   @ViewChild('inputFecha') inputFecha: ElementRef;
   @ViewChild('inputHora') inputHora: ElementRef;
   @ViewChild('inputFechaHora') inputFechaHora: ElementRef;

   estado: any = {};
   abrir: boolean;
   mostrar: any = {};
   sub: any = {};
   motor: any = {};
   modificado: any = {};
   enviado;
   fecha: any;
   fecha_mostrada: string;
   hora: string;
   opciones_fecha: any = [
      {'id': 1, 'nemo': 'Inmediato', 'icono': 'fas fa-clock'},
      {'id': 2, 'nemo': 'Elegir fecha', 'icono': 'fas fa-calendar'},
   ];
   constructor(
      private servicePost: PostitService,
      private cdRef: ChangeDetectorRef ) {
   }

   ngOnInit() {
      this.setCuando(false);

      // this.motor.fecha = setInterval(() => {
      //    this.actualizarFechaHora();
      // }, 1000);

      this.sub.fLimpiarCuando = this.servicePost.fLimpiarCuando.subscribe(valor => {
         this.seleccionarInmediato();
      });


      this.estado.inmediato = true;
      this.estado.fecha = false;
   }

   ngOnDestroy() {
      if (this.motor.fecha) {
         clearInterval(this.motor.fecha);
      }

      this.sub.fLimpiarCuando.unsubscribe();
   }

   despeglarCuando() {
      // if ( !this.estado.cuando ) {
      //    this.abrir = true;
      //    this.mostrar.lista = true;
      //    this.estado.cuando = true;
      // } else {
      //    this.abrir = false;
      //    this.mostrar.lista = false;
      //    this.estado.cuando = false;
      // }

      // this.servicePost.mostrarAlerta(false);
   }

   onClickedOutside(e: Event) {
      // if ( !this.abrir ) {
      //    if ( this.mostrar.lista ) {
      //       this.mostrar.lista = false;
      //       this.estado.cuando = false;
      //    }
      // }
      // this.abrir = false;
   }

   seleccionarInmediato() {
      this.estado.inmediato = true;
      this.estado.fecha = false;
      this.abrir = false;
      // this.mostrar.lista = false;
      this.estado.cuando = false;
      // this.setCuando(false);
      this.servicePost.mostrarAlerta(false);

      // this.seleccionarFecha();
   }

   seleccionFecha() {
      this.estado.inmediato = false;
      this.estado.fecha = true;
      this.abrir = false;
      // this.mostrar.lista = false;
      this.estado.cuando = false;
      this.mostrar = 3;
        
   }

   fechaElegida($event) {
      console.log($event);
       this.fecha.date = $event.dia;
      this.fecha.hora = $event.hora;

      this.fecha.dia = $event.dia.getDate();
      this.fecha.mes = $event.dia.getMonth() + 1;
      this.fecha.anio = $event.dia.getFullYear();

      this.mostrar = 0;
      // this.cdRef.detectChanges();

      // const now = new Date();

      // const day = ('0' + now.getDate()).slice(-2);
      // const month = ('0' + (now.getMonth() + 1)).slice(-2);

      // const fecha = now.getFullYear() + '-' + (month) + '-' + (day);
      // const fecha_aux = (day) + '/' + (month) + '/' + now.getFullYear();
      // const hora = ('0' + now.getHours()).slice(-2) + ':' + ('0' + now.getMinutes()).slice(-2);
      // const fechaHora = fecha + 'T' + hora;

      // this.inputFecha.nativeElement.setAttribute('value', fecha);
      // this.inputHora.nativeElement.setAttribute('value', hora);
      // this.inputFechaHora.nativeElement.setAttribute('value', fechaHora);

      // this.fecha = fecha;
      // this.fecha_mostrada = fecha_aux;
      // this.hora = hora;

      // this.modificado.fecha = false;
      // this.modificado.hora = false;

      // this.setMinFecha();

      // this.setCuando(true);
      // this.servicePost.mostrarAlerta(false);

      // this.inputFechaHora.nativeElement.focus();
   }

   toggleFecha() {
      if ( this.estado.inmediato ) {
         this.seleccionFecha();
      } else {
         this.seleccionarInmediato();
      }
   }

   // actualizarFechaHora() {
   //    if ( this.estado.fecha ) {
   //       if ( !this.modificado.fecha ) {
   //          const now = new Date();
   //          const day = ('0' + now.getDate()).slice(-2);
   //          const month = ('0' + (now.getMonth() + 1)).slice(-2);
   //          const fecha = now.getFullYear() + '-' + (month) + '-' + (day);
   //          const fecha_aux = (day) + '/' + (month) + '/' + now.getFullYear();

   //          this.inputFecha.nativeElement.setAttribute('value', fecha);
   //          this.fecha = fecha;
   //          this.fecha_mostrada = fecha_aux;

   //          this.setCuando(true);
   //       }

   //       if ( !this.modificado.hora ) {
   //          const now = new Date();
   //          const hora = ('0' + now.getHours()).slice(-2) + ':' + ('0' + now.getMinutes()).slice(-2);
   //          this.inputHora.nativeElement.setAttribute('value', hora);
   //          this.hora = hora;

   //          this.setCuando(true);
   //       }
   //    }
   // }

   // setMinFecha() {
   //    const today = new Date();
   //    let dd = String(today.getDate());
   //    let mm = String(today.getMonth() + 1);
   //    const yyyy = today.getFullYear();
   //    const hora = ('0' + today.getHours()).slice(-2) + ':' + ('0' + today.getMinutes()).slice(-2);

   //    let minDate;

   //    if ( Number(dd) < 10 ) {
   //       dd = '0' + dd;
   //    }

   //    if ( Number(mm) < 10 ) {
   //       mm = '0' + mm;
   //    }

   //    minDate = yyyy + '-' + mm + '-' + dd;
   //    this.inputFecha.nativeElement.setAttribute('min', minDate);

   //    minDate = yyyy + '-' + mm + '-' + dd + 'T' + hora;
   //    this.inputFechaHora.nativeElement.setAttribute('min', minDate);
   // }

   // cambioFecha($event) {
   //    const now = new Date();
   //    const day = ('0' + now.getDate()).slice(-2);
   //    const month = ('0' + (now.getMonth() + 1)).slice(-2);
   //    const fecha = now.getFullYear() + '-' + (month) + '-' + (day);
   //    const hora = ('0' + now.getHours()).slice(-2) + ':' + ('0' + now.getMinutes()).slice(-2);

   //    if ($event.srcElement.value !== '') {
   //       this.modificado.fecha = true;

   //       // tslint:disable-next-line:max-line-length
   //       const fecha_aux = $event.srcElement.value.split('-')[2] + '/' + $event.srcElement.value.split('-')[1] + '/' + $event.srcElement.value.split('-')[0];
   //       this.fecha = $event.srcElement.value;
   //       this.fecha_mostrada = fecha_aux;

   //       // Compruebo si la hora sigue bien
   //       if ( fecha === this.fecha && hora > this.hora ) {
   //          this.hora = hora;
   //          this.modificado.hora = false;
   //       }
   //    } else {
   //       this.modificado.fecha = false;
   //       const fecha_aux = (day) + '/' + (month) + '/' + now.getFullYear();
   //       this.fecha = fecha;
   //       this.fecha_mostrada = fecha_aux;
   //    }

   //    this.setCuando(true);
   // }

   // cambioHora($event) {
   //    const now = new Date();
   //    const day = ('0' + now.getDate()).slice(-2);
   //    const month = ('0' + (now.getMonth() + 1)).slice(-2);
   //    const fecha = now.getFullYear() + '-' + (month) + '-' + (day);
   //    const hora = ('0' + now.getHours()).slice(-2) + ':' + ('0' + now.getMinutes()).slice(-2);

   //    if ($event.srcElement.value !== '') {
   //       // Compruebo si la hora es correcta
   //       if ( fecha < this.fecha ) {
   //          // Puedo seleccionar cualquier hora
   //          this.modificado.hora = true;
   //          this.hora = $event.srcElement.value;
   //       } else {
   //          // Compruebo si la hora es correcta
   //          if ( hora <= $event.srcElement.value ) {
   //             this.modificado.hora = true;
   //             this.hora = $event.srcElement.value;
   //          } else {
   //             this.hora = hora;
   //             this.modificado.hora = false;
   //          }
   //       }
   //    } else {
   //       this.hora = hora;
   //       this.modificado.hora = false;
   //    }

   //    this.setCuando(true);
   // }

   // cambioFechaHora($event) {
   //    const now = new Date();
   //    const day = ('0' + now.getDate()).slice(-2);
   //    const month = ('0' + (now.getMonth() + 1)).slice(-2);
   //    const fecha = now.getFullYear() + '-' + (month) + '-' + (day);
   //    const hora = ('0' + now.getHours()).slice(-2) + ':' + ('0' + now.getMinutes()).slice(-2);

   //    const fechaInput = $event.srcElement.value.split('T')[0];
   //    const horaInput = $event.srcElement.value.split('T')[1];

   //    if (fechaInput !== '') {
   //       this.modificado.fecha = true;

   //       // tslint:disable-next-line:max-line-length
   //       const fecha_aux = fechaInput.split('-')[2] + '/' + fechaInput.split('-')[1] + '/' + fechaInput.split('-')[0];
   //       this.fecha = fechaInput;
   //       this.fecha_mostrada = fecha_aux;

   //       // Compruebo si la hora sigue bien
   //       if ( fecha === this.fecha && hora > this.hora ) {
   //          this.hora = hora;
   //          this.modificado.hora = false;
   //       }
   //    } else {
   //       this.modificado.fecha = false;
   //       const fecha_aux = (day) + '/' + (month) + '/' + now.getFullYear();
   //       this.fecha = fecha;
   //       this.fecha_mostrada = fecha_aux;
   //    }

   //    if (horaInput !== '') {
   //       // Compruebo si la hora es correcta
   //       if ( fecha < this.fecha ) {
   //          // Puedo seleccionar cualquier hora
   //          this.modificado.hora = true;
   //          this.hora = horaInput;
   //       } else {
   //          // Compruebo si la hora es correcta
   //          if ( hora <= horaInput ) {
   //             this.modificado.hora = true;
   //             this.hora = horaInput;
   //          } else {
   //             this.hora = hora;
   //             this.modificado.hora = false;
   //          }
   //       }
   //    } else {
   //       this.hora = hora;
   //       this.modificado.hora = false;
   //    }

   //    this.setCuando(true);
   // }

   // clickFecha() {
   //    this.inputFecha.nativeElement.click();
   //    this.servicePost.mostrarAlerta(false);
   //    this.modificado.fecha = true;
   // }

   // clickHora() {
   //    this.inputHora.nativeElement.click();
   //    this.servicePost.mostrarAlerta(false);
   //    this.modificado.hora = true;
   // }

   // clickFechaHora() {
   //    this.inputFechaHora.nativeElement.focus();
   //    this.servicePost.mostrarAlerta(false);
   //    this.modificado.fecha = true;
   //    this.modificado.hora = true;
   // }

   setCuando(estado: Boolean) {
      if ( estado ) {
       //  const cuando = {'fecha': this.fecha, 'hora': this.hora};
         //this.servicePost.setCuando(cuando);
      } else {
         this.servicePost.setCuando(undefined);
      }
   }
}
