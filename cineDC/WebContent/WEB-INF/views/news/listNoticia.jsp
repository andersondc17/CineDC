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
	<title>Lista de Noticias</title>
	<spring:url value="/resources" var="urlPublic" />
	

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
	


		<h3>Listado de Noticias</h3>
      
        <c:if test="${msg !=null }">        
        		<div class='alert alert-success' role='alert'>${msg}</div>
        </c:if> 
      
        <spring:url value="/news/edit" var="urlEdit" />
        <spring:url value="/news/delete" var="urlDelete" />
        <spring:url value="/news/create" var="urlCreate" />
        <a href="${urlCreate}" class="btn btn-success" role="button" title="Nueva noticia" >Nueva</a><br><br>        
      
        <div class="table-responsive">	
	        <table class="table table-hover table-striped table-bordered">
	          <tr>
	              <th>Id</th>
	              <th>Titulo</th>
	              <th>Fecha</th>
	              <th>Estatus</th>              
	              <th>Opciones</th>
	          </tr>
	
				<c:forEach var="noticia" items="${noticias}">
					<tr>
						<td>${noticia.id}</td>
						<td>${noticia.titulo}</td>
						<td><fmt:formatDate pattern="dd-MM-yyyy" value="${noticia.fecha}" /></td>
						<c:choose>
							<c:when test="${noticia.estatus eq 'Activa'}">
								<td><span class="label label-success">${noticia.estatus}</span></td>
							</c:when>
							<c:otherwise>
								<td><span class="label label-danger">${noticia.estatus}</span></td>
							</c:otherwise>
						</c:choose>								
						<td>
						   <a href="${urlEdit}/${noticia.id}" class="btn btn-success btn-sm" role="button" title="Edit"><span class="glyphicon glyphicon-pencil"></span></a>
							<a href="${urlDelete}/${noticia.id}" onclick='return confirm("¿Estas seguro?")' class="btn btn-danger btn-sm" role="button" title="Eliminar"><span class="glyphicon glyphicon-trash"></span></a>
					   </td>
					</tr>
				</c:forEach>
	
			</table>
		</div>

      <hr class="featurette-divider">
	</div>

   
	 <!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>