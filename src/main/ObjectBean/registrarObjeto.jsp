<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
	function validarFormulario() {
		const var_string =  document.getElementById('input_1').value.trim();
		
		if(var_string ===''){
			alert('FaltaIngresarLaVariable');
			return false;
		}
		
	}
		
</script>
</head>
<body>
<%
	String URL = "";
	
	// Validaciones 
	if(request.getParameter("respuesta") != null){
		boolean res = (boolean) request.getAttribute("respuesta");
		if(res){
			List<String> listaErrores = (List<String>) request.getAttribute("listaError");
			
			for(String error : listaErrores){
				%>
				<span><%=error%></span><br>
				<% 
			}
		}
	}
	
	%>
	<div>
	</div>
</body>
</html>