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
	<title>Login</title>
	<spring:url value="/resources" var="urlPublic" />	
	<spring:url value="/register/create" var="urlCreate" />	
	<spring:url value="/register/save" var="urlForm" />
	 
	<link rel="icon" type="image/png" href="${urlPublic}/images/favicon.png">
	

	
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway|Roboto:900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik:700&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="${urlPublic}/css/all.min.css">
    <link rel="stylesheet" href="${urlPublic}/css/estiloslogin.css">
	
	</head>

<body>

	
	
	 <c:if test="${msg !=null }">        
        		
        		
        		
        		    <div class="contenedor-modal">
<div class="ventana-modal">
    <h1> <i class="fas fa-check"></i>${msg}</h1>
    <a class="btn-aceptar">Aceptar</a>
</div>
</div>
        		
        </c:if>	
	
	
	
	<div class="fondov-claro">
</div>

<div class="fondo-claro">

        <jsp:include page="includes/menulogin.jsp"></jsp:include>

    
    <h3>Bienvenido!</h3>
    <p>Para mantenerse conectado con nosotros, inicie sesión  <br> con su información personal</p>


  <div class="contenedor-form-login">
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
                    <p>o use su correo electrónico para registrarse:</p>
                    </div>
                    
                    <form class="form-signin" action="j_security_check" method="post">
                    
        
                    <div class="contenedor-input">
                    <i class="fas fa-user"></i> 
                    <input type="text" id="j_username" name="j_username" class="form-control" placeholder="Usuario" required autofocus>       
                    </div>
        
                    <div class="contenedor-input">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="j_password" name="j_password" class="form-control" placeholder="Password" required>      
                    </div>
        
                    <div class="contenedor-input contenedor-input-m">
                            <a class="mensaje-password" href="${urlCreate}" title="Nuevo Usuario">¿Nuevo? Crear Cuenta</a>
                        </div>


                    <div class="mensaje-btn">
                        <button type="submit">Iniciar sesión</button>         
                        </div>
                        
                        
                      </form>  
                        
                        
        
            </div>
        
        
       
        
        
            <a href="" class="texto-izq">¿Se te olvidó tu contraseña?</a>
            <a href="${urlCreate}" title="Nuevo Usuario"  class="texto-der">Crear una nueva cuenta</a>
        
      
       
            </div>
         
   </div>

</div>

<div class="fondo-oscuro">
</div>
	
	
 

<script src="${urlPublic}/js/jquery-3.4.1.min.js"></script>
<script src="${urlPublic}/js/codigo.js"></script>
	
	
</body>
</html>










	
	
 

	




