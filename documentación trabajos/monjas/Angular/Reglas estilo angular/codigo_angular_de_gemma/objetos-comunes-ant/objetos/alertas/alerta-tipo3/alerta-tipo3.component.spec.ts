import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlertaTipo3Component } from './alerta-tipo3.component';

describe('AlertaTipo3Component', () => {
  let component: AlertaTipo3Component;
  let fixture: ComponentFixture<AlertaTipo3Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlertaTipo3Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlertaTipo3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
