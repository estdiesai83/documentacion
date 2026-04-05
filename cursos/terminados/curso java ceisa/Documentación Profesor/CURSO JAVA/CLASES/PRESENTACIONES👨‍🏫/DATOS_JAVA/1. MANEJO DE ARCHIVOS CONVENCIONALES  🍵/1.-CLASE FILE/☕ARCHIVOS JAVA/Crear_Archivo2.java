import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
/* se crea un archivo con escritura
 * 
 *
 */



public class Crear_Archivo2 {

	public static void main(String[] args) {
		File archivo = new File("mi_archivo.txt");
				
		try {
			
			if(archivo.createNewFile()) {
				System.out.print("achivo creado");
			
			
		try(FileWriter writer = new FileWriter(archivo)) {
			writer.write("contenido de prueba en mi_archivo.txt");
			System.out.println("Contenido escrito en el archivo");
		}
		

	} else {
		System.out.println("archivo no existe");
	}

} catch(IOException e) {
	System.err.print("Error al crear o escribir el archivo " + e.getMessage());
	
}

}
	
}

