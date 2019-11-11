package com.harvard.app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.harvard.app.model.Sala;
import com.harvard.app.repository.SalasRepository;

@Service
public class SalasServiceJPA implements ISalasService{

	@Autowired
	private SalasRepository salasRepo;
	
	@Override
	public void guardar(Sala sala) {
		// TODO Auto-generated method stub
		 salasRepo.save(sala);
		
	}

	@Override
	public List<Sala> buscarTodas() {
		// TODO Auto-generated method stub
		return salasRepo.findAll();
	}

	@Override
	public void eliminar(int idSala) {
		// TODO Auto-generated method stub
		salasRepo.deleteById(idSala);
		
	}

	@Override
	public Sala buscarPorId(int idSala) {
		// TODO Auto-generated method stub
		Optional<Sala> optional = salasRepo.findById(idSala);
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
	
	

}
