package Factura;

public class Factura{
   public String NombreTitular;
   public String ConceptoFactura;
   public double Precio;
   public double Total;
   public double Iva;
   

   //CONSTRUCTOR DE FACTURA
   public Factura()
   { 
      //VAMOS A INICIALIZAR LOS MIEMBROS DE LA CLASE
      this.NombreTitular = "sin titular";
      this.ConceptoFactura = "sin concepto";
      this.Precio = 0.0;
      this.Iva = 0.0;
      this.Total = 0.0;
   }
   
   public void setFactura(String titular, String concepto, double precio, double iva, double total) {
		
	   this.NombreTitular = titular;
	   this.ConceptoFactura = concepto;
	   this.Precio = precio;
	   this.Iva = iva;
	   this.Total = total;
   }
   
   public String getFactura() {
	   String factura;
	   factura = "Nombre Titular: " + this.NombreTitular +"\n"
  		+ "Concepto Factura: " + this.ConceptoFactura +"\n"
  		+ "Precio: " + this.Precio + "\n"
  		+ "Iva: " + this.Iva + "\n"
  		+ "Total: " + this.Total;
	   return factura;
   }

   public static void main(String[] args){
	   String datos;
	   
	   Factura f1 = new Factura();
	   
	   f1.setFactura("Esther Diez","Concepto1",400,230,620);
	   
	   datos = f1.getFactura();
	   System.out.println("Datos de la factura numero 1");
	   System.out.println(datos);
	   System.out.println("-------------------------------------");

	   f1.setFactura("Maria Fernandez","Concepto2",500,45,545);

	   datos=f1.getFactura();
	   System.out.println("Datos de la factura numero 2");
	   System.out.println(datos);
	   System.out.println("-------------------------------------");
   }	
}