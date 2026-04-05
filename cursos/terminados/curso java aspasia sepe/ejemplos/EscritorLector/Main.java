public class Main {
   public static void main(String args[]){
      Lector lector1 = new Lector();
      Lector lector2 = new Lector();

      lector1.num = 1;
      lector2.num = 2;

      Escritor cervantes = new Escritor();

      lector1.pedirAlEscritor(cervantes);
      lector2.pedirAlEscritor(cervantes);
      lector1.pedirAlEscritor(cervantes);
   }
}
