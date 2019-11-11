package com.harvard.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.harvard.app.model.Horario;
import com.harvard.app.model.Pelicula;
import com.harvard.app.model.Sala;
import com.harvard.app.service.IHorariosService;
import com.harvard.app.service.IPeliculasService;
import com.harvard.app.service.ISalasService;







@Controller
@RequestMapping(value="/schedule")
public class HorarioController {

	// Inyectamos una instancia desde nuestro Root ApplicationContext
			@Autowired
			private ISalasService serviceSalas;
	
	// Inyectamos una instancia desde nuestro Root ApplicationContext
		@Autowired
		private IPeliculasService servicePeliculas;
		
		// Inyectamos una instancia desde nuestro Root ApplicationContext
		@Autowired
		private IHorariosService serviceHorarios;
		
		
		@GetMapping(value = "/indexPagination")
		public String mostrarIndexPaginado(Model model, Pageable page) {
			Page<Horario> listaHorarios = serviceHorarios.buscarTodos(page);
			model.addAttribute("horarios", listaHorarios);
			return "schedule/listHorario";
		}
		
		
		@GetMapping(value = "/create")
		public String crear(@ModelAttribute Horario horario) {		
			return "schedule/formHorario";
		}
		
		
		@PostMapping(value = "/save")
		public String guardar(@ModelAttribute Horario horario, BindingResult result, Model model, RedirectAttributes attributes) {				
			
			if (result.hasErrors()){
				List<Pelicula> listaPeliculas = servicePeliculas.buscarActivas();
				model.addAttribute("peliculas", listaPeliculas);
				return "schedule/formHorario";
			}
			
			serviceHorarios.insertar(horario);
			attributes.addFlashAttribute("msg", "El horario fue guardado!");
			//return "redirect:/horarios/index";
			return "redirect:/schedule/indexPagination";
		}
		
		
		
		@GetMapping(value = "/edit/{id}")
		public String editar(@PathVariable("id") int idHorario, Model model) {		
			Horario horario = serviceHorarios.buscarPorId(idHorario);			
			model.addAttribute("horario", horario);
			return "schedule/formHorario";
		}
		
		
		
		@GetMapping(value = "/delete/{id}")
		public String eliminar(@PathVariable("id") int idHorario, RedirectAttributes attributes) {
			serviceHorarios.eliminar(idHorario);
			attributes.addFlashAttribute("msg", "El horario fue eliminado!");
			return "redirect:/schedule/indexPagination";
		}
		
		
		@ModelAttribute("peliculas")
		public List<Pelicula> getPeliculas(){
			return servicePeliculas.buscarActivas();
		}
		
		@ModelAttribute("salas")
		public List<Sala> getSalas(){
			return serviceSalas.buscarTodas();
		}
		
		
		@InitBinder("horario")
		public void initBinder(WebDataBinder binder) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		}
		
}
