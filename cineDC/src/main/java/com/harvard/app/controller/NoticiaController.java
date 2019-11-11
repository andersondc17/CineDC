package com.harvard.app.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.harvard.app.model.Noticia;
import com.harvard.app.service.INoticiasService;

@Controller
@RequestMapping(value = "/news/")
public class NoticiaController {

	// Inyectamos una instancia desde nuestro Root ApplicationContext
	@Autowired
	private INoticiasService serviceNoticias;

	// Metodo que muestra la lista de noticias
	@GetMapping(value = "/index")
	public String mostrarIndex(Model model) {
		List<Noticia> listaNoticias = serviceNoticias.buscarTodas();
		model.addAttribute("noticias", listaNoticias);
		return "news/listNoticia";
	}

	
	
	
	@GetMapping(value = "/create")
	public String crear(@ModelAttribute Noticia noticia) {
		return "news/formNoticia";
	}

	
	
	/**
	 * Metodo para guardar el registro de la Noticia
	 */
	@PostMapping(value = "/save")
	public String guardar(@ModelAttribute Noticia noticia, BindingResult result, Model model,
			RedirectAttributes attributes) {
		// Insertamos la noticia
		serviceNoticias.guardar(noticia);
		attributes.addFlashAttribute("msg", "Los datos de la noticia fueron guardados!");
		return "redirect:/news/index";
	}

	
	
	
	/**
	 * Metodo para eliminar una noticia
	 */
	@GetMapping(value = "/delete/{id}")
	public String eliminar(@PathVariable("id") int idNoticia, RedirectAttributes attributes) {
		serviceNoticias.eliminar(idNoticia);
		attributes.addFlashAttribute("msg", "La noticia fue eliminada!.");
		return "redirect:/news/index";
	}

	
	
	/**
	 * Metodo para mostrar el formulario de Editar
	
	 */
	@GetMapping(value = "/edit/{id}")
	public String editar(@PathVariable("id") int idNoticia, Model model) {
		Noticia noticia = serviceNoticias.buscarPorId(idNoticia);
		model.addAttribute("noticia", noticia);
		return "news/formNoticia";
	}

}
