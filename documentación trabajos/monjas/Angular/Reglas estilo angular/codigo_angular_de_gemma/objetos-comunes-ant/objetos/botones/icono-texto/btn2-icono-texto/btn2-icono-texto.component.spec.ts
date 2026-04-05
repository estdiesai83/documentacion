import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Btn2IconoTextoComponent } from './btn2-icono-texto.component';

describe('Btn2IconoTextoComponent', () => {
  let component: Btn2IconoTextoComponent;
  let fixture: ComponentFixture<Btn2IconoTextoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Btn2IconoTextoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Btn2IconoTextoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
