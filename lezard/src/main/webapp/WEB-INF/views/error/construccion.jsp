<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<!-- RESOURCES -->
		<%@ include file="/resources/templates/fixed_resources.jsp"%>
		
		<!-- TITLE -->
		<title>${contextTitle} - Sitio en construcción</title>
	</head>
	<body>		
		<!-- MAIN -->
		<main>
			<div class="container">
				<div class="row">
					<div class="card col s12 m8 offset-m2 blue-grey darken-1 hoverable white-text center card-main-x6">
						<div class="card-content">
							<hr>
							<h1>¡LO SENTIMOS!</h1>
							<hr>
							<br>
							<h5>La página a la que intentas acceder, está en construcción.</h5>
							<br><br>
							<a class="btn-large waves-effect waves-light btnCancelar pulse hoverable btnGoBack">¡Volver!</a>
						</div>
					</div>
				</div>
	    	</div>
		</main>
	</body>
</html>