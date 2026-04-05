package APLICACIONES;


import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
public class Tabla extends WindowAdapter {
	JFrame frame;
	JTable tabla;
	DefaultTableModel modelo;
	
	Tabla(){
		frame = new JFrame("mi primer APP-Escritorio");
		//creacion de campos de la tabla
		modelo =new DefaultTableModel();
		modelo.addColumn("ID");
		modelo.addColumn("Nombre");
		modelo.addColumn("Edad");
		
		tabla = new JTable(modelo);
		JScrollPane sp = new JScrollPane(tabla);
		frame.addWindowListener(this);
		frame.add(sp);
		
		JPanel panel = new JPanel();
		JTextField idField = new JTextField(5);
		JTextField nombreField = new JTextField(10);
		JTextField edadField = new JTextField(5);
		JButton btnAgregar = new JButton("Agregar");
		JButton btnEliminar = new JButton("Eliminar");
		
		
		//creacion de la tabla
		panel.add(new JLabel ("ID"));
		panel.add(idField);
		panel.add
		
		(new JLabel("Nombre"));
		   panel.add(nombreField);
		   panel.add(new JLabel("Edad"));
		   panel.add(edadField);
		   panel.add(btnAgregar);
		   panel.add(btnEliminar);
		   frame.add(panel,"South");  
		   
		   
		   btnAgregar.addActionListener(new ActionListener() {

			//se programa para ingresar filas a la tabla:
			public void actionPerformed(ActionEvent e) {
				String[] nuevaFila = {idField.getText(),nombreField.getText(),edadField.getText()};
				modelo.addRow(nuevaFila);
			}
			   
			   
		   });
		   
		   //aqui eliminamos las filas:
		   
		   btnEliminar.addActionListener(new ActionListener() {

			
			public void actionPerformed(ActionEvent e) {
				int filaSeleccionada = tabla.getSelectedRow();
				if(filaSeleccionada >=0) {
					modelo.removeRow(filaSeleccionada);
				}else {
					JOptionPane.showConfirmDialog(frame, "porfavor selecciona una fila para eliminar");
				}}});
		   
		   
		   
		   
		   
		   
		   
		   
		frame.setSize(900,500);
        frame.setVisible(true);		
	}
	
        public void windowClosing(WindowEvent e) {
        	
        	int opcion = JOptionPane.showConfirmDialog(frame, "Esta seguro de salir de la APP");
        	if(opcion==JOptionPane.YES_OPTION) {
        		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        	}
        	
        }
	
	
	
	
	
	public static void main(String[] args) {
		new Tabla();
		
	
	}
}
