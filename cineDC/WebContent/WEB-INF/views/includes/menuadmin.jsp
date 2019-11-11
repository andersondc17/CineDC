  <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/" var="urlRoot" />
  
    <div class="columna-izq">
        <div class="caja-h2-admi"><a href="${urlRoot}"><img src="${urlRoot}/resources/images/logo.png" alt=""></a></div>
<div class="contenedor-columna">


     <c:choose>
	<c:when test="${usuario.hasRole('usuario')}">				

         <a href="#"> <i class="fas fa-user-cog i-perfil"></i> Perfil</a>
         <a href="#"> <i class="fas fa-users i-users"></i> Amigos</a>
         <a href="#"> <i class="fas fa-photo-video i-movie"></i> Peliculas</a>  
         <a href="#"> <i class="fas fa-ticket-alt i-pedido"></i> Pedidos</a>       
     </c:when>
         
        
        	<c:when test="${usuario.hasRole('Administrador')}">	
        	
        	
        	 <a href="${urlRoot}admin/index"> <i class="fas fa-user-cog i-perfil"></i> Perfil</a>
         <a href="#"> <i class="fas fa-user i-users"></i> Usuarios</a>
         <a href="${urlRoot}films/indexPagination?page=0"> <i class="fas fa-photo-video i-movie"></i> Peliculas</a>  
         <a href="${urlRoot}carrusel/index"> <i class="fas fa-photo-video i-banner"></i> Banners</a> 
         <a href="${urlRoot}rooms/index"> <i class="fas fa-couch i-sala"></i> Salas</a>
          <a href="${urlRoot}news/index"> <i class="far fa-newspaper"></i> Noticias</a> 
         <a href="${urlRoot}schedule/indexPagination?page=0"> <i class="fas fa-ticket-alt i-pedido"></i> Horarios</a>       
         <a href="#"> <i class="far fa-calendar-alt i-reporte"></i> Reportes</a>
        	
        			
        </c:when>
		</c:choose> 
         
        </div>

    </div>
    
    
    
    
        <div class="barra">
      

              <div class="barra-izq">
                  <h3>Perfil de Usuario</h3>
              </div>


                <div class="barra-datos">
                        <div class="barra-img">
                                <img src="${urlRoot}/resources/images/perfil.jpg" alt="">
                                </div>
                        <p>Nombre Apellido</p>
                </div>

           
                <div class="caja-opciones">
                        <p class="texto-opciones">Bienvenido!</p> 
                         <ul>
                             <li><a href="${urlRoot}admin/index"> <i class="fas fa-user"></i> Mi Perfil</a></li>
                             <li><a href=""> <i class="fas fa-cog"></i> Opciones</a></li>
                             <li><a href=""> <i class="far fa-calendar-alt"></i> Actividad</a></li>
                             <li><a href=""> <i class="fas fa-folder-open"></i> Reportes</a></li>
                            
                             <li> <hr><a href="${urlRoot}/admin/logout"> <i class="fas fa-sign-out-alt"></i> Salir</a></li>
                         </ul>
                      </div>
                       


         
    </div>
    