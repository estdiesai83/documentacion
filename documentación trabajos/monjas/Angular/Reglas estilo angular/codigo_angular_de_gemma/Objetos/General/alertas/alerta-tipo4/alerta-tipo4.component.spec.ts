import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlertaTipo4Component } from './alerta-tipo4.component';

describe('AlertaTipo4Component', () => {
  let component: AlertaTipo4Component;
  let fixture: ComponentFixture<AlertaTipo4Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlertaTipo4Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlertaTipo4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
