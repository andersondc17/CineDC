package com.harvard.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.harvard.app.model.DetallePelicula;
import com.harvard.app.repository.DetallePeliculaRepository;


// Registramos esta clase como un Bean en nuestro Root ApplicationContext.
@Service
public class DetallePeliculaServiceJPA implements IDetallePeliculaService{

	// Inyectamos una instancia desde nuestro Root ApplicationContext.
    @Autowired
	private DetallePeliculaRepository detallesRepo;
		
	@Override
	public void insertar(DetallePelicula detalle) {
		detallesRepo.save(detalle);
	}

	@Override
	public void eliminar(int idDetalle) {
	
		detallesRepo.deleteById(idDetalle);
	}

}
