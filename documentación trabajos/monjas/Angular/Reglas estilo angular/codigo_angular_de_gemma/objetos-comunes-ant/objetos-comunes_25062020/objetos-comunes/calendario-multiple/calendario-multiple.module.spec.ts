import { CalendariomultipleModule } from './calendario-multiple.module';

describe('CalendariomultipleModule', () => {
   let semanalModule: CalendariomultipleModule;

   beforeEach(() => {
      semanalModule = new CalendariomultipleModule();
   });

   it('should create an instance', () => {
      expect(semanalModule).toBeTruthy();
   });
});
