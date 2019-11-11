<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Administracion | Cine DC</title>
    <spring:url value="/resources" var="urlPublic" />
    <link rel="icon" type="image/png" href="${urlPublic}/images/favicon.png">
    <link rel="stylesheet" href="${urlPublic}/css/all.min.css">
    <link rel="stylesheet" href="${urlPublic}/css/estilos-adm.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway|Roboto:900&display=swap" rel="stylesheet">
</head>
<body>



<jsp:include page="includes/menuadmin.jsp"></jsp:include>



    <div class="fondo-admin">

     <div class="fondo-letras">
       <h1>Hola <label>${usuario.name}</label></h1>
       <p>Esta es tu página de perfil. Puede ver el progreso que ha logrado con <br>
         su trabajo y administrar sus proyectos o tareas asignadas</p>
        <a href="#">Editar Perfil</a> 
    </div>   

         <img src="${urlPublic}/images/portada.jpg" alt="">
    </div>





    <div class="contenedor-datos">
         <div class="caja-datos">

                <div class="resumen-dato">

                        <div class="contenedor-resumen">
     
                             <div class="c-resumen">
                                     <a href="#" class="btn-conectar">Conectar</a>
                                 </div>
     
                         <div class="c-resumen">
                             <img src="${urlPublic}/images/perfil.jpg" alt="">
                         </div>
     
                             <div class="c-resumen">
                                     <a href="#" class="btn-mensaje">Mensaje</a>
                                 </div>
                        </div>
                       
     
                        <div class="resultados">
                              <ul>
                                  <li> <span class="numero">22</span>  Amigos </li>
                                  <li> <span class="numero">10</span>  Fotos </li>
                                  <li> <span class="numero">89</span>  Comentarios </li>
                              </ul>
                        </div> 
     
     
                       <div class="resumen-nombre">
                              <p>Jessica Jones<label for="" class="rnumero">, 27</label> <br>
                                   <label for="" class="rdireccion">Bucharest, Romania  </label></p>
                       </div>
     
     
     
                  </div>

             <div class="registro-dato">

                <div class="titulo-dato">
                      <div class="tcuenta">
                            <h2>Mi Cuenta</h2>
                      </div>  

                      <div class="tajustes">
                          <a href="#">Ajustes</a>
                      </div>
                       
                </div>



                <div class="info-user">
                        <h3>INFORMACION DEL USUARIO</h3>

                        <div class="contenedor-input">
                          <label for="">Usuario</label>
                          <input type="text">
                        </div>

                        <div class="contenedor-input">
                          <label for="">Correo</label>
                          <input type="text">
                        </div>

                        <div class="contenedor-input">
                          <label for="">Nombre</label>
                          <input type="text" value="${usuario.name}">
                        </div>

                        <div class="contenedor-input">
                          <label for="">Apellido</label>
                          <input type="text">
                        </div>

                      <hr>

                      <h3>INFORMACIÓN DE CONTACTO</h3>

                        <div class="contenedor-input">
                          <label for="">Dirección</label>
                          <input type="text">
                        </div>

                        <div class="contenedor-input">
                          <label for="">Ciudad</label>
                          <input type="text">
                        </div>

                        <div class="contenedor-input">
                          <label for="">Pais</label>
                          <input type="text">
                        </div>

                        <div class="contenedor-input">
                          <label for="">Codigo Postal</label>
                          <input type="text">
                        </div>

                </div>
                   
                


             </div>
          
         </div>
    </div>



    <script src="${urlPublic}/js/jquery-3.4.1.min.js"></script>
    <script src="${urlPublic}/js/codigoadmin.js"></script>

</body>
</html>