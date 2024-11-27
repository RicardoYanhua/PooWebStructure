<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
	</script>
	
	<link rel="stylesheet" href="<%= request.getContextPath() %>/assetsCustom/css/popupStyle.css">
	<script src="<%= request.getContextPath() %>/assetsCustom/js/popupScript.js"></script>
	
	<style>
		
		.container-fluid {
			margin : 0;
			padding: 0px;
			}
		.navbar-brand{
			padding: 0px 100px 0px 0px;
		}
	</style>
	
</head>
<body>

	<%
	String url = "http://localhost:8080/WebStructure/";
	%>

	<div class="container-fluid">
	<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
		<div class="container">
			<a class="navbar-brand" href="#">WebProject</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<!-- 
					______________________________________BUTTON______________________________________
					
						<li class="nav-item">
							<a class="nav-link active" aria-current="page" href="<%=url%>AutorController?op=listar">Autor</a>
						</li>
					______________________________________BUTTON______________________________________
					 -->
					
					<li class="nav-item">
						<a class="nav-link " href="#">Editorial</a>
					</li>
					
					<!-- 
					______________________________________DROPDOWN-BUTTON______________________________________
					
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Reportes</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Por Autor</a></li>
							<li><a class="dropdown-item" href="#">Por Libro</a></li>
							<li><a class="dropdown-item" href="#">Por Editorial</a></li>
						</ul>
						</li>
					______________________________________DROPDOWN-BUTTON______________________________________
					 -->
					 <li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Reportes</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Por Autor</a></li>
							<li><a class="dropdown-item" href="#">Por Libro</a></li>
							<li><a class="dropdown-item" href="#">Por Editorial</a></li>
						</ul>
						</li>
					
				</ul>
			</div>
		</div>
	</nav>
</div>

<div id="PopupMessage" class="PopupMessage">
    <span id="PopupIcon"></span>
    <span id="PopupText"></span>
</div>

<div id="Overlay" class="Overlay"></div>
<div id="ConfirmationPopup" class="PopupMessage" style = "padding: 30px 20px;">
	<div >
		<h4 id = "PopupTextTittle"style = "text-align: left;">Tittle</h4>
    	<span id="PopupTextComfir"></span>
	</div>
    
    <div style="display:flex;justify-content:flex-end; gap : 10px;margin-top: 20px">
     	<button id="PopupCancelButton" class="btn btn-secondary">Cancelar</button>
        <button id="PopupConfirmButton" class="btn btn-primary">Confirmar</button>
       
    </div>
</div>


</body>


</html>