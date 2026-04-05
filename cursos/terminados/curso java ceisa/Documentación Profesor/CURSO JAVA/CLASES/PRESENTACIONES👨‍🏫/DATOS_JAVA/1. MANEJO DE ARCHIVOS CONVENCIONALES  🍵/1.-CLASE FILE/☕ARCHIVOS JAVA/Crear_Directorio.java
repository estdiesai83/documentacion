/*
 * 
 * En este ejemplo estamos creando undirecto en nuestro proyecto 
 * con el metodo mkdirs()
 */


import java.io.File;

public class Crear_Directorio {

	public static void main(String[] args) {
		
		String rutaDirectorio ="proyectos/java";//se crea la ruta a seguir para crear el directorio
		
		File directorio = new File(rutaDirectorio); //creamos el objeto indicando el String
		
		if(!directorio.exists()) { //se hace una condicion con la funcion exists()
			boolean creado = directorio.mkdirs();
			
		if (creado) {
			System.out.print("El directorio se ha creado");
		}else {
			System.out.print("No se puede crear el directorio");
		}
		
		}else {
			System.out.println("El directorio ya existe");
		}
		

	}
}
