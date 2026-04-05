package SWING;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.WindowConstants;

public class Clase4 extends JFrame implements ActionListener {
private JLabel etiquetaSu;
private JPanel panelIzquierdo, panelDerecho, panelInferior;
private JButton botonIz1,botonIz2,botonIz3;
private JButton botonDe1,botonDe2,botonDe3;
private JButton botonIn1,botonIn2,botonIn3;
private JScrollPane scroll;

public void contruyePanelIzquierdo() {
	panelIzquierdo = new JPanel();
	botonIz1=new JButton("BOTTON IZQ1");
	botonIz2=new JButton("BOTTON IZQ2");
	botonIz3=new JButton("BOTTON IZQ3");
	panelIzquierdo.setLayout(new BoxLayout(panelIzquierdo,BoxLayout.Y_AXIS));
	panelIzquierdo.setBackground(Color.red);
	panelIzquierdo.add(botonIz1);
	panelIzquierdo.add(botonIz2);
	panelIzquierdo.add(botonIz3);
	
}
	
public void contruyePanelDerecho() {
	panelDerecho = new JPanel();
	botonDe1=new JButton("BOTTON Der1");
	botonDe2=new JButton("BOTTON Der2");
	botonDe3=new JButton("BOTTON Der3");
	panelDerecho.setLayout(new BoxLayout(panelDerecho,BoxLayout.Y_AXIS));
	panelDerecho.setBackground(Color.blue);
	panelDerecho.add(botonDe1);
	panelDerecho.add(botonDe2);
	panelDerecho.add(botonDe3);
	
}	
	
public void contruyePanelInferior() {
	panelInferior = new JPanel();
	botonIn1=new JButton("Titulo 1");//tarea
	botonIn2=new JButton("Titulo 2");//tarea
	botonIn3=new JButton("Finalizar");//realizar funcion de cierre de ventana al hace click
	panelInferior.setLayout(new FlowLayout());
	panelInferior.setBackground(Color.green);
	panelInferior.add(botonIn1);
	panelInferior.add(botonIn2);
	panelInferior.add(botonIn3);
	setLayout(null);
	
}		
	
	public void contruyeVentana() {
	 JFrame frame = new JFrame();
	 scroll = new JScrollPane(new JTextArea("            ", 20 ,60));
	 etiquetaSu = new JLabel("CURSO DE DATOS JAVA");
	 etiquetaSu.setBounds(100, 50, 40, 50);
	 Font aux=etiquetaSu.getFont();
	 etiquetaSu.setFont(new Font(aux.getFontName(), aux.getStyle(),50));
	 frame.setLayout(new BorderLayout());	
	  
	 frame.add(etiquetaSu,BorderLayout.NORTH);
	 //frame.add(scroll,BorderLayout.CENTER);
	 frame.add(panelIzquierdo,BorderLayout.WEST);
	 frame.add(panelDerecho,BorderLayout.EAST);
	 frame.add(panelInferior, BorderLayout.SOUTH);
	 frame.pack();
	 frame.setVisible(true);
	 frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
	 
		
		
	}
	
	public Clase4() {
		contruyePanelInferior();
		contruyePanelIzquierdo();
		contruyePanelDerecho();
		contruyeVentana();
	}
	
	
	
	
	
	
	public static void main(String[] args) {
		new Clase4();

	}

	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

}
