<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/" var="urlRoot" />
<!-- FOOTER -->
<footer>


<div class="ancho-limite">

    <div class="caja-footer">
      <img class="footer-logo" src="${urlRoot}resources/images/logo-blanco.png" alt="">
      <p class="texto-f">Lorem ipsum dolor sit amet consectetur adipisicing elit. Saepe, quas ut ab exercitationem dicta magnam aperiam quae alias voluptatem quis veniam numquam accusamus amet explicabo maiores velit eos! Magnam, exercitationem!</p>
      <h2 class="redes-h2">Siguenos en:</h2>
      <a href="" class="icono-red"><i class="fab fa-facebook-f"></i></a>
      <a href="" class="icono-red"><i class="fab fa-twitter"></i></a>
      <a href="" class="icono-red"><i class="fab fa-youtube"></i></a>
      <a href="" class="icono-red"><i class="fab fa-google-plus-g"></i></a>
      <a href="" class="icono-red"><i class="fab fa-instagram"></i></a>
    </div>
    <div class="caja-footer">
     <h2 class="footer-h2 centrar">Categorias de peliculas</h2>

<div class="contenedor-f-ul">

     <ul>
         <li>Accion</li>
         <li>Aventura</li>
         <li>Drama</li>
         <li>Comedia</li>
         <li>Ficcion</li>
     </ul>
     <ul>
        <li>Animacion</li>
        <li>Deportivo</li>
        <li>Terro</li>
        <li>De Guerra</li>
        <li>Musical</li>
    </ul>

</div>
    </div>
    <div class="caja-footer">
    <h2 class="footer-h2">Novedades</h2>
    <p class="texto-f">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, sequi voluptates? Veritatis minima ad, cumque aliquid nulla labore error illo! Laudantium, sint assumenda. Architecto quas obcaecati, quam qui porro officia?</p>
    <input type="text" placeholder="INGRESAR EMAIL" class="input-f"> <i class="fas fa-long-arrow-alt-right flecha-f"></i>
    <h2 class="footer-h2">Descargar nuestra aplicacion</h2>
    <img class="logo-app" src="${urlRoot}resources/images/logo-playstore.png" alt="">
    <img class="logo-app" src="${urlRoot}resources/images/logo-appstore.png" alt="">
    </div>

<div class="linea-footer">
    <div class="linea-f-menu">
        <a href="">Nosotros</a>
        <a href="">Cartelera</a>
        <a href="">Promociones</a>
        <a href="">Contacto</a>
    </div>
    <div class="linea-f-creditos">
        <p>2019 Cinema DC Todos los derechos reservados </p>
    </div>
</div>

</div>

</footer>
