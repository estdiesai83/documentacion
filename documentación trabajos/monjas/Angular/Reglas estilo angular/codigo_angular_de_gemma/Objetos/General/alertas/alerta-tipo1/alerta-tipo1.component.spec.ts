import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AlertaTipo1Component } from './alerta-tipo1.component';

describe('AlertaTipo1Component', () => {
  let component: AlertaTipo1Component;
  let fixture: ComponentFixture<AlertaTipo1Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AlertaTipo1Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AlertaTipo1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
