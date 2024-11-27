<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar</title>
<!-- _______________________________________SCRIPT DE VALIDADCION DE INSERCION DE DATOS _______________________________________ -->
	
	<script>
	function validarFormulario() {
		const Variable1 = document.getElementById('Variable1').value.trim();
		const Variable2 = document.getElementById('Variable2').value.trim();
		
		if (Variable1 === '') {
            
			showMessage('Operación realizada con éxito', 2);
            document.getElementById('Variable1').focus();
            return false; // Previene el envío del formulario
        }
		if (Variable2 === '') {
            
			showMessage('Operación realizada con éxito', 1);
            document.getElementById('Variable2').focus();
            return false; // Previene el envío del formulario
        }
		
        return true; // Permite el envío del formulario
        
	}
	</script>

<!-- _______________________________________STYLE DE CENTRADO DEL FORM _______________________________________ -->

	<style>
		.form-conteiner{
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			margin: 0;
		}
		
		.form-panel{
			width: 50%;
			margin: 20px;
			padding: 30px;
			background-color: rgb(255,255,255);
			border-radius:8px;
			box-shadow: 0px 0px 10px 5px rgba(0,0,0,0.1);
			border: 1px solid rgb(220,220,220);
		}

        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type="number"] {
            -moz-appearance: textfield;
        }
		
		.tittle-form{
			margin-bottom: 25px;
		}
		
		.submit-conteiner{
			display:flex;
			justify-content: flex-end;
			gap: 10px;
			padding: 30px 0px 0px 0px;
		}
		
		.input-group-text.tittles-inputs{
			background-color: #0d6efd;
			color: rgb(255,255,255);
		}
		
	
	</style>

</head>
<body>

<%@ include file='/MenuNavegacion.jsp' %>


 <div class = "form-conteiner">
 <div class = "form-panel">
 <!--____________________________________________________________FORM____________________________________________________________-->
 		<form role="form" action="<%=url%>StructureController" method="POST" onsubmit="return validarFormulario()">
 			
 			<!-- TITTLE FORM -->
 			<h4 class = "tittle-form">Titulo del formulario</h4>
 			<!-- OPERACION A EJECUTAR EN EL CONTROLADOR -->
			<input type = "hidden" id = "op" name = "op" value = "insertar">
			
			<!--_______________________________________INSERTAR COMPONENTES INPUT_______________________________________-->
			<!-- DEFIRNIR EL ID Y EL NAME DE CADA ETIQUETA -->
			
			
				<!-- TEXTO -->
				<div class="input-group mb-3">
  					<span class="input-group-text tittles-inputs" >Tittle</span>
  					<input id = "Variable1" type="text" class="form-control" placeholder="Inserte un texto" aria-describedby="basic-addon1">
				</div>
				
				<!-- TEXT AREA -->
				<div class="input-group" style = "margin-bottom: 10px">
 					<span class="input-group-text tittles-inputs">Tittle</span>
  					<textarea id = "Variable2"class="form-control" aria-label="With textarea" placeholder="Esto es un text area"></textarea>
				</div>
				
				<!-- NUMBER -->
				<div class="input-group mb-3">
  					<span class="input-group-text tittles-inputs" >Tittle</span>
  					<input type="number" id = "input-number" name = "input-number" class="form-control" placeholder="0.00">
				</div>
				
				<!-- COMBOBOX CUSTOM-->
			 	<div class="input-group mb-3">
					<span class="input-group-text tittles-inputs">Tittle</span>
			 		<select class="form-select" aria-label="Default select example">
			 			<option value="" disabled selected>Elija una opción</option>
  <% 
  					List<Object[]> ListaComboBox= (List<Object[]>)request.getAttribute("ListaOpcionesCombo");
  					/* Object [] = {PrimaryKey,Variable2,Variable3,....}; */
    				if (ListaComboBox != null) {
      					for (Object[] ComboItem : ListaComboBox) { 
  %>
    				<option value="<%=ComboItem[0]%>"><%=ComboItem[1]%></option>
  <%
      				}} 
  %>
					</select>
				</div>
				
				<!-- COMBOBOX PREDETERMINADO-->
			 	<div class="input-group mb-3">
					<span class="input-group-text tittles-inputs">Tittle</span>
			 		<select class="form-select" aria-label="Default select example">
			 			<option value="" disabled selected>Elija una opción</option>
  
    				<option value="1">Opcion1</option>
    				<option value="2">Opcion2</option>
    				<option value="3">Opcion3</option>
    				<option value="4">Opcion4</option>
  
					</select>
				</div>
				
				<!-- FECHA DATE -->
				<div class="input-group mb-3">
  					<label class="input-group-text tittles-inputs" id="basic-addon1">Tittle</label>
  					<input type="date" class="form-control" placeholder="Inserte un texto" aria-describedby="basic-addon1">
				</div>
				
				
				<!-- INSERTAR TABLE DATA -->
				
			
			<!--_______________________________________INSERTAR COMPONENTES INPUT_______________________________________-->
			
			<div class = "submit-conteiner">
				<!-- BOTON DE RETORNO AL MAIN DEL CONTROLADOR -->
				<a  class="btn btn-secondary" href="#">Retornar</a>
				<!-- BOTON DE ENVIO DE FORMULARIO AL CONTROLLER -->
				<button class="btn btn-primary" type="submit" >Guardar</button>
				
			</div>
			
		</form>
</div>
</div>

</body>
</html>