<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Creacion de Horarios</title>
	<spring:url value="/resources" var="urlPublic" />	
	<spring:url value="/schedule/save" var="urlForm" />
		
<link rel="icon" type="image/png" href="${urlPublic}/images/favicon.png">
<link href="${urlPublic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${urlPublic}/css/all.min.css">
<link rel="stylesheet" href="${urlPublic}/css/estilos-adm.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway|Roboto:900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik:700&display=swap" rel="stylesheet">

    
	</head>

<body>

	<jsp:include page="../includes/menuadmin.jsp" />
	
	<div class="caja-contenedor-admin">

	  <h3 class="blog-title"><span class="label label-success">Datos del Horario</span></h3>
	  
	  <spring:hasBindErrors name="horario">
			<div class='alert alert-danger' role='alert'>
			Por favor corrija los siguientes errores:
				<ul>
					<c:forEach var="error" items="${errors.allErrors}">
						<li><spring:message message="${error}" /></li>
					</c:forEach>
				</ul>				
			</div>
		</spring:hasBindErrors>		
	  
	  <form:form action="${urlForm}" method="POST" modelAttribute="horario" >
        <div class="row">         
          <div class="col-sm-3">
            <div class="form-group">
              <label for="idPelicula" class="control-label">Pelicula</label>
              <form:hidden path="id"/>              
              <form:select id="idPelicula" path="pelicula.id"	class="form-control" items="${peliculas}" itemLabel="titulo" 
              itemValue="id" />           
            </div> 
          </div>
        </div>
        <div class="row"> 
          <div class="col-sm-3">
            <div class="form-group">
              <label for="fecha">Fecha</label>             
              <form:input type="text" class="form-control" path="fecha" id="fecha" required="required"/>
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="hora">Hora</label>
              <form:input type="text" class="form-control" path="hora" id="hora" placeholder="Formato: HH:mm Ejemplo 21:30" required="required"/>
            </div>  
          </div>
          
          
         <div class="row">         
          <div class="col-sm-3">
            <div class="form-group">
              <label for="sala" class="control-label">Sala</label>             
              <form:select id="sala" path="sala"	class="form-control" items="${salas}" itemLabel="descripcion" 
              itemValue="descripcion" />           
              
              
              
            </div> 
          </div>
        </div>
          
          
          <div class="col-sm-3">
            <div class="form-group">
              <label for="precio">Precio</label>
              
            
              
              <form:input type="text" class="form-control" path="precio" value="0" id="precio" required="required"/>
            </div>  
          </div>
               
        </div>
       
        <button type="submit" class="btn btn-danger" >Guardar</button>
      </form:form> 

      <hr class="featurette-divider">

	</div> <!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
      $(function () {
         $("#fecha").datepicker({dateFormat: 'dd-mm-yy'});       
        }
      );
    </script>
</body>
</html>