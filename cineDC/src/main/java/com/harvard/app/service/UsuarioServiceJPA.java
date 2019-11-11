package com.harvard.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.harvard.app.model.Usuario;
import com.harvard.app.repository.UsuarioRepository;

@Service
public class UsuarioServiceJPA implements IUsuarioService{
	
	// Inyectamos una instancia desde nuestro Root ApplicationContext.
    @Autowired
    private UsuarioRepository usuarioRepo;

	@Override
	public void insertar(Usuario usuario) {
		// TODO Auto-generated method stub
		usuarioRepo.save(usuario);
		
	}

	@Override
	public void eliminar(int idUsu) {
		// TODO Auto-generated method stub
		usuarioRepo.deleteById(idUsu);
		
	}

}
