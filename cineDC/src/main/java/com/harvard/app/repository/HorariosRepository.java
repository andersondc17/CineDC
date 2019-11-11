package com.harvard.app.repository;

import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.harvard.app.model.Horario;



@Repository
public interface HorariosRepository extends JpaRepository<Horario, Integer>{

	// Horarios por idPelicula (Pelicula.id = Pelicula_Id and fecha=?)
	public List<Horario> findByPelicula_IdAndFechaOrderByHora(int idPelicula,Date fecha);
	
	
	
	//esta consulta la voy utilizar en peliculaServiceJPA
	@Query("select h from Horario h where h.fecha = :fecha and pelicula.estatus='Activa' group by h.pelicula order by pelicula.id asc")
	public List<Horario> findByFecha(@Param("fecha") Date fecha);
}
