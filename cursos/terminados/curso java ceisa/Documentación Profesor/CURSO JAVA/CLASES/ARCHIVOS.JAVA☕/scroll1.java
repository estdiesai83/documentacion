package SWING;

import java.awt.event.AdjustmentEvent;
import java.awt.event.AdjustmentListener;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JScrollBar;

public class Clase5 {
	JFrame frame;
	JLabel etiqueta;
	
	Clase5(){
		frame =new JFrame("Utilizando el Scrollbar");
		
		etiqueta = new JLabel();
		etiqueta.setHorizontalAlignment(JLabel.CENTER);
		etiqueta.setSize(200,50);
        frame.add(etiqueta);		
		
		JScrollBar barra = new JScrollBar(JScrollBar.VERTICAL, 0,20,0,200);
		barra.setBounds(100, 100, 50, 100);
		frame.add(barra);
		
		barra.addAdjustmentListener(new AdjustmentListener() {
			
			public void adjustmentValueChanged(AdjustmentEvent e) {
				etiqueta.setText("valor actual:" + barra.getValue());
			}
			
			
			
		}
				
				
				
				);
		
		
		
		
		
		
		
		
		frame.setSize(300,300);
		frame.setLayout(null);
		frame.setVisible(true);
        
        
        
        
		
		
	}
	
	
	

	public static void main(String[] args) {
		new Clase5();
		
		
		
		

	}

}
