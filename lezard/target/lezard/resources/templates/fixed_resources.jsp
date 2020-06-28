<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- ================================================== CSS ================================================== -->
<!-- LET BROWSER KNOW WEBSITE IS OPTIMIZED FOR MOBILE -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- IMPORT GOOGLE ICON FONT -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- CHARSET UTF-8 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- FAVICON -->
<link href="<c:url value="/resources/img/favicon.ico" />" rel="icon" type="image/png" >

<!-- CSS PLUGINS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/plugins/select2/select2-materialize.css" />" media="screen,projection" />

<!-- MINE CSS -->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/main.css" />" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/cssAssets/stroke-7/style.css" />" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/plugins/alertBox/css/alertBox.css" />" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/plugins/simpleLoading/css/simpleLoading.css" />" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/plugins/alertBox/css/font-awesome/css/font-awesome.css" />" media="screen,projection" />


<!-- ================================================== VARIABLES ================================================== -->
<!-- GLOBAL VARIABLES SPRING -->
<spring:url value="/" var="contextPath"/>
<c:set var="contextPath" value="${contextPath}" scope="request"/>
<c:set var="contextTitle" value="${fn:toUpperCase(fn:substring(contextPath, 1, fn:length(contextPath) - 1))}" scope="request"/>
<c:set var="userListRoles" value="0" scope="request"/>
<sec:authorize access="isAuthenticated()" var="usuarioAutenticado" />

<sec:authorize access="hasRole('ENLACE')" var="enlace"/>
<sec:authorize access="hasRole('ADMINISTRADOR')" var="admn"/>

<sec:authorize access="hasRole('ROLE_SEGUIMIENTO')" >
	<c:set var="userListRoles" value="${userListRoles + 1}" scope="request"/>
	<c:set scope="request" var="userRoleActive"	value="4"></c:set>
	<c:set scope="request" var="contextRoleActive" value="${contextPath}seguimiento/"></c:set>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ENCARGADO')" >
	<c:set var="userListRoles" value="${userListRoles + 1}" scope="request"/>
	<c:set scope="request" var="userRoleActive"	value="3"></c:set>
	<c:set scope="request" var="contextRoleActive" value="${contextPath}encargado/"></c:set>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ENLACE')" >
	<c:set var="userListRoles" value="${userListRoles + 1}" scope="request"/>
	<c:set scope="request" var="userRoleActive"	value="2"></c:set>
	<c:set scope="request" var="contextRoleActive" value="${contextPath}enlace/"></c:set>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_ADMINISTRADOR')" >
	<c:set var="userListRoles" value="${userListRoles + 1}" scope="request"/>
	<c:set scope="request" var="userRoleActive" value="1"></c:set>
	<c:set scope="request" var="contextRoleActive" value="${contextPath}admin/"></c:set>
</sec:authorize>


<!-- ================================================== JSP ================================================== -->
<!--  CERRAR SESIÖN -->
<%@ include file="/WEB-INF/views/modals/modalCerrarSesion.jsp"%>

<!-- SIDENAV -->
<%@ include file="/resources/templates/sidenav.jsp"%>

<!-- SIMPLE LOADING -->
<%@ include file="/resources/templates/simpleLoading.jsp"%>



<!-- ================================================== JS ================================================== -->
<!-- GLOBAL VARIABLES JAVASCRIPT -->
<script type="text/javascript">
	var CONTEXT_PATH = "${contextPath}",
		CURRENT_YEAR = "${session.anio}",
		CONTEXT_PLUS = "${contextRoleActive}",
		USER_ROLE_ACTIVE = "${userRoleActive}",
		IS_AUTHENTICATED = "${usuarioAutenticado}";
		
		
// 		console.log(CONTEXT_PATH+ "   "+CONTEXT_PLUS+"  "+USER_ROLE_ACTIVE)
</script>


<!-- SCRIPTS PLUGINS -->
<script type="text/javascript" charset="utf-8"  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8"  src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js"></script>
<script type="text/javascript" charset="utf-8"  src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
			
<!-- LOCAL SCRIPTS -->
<script type="text/javascript" charset="utf-8"  src="<c:url value="/resources/plugins/jQueryValidate1.19.1/jquery.validate.min.js" />"></script>
<script type="text/javascript" charset="utf-8"  src="<c:url value="/resources/plugins/jQueryValidate1.19.1/localization/messages_es.min.js" />"></script>

<script type="text/javascript" src="<c:url value="/resources/plugins/alertBox/js/TweenMax.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/alertBox/js/alertBox.js" />"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/main.js" />"></script>