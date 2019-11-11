<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<meta name="description" content="">
	<meta name="author" content="">		
	<title>Listado de Peliculas</title>
	<spring:url value="/resources" var="urlPublic" />
	<spring:url value="/films" var="urlPeliculas" />
	
	<link rel="icon" type="image/png" href="${urlPublic}/images/favicon.png">
<link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${urlPublic}/css/all.min.css">
<link rel="stylesheet" href="${urlPublic}/css/estilos-adm.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway|Roboto:900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik:700&display=swap" rel="stylesheet">
	
	</head>
	
<body>

	<jsp:include page="../includes/menuadmin.jsp"></jsp:include>
	
	
	<div class="caja-contenedor-admin">
	


		<h3>Listado de Peliculas</h3>
      
        <c:if test="${msg !=null }">        
        		<div class='alert alert-success' role='alert'>${msg}</div>
        </c:if>	
              
        <a href="${urlPeliculas}/create" class="btn btn-success" role="button" title="Nueva Pelicula" >Nueva</a><br><br>        
      
        <div class="table-responsive">
	        <table class="table table-hover table-striped table-bordered">
	          <tr>
	              <th>Titulo</th>
	              <th>Genero</th>
	              <th>Clasificacion</th>
	              <th>Duracion</th>
	              <th>Fecha Estreno</th>
	              <th>Estatus</th>
	              <th>Opciones</th>
	          </tr>
	
				<c:forEach var="pelicula" items="${peliculas.content}">
					<tr>
						<td>${pelicula.titulo}</td>
						<td>${pelicula.genero}</td>
						<td>${pelicula.clasificacion}</td>
						<td>${pelicula.duracion} min.</td>
						<td><fmt:formatDate pattern="dd-MM-yyyy"
								value="${pelicula.fechaEstreno}" /></td>
						<c:choose>
							<c:when test="${pelicula.estatus eq 'Activa'}">
								<td><span class="label label-success">${pelicula.estatus}</span></td>
							</c:when>
							<c:otherwise>
								<td><span class="label label-danger">${pelicula.estatus}</span></td>
							</c:otherwise>
						</c:choose>
						<td>
							<a href="${urlPeliculas}/edit/${pelicula.id}" class="btn btn-success btn-sm" role="button" title="Edit"><span class="glyphicon glyphicon-pencil"></span></a>
							<a href="${urlPeliculas}/delete/${pelicula.id}" onclick='return confirm("�Estas seguro?")' class="btn btn-danger btn-sm" role="button" title="Eliminar"><span class="glyphicon glyphicon-trash"></span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<nav aria-label="">
		  <ul class="pager">
		    <li><a href="${urlPeliculas}/indexPagination?page=${peliculas.number - 1 }">Anterior</a></li>
		    <li><a href="${urlPeliculas}/indexPagination?page=${peliculas.number + 1 }">Siguiente</a></li>
		  </ul>
		</nav>

      <hr class="featurette-divider">



	 <!-- /container -->

</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>