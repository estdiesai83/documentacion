import { AlertaErrorModule } from './alerta-error.module';

describe('AlertaErrorModule', () => {
  let alertaErrorModule: AlertaErrorModule;

  beforeEach(() => {
    alertaErrorModule = new AlertaErrorModule();
  });

  it('should create an instance', () => {
    expect(alertaErrorModule).toBeTruthy();
  });
});
