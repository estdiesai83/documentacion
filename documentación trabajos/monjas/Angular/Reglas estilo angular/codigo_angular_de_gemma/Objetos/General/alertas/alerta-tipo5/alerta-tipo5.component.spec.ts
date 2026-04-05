import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlertaTipo5Component } from './alerta-tipo5.component';

describe('AlertaTipo5Component', () => {
  let component: AlertaTipo5Component;
  let fixture: ComponentFixture<AlertaTipo5Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlertaTipo5Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlertaTipo5Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
