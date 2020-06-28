<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- RESOURCES -->
		<%@ include file="/resources/templates/fixed_resources.jsp"%>
		
		<!-- TITLE -->
		<title>${contextTitle} - Perfil</title>
		
		<style>
		 .card {
			 width:400px;
		}
		</style>
	</head>
	
	<body>
		<!-- HEARDER -->
		<%@ include file="/resources/templates/header.jsp"%>
		
		<!-- MAIN -->
		<main>
			
		<div class="container">

			<div class="row card col s12 m12 l12 offset-m2 hoverable card-main-x1">



				<div class="card-content center">
					<span class="card-title center">${usuario.getNombre()}</span>
					
				</div>
				
				<p>Nombre Completo: ${usuario.getNombreCompleto()}</p>
				<p>Correo: ${usuario.getCorreo()}</p>
				<p>Teléfono: ${usuario.getTelefono()}</p>
				<p>Adscripción: ${usuario.getDescripcionAdscripcion()}</p>
				
				
				
				
				<div class="row">
					<div class="input-field col s2 m2 l2">
						<p>Teléfono: </p>
					</div>
					<div class="input-field col s5 m5 l5">
					
						<input type="text" id="Telefono" name="Telefono" value="${usuario.getTelefono()}">
					</div>
				</div>
				
				<div class="row">
					<div class="input-field col s2 m2 l2">
						<p>Edificio: </p>
					</div>
					<div class="input-field col s5 m5 l5">
					
						<input type="text" id="edificio" name="edificio" value="${usuario.getEdificio()}">
					</div>
				</div>
				
				
				
			</div>
		</div>
		</main>		
		
		<!--  MODALS -->
		
		<!-- FOOTER -->
		<%@ include file="/resources/templates/footer.jsp"%>
		
		<!-- JAVASCRIPT AND JQUERY -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fileDownload/1.4.2/jquery.fileDownload.min.js"></script>
		
		<!-- MINE JAVASCRIPTS FILES -->
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/perfil.js" />"></script>
	</body>
</html>