package com.harvard.app.service;


import com.harvard.app.model.Usuario;

public interface IUsuarioService {
	
	void insertar(Usuario usuario);
	void eliminar(int idUsu);

}
