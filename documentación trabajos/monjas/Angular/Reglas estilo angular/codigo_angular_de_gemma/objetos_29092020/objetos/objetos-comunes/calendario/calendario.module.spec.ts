import { CalendarioModule } from './calendario.module';

describe('CalendarioModule', () => {
   let semanalModule: CalendarioModule;

   beforeEach(() => {
      semanalModule = new CalendarioModule();
   });

   it('should create an instance', () => {
      expect(semanalModule).toBeTruthy();
   });
});
