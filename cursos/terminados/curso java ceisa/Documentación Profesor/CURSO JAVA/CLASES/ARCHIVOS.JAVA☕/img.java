import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class img  extends JFrame implements ItemListener {
	
	JPanel base=(JPanel)this.getContentPane();
	ImageIcon in=new ImageIcon("src/img/java.png");
	JLabel imagen= new JLabel();
	
	public img() {
	 imagen.setIcon(in);
	   imagen.setBounds(1000, 100,50 ,100);
	   add(imagen);
	}

	public static void main(String[] args) {
		img formulario = new img();
		formulario.setBounds(400,200 , 1000, 900);
		formulario.setVisible(true);
        formulario.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	
	public void itemStateChanged(ItemEvent e) {
		
		
	}

}
