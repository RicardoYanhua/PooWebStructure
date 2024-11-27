<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.unu.poo2.beans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>

	/*function EliminarRegistro(id) {
		if (confirm("¿Desea eliminar el registro?") == true) {
			location.href = "NameController?op=eliminar&id=" + id;
		} else {}
	}*/
	
	async function EliminarRegistro(id) {
	    const resultado = await showConfirm('Eliminar Registro','Estás seguro de eliminar este registro ?');
	    if (resultado) {
	    	location.href= "#";
	    	//location.href = "NameController?op=eliminar&id=" + id;
	        console.log('Acción confirmada.');
	    } else {
	        console.log('Acción cancelada.');
	    }
	}
</script>

	<style>
		
		
		.panel-body{
			
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			margin: 0;
		}
		
		.panel-conteiner{
			width: 50%;
			margin: 20px;
			padding: 30px;
			background-color: rgb(255,255,255);
			border-radius:8px;
			box-shadow: 0px 0px 10px 5px rgba(0,0,0,0.1);
		}
		
		.panel-header{
			display: flex;
			justify-content: space-between;
			gap: 10px;
			padding: 20px 0px;
		}
		.row:hover {
			background-color: rgb(255,0,0);
		}
		.table-content{
            width: 100%;
            height: 500px;  /* Altura fija para el contenedor */
            overflow-y: auto;  /* Habilita el scroll cuando el contenido exceda la altura */
        }
		
		
		
	</style>

</head>
<body>


	<%@ include file='/MenuNavegacion.jsp'%>
	
	<!-- VALIDACION - OPTION
	<% 
	if (request.getAttribute("respuesta") != null) {
		boolean res = (boolean) request.getAttribute("respuesta");
		if (res) {
			List<String> listaError = (List<String>) request.getAttribute("listaError");
			for (String error : listaError) {
	%>
	<div class="alert alert-danger"><%= error %></div>
	<% 
			}
		}
	}
	%>
	
	 -->
	
	<div class = "panel-body" >
	<div class="panel-conteiner">
		
		<div class = "panel-header">
			<h4>Titulo del panel</h4>
			<a type="button" href="<%=url%>NameController?op=nuevo" class="btn btn-primary">Nuevo autor</a>
		</div>
	
		<div class = "table-content">
		
			<table class="table table-hover">
			<thead class="table-dark">
				<tr>
					<th>PrimaryKey</th>
					<th>Variable1</th>
					<th>Variable2</th>
					<th>Variable3</th>
					<th>Operaciones</th>
				</tr>
			</thead>
			<tbody>
				<%
				//List<Object[]> Lista = (List<Object[]>) request.getAttribute("Lista");
				List<Entidad> Lista = (List<Entidad>) request.getAttribute("Lista");
				
				//TEST DATA
					/* Object [] = {PrimaryKey,Variable2,Variable3,....}; */
					if(Lista == null){
						Lista = new ArrayList<>();
						Lista.add(new Entidad());
						Lista.add(new Entidad());
						Lista.add(new Entidad());
						Lista.add(new Entidad());
					}

				if (Lista != null) {
					for (Entidad obj : Lista) {
				%>
				<tr>
					<td><%=obj.getVariableTipoInt()%></td>
					<td><%=obj.getVariableTipoString()%></td>
					<td><%=obj.getVariableTipoDouble()%></td>
					<td><%=obj.getVariableTipoDate()%></td>
					<td>
						<!-- INSERTAR PRIMARY KEY -->
						<a class="btn btn-warning" href="<%=url%>AutorController?op=obtener&id=<%=obj.getVariableTipoInt()%>" >Modificar</a>
						<a class="btn btn-danger" href="javascript:EliminarRegistro('<%=obj.getVariableTipoInt()%>')" >Eliminar</a>
					</td>
				</tr>
				<%
					}}else{
				%>
				
				<tr>
					<td colspan="5" class="text-center">No hay datos</td>
				</tr>
				
				<%
				};
				%>
				
			</tbody>
		</table>
	</div>

		
		
	</div>
	</div>
	

</body>
</html>