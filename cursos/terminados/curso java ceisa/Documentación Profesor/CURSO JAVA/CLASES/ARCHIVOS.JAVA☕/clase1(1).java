package SWING;

import javax.swing.JButton;
import javax.swing.JFrame;

public class clase1 {

	public static void main(String[] args) {
		JFrame frame = new JFrame();
		JButton boton = new JButton("HAZ CLIC");
		boton.setBounds(130, 100, 100, 40);
		frame.add(boton);
		frame.setSize(400,500);
		frame.setLayout(null);
		frame.setVisible(true);
		
		
		

	}

}
