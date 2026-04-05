import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CalendariomultipleComponent } from './calendario-multiple.component';

describe('CalendariomultipleComponent', () => {
   let component: CalendariomultipleComponent;
   let fixture: ComponentFixture<CalendariomultipleComponent>;

   beforeEach(async(() => {
      TestBed.configureTestingModule({
         declarations: [ CalendariomultipleComponent ]
      })
      .compileComponents();
   }));

   beforeEach(() => {
      fixture = TestBed.createComponent(CalendariomultipleComponent);
      component = fixture.componentInstance;
      fixture.detectChanges();
   });

   it('should create', () => {
      expect(component).toBeTruthy();
   });
});
