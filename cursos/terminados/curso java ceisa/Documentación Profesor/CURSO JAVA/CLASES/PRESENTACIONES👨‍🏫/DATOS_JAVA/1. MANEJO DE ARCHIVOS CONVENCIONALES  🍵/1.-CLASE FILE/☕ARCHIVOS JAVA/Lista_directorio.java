/*
 * En este ejemplo etamos utilizando el metodo que 
 * permite obtener lista de los archivos y subdirectorios
 * 
 * 
 * 
 */
import java.io.File;

public class Lista_directorio {

	public static void main(String[] args) {
		
		File directorio = new File("proyectos");//Especificamos el directorio que queremos listar
		
		if(directorio.exists() && directorio.isDirectory()) { // verificamos si e directorio existe
			String[] contenido = directorio.list(); //listado de los archivos
		
		if (contenido != null) { // vemos la condicion si es distinta
			System.out.println("Contenido de directorio:");
			for(String nombre : contenido) {
				System.out.println(nombre);
			}
		}else {
			System.out.println("El directorio esta vacio o no se puede accder");
		}
		} else {
			System.out.println("no existe el directorio");
		}

	}

}
