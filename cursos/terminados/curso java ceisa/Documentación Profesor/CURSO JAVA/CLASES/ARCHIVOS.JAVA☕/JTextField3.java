package CURSO_SWING;

import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JTextField;

public class JTextField3 {

	public static void main(String[] args) {
		  JFrame frame = new JFrame("Ejemplo de JTextField con Fuente");  
	        JTextField campoTexto = new JTextField("Texto con fuente personalizada");  
	        campoTexto.setBounds(50, 100, 850, 300);  

	        // Cambiar la fuente del campo de texto
	        Font nuevaFuente = new Font("Serif", Font.BOLD, 50 );  
	        campoTexto.setFont(nuevaFuente);  

	        frame.add(campoTexto);  
	        frame.setSize(400, 300);  
	        frame.setLayout(null);  
	        frame.setVisible(true);

	}

}
