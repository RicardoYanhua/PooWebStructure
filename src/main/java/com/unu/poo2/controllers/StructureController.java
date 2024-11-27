package com.unu.poo2.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

import com.unu.poo2.beans.*;
import com.unu.poo2.models.StructureModel;

@WebServlet("/StructureController")

public class StructureController extends HttpServlet {
	
    public StructureController() {super();}
    
    StructureModel structureModel = new StructureModel();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response){
		try {
			
			String op = request.getParameter("op") == null ? "" : request.getParameter("op");
			
			switch (op) {
			
				case "listar":
					listar(request,response);
					break;
				case "nuevo":
					nuevo(request,response);
					break;
				case "obtener":
					obtener(request,response);
					break;
				case "modificar":
					modificar(request,response);
					break;
				case "eliminar":
					eliminar(request,response);
					break;
				case "registrar":
					registrar(request,response);
					break;
				
				// MAIN CONTROLLER
				default:
					listar(request,response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".processRequest() \n" + e.getMessage().toString());
		}
	}
    
    private boolean validar(HttpServletRequest request, HttpServletResponse response){
    	
    	boolean respuestaValidacion = false;
		List<String> listaErrrores = new ArrayList<>();
    	try {
    		// VALIDAR CAMPO DE ENTRADA DENTRO DEL JSP MEDIANTE name=""
    		if(request.getParameter("VariableInputNameEtiquetaJSP").equals("")) {
    			respuestaValidacion = true;
    			listaErrrores.add("Detalle de Error/Validacion/ListaError");
    		}
    		
    		/* PUEDE INGRESAR MAS CAMPOS QUE DESEEA VALIDAR */
    		
    		// ENVIAR RESPUESTA Y LISTA DE ERRORES DE VALIDACION
    		request.setAttribute("respuestaAtributeJavaJSP", respuestaValidacion);
    		request.setAttribute("listaErrorAtributeJavaJSP", listaErrrores);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName()+".validar() \n" + e.getMessage().toString());
		}
    	return respuestaValidacion;
    }
    
    private void listar(HttpServletRequest request, HttpServletResponse response){
		try {
			// GUARDAR LISTA DE DATOS DE LA BD DENTRO DE UN ATRIBUTO JAVA DEL JSP
			request.setAttribute("AtributoJavaJSP", structureModel.listar());
			request.getRequestDispatcher("/ruta/archivoListar.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".listar() \n" + e.getMessage().toString());
		}
	}
    
    private void nuevo(HttpServletRequest request, HttpServletResponse response){
		try {
			// ABRE O REDIRECCIONA AL JSP
			request.getRequestDispatcher("/ruta/archivoNuevo.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".nuevo() \n" + e.getMessage().toString());
		}
	}
    
    private void eliminar(HttpServletRequest request, HttpServletResponse response){
		try {
			// CAPTURA LA VARIABLE ID DEL INPUT HIDDEN DEL JSP
			int primaryKey = Integer.parseInt(request.getParameter("id"/*PARAMETER OF INPUT-HIDDEN-JSP*/));
			
			//EJECUTA Y COMPRUEBA LA OPERACIONES
			if (structureModel.eliminar(primaryKey) > 0) {
				request.getSession().setAttribute("mensaje", "Success operation");
				response.sendRedirect(request.getContextPath() + "/StructureController");
			} else {
				request.getSession().setAttribute("mensaje", "Esto es un mensaje de Error Controller");
				response.sendRedirect(request.getContextPath() + "/error404.jsp");
			}
			
		} catch (Exception e) {
			System.out.println("Error en " + this.getClass().getName() + " .eliminar() \n" + e.getMessage().toString());
			e.printStackTrace();
		}

	}
    
    private void obtener(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int primaryKey = Integer.parseInt(request.getParameter("id"/*PARAMETER OF INPUT-HIDDEN-JSP*/));
			
			Entidad miEntidad = structureModel.obtener(primaryKey);
			
			if (miEntidad != null) {
				request.setAttribute("entidadAtributeJava", miEntidad);
				request.getRequestDispatcher("/ruta/archivo.jsp").forward(request, response);
			} else {
				request.getSession().setAttribute("mensaje", "Esto es un mensaje de Error Controller");
				response.sendRedirect(request.getContextPath() + "/error404.jsp");
			}
		} catch (Exception e) {
			System.out.println("Error en " + this.getClass().getName() + " .obtenerAutor() \n" + e.getMessage().toString());
			e.printStackTrace();
		}
	}
    
    private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			Entidad miEntidad = new Entidad();
			/* CAPTURAR PRIMARY KEY */
			miEntidad.setVariableTipoInt(Integer.parseInt(request.getParameter("InputNameParameterJSP")));
			miEntidad.setVariableTipoString(request.getParameter("InputNameParameterJSP"));
			miEntidad.setVariableTipoDouble(Double.parseDouble(request.getParameter("InputNameParameterJSP")));
			miEntidad.setVariableTipoDate(LocalDate.parse(request.getParameter("InputNameParameterJSP")));
			// OTHER ATRIBUTES ...
			
			if (!validar(request, response)) {
				if (structureModel.modificar(miEntidad) > 0) {
					request.getSession().setAttribute("mensaje", "Success operation");
					response.sendRedirect(request.getContextPath() + "/StructureController");
				} else {
					request.getSession().setAttribute("mensaje", "Esto es un mensaje de Error Controller");
					response.sendRedirect(request.getContextPath() + "/error404.jsp");
				}
			} else {
				request.getRequestDispatcher("/ruta/archivoRegistrar.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			System.out.println("Error en " + this.getClass().getName() + " .modificar() \n" + e.getMessage().toString());
			e.printStackTrace();
		}
	}
    
    private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			Entidad miEntidad = new Entidad();
			miEntidad.setVariableTipoInt(Integer.parseInt(request.getParameter("InputNameParameterJSP")));
			miEntidad.setVariableTipoString(request.getParameter("InputNameParameterJSP"));
			miEntidad.setVariableTipoDouble(Double.parseDouble(request.getParameter("InputNameParameterJSP")));
			miEntidad.setVariableTipoDate(LocalDate.parse(request.getParameter("InputNameParameterJSP")));
			// OTHER ATRIBUTES ...
			
			if (!validar(request, response)) {

				if (structureModel.insertar(miEntidad) > 0) {
					request.getSession().setAttribute("mensaje", "Success operation");
					response.sendRedirect(request.getContextPath() + "/StructureController");
				} else {
					request.getSession().setAttribute("mensaje", "Esto es un mensaje de Error Controller");
					response.sendRedirect(request.getContextPath() + "/error404.jsp");
				}

			} else {
				request.getRequestDispatcher("/ruta/archivoRegistrar.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("Error en " + this.getClass().getName() + " .resgistrarAutor() \n" + e.getMessage().toString());
			e.printStackTrace();
		}
	}
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/*
    private void nameTag(HttpServletRequest request, HttpServletResponse response){
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".nameTag() \n" + e.getMessage().toString());
		}
	}
	*/
}
