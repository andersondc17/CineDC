<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Cine DC - Bienvenido</title>
<spring:url value="/resources" var="urlPublic" />
<spring:url value="/" var="urlRoot" />


<link rel="icon" type="image/png" href="${urlPublic}/images/favicon.png">
<link rel="stylesheet" href="${urlPublic}/css/all.min.css">
<link rel="stylesheet" href="${urlPublic}/css/estilos.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway|Roboto:900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik:700&display=swap" rel="stylesheet">

</head>

<body>

	<jsp:include page="includes/menu.jsp"></jsp:include>






<div class="section-cartelera">


<div class="banner-cartelera">
<div class="contenedor-banner-car">
    <h1>Cartelera</h1>
    <p>Vive toda la emoción de las películas en CINEMA DC</p>
</div>
    <img src="${urlPublic}/images/portada-cartelera.jpg" alt="">
</div>

    <div class="ancho-limite">

<div class="tipoCartelera">
     <p class="pCar">En cartelera</p>
     <p class="pEst">Próximos estrenos</p>
</div>


			
				


<c:forEach var="pelicula" items="${peliculas}">




     <div class="portadas">



       <div class="clasificacion">
          <p>${pelicula.clasificacion}</p>
       </div>


   
<div class="contenedor-portada">
   
        <div class="capa-portada">
       
            <h3 class="capa-titulo">${pelicula.titulo}</h3>
            <div class="capa-c-clasificacion">
            <h3 class="capa-clasificacion">${pelicula.clasificacion}</h3>
        </div>
              <ul>
                <li> <label for="">Lanzamiento: </label>${pelicula.fechaEstreno}</li>  
                <li><label for="">Genero:   </label>${pelicula.genero}</li> 
                <li><label for="">Duración: </label>${pelicula.duracion} min</li> 
                <li><label for="">Idioma: </label>English</li> 
              </ul>
              <h3>4.3</h3>
              <a href="${urlRoot}detailBillboard/${pelicula.id}/${fechaBusqueda}">Ver Detalles</a>
              
            
            </div>
            <img src="${urlPublic}/images/${pelicula.imagen}" alt="">
            
          
</div>
        





         <h3>${pelicula.titulo}</h3>

         <div class="contenedor-star">
         <i class="fas fa-star ico-star"></i>
         <i class="fas fa-star ico-star"></i>
         <i class="fas fa-star ico-star"></i>
         <i class="fas fa-star ico-star"></i>
         <i class="fas fa-star ico-star-off"></i>
        </div>

         <p>${pelicula.duracion} min</p>
         
         
         
         
        </div>

   
</c:forEach>



    </div>

</div>

















		<jsp:include page="includes/footer.jsp"></jsp:include>

		<!-- /container -->

		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="${urlPublic}/js/codigo.js"></script>
</body>
</html>