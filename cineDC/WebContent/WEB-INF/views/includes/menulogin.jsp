<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/" var="urlRoot" />


<nav>





                <div class="contenedor-menu">
                
                <div class="ancho-limite">
                
                <div class="logo">
                  <a href="${urlRoot}"><img src="${urlRoot}/resources/images/logo-blanco.png" alt=""></a>
                </div>
                
                <div class="li-menu">
                    <a href="${urlRoot}"><i class="fas fa-home"></i> Inicio</a>
                    <a href=""><i class="fas fa-users"></i> Nosotros</a>
                    <a href="${urlRoot}peliculas"><i class="fas fa-film"></i> Cartelera</a>
                    <a href=""><i class="far fa-newspaper"></i> Noticias</a>
                    <a href=""><i class="fas fa-envelope"></i> Contacto</a>
                </div>
                
              
                
                </div>
                
                </div>
                
                   
                
                </nav>