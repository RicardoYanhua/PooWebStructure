<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registrar</title>

<!-- _______________________________________SCRIPT DE CREACION DE ROW PARA LA TABLA  _______________________________________ -->
	 <script>
    function agregarATabla(event) {
        event.preventDefault();
        const select = document.getElementById("Combo");
        const tabla = document.getElementById("TablaBody");
        const selectedOption = select.options[select.selectedIndex];

        if (selectedOption && select.selectedIndex != 0) {
            
            // RECOLECTAR DATOS
            const primaryKey = selectedOption.value;
            const datos = selectedOption.innerHTML.split("-");
            const variable1 = datos[0];
            const variable2 = datos[1];

            // Crear la primera celda para el ID
            const fila = tabla.insertRow();
        
            //CELDA PRIMARY KEY
            const Celda_PrimaryKey = fila.insertCell(0);
            // Crear el campo oculto para el servlet
            const inputHidden = document.createElement("input");
            inputHidden.type = "hidden";
            inputHidden.name = "PrimaryKeyArray";  // Este es el nombre que se enviará al servlet
            inputHidden.value = primaryKey;
            // Agregar el campo oculto a la primera celda
            Celda_PrimaryKey.appendChild(inputHidden);
            Celda_PrimaryKey.innerText = primaryKey;
       
            // CELDAS VARIABLES
            fila.insertCell(1).innerText = variable1;
            fila.insertCell(2).innerText = variable2;

            // Crear la celda de eliminación
            const Celda_Elminar = fila.insertCell(3);
            
            const BotonEliminar = document.createElement("a");
            BotonEliminar.innerText = "Eliminar";
            BotonEliminar.classList = "btn btn-danger";
            BotonEliminar.onclick = function () {
                // Confirmación de eliminación
                	showMessage('Fila'+ fila.rowIndex, 2);
                    tabla.deleteRow(fila.rowIndex - 1);  // Eliminar la fila usando el índice
                    selectedOption.style.display = "block"; // Hacer visible de nuevo la opción seleccionada
                
            };
            
            Celda_Elminar.appendChild(BotonEliminar);

            // Remover la opción seleccionada del select
            //select.removeChild(selectedOption);
            selectedOption.style.display = "none";
            select.selectedIndex = 0;
        }
    }

    </script>

<!-- _______________________________________SCRIPT DE VALIDADCION DE INSERCION DE DATOS _______________________________________ -->
	<script>
	function validarFormulario() {
		const Variable1 = document.getElementById('Variable1').value.trim();
		
		if (Variable1 === '') {
			showMessage('Operación realizada con éxito', 2);
            document.getElementById('Variable1').focus();
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

		.tittle-form{
			margin-bottom: 25px;
		}
		
		.submit-conteiner{
			display:flex;
			justify-content: flex-end;
			gap: 10px;
			padding: 30px 0px 0px 0px;
		}
	
	</style>

</head>
<body>

<%@ include file='/MenuNavegacion.jsp' %>


 <div class = "form-conteiner">
 <div class = "form-panel">
 <!--____________________________________________________________FORM____________________________________________________________-->
 		<form role="form" action="<%=url%>NameController" method="POST" onsubmit="return validarFormulario()">
 			
 			<!-- TITTLE FORM -->
 			<h4 class = "tittle-form">Titulo del formulario</h4>
 			<!-- OPERACION A EJECUTAR EN EL CONTROLADOR -->
			<input type="hidden" name="op" value="insertar" />
			
			<!-- TEXTO -->
				<div class="input-group mb-3">
  					<span class="input-group-text tittles-inputs" >Tittle</span>
  					<input id = "Variable1" type="text" class="form-control" placeholder="Inserte un texto" aria-describedby="basic-addon1">
				</div>
			
			<!--_______________________________________INSERTAR COMPONENTES INPUT_______________________________________-->
		
			<!-- INSERTAR TABLE DATA -->
			<div class="content-select">
				
				<!-- COMBOBOX -->
			 	<div class="input-group mb-3">
					<span class="input-group-text">Tittle</span>
			 		<select id = "Combo" class="form-select" aria-label="Default select example">
			 			<option value="" disabled selected>Elija una opción</option>
  <% 
  						List<Object[]> ListaComboBox= (List<Object[]>)request.getAttribute("ListaOpcionesCombo");
  						
  						//TEST DATA
  						/* Object [] = {PrimaryKey,Variable2,Variable3,....}; */
  						if(ListaComboBox == null){
  							ListaComboBox = new ArrayList<>();
  							ListaComboBox.add(new Object[]{1,"Nombre1","Sueldo1"});
  	  						ListaComboBox.add(new Object[]{2,"Nombre2","Sueldo2"});
  	  						ListaComboBox.add(new Object[]{3,"Nombre3","Sueldo3"});
  	  						ListaComboBox.add(new Object[]{4,"Nombre4","Sueldo4"});
  						}
  						
  						
    					if (ListaComboBox != null) {
      						for (Object[] Item : ListaComboBox) { 
  %>
    					<option value="<%=Item[0]%>"><%=Item[1]%>-<%=Item[2]%></option>
  <%
      					}} 
  %>
					</select>
					<button class="btn btn-primary" type="button" onclick="agregarATabla(event)">Agregar</button>
				</div>
				
                		
                	<table class="table table-hover" >
						<thead class="table-dark">
                    		<tr>
                        		<th>PrimaryKey</th>
                        		<th>Variable1</th>
                        		<th>Variable2</th>
                        		<th>Operacion</th>
                    		</tr>
                		</thead>
                
                		<tbody id = "TablaBody">
                    		<!-- Filas se agregarán aquí dinámicamente -->
                		</tbody>
           			 </table>
        	</div>
				
			
			<!--_______________________________________INSERTAR COMPONENTES INPUT_______________________________________-->
			
			<div class = "submit-conteiner">
				<!-- BOTON DE RETORNO AL MAIN DEL CONTROLADOR -->
				<a  class="btn btn-secondary" href="<%=url%>NameController?op=...">Retornar</a>
				<!-- BOTON DE ENVIO DE FORMULARIO AL CONTROLLER -->
				<button class="btn btn-primary" type="submit" >Guardar</button>
				
			</div>
			
		</form>
</div>
</div>
</body>
</html>