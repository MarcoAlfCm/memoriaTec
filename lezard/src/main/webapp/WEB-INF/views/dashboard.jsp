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
			<c:redirect url="/admin/usuarios" />
		</sec:authorize>
		<sec:authorize access="hasRole('MAESTRO')">
			<c:redirect url="/maestro/noticia" />
		</sec:authorize>
		<sec:authorize access="hasRole('ALUMNO')">
			<c:redirect url="/alumno/noticia" />
		</sec:authorize>
	</c:if>
</body>
</html>