

$(document).ready(function(){

 $('.barra-datos').click(function(){
    $('.caja-opciones').slideToggle();
 })

 
 
 
 var scroll = $(window).scrollTop();

 
 $(window).scroll(function(event) {
	 
     var scroll = $(window).scrollTop();
     
   
     
     if(scroll!=0){
         $('.barra').css({ background: '#fff'});
         $('.barra-izq h3').css("color","#525f7f");
         $('.barra-datos p').css("color","#525f7f");    
     }else{
         $('.barra').css({ background: 'unset'});
         $('.barra-izq h3').css("color","white");
         $('.barra-datos p').css("color","white");  
     }
     
     console.log(scroll+'hola');
     
 });
 
 
 
});
