<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>Creacion de Usuario - DC</title>
	<spring:url value="/resources" var="urlPublic" />
	<spring:url value="/register/save" var="urlForm" />
	 
	<link rel="icon" type="image/png" href="${urlPublic}/images/favicon.png">
	

	
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway|Roboto:900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik:700&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${urlPublic}/css/all.min.css">
    <link rel="stylesheet" href="${urlPublic}/css/estiloslogin.css">
	
	</head>

<body>

	
	
	<div class="fondov-claro">
</div>

<div class="fondo-claro">

        <jsp:include page="../includes/menulogin.jsp"></jsp:include>

              

    <h3>Bienvenido!</h3>
    <p>Para mantenerse conectado con nosotros, inicie sesión  <br> con su información personal</p>



    <div class="general-form">

            <div class="contenedor-form">
        
                
                    <div class="mensaje-cuenta">
        
                    <p>Inicia sesión con</p>
        
          <div class="conectar-red">
               <a href=""> <img src="${urlPublic}/images/facebook.svg" alt=""> <span>facebook</span></a>
               <a href=""> <img src="${urlPublic}/images/google.svg" alt=""> <span>Google</span></a>
          </div>
        
          <br>
            <hr> 
          <br>
     
                    </div>
                    
                    
                    	<spring:hasBindErrors name="rol">
			<div class='alert alert-danger' role='alert'>
			Por favor corrija los siguientes errores:
				<ul>
					<c:forEach var="error" items="${errors.allErrors}">
						<li><spring:message message="${error}" /></li>
					</c:forEach>
				</ul>
				<!-- 
				<form:errors path="rol.*" cssClass="error" />
				-->
			</div>
		</spring:hasBindErrors>
                    
                    
                    
                      <form:form action="${urlForm}" method="POST" enctype="multipart/form-data" modelAttribute="rol" >
                    
        
          <form:hidden class="form-control" path="id"/>
               <form:hidden class="form-control" path="usuario.id"/>
               <form:hidden class="form-control" path="username"/>
        
        
                    <div class="contenedor-input">
                    <i class="fas fa-user"></i> 
                     <form:input type="text" class="form-control" path="usuario.nombre" id="nombre" required="required"  placeholder="Nombre"/>     
                    </div>
        
        
        
                    <div class="contenedor-input">
                    <i class="fas fa-envelope"></i> 
                      <form:input type="text" class="form-control" path="usuario.email" id="email" required="required" placeholder="Correo"/>      
                    </div>
        
                    <div class="contenedor-input">
                    <i class="fas fa-user"></i>
                    <form:input type="text" class="form-control" path="usuario.username" id="username" required="required"  placeholder="Usuario"/>
                    </div>
        
        
        <div class="contenedor-input">
                    <i class="fas fa-lock"></i>
                    <form:input type="text" class="form-control" path="usuario.password" id="password" required="required"  placeholder="Password"/>  
                    </div>
        
        
        
        
        <div class="ocultar">
             <div class="col-sm-3">
            <div class="form-group">
              <label for="imagen">Imagen</label>
              <input type="file" id="archivoImagen" name="archivoImagen" />              
              <form:hidden path="imagen" />
              <p class="help-block">Imagen de Usuario</p>
            </div> 
          </div>
        </div>
        
        

                    <div class="mensaje-btn">
                        <button type="submit">Registrar</button>         
                        </div>
                       
                       
                       
                       
                        
                        
                   </form:form> 
                        
                        
        
            </div>
        
            <a href="" class="texto-izq">¿Se te olvidó tu contraseña?</a>
            <a href="../${urlRoot}admin/index" title="Nuevo Usuario"  class="texto-der">Iniciar Sesion</a>
        
            </div>
        


</div>

<div class="fondo-oscuro">
</div>
	
	
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${urlPublic}/bootstrap/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
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










	
	
 

	




