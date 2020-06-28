
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>

<!-- RESOURCES -->
<%@ include file="/resources/templates/fixed_resources.jsp"%>

<!-- PLUGIN CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css">

<title>${contextTitle}-Usuarios</title>
</head>
<body>
	<%@ include file="/resources/templates/header.jsp"%>
	<main>
		<div class="container">
			<div class="row card col s12 m8 offset-m2 hoverable card-main-x1">
				<div class="card-content center">
					<span class="card-title center">PANEL USUARIOS</span>
					<hr>
					<br> 
					<br class="hide-on-med-and-down">
					<form>
						<div class="row">
						<div class="col s5 m5 l5"></div>
							<div class="input-field col s3 m3 l2">
								<input name="bsqClave" id="bsqClave" placeholder="" type="text" class="validate"> <label>Clave</label>
							</div>
						</div>

						<div class="row">
							<div class="col s3"></div>
							<div class="col s3">
								<button type="reset" id="btnClear" class="waves-effect waves-light btn-small red">
									Limpiar<i class="material-icons left">clear</i>
								</button>
							</div>
							<div class="col s3">
								<a class="waves-effect waves-light btn-small blue" id="btnBuscar">
								Buscar<i class="material-icons left">search</i></a>
							</div>
						</div>
					</form>
					<div class="row center">
						<table class="mdl-data-table striped centered" id="tableUsuarios"></table>
					</div>
				</div>
			</div>
		</div>

		<a class=" btn-floating btn-large waves-effect waves-light red add"
			id="btnAgregarUsuario"> <i class="material-icons">add</i>
		</a>
	</main>
	<!-- FOOTER -->
	<%@ include file="/resources/templates/footer.jsp"%>

	<!-- MODALS -->
<%-- 	<%@ include file="/WEB-INF/views/modals/modal_usuario.jsp"%> --%>
<%-- 	<%@ include file="/WEB-INF/views/modals/modalUsuarioDesbloquear.jsp"%> --%>

	<!-- JAVASCRIPT AND JQUERY -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.material.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>

	<!-- LOCAL JAVASCRIPTS FILES -->
	<script type="text/javascript" charset="utf-8"
		src="<c:url value="/resources/js/tables.js" />"></script>


	<script src="<c:url value="/resources/js/usuario.js" />"></script>
<%-- 	<script src="<c:url value="/resources/js/validations/usuario.js" />"></script> --%>
</body>
</html>