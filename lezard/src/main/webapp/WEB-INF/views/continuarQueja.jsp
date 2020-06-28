<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- RESOURCES -->
<%@ include file="/resources/templates/fixed_resources.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- PLUGIN CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css">

<!-- TITLE -->
<title>${contextTitle}-QUEJA</title>
</head>

<body>
	<!-- HEARDER -->
	<%@ include file="/resources/templates/header.jsp"%>

	<!-- MAIN -->
	<main>
		<div class="container-main">
			<div class="row">
				<div class="card col s12 m10 offset-m1 hoverable">
					<div class="card-content">
						<span class="card-title center">Instrumento de entrevista
							para personas que interponen una queja por Violencia de Género,
							Acoso Sexual y Hostigamiento Sexual</span>
						<hr>
						<!-- 						<form id="formNuevaQueja" method="POST"> -->

						<input value="${param.idCaso }" id="idCaso" hidden="true">
						<!-- 						</form> -->
						<div class="row"></div>
						<br class="hide-on-med-and-down">
						<div class="row center">

							<div class="col s6 m8 l8">
								<br>
							</div>
							<div class="col s6 m4 l4">
								<div class="col s6 m10 l10">
									<button class="btn red  waves-light  pulse right" id="btnTerminarCaso" title="Terminar caso">
										Terminar caso 
									</button>
								</div>
								<div class="col s6 m2 l2">
									<button class="btn-floating   waves-light green pulse right" id="btnCrearQueja" title="Crear nueva queja">
										<i class="material-icons right">exposure_plus_1</i>
									</button>
								</div>
							</div>

							<table class="mdl-data-table striped centered" id="tableQuejas"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript">
		
	</script>

	<!-- FOOTER -->
	<%@ include file="/resources/templates/footer.jsp"%>

	<!-- JAVASCRIPT AND JQUERY -->

	<!-- JAVASCRIPT AND JQUERY -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.15/js/dataTables.material.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	<!-- LOCAL JAVASCRIPTS FILES -->
	<script type="text/javascript" charset="utf-8"
		src="<c:url value="/resources/js/tables.js" />"></script>



	<!-- MINE JAVASCRIPTS FILES -->
	<script src="<c:url value="/resources/js/continuarQueja.js" />"></script>
</body>
</html>