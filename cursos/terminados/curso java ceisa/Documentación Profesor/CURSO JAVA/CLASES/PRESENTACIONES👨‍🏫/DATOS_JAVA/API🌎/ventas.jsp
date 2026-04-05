<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VENTAS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="js/funcion.js"></script>
<script src="js/funcion2.js"></script>



</head>
<body style="background-color: rgb(192,192,192);">

<!--  -img src="img/111.gif" style="width:120px;height:120px;margin-left:120px"--->


<div class="container mt-3">

<div class="table-responsive">
<table class="table table-bordered">
<thead>
    <tr>
    <th><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1z"/>
  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0z"/>
</svg></th>
      <th><img alt="" src="img/1.png " width="35" height="25">Margarita</th>
      <th><img alt="" src="img/1.png " width="35" height="25">Martinis</th>
      <th><img alt="" src="img/1.png " width="35" height="25">Vodkatinis</th>
       <th><img alt="" src="img/1.png " width="35" height="25">Daiquiris</th>
        <th><img alt="" src="img/1.png " width="35" height="25">Maraquita</th>
         <th><img alt="" src="img/1.png " width="35" height="25">Negronis</th>
          <th><img alt="" src="img/1.png " width="35" height="25">Mojito</th>
          <th><img alt="" src="img/1.png " width="35" height="25">Pisco</th>
    </tr>
</thead>
<tbody>
     <tr>
        <td><b>Cantidad</b></td>
       <td id="demo1"></td> 
       <td id="demo2"></td>
       <td id="demo3"></td>
       <td id="demo4"></td>
       <td id="demo5"></td>
      <td id="demo6"></td>
      <td id="demo7"></td>
      <td id="demo8"></td>
     </tr>
</tbody>
</table>
</div>
</div>

<div class="container"
>

<p  id="demo20" style="border: 5px solid white;background-color:black;padding:150px;color:white"><span style="text-align:center"></span></p>
<div style="margin-left:200px">
<button type="button" class="btn btn-danger" onclick="bebidas()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
</svg>VENTAS DIA</button>

<button type="button" class="btn btn-danger" onclick="bote()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm-2 0h1v1A2.5 2.5 0 0 0 6.5 5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
</svg>BOTE</button>

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  PRECIOS VENTAS
</button>

<button type="button" class="btn btn-danger" onclick="caja()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm-2 0h1v1A2.5 2.5 0 0 0 6.5 5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
</svg>CAJA</button>

<button type="button" class="btn btn-danger" onclick="costo()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm-2 0h1v1A2.5 2.5 0 0 0 6.5 5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
</svg>MARGEN</button>

<button type="button" class="btn btn-danger" onclick="costo()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm-2 0h1v1A2.5 2.5 0 0 0 6.5 5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
</svg>COSTO</button>



<button type="button" class="btn btn-danger" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 1.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-5 0A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5v1A1.5 1.5 0 0 1 9.5 4h-3A1.5 1.5 0 0 1 5 2.5zm-2 0h1v1A2.5 2.5 0 0 0 6.5 5h3A2.5 2.5 0 0 0 12 2.5v-1h1a2 2 0 0 1 2 2V14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3.5a2 2 0 0 1 2-2"/>
</svg><a href="http://localhost:8080/API_RESTAURANTE/bar.jsp">SALIR</a></button>
</div>





<script type="text/javascript">

function bote(){ 
	 var hoy = 0;
	 var lunes=0;
	 var martes=0;
	 var miercoles=0;
	 var jueves=0;
	 var viernes=0;
	 var sabado=0;
	 var divison1=0;
	 var divion2=0;
	 var divion3=0;
	 var divion4=0;
	 var total=0;
	 var resultado1=0;
	 var resultado2=0;
	 var resultado3=0
	 var resultado4=0;
	 
	 hoy=prompt("bote de hoy: ");
	 lunes=prompt("bote del lunes: ");
	 martes=prompt("bote del martes: ");
	 miercoles=prompt("bote del miercoles: ");
	 jueves=prompt("bote del jueves: ");
	 viernes=prompt("bote del viernes: ");
	 sabado=prompt("bote del sabado: ");
	 division1=prompt("numero de gerente: ");
	 division2=prompt("numero de barteder: ");
	 division3=prompt("numero de cocineros: ");
	 division4=prompt("numero de camareros: ");
	 total=Number(lunes)+Number(martes)+Number(miercoles)+Number(jueves)+Number(viernes)+Number(sabado)+Number(hoy)
     
	 resultado1=total*0.50/division1;
	 resultado2=total*0.20/division2;
	 resultado3=total*0.15/division3;
	 resultado4=total*0.15/division4;
	 document.getElementById("demo20").innerHTML="<p style='text-align:center'>"+"------------------------------"+"<br>"+"El total del bote semanal es: " + total + "<br>"+ "Los gerentes cobra: " + resultado1 + "<br>" + "el bartender cobra: " + resultado2 +"<br>"+ "los cocineros cobran; " + resultado3 + "<br>"+ "los camareros cobran:  "+ resultado4 + "<br>"+ "</p>";       

}









</script>




</div>



<!-- -------modal -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">PRECIOS VENTAS</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
       <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
  <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1z"/>
  <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0z"/>
</svg> 
        
     <h4>Precios actualizados:</h4>
     
     <ul>
        <li>Margarita precio 4 costo: 1 margen 1</li>
        <li>Martinis precio 6 costo: 1 margen 1</li>
        <li>vodkatinis precio 3 costo: 1 margen 1</li>
        <li>Daiquiri precio 6 costo: 2 margen 1</li>
        <li>Maraquita precio 4 costo: 1 margen 1</li>
        <li>Negroni precio 6 costo: 1 margen 1</li>
        <li>Mojito precio 3 costo: 1 margen 1</li>
        <li>Pisco precio 6 costo: 2 margen 1</li>
        
        
        
        
        <li>
     
     
     
     </ul>   
        
        
        
        
        
        
        
        
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>













<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>