import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-btn1-texto',
  templateUrl: './btn1-texto.component.html',
  styleUrls: ['./btn1-texto.component.less']
})
export class Btn1TextoComponent implements OnInit {
   @Input() texto;   
   constructor() { }

   ngOnInit() {
   }

}
