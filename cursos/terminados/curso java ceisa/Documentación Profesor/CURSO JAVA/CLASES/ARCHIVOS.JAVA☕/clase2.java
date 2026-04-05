package SWING;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class clase2 {
	JFrame frame;
	
	
	clase2(){
		frame = new JFrame();
		frame.setLayout(new FlowLayout());
		
		frame.add(new JButton("Boton 1"));
		frame.add(new JButton("Boton 2"));
		frame.add(new JButton("Boton 3"));
		
		frame.setSize(300,200);
		frame.setVisible(true);
	}
	
	
	public static void main(String[] args) {
		new clase2();
		
		
	
		
		
		
		
		
		
		
		

	}

}
