<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div style="margin-left:35%;padding: 1px;height:700px">
<div class="container mt-3">

<h2>RESERVACIONES</h2>

<table class="table">
 <thead>
 <tr>
   <th>Nª Mesa</th>
   <th>Capacidad</th>
   <th>Reservacion</th>
 </tr>
 <tr>
 <td><img alt="" src="img/200.png" style="width:50px; height:50px">(1)</td>
 <td><img alt="" src="">4</td>
 <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Reservar
</button></td>

</tr>
 
 
 
 
 
 
 
 
 

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-clipboard-minus-fill" viewBox="0 0 16 16">
  <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"/>
  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zM6 9h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1 0-1"/>
</svg>RESERVAR MESA</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="text-align:center">
        
        
        <form action="">
        
        <label>Nombre del cliente:</label><br>
        <input type="text" name="cliente"><br><br>
        
        <label>Nª Persona:</label><br>
        <input type="number" name="numero"><br><br>
        
        <label>Fecha de Reservacion:</label><br>
        <input type="date" name="fecha"><br><br>
        
        <label>Telefono de contacto</label><br>
        <input type="text" name="telefono"><br><br>
          
        
        
        
        
        
        
        
        
        
        
        
      </div>
      <div class="modal-footer">
         <button type="reset" class="btn btn-danger" style="margin-right:220px">Borrar</button>
         
         
         
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>
        <button type="submit" class="btn btn-primary" onclick="reserva()">RESERVAR</button>
       </form> 
    
      </div>
    </div>
  </div>
</div>

        
 
 
 
 
 
 
 
 
 
 
 
 
 </thead>
</table>
</div>



</div>

<script type="text/javascript">

function reserva(){
	alert("se ha reservado la mesa")
}

</script>








<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>