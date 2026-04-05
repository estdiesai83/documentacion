/*
 * En este ejemplo se realizo la eliminacion
 * de un un sub directorio vacio.
 * 
 */



import java.io.File;

public class Eliminar_directorio1 {

	public static void main(String[] args) {
		
		File directorio = new File("proyectos/java"); //ruta a eliminar con la clase file
		
		if(directorio.exists()) {
			boolean eliminado = directorio.delete(); // verificar si el directorio existe
			
		if(eliminado) {
			System.out.print("Ha sido eliminado exitosamente el subdirectorio");
		}else {
			System.out.print("No se pudo eliminar el directorio");
		}
			
		}else {
			System.out.print("El directorio no existe");
		}
		
		

	}

}
