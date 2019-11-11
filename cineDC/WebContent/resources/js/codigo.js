$(document).ready(function(){
	$(".btn-aceptar").click(function(){
		  $(".contenedor-modal").hide();
		})
		
		
		
$(".portadas").mouseover(function(){
 $(this).find(".capa-portada").show();
})

$(".portadas").mouseleave(function(){
  $(this).find(".capa-portada").hide();
})

});