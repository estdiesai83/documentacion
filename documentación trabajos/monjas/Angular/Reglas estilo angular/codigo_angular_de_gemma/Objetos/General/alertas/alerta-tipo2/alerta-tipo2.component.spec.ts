import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlertaTipo2Component } from './alerta-tipo2.component';

describe('AlertaTipo2Component', () => {
  let component: AlertaTipo2Component;
  let fixture: ComponentFixture<AlertaTipo2Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlertaTipo2Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlertaTipo2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
