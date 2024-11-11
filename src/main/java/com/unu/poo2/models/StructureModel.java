package com.unu.poo2.models;

import com.unu.poo2.utils.Conexion;
import java.sql.*;
import java.text.DecimalFormat;
import java.util.*;

public class StructureModel {
	
	Connection con = Conexion.getInstance().getConection();
	
	PreparedStatement pst;
	ResultSet rs ;
	
	String SQL_TABLA = "";
	String SQL_PRIMARY_KEY = "";
	String SQL_SEARCH_CONDITION = "";
	
	String SQL_LISTAR_TABLA = "SELECT * FROM " + SQL_TABLA;
	String SQL_LISTAR_BUSQUEDA_CONDITION = "SELECT * FROM " + SQL_TABLA + " WHERE " + SQL_SEARCH_CONDITION +" like ?";
	String SQL_OBTENER_REGISTRO = "SELECT * FROM " + SQL_TABLA + " WHERE " + SQL_PRIMARY_KEY + " = ?" ;
	String SQL_ELIMINAR = "DELETE FROM " + SQL_TABLA + " WHERE " + SQL_PRIMARY_KEY + " = ?";
	String SQL_REGISTRAR = "INSERT INTO " + SQL_TABLA + " ("
			+ "var,"
			+ "var,"
			+ "var,"
			+ "var"
			+ ") VALUES (?,?,?,...)";
	String SQL_MODIFICAR = "UPDATE " + SQL_TABLA + " SET "
			+ " var = ? ,"
			+ " var = ? ,"
			+ " var = ? ,"
			+ " var = ? ,"
			+ " var = ?  "
			+ " WHERE " + SQL_PRIMARY_KEY + " = ?";
	
	public List<Object[]> listar() {
		try {
			
			pst = con.prepareStatement(""/*SQL*/);
			rs = pst.executeQuery();
			
			
			List<Object[]> lista = new ArrayList<>();
			while(rs.next()) {
				lista.add(new Object[] {
						rs.getInt(1),
						rs.getInt(2)
				});
			}
			return lista;
			
		} catch (SQLException e) {
			System.out.println("ERROR EN " + this.getClass().getName() + ".listar() \n" + e.getMessage().toString());
			return null;
		}finally {
			Conexion.getInstance().cerrarRecursos(pst,rs);
		}
	}
	
	public Object[] obtener (int id) {
		try {
			
			pst = con.prepareStatement(""/*SQL*/);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				return new Object[] {
						rs.getInt(1),
						rs.getInt(2)
				};
			}else {
				return null;
			}
		} catch (SQLException e) {
			System.out.println("ERROR EN " + this.getClass().getName() + ".obtener() \n" + e.getMessage().toString());
			return null;
		}finally {
			Conexion.getInstance().cerrarRecursos(pst,rs);
		}
	}
	
	public int modificar (Object[] registro) {
		try {
			int filasAfectadas = 0;
			pst = con.prepareStatement(""/*SQL*/);
			/*
			pst.setInt(0, registro.data);
			
			pst.setDate(0, Date.valueOf(registro.data).toLocalDate());
			
			DecimalFormat df = new DecimalFormat("#.00");
			pst.setDouble(0, df.format(registro.data));
			
			pst.setString(0, registro.data);
			*/
			
			
			filasAfectadas = pst.executeUpdate();
			
			return filasAfectadas;
			
		} catch (SQLException e) {
			System.out.println("ERROR EN " + this.getClass().getName() + ".modificar() \n" + e.getMessage().toString());
			return 0;
		}finally {
			Conexion.getInstance().cerrarRecursos(pst,rs);
		}
	}
	public int registrar (Object[] registro) {
		try {
			int filasAfectadas = 0;
			pst = con.prepareStatement(""/*SQL*/);
			/*
			pst.setInt(0, registro.data);
			
			pst.setDate(0, Date.valueOf(registro.data).toLocalDate());
			
			DecimalFormat df = new DecimalFormat("#.00");
			pst.setDouble(0, df.format(registro.data));
			
			pst.setString(0, registro.data);
			*/
			
			
			filasAfectadas = pst.executeUpdate();
			
			return filasAfectadas;
			
		} catch (SQLException e) {
			System.out.println("ERROR EN " + this.getClass().getName() + ".registrar() \n" + e.getMessage().toString());
			return 0;
		}finally {
			Conexion.getInstance().cerrarRecursos(pst,rs);
		}
	}
	public int eliminar (int id) {
		try {
			int filasAfectadas = 0;
			pst = con.prepareStatement(""/*SQL*/);
			pst.setInt(1, id);
			
			filasAfectadas = pst.executeUpdate();
			
			return filasAfectadas;
			
		} catch (SQLException e) {
			System.out.println("ERROR EN " + this.getClass().getName() + ".eliminar() \n" + e.getMessage().toString());
			return 0;
		}finally {
			Conexion.getInstance().cerrarRecursos(pst,rs);
		}
	}
	

}
