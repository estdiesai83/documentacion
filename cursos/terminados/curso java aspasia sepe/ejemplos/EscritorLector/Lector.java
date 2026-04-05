public class Lector{
   public int num;

   public void pedirAlEscritor(Escritor escritor){
      escritor.enviameTexto(this); // Le pasamos el objeto en si
   }

   public void enviar(String texto){
      System.out.println("Soy el lector nº " + String.valueOf(num) + " y he recibido" +  texto);
   }
}