<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- RESOURCES -->
<%@ include file="/resources/templates/fixed_resources.jsp"%>
<!-- PLUGIN CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="//cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css">



<!-- TITLE -->
<title>${contextTitle}-Quejas</title>
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
						<span class="card-title center">UNIDAD DE ATENCI&Oacute;N A LA VIOLENCIA DE G&Eacute;NERO</span>
						<hr>
<!-- 						<br class="hide-on-med-and-down" /> -->
						<div class="row col l12">
							
							<div class="row">
								<div class="center">
									<button class="btn-floating   waves-light green pulse right" id="btnCrearCaso" title="Crear nuevo caso">
										<i class="material-icons right">exposure_plus_1</i>
									</button>
								</div>
							</div>
							<div class="row center">
								<table class="mdl-data-table striped centered" id="tableCasos"></table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<!--  MODALS -->
	<%@ include file="/WEB-INF/views/modals/modalCrearCaso.jsp"%>
	<%@ include file="/WEB-INF/views/modals/modalCambiarEstatus.jsp"%>
	

	<!-- FOOTER -->
	<%@ include file="/resources/templates/footer.jsp"%>


	<!-- JAVASCRIPT AND JQUERY -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.15/js/dataTables.material.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
	<!-- LOCAL JAVASCRIPTS FILES -->
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/tables.js" />"></script>



	<!-- MINE JAVASCRIPTS FILES -->
	<script src="<c:url value="/resources/js/queja.js" />"></script>
	<script src="<c:url value="/resources/js/validations/queja.js" />"></script>
	<!-- 	<script charset="utf-8" type="text/javascript" -->
	<%-- 		src="<c:url value="/resources/resources2/js/validations/datosIdentificacion.js" />"></script> --%>
</body>
</html>