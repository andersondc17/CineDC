package com.harvard.app.service;

import java.util.List;

import com.harvard.app.model.Sala;



public interface ISalasService {
	
	void guardar(Sala sala);
	List<Sala> buscarTodas();
	void eliminar(int idSala);
	Sala buscarPorId(int idSala);

}
