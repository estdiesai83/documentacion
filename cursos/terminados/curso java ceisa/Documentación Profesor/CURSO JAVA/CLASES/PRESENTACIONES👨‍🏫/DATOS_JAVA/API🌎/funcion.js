/**
 * funciones

 */

 function bebidas(){
	 
	 var b1=0;
	 var b2=0;
	 var b3=0;
	 var b4=0;
	 var b5=0;
	 var b6=0;
	 var b7=0;
	 var b8=0;
	 var resultado;
	 
	 b1=prompt("tragos vendidos hoy de margarita?");
	 document.getElementById("demo1").innerHTML=b1;
	 b2=prompt("tragos vendidos hoy de martinis?");
	 document.getElementById("demo2").innerHTML=b2;
	 b3=prompt("tragos vendidos hoy de vodkatinis?");
	 document.getElementById("demo3").innerHTML=b3;
	 b4=prompt("tragos vendidos hoy de daiquiri?");
	 document.getElementById("demo4").innerHTML=b4;
	 b5=prompt("tragos vendidos hoy de maraquita?");
	 document.getElementById("demo5").innerHTML=b5;
	 b6=prompt("tragos vendidos hoy de negroni?");
	 document.getElementById("demo6").innerHTML=b6;
	 b7=prompt("tragos vendidos hoy de mojito?");
	 document.getElementById("demo7").innerHTML=b7;
	 b8=prompt("tragos vendidos hoy de pisco?");
	 document.getElementById("demo8").innerHTML=b8;
	 resultado=(Number(b1)+Number(b2)+Number(b3)+Number(b4)+Number(b5)+Number(b6)+Number(b7)+Number(b8));
	 document.getElementById("demo20").innerHTML= "<h4 style='text-align:center;border 5px solid white'>"  +  "RESUMEN DE VENTAS DEL DIA"+"<br>"+"****************************************" +"</BR>"    +"<BR>"+"El total de bebidas vendidas es "+ resultado+  "</h4>";                               
	 
	 
	 
	 
	 
 }