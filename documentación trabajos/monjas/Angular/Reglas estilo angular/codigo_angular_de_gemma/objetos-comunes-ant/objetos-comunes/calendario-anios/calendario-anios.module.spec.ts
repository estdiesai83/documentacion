import { CalendarioAniosModule } from './calendario-anios.module';

describe('CalendarioAniosModule', () => {
  let calendarioAniosModule: CalendarioAniosModule;

  beforeEach(() => {
    calendarioAniosModule = new CalendarioAniosModule();
  });

  it('should create an instance', () => {
    expect(calendarioAniosModule).toBeTruthy();
  });
});
