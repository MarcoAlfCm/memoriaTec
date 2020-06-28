<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<!-- RESOURCES -->
		<%@ include file="/resources/templates/fixed_resources.jsp"%>
		
		<!-- TITLE -->
		<title>${contextTitle} - ERROR 401</title>
	</head>
	<body>		
		<!-- MAIN -->
		<main>
			<div class="container">
				<div class="row">
					<div class="card col s12 m8 offset-m2 blue-grey darken-1 hoverable white-text center card-main-x6">
						<div class="card-content">
							<hr>
							<h1>ERROR 401</h1>
							<hr>
							<br>
							<h5>No autorizado.<br>Inicie sesión para solucionar el problema por favor.</h5>
							<br><br>
							<a class="btn-large waves-effect waves-light btnCancelar pulse hoverable btnGoBack">¡Volver!</a>
						</div>
					</div>
				</div>
	    	</div>
		</main>
	</body>
</html>