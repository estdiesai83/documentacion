import java.security.PrivateKey;

public class Escritor {
   // parte privada
   private String parteTexto1;
   private String parteTexto2;
   private int veces;

   private String escribir() {
      // Si no hay otra variable que se llame igual this no es necesario
      // La clase String tiene un método estático para producir un string a partir de otros tipos
      String vecesString = String.valueOf(veces);
      return parteTexto1 + veces + parteTexto2;
   }

   // parte pública, interfaz usuario
   public Escritor() {
      this.parteTexto1 = "En un lugar de la maancha de cuyo nombre no quiero acordarme ";
      this.parteTexto2 = "º vez ";
      this.veces = 0;
   }
   // En este caso le enviamos al lector un texto a través de uno de sus métodos.
   public void enviameTexto(Lector lector){
      this.veces++; // Lo incrementamosº
      lector.enviar(this.escribir());
   }
}