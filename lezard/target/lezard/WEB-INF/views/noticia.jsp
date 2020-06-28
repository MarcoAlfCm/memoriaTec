<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- RESOURCES -->
<%@ include file="/resources/templates/fixed_resources.jsp"%>
<title>${contextTitle}-Noticias</title>
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
						<span class="card-title center">NOTICIAS</span>
						<hr>
						<br class="hide-on-med-and-down" />
						<div class="row col m12 l12">
							<div class="row">
								<div class="card-panel">
									<c:if test="${empty noticias }">
										<a class="btn btn-floating center" href="agregarNoticias" title="Agregar/editar noticia)"><i class="material-icons">edit</i></a>
										<br>
									</c:if>
									<sec:authorize access="hasRole('ENCARGADO')" var="encargado"/>
									<sec:authorize access="hasRole('ENLACE')" var="enlace"/>
									<sec:authorize access="hasRole('ADMINISTRADOR')" var="administrador"/>
									<c:if test="${not empty noticias }">
										<ul class="collapsible">
											<c:forEach var="noticia" items="${noticias}">
												<sec:authorize access="hasRole('ADMINISTRADOR')">
												<c:if test="${noticia.rol.descripcionRol eq 'ADMINISTRADOR'}">
													<li>
														<div class="collapsible-header">
															<i class="material-icons">filter_drama</i>Noticias
															${noticia.rol.descripcionRol}
														</div>
														<div class="collapsible-body">
															<c:if test="${ empty noticia.informacion }">
															Sin noticias
														</c:if>
															<c:if test="${not empty noticia.informacion }">
															${noticia.informacion }
														</c:if>
														
															<a class="btn btn-floating right"
																href="createEditNoticia?noticia=${noticia.idNoticia}"
																title="Agregar/editar noticia"> <i
																class="material-icons">edit</i>
															</a> 
															
															<br>
														</div>
													</li>
													</c:if>
												</sec:authorize>
												<sec:authorize access="hasRole('ENLACE')">
													<c:if test="${noticia.rol.descripcionRol eq 'ENLACE'}">
												
													<li>
														<div class="collapsible-header">
															<i class="material-icons">filter_drama</i>Noticias
															${noticia.rol.descripcionRol}
														</div>
														<div class="collapsible-body">
															<c:if test="${ empty noticia.informacion }">
															Sin noticias
														</c:if>
															<c:if test="${not empty noticia.informacion }">
															${noticia.informacion }
														</c:if>
																<sec:authorize access="hasRole('ADMINISTRADOR')">
															<a class="btn btn-floating right"
																href="createEditNoticia?noticia=${noticia.idNoticia}"
																title="Agregar/editar noticia"> <i
																class="material-icons">edit</i>
															</a> <br>
															</sec:authorize>
														</div>
													</li>
													</c:if>
												</sec:authorize>
												<sec:authorize access="hasRole('ENCARGADO')">
												<c:if test="${noticia.rol.descripcionRol eq 'ENCARGADO DE ATENCION'}">
													<li>
														<div class="collapsible-header">
															<i class="material-icons">filter_drama</i>Noticias
															${noticia.rol.descripcionRol}
														</div>
														<div class="collapsible-body">
															<c:if test="${ empty noticia.informacion }">
															Sin noticias
														</c:if>
															<c:if test="${not empty noticia.informacion }">
															${noticia.informacion }
														</c:if>
																<sec:authorize access="hasRole('ADMINISTRADOR')">
															<a class="btn btn-floating right"
																href="createEditNoticia?noticia=${noticia.idNoticia}"
																title="Agregar/editar noticia"> <i
																class="material-icons">edit</i>
															</a> <br>
															</sec:authorize>
														</div>
													</li>
													</c:if>
												</sec:authorize>

											</c:forEach>
										</ul>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- FOOTER -->
	<%@ include file="/resources/templates/footer.jsp"%>

	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.collapsible');
			var instances = M.Collapsible.init(elems);
		});

		var $btnCrearNoticia = $("#btnCrearNoticia");

		$btnCrearNoticia.on('click', function() {
			// 	alert()

			location.href = "agregarNoticias"
		})

		// 		$document.ready(function() {
		// 			$.ajax({
		// 				type : 'POST',
		// 				url : CONTEXT_PATH + "admin/noticia/verNoticias",
		// 				success : function(data, textStatus, jqXHR) {
		// 					$("#mostrarNoticia").append(data.informacion);
		// 				}
		// 			});
		// 		});
	</script>
</body>
</html>