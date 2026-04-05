package CURSO_SWING;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;

public class JTextArea5 implements ActionListener{
	JLabel etiquetaPalabras, etiquetaCaracteres;  
    JTextArea areaTexto;  
    JButton botonContar;  

    JTextArea5() {  
        JFrame frame = new JFrame("Contar Palabras y Caracteres");  

        etiquetaPalabras = new JLabel("Palabras: ");  
        etiquetaPalabras.setBounds(50, 25, 100, 30);  

        etiquetaCaracteres = new JLabel("Caracteres: ");  
        etiquetaCaracteres.setBounds(160, 25, 100, 30);  

        areaTexto = new JTextArea();  
        areaTexto.setBounds(20, 75, 250, 200);  

        botonContar = new JButton("Contar Palabras");  
        botonContar.setBounds(100, 300, 150, 30);  
        botonContar.addActionListener(this);  

        frame.add(etiquetaPalabras);  
        frame.add(etiquetaCaracteres);  
        frame.add(areaTexto);  
        frame.add(botonContar);  

        frame.setSize(400, 400);  
        frame.setLayout(null);  
        frame.setVisible(true);  
    }  

    
	
	
	
	
	
	
	
	
	
	public static void main(String[] args) {
		new JTextArea5();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String texto = areaTexto.getText();  
        String[] palabras = texto.split("\\s+");  // Divide el texto en palabras usando espacios
        etiquetaPalabras.setText("Palabras: " + palabras.length);  
        etiquetaCaracteres.setText("Caracteres: " + texto.length());  
		
	}

}
