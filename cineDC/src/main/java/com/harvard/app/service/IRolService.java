package com.harvard.app.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.harvard.app.model.Rol;

public interface IRolService {

	void insertar(Rol rol);	
	List<Rol> buscarTodas();
	Rol buscarPorId(int idRol);
	void eliminar(int idRol);
	Page<Rol> buscarTodas(Pageable page);
	
	
}
