<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- RESOURCES -->
<%@ include file="/resources/templates/fixed_resources.jsp"%>
</head>

<body>
	<!-- VALIDATIONS LOGIN -->


	<c:if test="${usuarioAutenticado}">
		${usuarioAutenticado}
			<sec:authorize access="hasRole('ADMINISTRADOR')">
			<c:redirect url="/admin/noticias" />
		</sec:authorize>
		<sec:authorize access="hasRole('ENLACE')">
			<c:redirect url="/enlace/noticias" />
		</sec:authorize>
		<sec:authorize access="hasRole('ENCARGADO')">
			<c:redirect url="/encargado/noticias" />
			<p>Parrafo del encargado</p>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_SEGUIMIENTO')">
			<c:redirect url="/seguimiento/noticias" />
		</sec:authorize>
	</c:if>
</body>
</html>