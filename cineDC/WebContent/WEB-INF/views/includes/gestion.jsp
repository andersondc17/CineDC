<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/" var="urlRoot" />


    <div class="columna-izq">
        <div class="caja-h2-admi">
         <a href="${urlRoot}">
        <img src="${urlRoot}/resources/images/logo-blanco.png" alt="">
        </a>
        </div>
<div class="contenedor-columna">
         <a href="#"> <i class="fas fa-user-cog"></i> Perfil</a>
         <a href="#"> <i class="fas fa-user"></i> Usuarios</a>
         <a href="#"> <i class="fas fa-photo-video"></i> Peliculas</a>  
         <a href="${urlRoot}carrusel/index"> <i class="fas fa-photo-video"></i> Banners</a> 
         <a href="#"> <i class="fas fa-couch"></i> Salas</a>
         <a href="${urlRoot}news/index"> <i class="far fa-newspaper"></i> Noticias</a> 
         <a href="#"> <i class="fas fa-ticket-alt"></i> Pedidos</a>
         <a href="#"> <i class="far fa-calendar-alt"></i> Reportes</a>
        </div>


    

    </div>

    <div class="barra">
         <div class="barra-der">

                <div class="barra-datos">
                        <p>Nombre Apellido</p>
                        <div class="barra-img">
                        <img src="${urlRoot}/resources/images/perfil.jpg" alt="">
                        </div>
                    </div>

                   <div class="barra-iconos">
                       <i class="fas fa-bell"></i>
                       <i class="fas fa-envelope"></i>
                   </div>

                
         </div>
    </div>

