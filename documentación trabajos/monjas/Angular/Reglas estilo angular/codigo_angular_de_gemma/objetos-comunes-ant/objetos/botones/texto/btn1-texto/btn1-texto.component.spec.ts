import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Btn1TextoComponent } from './btn1-texto.component';

describe('Btn1TextoComponent', () => {
  let component: Btn1TextoComponent;
  let fixture: ComponentFixture<Btn1TextoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Btn1TextoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Btn1TextoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
