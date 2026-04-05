import java.io.File;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;


public class MultipleElementsXmlParsing {

	public static void main(String[] args) {
      try {
    	  
      
		File inputXmlFile = new File("src/multipleElements.xml");
		
		DocumentBuilderFactory dbFactory =DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = dbFactory.newDocumentBuilder();
		Document xmldoc = docBuilder.parse(inputXmlFile);
		
		Element element = xmldoc.getDocumentElement();
		System.out.println("Nombre del elemento del " + element.getTagName());
		
		NodeList nList = element.getChildNodes();
		
		for(int temp =0; temp < nList.getLength(); temp++) {
			
			Node nNode = nList.item(temp);
			System.out.println("\nElemento : " + nNode.getNodeName());
			
			if(nNode.getNodeType()==Node.ELEMENT_NODE) {
				Element eElement = (Element) nNode;
				System.out.println("nombre del departamento: " +eElement.getElementsByTagName("nombre").item(0).getTextContent());
				System.out.println("estudiantes del departamento : " +eElement.getElementsByTagName("estudiantes").item(0).getTextContent());
			
			
			}
				
			
		}
	
      } catch (Exception e) {
    	  e.printStackTrace();    	  
      }
      
	}

}
