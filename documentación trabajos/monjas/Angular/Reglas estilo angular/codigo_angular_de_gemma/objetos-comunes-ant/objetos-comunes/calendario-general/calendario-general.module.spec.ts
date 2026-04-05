import { CalendarioGeneralModule } from './calendario-general.module';

describe('CalendarioGeneralModule', () => {
  let calendarioGeneralModule: CalendarioGeneralModule;

  beforeEach(() => {
    calendarioGeneralModule = new CalendarioGeneralModule();
  });

  it('should create an instance', () => {
    expect(calendarioGeneralModule).toBeTruthy();
  });
});
