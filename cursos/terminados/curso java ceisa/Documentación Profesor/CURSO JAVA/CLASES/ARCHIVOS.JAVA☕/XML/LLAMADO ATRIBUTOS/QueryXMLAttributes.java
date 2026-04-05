package coche;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;
import java.io.File;

public class QueryXMLAttributes {

	public static void main(String[] args) {
		
		try {
			
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		File inputFile = new File("src/cars.xml");
		int count=0;
		Document doc = dBuilder.parse(inputFile);
		NodeList nList = doc.getElementsByTagName("nombrecoche");
		for(int i=0; i<nList.getLength();i++) {
			Element ele =(Element) nList.item(i);
			if(ele.getAttribute("company").equals("toyota")) {
				count++;
			}	
			
		}
		System.out.print("Numero de coche " + count);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
