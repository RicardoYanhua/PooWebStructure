package com.unu.poo2.utils;
import java.sql.*;

public class Conexion {
	
	public Connection conexion;
	
	private String DRIVER = "com.mysql.cj.jdbc.Driver";
	private String DATABASE_NAME = "";
	private String URL = "jdbc:mysql://localhost:3306/" + DATABASE_NAME;
	private String USER = "root";
	private String PASSWORD = "123456";
	
	public static Conexion instance;
	
	public static Conexion getInstance() {
		
		if(instance == null) {
			instance = new Conexion();
		}
		return instance;
	}
	
	
	public Conexion () {
		try {
			Class.forName(DRIVER);
			conexion = (Connection) DriverManager.getConnection(URL,USER,PASSWORD);
			System.err.println(conexion != null ? "Conexion Exitosa" : "ConexionFallida");
		} catch (Exception e) {
			System.out.println("ERROR EN " + this.getClass().getName()+".conectar() \n" + e.getMessage().toString());
		}
	}
	
	public Connection getConection() {
		return conexion;
	}
	
	
	
	public void desconectar() {
		try {
			if(conexion != null && !conexion.isClosed()) {
				cerrarRecursos(conexion);
			}
		} catch (Exception e) {
			System.out.println("ERROR EN " + this.getClass().getName()+ ".desconectar() \n" + e.getMessage().toString());
		}
	}
	
	public void cerrarRecursos(AutoCloseable...autoCloseables) {
		try {
			for	(AutoCloseable recurso : autoCloseables) {
				if(recurso != null){
					recurso.close();
				}
			}
		} catch (Exception e) {
			System.out.println("ERROR EN " + this.getClass().getName()+ ".cerrarRecursos() \n" + e.getMessage().toString());
		}
	}

}
