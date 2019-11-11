package com.harvard.app.service;

import com.harvard.app.model.DetallePelicula;

public interface IDetallePeliculaService {
	
	void insertar(DetallePelicula detalle);
	void eliminar(int idDetalle);
}
