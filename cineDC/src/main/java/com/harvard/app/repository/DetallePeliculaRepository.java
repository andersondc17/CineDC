package com.harvard.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.harvard.app.model.DetallePelicula;


@Repository
public interface DetallePeliculaRepository extends JpaRepository<DetallePelicula, Integer>{

}
