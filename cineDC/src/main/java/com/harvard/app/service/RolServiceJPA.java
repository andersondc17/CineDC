package com.harvard.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.harvard.app.model.Rol;
import com.harvard.app.repository.RolRepository;

@Service
public class RolServiceJPA implements IRolService{
	
	@Autowired
	private RolRepository rolRepo;

	@Override
	public void insertar(Rol rol) {
		// TODO Auto-generated method stub
		rolRepo.save(rol);
		
	}

	@Override
	public List<Rol> buscarTodas() {
		// TODO Auto-generated method stub
		return rolRepo.findAll();
	}

	@Override
	public Rol buscarPorId(int idRol) {
		// TODO Auto-generated method stub
		Optional<Rol> optional = rolRepo.findById(idRol);
		
		if(optional.isPresent()) {
			return optional.get();
					
		}
		return null;
	}

	

	@Override
	public void eliminar(int idRol) {
		// TODO Auto-generated method stub
		rolRepo.deleteById(idRol);
	}

	@Override
	public Page<Rol> buscarTodas(Pageable page) {
		// TODO Auto-generated method stub
		return rolRepo.findAll(page);
	}

	

	

}
