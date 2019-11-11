package com.harvard.app.service;

import java.util.Date;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.harvard.app.model.Pelicula;


public interface IPeliculasService {
	void insertar(Pelicula pelicula);	
	List<Pelicula> buscarTodas();
	Pelicula buscarPorId(int idPelicula);
	List<String> buscarGeneros();
	void eliminar(int idPelicula);
	Page<Pelicula> buscarTodas(Pageable page);	
	
	// querys avanzados
    List<Pelicula> buscarActivas();	
	List<Pelicula> buscarPorFecha(Date fecha);//trabaja con HorariosServiceJPA
	
	
}
