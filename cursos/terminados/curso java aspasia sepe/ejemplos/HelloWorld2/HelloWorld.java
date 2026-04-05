import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

// Extendemos la clase HttpServlet
public class HelloWorld extends HttpServlet {
   private String message;
   // En init llevamos a cabo la inicialización
   public void init() throws ServletException {
      message = "Hello World";
   }

   public void doGet(HttpServletRequest request, HttpServletResponse response) 
   throws ServletException, IOException {

      // El contenido que devolvemos es un html
      response.setContentType("text/html");

      // A través de un PrintWriter escribimos la salida
      PrintWriter out = response.getWriter();
      out.println("<h1>" + this.message + "</h1");
   }

   public void destroy() {
      // Aquí irian las operaciones necesarias cuando el servlet es destruido
   }
}