import { AlertaTipo5Module } from './alerta-tipo5.module';

describe('AlertaTipo5Module', () => {
  let alertaTipo5Module: AlertaTipo5Module;

  beforeEach(() => {
    alertaTipo5Module = new AlertaTipo5Module();
  });

  it('should create an instance', () => {
    expect(alertaTipo5Module).toBeTruthy();
  });
});
