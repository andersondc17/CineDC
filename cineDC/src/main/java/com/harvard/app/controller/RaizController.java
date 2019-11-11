package com.harvard.app.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.harvard.app.model.Banner;
import com.harvard.app.model.Horario;
import com.harvard.app.model.Noticia;
import com.harvard.app.model.Pelicula;
import com.harvard.app.service.IBannersService;
import com.harvard.app.service.IHorariosService;
import com.harvard.app.service.INoticiasService;
import com.harvard.app.service.IPeliculasService;
import com.harvard.app.util.Utileria;


@Controller
public class RaizController {
	
	
	//inyeccion de dependencia para el IBANNERSERVICE
	@Autowired
	private IBannersService serviceBannners;
	
	//inyeccion de dependencia para el INOTICIASERVICE
	@Autowired
	private INoticiasService serviceNoticias;
	
	
	//inyeccion de dependencia para el IPELICULAERVICE
	@Autowired
	private IPeliculasService servicePeliculas;
	
	//inyeccion de dependencia para el IHORARIOERVICE
	@Autowired
	private IHorariosService serviceHorarios;	
	
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	
	@GetMapping(value = "/")
	public String goRaiz(Model model) {
		
		try {
			Date fechaSinHora = dateFormat.parse(dateFormat.format(new Date()));
			List<String> listaFechas = Utileria.getNextDays(4);		
			List<Pelicula> peliculas = servicePeliculas.buscarPorFecha(fechaSinHora);			
			model.addAttribute("fechas", listaFechas);
			model.addAttribute("fechaBusqueda", dateFormat.format(new Date()));
			model.addAttribute("peliculas", peliculas);
		} catch (ParseException e) {
			System.out.println("Error: goRaiz()" + e.getMessage());
		}
		
		return "Raiz";
	}
	
	@PostMapping(value = "/filter")
	public String filtrarPeliculaEnCartelera(@RequestParam("fecha") Date fecha, Model model) {
		
		try {			
			System.out.println("entro al filtrado");
			Date fechaSinHora = dateFormat.parse(dateFormat.format(fecha));
			List<String> listaFechas = Utileria.getNextDays(4);
			List<Pelicula> peliculas  = servicePeliculas.buscarPorFecha(fechaSinHora);
			model.addAttribute("fechas", listaFechas);			
			// Regresamos la fecha que selecciono el usuario con el mismo formato
			model.addAttribute("fechaBusqueda",dateFormat.format(fecha));			
			model.addAttribute("peliculas", peliculas);			
			return "Raiz";
		} catch (ParseException e) {
			System.out.println("Error: filtrarPeliculaEnCartelera()" + e.getMessage());
		}
		
		return "Raiz";
	}
	
	
	
    @GetMapping(value = "/peliculas")
			public String mostrarPeliculas(Model model) {
		try {
			Date fechaSinHora = dateFormat.parse(dateFormat.format(new Date()));
			List<String> listaFechas = Utileria.getNextDays(4);		
			List<Pelicula> peliculas = servicePeliculas.buscarPorFecha(fechaSinHora);			
			model.addAttribute("fechas", listaFechas);
			model.addAttribute("fechaBusqueda", dateFormat.format(new Date()));
			model.addAttribute("peliculas", peliculas);
		} catch (ParseException e) {
			System.out.println("Error: goRaiz()" + e.getMessage());
		}
		
		return "cartelera";
		}
		   
	
    
	
	@GetMapping(value = "/detailBillboard/{id}/{fecha}")
	public String mostrarDetalle(@PathVariable("id") int idPelicula, @PathVariable("fecha") Date fecha, Model model) {
		//Buscar en la base de datos los horarios.		
		List<Horario> horarios= serviceHorarios.buscarPorIdPelicula(idPelicula, fecha);
		model.addAttribute("horarios", horarios);
		model.addAttribute("fechaBusqueda", dateFormat.format(fecha));
		model.addAttribute("pelicula", servicePeliculas.buscarPorId(idPelicula));		
		return "detalleCartelera";
	}
	
	
	@ModelAttribute("banners")
	public List<Banner> getBanners(){
		return serviceBannners.buscarActivos();
	}
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {				
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@ModelAttribute("noticias")
	public List<Noticia> getNoticias(){
		return serviceNoticias.buscarUltimas();
	}
}
