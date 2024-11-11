package com.unu.poo2.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import com.unu.poo2.models.StructureModel;

@WebServlet("/StructureController")

public class StructureController extends HttpServlet {
	
    public StructureController() { super();}
    StructureModel model = new StructureModel();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String op = request.getParameter("op") == null ? "listar" : request.getParameter("op");
			
			switch (op) {
			case "listar":
				listar(request,response);
				break;
			case "nuevo":
				break;
			case "obtener":
				break;
			case "modificar":
				break;
			case "eliminar":
				break;
			case "registrar":
				break;
			
			default:
				listar(request,response);
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".processRequest() \n" + e.getMessage().toString());
		}
	}
    private boolean validar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean res = false;
		List<String> listaErrrores = new ArrayList<>();
    	try {
    		if(request.getParameter("var1").equals("")) {
    			res = true;
    			listaErrrores.add("Ingrese Nombre del Autor");
    		}
    		if(request.getParameter("var2").equals("")) {
    			// Alls Parameters
    		}
    		request.setAttribute("respuesta", res);
    		request.setAttribute("listaError", listaErrrores);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName()+".validar() \n" + e.getMessage().toString());
		}
    	return res;
    }
    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("lista", model.listar());
			request.getRequestDispatcher("/ruta/archivo.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".listar() \n" + e.getMessage().toString());
		}
	}
    
    private void nuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			response.sendRedirect(request.getContextPath() + "NameController?op=nuevo");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".processRequest() \n" + e.getMessage().toString());
		}
	}
    /*
    private void nameTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR EN " + this.getClass().getName() + ".processRequest() \n" + e.getMessage().toString());
		}
	}
	*/

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
