package com.harvard.app.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.harvard.app.model.Rol;
import com.harvard.app.service.IRolService;
import com.harvard.app.service.IUsuarioService;
import com.harvard.app.util.Utileria;


@Controller
@RequestMapping(value="/register")
public class RolController {
	
	/**ESTE CONTROLADOR GESTIONA EL REGISTRO DEL USUARIO Y POSTERIORMENTE LA ASIGNACION DE ROLES **/
	/**ESTE CONTROLADOR GESTIONA EXCLUSIVAMENTE EL REGISTRO DE USUARIOS CON ROL(CLIENTE)  **/
	
	// Inyectamos una instancia desde nuestro Root ApplicationContext
			@Autowired
			private IRolService serviceRol;
			
	// Inyectamos una instancia desde nuestro Root ApplicationContext
			@Autowired
			private IUsuarioService serviceUsuario;
			
			
			@GetMapping(value = "/create")
			public String crear(@ModelAttribute Rol rol) {		
				return "register/formRegister";
			}
			
			
			@GetMapping(value = "/login")
			public String goLogin(@ModelAttribute Rol rol) {		
				return "/formLogin";
			}
	
			@PostMapping(value = "/save")
			public String guardar(@ModelAttribute Rol rol, BindingResult result,
					@RequestParam("archivoImagen") MultipartFile multiPart, HttpServletRequest request, RedirectAttributes attributes) throws NoSuchAlgorithmException {	
				
				if (result.hasErrors()){
					
					System.out.println("Existieron errores");
					return "register/formRegister";
				}
				
				
				if (!multiPart.isEmpty()) {
					String nombreImagen = Utileria.guardarImagen(multiPart,request);
					if (nombreImagen!=null){ // valida si la imagen se subio			
						rol.setImagen(nombreImagen); 
					}	
				}
				
				String password = rol.getUsuario().getPassword();

				
				//GUARDAR EL PASSWORD ENCRIPTADO EN MD5
			    MessageDigest md = MessageDigest.getInstance("MD5");
			    md.update(password.getBytes());

			    byte byteData[] = md.digest();

			    StringBuffer sb = new StringBuffer();
			    for (int i = 0; i < byteData.length; i++) {
			    	sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			    }		        

			    rol.getUsuario().setPassword(sb.toString()); 
			  //GUARDAR EL PASSWORD ENCRIPTADO EN MD5
			    
			    
				// Primero insertamos el usuario
				serviceUsuario.insertar(rol.getUsuario());
			    
				//GUARDAMOS USERNAME EN TABLA ROL
				rol.setUsername(rol.getUsuario().getUsername());
				
				// Como el usuario ya tiene id, ya podemos guardar el rol
				serviceRol.insertar(rol);
				
				attributes.addFlashAttribute("msg", "Registro Usuario Exitoso!");	
				
				return "redirect:/register/login";		
			}
			
			
			
			
}
