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


import com.harvard.app.model.Sala;

import com.harvard.app.service.ISalasService;

@Controller
@RequestMapping(value = "/rooms/")
public class SalaController {

	@Autowired
	private ISalasService serviceSalas;
	
	//INDEX DE LA SALA
	@GetMapping(value = "/index")
	public String mostrarIndex(Model model) {
		
		List<Sala> listaSalas = serviceSalas.buscarTodas();
		model.addAttribute("salas", listaSalas);
		
		return "rooms/listSala";
	}
	
	//ENVIAR MODELO(CLASE SALA) NUEVO AL FORMULARIO SALA
	
	@GetMapping(value = "/create")
	public String crear(@ModelAttribute Sala sala) {
		
		return "rooms/formSala";
	}
	
	@PostMapping(value = "/save")
	public String guardar(@ModelAttribute Sala sala, BindingResult result, RedirectAttributes attributes) {
		
		//grabar sala
		
		serviceSalas.guardar(sala);
		attributes.addFlashAttribute("msg", "Los datos de la sala fueron guardados!");
		return "redirect:/rooms/index";
	}
	
	
	//metodo para eliminar clase sala
	@GetMapping(value = "/delete/{id}")
	public String eliminar(@PathVariable("id") int idSala, RedirectAttributes attributes) {
		serviceSalas.eliminar(idSala);
		attributes.addFlashAttribute("msg", "La Sala fue eliminada!.");
		return "redirect:/rooms/index";
	}
	
	//metodo para editar clase sala
	
	@GetMapping(value = "/edit/{id}")
	public String editar(@PathVariable("id") int idSala, Model model) {
		Sala sala= serviceSalas.buscarPorId(idSala);
		model.addAttribute("sala", sala);
		return "rooms/formSala";
	}
	
}
