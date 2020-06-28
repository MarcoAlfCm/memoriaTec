<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- RESOURCES -->
<%@ include file="/resources/templates/fixed_resources.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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

						<span class="card-title center">Instrumentoo de entrevista para personas que interponen una queja por Violencia de Género, Acoso Sexual y Hostigamiento Sexual</span>
						<hr>
						<br class="hide-on-med-and-down">
						<div class="card-content center">
							<ul class="tabs" id="tabs-swipe-account">
								<li class="tab"><a class="active"	href="#tab-datos-generales">1. Datos de identificaci&oacute;n</a></li>
								<li id="idTabDatosAgresion" class="tab" ><a href="#tab-datos-agresion">2.Datos de la agresi&oacute;n</a></li>
								<li class="tab"><a href="#tab-datos-agresor">3.Datos de la persona agresora</a></li>
								<li class="tab"><a href="#tab-datos-testigo">4.Datos testigo</a></li>
							</ul>
						</div>

						<%@ include file="/WEB-INF/views/formato/datosIdentificacion.jsp"%> 


						<%@ include file="/WEB-INF/views/formato/datosAgresion.jsp"%>

						<%@ include file="/WEB-INF/views/formato/datosAgresor.jsp"%>


						<%@ include file="/WEB-INF/views/formato/datosTestigo.jsp"%>

					</div>
				</div>
			</div>
		</div>
	</main>

<script>
$('ul#tabs-swipe-account').on('click', 'a', function(e) {

	//llamada ajax donde guardar en controlador

// 	alert("tab")
	});
	
	</script>
	<!--  MODALS -->

	<!-- FOOTER -->
	<%@ include file="/resources/templates/footer.jsp"%>

	<!-- JAVASCRIPT AND JQUERY -->


	<!-- MINE JAVASCRIPTS FILES -->
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/datosIdentificacion.js" />"></script>
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/validations/datosIdentificacion.js" />"></script>
<%-- 		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/testigo.js" />"></script> --%>
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/validations/datosIdentificacion.js" />"></script>
<%-- 		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/validations/datosTestigo.js" />"></script> --%>
<!-- 		 Datos de agresion --> 
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/datosAgresion.js" />"></script>
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/validations/datosAgresion.js" />"></script>
</body>
</html>