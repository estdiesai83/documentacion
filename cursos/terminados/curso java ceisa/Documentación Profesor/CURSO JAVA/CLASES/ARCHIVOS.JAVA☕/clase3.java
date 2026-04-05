package SWING;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;

public class clase3 {

	public static void main(String[] args) {
		JFrame frame = new JFrame ("Ejemplo de botton");
		JTextField texto = new JTextField();
		texto.setBounds(50, 50, 150, 20);
		JButton boton = new JButton("ENVIAR");
		boton.setBounds(50, 100, 120, 30);
		
		
		boton.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				texto.setText("Mensaje enviado");
			}
		});
		
		frame.add(boton);
		frame.add(texto);
		frame.setSize(400,400);
		frame.setLayout(null);
		frame.setVisible(true);
		
		
		
		

	}

}
