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
						<span class="card-title center">AGREGAR NOTICIA</span>
						<hr>
						<br class="hide-on-med-and-down" />
						<div class="row col l12">
							<div class="row">
								<div class="center">
									<div class="card-panel">
										<div class="adjoined-bottom">
											<div class="grid-container">
												<div class="grid-width-100">
												<input type="text" name="idNoticia" id="idNoticia" value="${ param.noticia}" hidden="">
													<textarea class="ckeditor" name="informacion" id="informacion">
													${noticias.informacion }
													</textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<button class="btn large btnAceptar right" id="btnAgregarNoticia">Guardar</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>
	<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/plugins/ckeditor/ckeditor.js" />"></script>
	<script src="<c:url value="/resources/js/noticia.js" />"></script>

	<!-- FOOTER -->
	<%@ include file="/resources/templates/footer.jsp"%>


</body>
</html>