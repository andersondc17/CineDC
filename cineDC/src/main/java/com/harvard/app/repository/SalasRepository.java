package com.harvard.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.harvard.app.model.Sala;

@Repository
public interface SalasRepository extends JpaRepository<Sala, Integer> {

}
