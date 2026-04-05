import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlertaConfirmacion2Component } from './alerta-confirmacion2.component';

describe('AlertaConfirmacion2Component', () => {
  let component: AlertaConfirmacion2Component;
  let fixture: ComponentFixture<AlertaConfirmacion2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlertaConfirmacion2Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlertaConfirmacion2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
