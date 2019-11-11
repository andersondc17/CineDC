package com.harvard.app.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.harvard.app.model.Banner;


@Repository
public interface BannersRepository extends JpaRepository<Banner, Integer> {
	
	// select * from Banners where estatus = ? order by id desc 
	//public List<Banner> findByEstatusOrderByIdDesc(String estatus);
	
	@Query("select b from Banner b where b.estatus = ?1 order by b.id asc")
	public List<Banner> buscarOrdenarBanner(String estatus);
}