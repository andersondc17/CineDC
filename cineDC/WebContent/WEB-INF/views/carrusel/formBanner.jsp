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
      <title>Creacion de imagenes del Banner</title>    
	   <spring:url value="/resources" var="urlPublic" />
	   <spring:url value="/carrusel/save" var="urlForm" />
	   
  

      
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


      <div class="container theme-showcase" role="main">

         <h3 class="blog-title"><span class="label label-success">Datos de la imagen</span></h3>

         <form:form action="${urlForm}" method="post" modelAttribute="banner" enctype="multipart/form-data">
         
			<!-- Ya traemos el objeto banner, por lo tanto tambien traemos la imagen. Podemos aprovechar que ya traemos
				la imagen del banner. La mostramos en un tag <img>. Solo llamamos ${banner.archivo}
			-->
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-default">
						<div class="panel-body">
							<img class="img-responsive" src="${urlPublic}/images/${banner.archivo}" title="Vista preliminar" id="blah">
						</div>
					</div>
				</div>
			</div>
			
			<!-- Inician los inputs del form -->
			<div class="row">              
               <div class="col-sm-6">
                  <div class="form-group">
                     <label for="titulo">Titulo</label> 
                     <form:hidden path="id"/>            
                     <form:input type="text" class="form-control" path="titulo" id="titulo" required="required"/>
                  </div>
               </div>

               <div class="col-sm-3">
                  <div class="form-group">
                     <label for="imagen">Imagen</label>
                     
                     <c:choose>                     
                     	<c:when test="${banner.id == 0}">
                     		<input type="file" id="archivoImagen" name="archivoImagen" required="required"/>
                     	</c:when>
                     	<c:otherwise>
                     		<input type="file" id="archivoImagen" name="archivoImagen"/>
                     	</c:otherwise>                     
                     </c:choose>
                                                                                    
                     <form:hidden path="archivo" />
                     <p class="help-block">Tamaño recomendado: 1140 x 250 </p>
                  </div> 
               </div> 

               <div class="col-sm-3">
                  <div class="form-group">
                     <label for="estatus">Estatus</label>             
                     <form:select id="estatus" path="estatus" class="form-control">
                        <form:option value="Activo">Activo</form:option>
                        <form:option value="Inactivo">Inactivo</form:option>                
                     </form:select>  
                  </div>
               </div>
            </div>

            <button type="submit" class="btn btn-danger" >Guardar</button>
         </form:form> 

         <hr class="featurette-divider">

 </div>


      </div> <!-- /container -->

   
   
      <!-- Bootstrap core JavaScript
      ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
      <script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script> 
      
      
      <script>

      function readURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              
              reader.onload = function (e) {
                  $('#blah').attr('src', e.target.result);
              }
              
              reader.readAsDataURL(input.files[0]);
          }
      }
      
      $("#archivoImagen").change(function(){
          readURL(this);
      });
      </script>

   </body>
</html>
