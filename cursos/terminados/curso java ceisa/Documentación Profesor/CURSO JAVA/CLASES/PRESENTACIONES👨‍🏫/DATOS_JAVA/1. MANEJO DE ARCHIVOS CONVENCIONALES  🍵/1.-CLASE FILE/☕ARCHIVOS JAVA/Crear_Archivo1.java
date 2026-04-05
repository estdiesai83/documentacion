/*
 * eN ESTE EJEMPLO CREAMOS UN ARCHIVO UTILIZANDO 
 * CODIGO BYTE
 * 
 */



import java.io.FileOutputStream;
import java.io.IOException;

public class Crear_Archivo1 {

	public static void main(String[] args) {
		
		
		byte[] datos = {72,111,108,97,44,32,74,97,118,97,33};//CREAR LO QUE QUEREMOS ESCRIBIR EN EL ARCHIVO EN BYE
		
		try(FileOutputStream fos = new FileOutputStream("archivo.txt")){ //USAMOS EL TRY PARA ASEGURAR EL ARCHIVO
			fos.write(datos);
			System.out.print("El archivo se ha creado exitosamente");
			
		}catch(IOException e) { //CAPTURA DE EXCEPCIONES EN CASO DE ERROR
			System.err.print("Error al crear el archovo " + e.getMessage());
			
		}
		
		
		
		

	}

}
