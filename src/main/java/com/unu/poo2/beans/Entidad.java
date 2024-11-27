package com.unu.poo2.beans;

import java.time.LocalDate;

public class Entidad {
	
	// VARIABLES - TIPO DE VARIABLES
	private int VariableTipoInt;
	private String VariableTipoString;
	private double VariableTipoDouble;
	private LocalDate VariableTipoDate;
	
	// CONSTRUCTOR VACIO
	public Entidad() {
		this(0,"TestString",0.0,LocalDate.now());
	}
	
	// CONSTRUCTOR DEFINIDO
	public Entidad(int variableTipoInt, String variableTipoString, double variableTipoDouble,
			LocalDate variableTipoDate) {
		super();
		VariableTipoInt = variableTipoInt;
		VariableTipoString = variableTipoString;
		VariableTipoDouble = variableTipoDouble;
		VariableTipoDate = variableTipoDate;
	}

	// METODO PARA CONFIGURAR LA LISTA DE DATOS O VARIABLES DE LA ENTIDAD
	public Object[] get_CustomData(){
		return new Object[] {
				this.VariableTipoInt,
				this.VariableTipoString,
				this.VariableTipoDouble,
				this.VariableTipoDate
		};
	}
	
	// GETTERS AND SETTERS
	public int getVariableTipoInt() {
		return VariableTipoInt;
	}
	public void setVariableTipoInt(int variableTipoInt) {
		VariableTipoInt = variableTipoInt;
	}
	public String getVariableTipoString() {
		return VariableTipoString;
	}
	public void setVariableTipoString(String variableTipoString) {
		VariableTipoString = variableTipoString;
	}
	public double getVariableTipoDouble() {
		return VariableTipoDouble;
	}
	public void setVariableTipoDouble(double variableTipoDouble) {
		VariableTipoDouble = variableTipoDouble;
	}
	public LocalDate getVariableTipoDate() {
		return VariableTipoDate;
	}
	public void setVariableTipoDate(LocalDate variableTipoDate) {
		VariableTipoDate = variableTipoDate;
	}
	
	
	

}
