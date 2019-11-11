package com.harvard.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.harvard.app.model.Pelicula;
import com.harvard.app.service.IDetallePeliculaService;
import com.harvard.app.service.IPeliculasService;
import com.harvard.app.util.Utileria;


@Controller
@RequestMapping("/films/")
public class PeliculaController {
	
	// Inyectamos una instancia desde nuestro Root ApplicationContext
		@Autowired
		private IDetallePeliculaService serviceDetalles;
		
		// Inyectamos una instancia desde nuestro Root ApplicationContext
	    @Autowired
		private IPeliculasService servicePeliculas;
	    
	    
	    @GetMapping(value = "/index")
		public String mostrarIndex(Model model) {
			List<Pelicula> lista = servicePeliculas.buscarTodas();
			model.addAttribute("peliculas", lista);
			return "films/listPelicula";
		}
	    
	    @GetMapping(value = "/indexPagination")
		public String mostrarIndexPaginado(Model model, Pageable page) {
			Page<Pelicula> lista = servicePeliculas.buscarTodas(page);
			model.addAttribute("peliculas", lista);
			return "films/listPelicula";
		}
	    
	     
	    
	    @GetMapping(value = "/create")
		public String crear(@ModelAttribute Pelicula pelicula) {		
			return "films/formPelicula";
		}
	    
	    @PostMapping(value = "/save")
		public String guardar(@ModelAttribute Pelicula pelicula, BindingResult result, 
				@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request, RedirectAttributes attributes) {	
			
			if (result.hasErrors()){
				
				System.out.println("Existieron errores");
				return "films/formPelicula";
			}	
			
			if (!multiPart.isEmpty()) {
				String nombreImagen = Utileria.guardarImagen(multiPart,request);
				if (nombreImagen!=null){ // valida si la imagen se subio			
					pelicula.setImagen(nombreImagen); 
				}	
			}
			
			// Primero insertamos el detalle
		    serviceDetalles.insertar(pelicula.getDetalle());
		    
			// Como el Detalle ya tiene id, ya podemos guardar la pelicula
			servicePeliculas.insertar(pelicula);
			attributes.addFlashAttribute("msg", "Los datos de la pelicula fueron guardados!");
				
			
			return "redirect:/films/indexPagination";		
		}
	    
	    
	    @GetMapping(value = "/edit/{id}")
		public String editar(@PathVariable("id") int idPelicula, Model model) {		
			Pelicula pelicula = servicePeliculas.buscarPorId(idPelicula);			
			model.addAttribute("pelicula", pelicula);
			return "films/formPelicula";
		}
	    
	    @GetMapping(value = "/delete/{id}")
		public String eliminar(@PathVariable("id") int idPelicula, RedirectAttributes attributes) {
			
			Pelicula pelicula = servicePeliculas.buscarPorId(idPelicula);		
			
			// Eliminamos la pelicula, se borraran los Horarios (ON CASCADE DELETE)
			servicePeliculas.eliminar(idPelicula);
			
			// Eliminamos el registro del detalle
			serviceDetalles.eliminar(pelicula.getDetalle().getId());		
			attributes.addFlashAttribute("msg", "La pelicula fue eliminada!.");
			
			return "redirect:/films/indexPagination";
		}
	    
	    
	    
	    @ModelAttribute("generos")
		public List<String> getGeneros(){
			return servicePeliculas.buscarGeneros();
		}
	    
	    //Personalizamos el Data Binding para todas las propiedades de tipo Date
	    @InitBinder
		public void initBinder(WebDataBinder webDataBinder) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		}
	    
	    
	   

}
