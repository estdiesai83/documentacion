import { AlertaTipo1Module } from './alerta-tipo1.module';

describe('AlertaTipo1Module', () => {
  let alertaTipo1Module: AlertaTipo1Module;

  beforeEach(() => {
    alertaTipo1Module = new AlertaTipo1Module();
  });

  it('should create an instance', () => {
    expect(alertaTipo1Module).toBeTruthy();
  });
});
