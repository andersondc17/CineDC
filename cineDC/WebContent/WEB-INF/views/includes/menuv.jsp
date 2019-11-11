<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/" var="urlRoot" />
<spring:url value="/register" var="urlPerfil" />
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

   
    
	 <c:choose>
			<c:when test="${usuario.hasRole('usuario')}">				
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"	data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${urlRoot}admin/index">Panel Administrativo</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="#">Reservas</a></li>
						<li><a href="#">Perfil de ${usuario.name}</a></li>
						<li><a href="${urlRoot}admin/logout">Salir</a></li>
					</ul>
				</div>
			</c:when>
			
			<c:when test="${usuario.hasRole('Administrador')}">				
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"	data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${urlRoot}admin/index">Panel Administrativo</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="${urlRoot}films/indexPagination?page=0">Peliculas</a></li>
						<li><a href="${urlRoot}schedule/indexPagination?page=0">Horarios</a></li>
						<li><a href="${urlRoot}news/index">Noticias</a></li>
						<li><a href="${urlRoot}carrusel/index">Banner</a></li>				
						<li><a href="${urlRoot}rooms/index">Salas</a></li>	
						<li><a href="#">Reportes</a></li>		
						<li><a href="${urlRoot}admin/logout">Salir</a></li>
					</ul>
				</div>
			</c:when>
	  
	  		<c:otherwise>	
	  		
	  					


    <a href="${urlRoot}">Inicio</a>
    <a href="">Nosotros</a>
    <a href="">Promociones</a>
    <a href="">Noticias</a>
    <a href="">Contacto</a>

				
				
				
			</c:otherwise>
	  
		</c:choose>
</div>

<div class="pedido">

    <i class="fas fa-ticket-alt"></i>
    <i class="fas fa-search"></i>
   

</div>

</div>

</div>

   

</nav>
