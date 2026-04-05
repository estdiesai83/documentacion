import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlertaTipo7Component } from './alerta-tipo7.component';

describe('AlertaTipo7Component', () => {
  let component: AlertaTipo7Component;
  let fixture: ComponentFixture<AlertaTipo7Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlertaTipo7Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlertaTipo7Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
