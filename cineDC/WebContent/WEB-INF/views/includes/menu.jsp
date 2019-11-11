<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/" var="urlRoot" />
<!-- Fixed navbar -->





<nav>

        <div class="datos-info-movil">
        <ul>
                <li class="li-icono"><i class="fas fa-bars"></i></li>
                <li class="li-icono"><i class="fas fa-search"></i></li>
                <li class="li-logo"><img src="${urlRoot}/resources/images/logo-blanco.png" alt=""></li>
                <li class="li-icono"><i class="fas fa-ticket-alt"></i></li>
                <li class="li-icono"><i class="fas fa-door-open"></i></li>
        </ul>
            </div>


<div class="contenedor-info">

<div class="ancho-limite">


    <div class="caja-datos">
     <ul>
     <li><i class="fas fa-phone-alt"></i> &nbsp; 934567890 &nbsp;&nbsp;</li>
     <li><i class="fas fa-envelope"></i>  &nbsp; cinemadc@gmail.com</li>
     </ul> 
    </div>

    <div class="caja-ingresar">
      <a href="${urlRoot}admin/index">

    Únete / Ingresar  &nbsp;&nbsp; <i class="fas fa-door-open"></i>
     
    </a>  
    </div>     


</div>

</div>


<div class="contenedor-menu">

<div class="ancho-limite">

<div class="logo">
   <a href="${urlRoot}">
    <img src="${urlRoot}resources/images/logo.png" alt=""></a>
</div>

<div class="li-menu">

    <a href="${urlRoot}">Inicio</a>
    <a href="">Nosotros</a>
    <a href="${urlRoot}peliculas">Cartelera</a>
    <a href="">Noticias</a>
    <a href="">Contacto</a>

</div>

<div class="pedido">

    <i class="fas fa-ticket-alt"></i>
    <i class="fas fa-search"></i>
   

</div>

</div>

</div>

   

</nav>
