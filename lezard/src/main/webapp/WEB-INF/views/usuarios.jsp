<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- RESOURCES -->
		<%@ include file="/resources/templates/fixed_resources.jsp"%>
		
		<!-- TITLE -->
		<title>${contextTitle} - Perfil</title>
	</head>
	
	<body>
		<!-- HEARDER -->
		<%@ include file="/resources/templates/header.jsp"%>
		
		<!-- MAIN -->
		<main>
			<div class="container">
				<div class="row">
					<div class="card col s12 m10 offset-m1 hoverable">
						<div class="card-content">
							<c:choose>
								<c:when test="${usuario != null}">
									<span class="card-title center">PANEL ADMINISTRATIVO</span>
									<hr>
									<br><br class="hide-on-med-and-down">
									
																
								</c:when>
							
							</c:choose>
							</div>	
						</div>
					</div>
				</div>
		</main>		
		
		<!--  MODALS -->
		
		<!-- FOOTER -->
		<%@ include file="/resources/templates/footer.jsp"%>
		
		<!-- JAVASCRIPT AND JQUERY -->
		
		<!-- MINE JAVASCRIPTS FILES -->
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/perfil.js" />"></script>
	</body>
</html>