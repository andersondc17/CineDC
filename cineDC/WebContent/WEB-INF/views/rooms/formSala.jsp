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
	<title>Creacion de Salas</title>
	<spring:url value="/resources" var="urlPublic" />
	<spring:url value="/rooms/save" var="urlForm" />
	

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

		<div class="page-header">
          <h3 class="blog-title"><span class="label label-success">Datos de la Sala</span></h3>
      </div>

		<spring:hasBindErrors name="sala">
			<div class='alert alert-danger' role='alert'>
			Por favor corrija los siguientes errores:
				<ul>
					<c:forEach var="error" items="${errors.allErrors}">
						<li><spring:message message="${error}" /></li>
					</c:forEach>
				</ul>
				<!-- 
				<form:errors path="sala.*" cssClass="error" />
				-->
			</div>
		</spring:hasBindErrors>

      <form:form action="${urlForm}" method="POST" enctype="multipart/form-data" modelAttribute="sala" >   		 	
        
        
        <!-- Inician los inputs del form -->
        <div class="row">
          <div class="col-sm-3">
            <div class="form-group">
              <label for="descripcion">Descripcion</label>
              <form:hidden class="form-control" path="id"/>
              <form:input type="text" class="form-control" path="descripcion" id="descripcion" required="required" />
            </div>  
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="precio">Precio</label>
              <form:input type="text" class="form-control" path="precio" id="precio" required="required"/>
            </div>  
          </div>
          
          <div class="col-sm-3">
            <div class="form-group">
              <label for="capacidad">Capacidad</label>
              <form:input type="text" class="form-control" path="capacidad" id="capacidad" required="required"/>
            </div>  
          </div>
          
          
          <div class="col-sm-3">
            <div class="form-group">
              <label for="tipo" class="control-label">Tipo</label>              
              <form:select id="tipo" path="tipo" class="form-control">
                <form:option value="A">Tipo 1</form:option>
                <form:option value="B">Tipo 2</form:option>
                <form:option value="C">Tipo 3</form:option>                  
              </form:select>             
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
  
</body>
</html>