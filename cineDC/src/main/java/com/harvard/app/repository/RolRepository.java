package com.harvard.app.repository;





import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;


import com.harvard.app.model.Rol;

@Repository
public interface RolRepository extends JpaRepository<Rol, Integer> {

	
	
		
}
