package com.harvard.app.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name = "Butacas")
public class Butaca {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String descripcion;
	private String numero;
	private String estatus;
	@ManyToOne
	@JoinColumn(name = "idSala")
	private Sala sala;
	
	
	public Butaca() {
		// TODO Auto-generated constructor stub
		this.estatus = "Inactiva";
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public String getNumero() {
		return numero;
	}


	public void setNumero(String numero) {
		this.numero = numero;
	}


	public String getEstatus() {
		return estatus;
	}


	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}


	public Sala getSala() {
		return sala;
	}


	public void setSala(Sala sala) {
		this.sala = sala;
	}


	@Override
	public String toString() {
		return "Butaca [id=" + id + ", descripcion=" + descripcion + ", numero=" + numero + ", estatus=" + estatus
				+ ", sala=" + sala + "]";
	}
	
	
	
	
	/**
	 * CREATE TABLE `Butacas` (	
	`id` int NOT NULL AUTO_INCREMENT,
    `descripcion` varchar(150) NOT NULL,
	 `numero` varchar(150) NOT NULL,
     `estatus` enum('Activa','Inactiva') NOT NULL,
     `idSala` int NOT NULL,
	 * */

}
