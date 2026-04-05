import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

public class Crear_archivo3 {

	public static void main(String[] args) {
		
		String contenido="Este es el  contenido usado en nuestro archivo";
		
		try {
			Files.write(Paths.get("archivo_contenido.txt") , contenido.getBytes());
			System.out.println("archivo 'archivo_contenido.txt'creado y contenido exitosamente");
			
			List<String> lineas = List.of("Primera linea", "segunda linea","tercera linea");
			Files.write(Paths.get("archivo_lineas.txt"), lineas, StandardOpenOption.CREATE, StandardOpenOption.APPEND);
			System.out.println("archivo creado correctamente");
				
		}catch(IOException e) {
			System.err.println("Error al crear o escribir el archivo " + e.getMessage());
		}
		

	}

}
