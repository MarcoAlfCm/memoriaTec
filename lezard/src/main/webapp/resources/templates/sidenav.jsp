
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="container">
	<!-- 	<ul id="slideNavMain" class="sidenav blue-grey darken-2 collapsible collapsible-accordion expandable "> -->
	<ul id="slideNavMain"
		class="sidenav blue-grey-text text-darken-4 collapsible collapsible-accordion expandable ">

		<c:if test="${usuarioAutenticado}">
			
				<!-- Administrador -->
				<li class="active" ><a
					class="collapsible-header waves-effect waves-light center-align subheader-role z-depth-1">
<!-- 							<i id="btnLaunchNav" class=" white-text material-icons" title="Abrir o cerrar barra lateral">menu</i> -->
					<img
					id="imgHeader"
					src="<c:url value="/resources/img/uaqLogoWhite.png" />">
					
					</a>
					<div class="collapsible-body">
						<ul class="collapsible collapsible-accordion expandable">
						
							<sec:authorize access="hasAnyRole('ENLACE','ROLE_SEGUIMIENTO','ROLE_ENCARGADO','ROLE_SEGUIMIENTO')">
								<li><a class="waves-effect waves-blue" href="${contextRoleActive}quejas">Formato queja<i class="material-icons left ">format_align_justify</i></a></li>
								<li><a class="waves-effect waves-blue" href="${contextRoleActive}noticias">Noticias<i class="s7-news-paper left "></i></a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMINISTRADOR')">
								<li><a class="waves-effect waves-blue" href="${contextRoleActive}usuarios">Usuarios<i class="material-icons left ">people</i></a></li>
						</sec:authorize>

						</ul>
					</div></li>
		
<%-- 			<sec:authorize access="hasRole('ENLACE')"> --%>
<!-- 				Enlace -->
<!-- 				<li class="active"><a -->
<!-- 					class="collapsible-header waves-effect waves-light center-align subheader-role z-depth-1">ENLACE</a> -->
<!-- 					<div class="collapsible-body"> -->
<!-- 						<ul class="collapsible collapsible-accordion expandable"> -->
<!-- 							<li><a class="waves-effect waves-blue" -->
<%-- 								href="${contextRoleActive}quejas">Administración de quejas<i --%>
<!-- 									class="s7-news-paper left hide-on-med-and-down"></i></a></li> -->
<!-- 						</ul> -->
<!-- 					</div></li> -->
<%-- 			</sec:authorize> --%>
			<!-- Cuenta -->
			<li class="active"><a
				class="collapsible-header co collapsible-headerco waves-effect waves-light center-align subheader-role z-depth-1">CUENTA</a>
				<div class="collapsible-body">
					<ul class="collapsible co collapsible-accordion expandable">
						<li><a class="waves-effect waves-blue"
							href="${contextRoleActive}perfil">Ver mi perfil<i
								class="material-icons left ">account_circle</i></a></li>
						<li><a class="waves-effect waves-blue"
							onclick="cerrarSesion()">Cerrar sesi&oacute;n<i
								class="material-icons left ">exit_to_app</i></a></li>
					</ul>
				</div></li>
		</c:if>
	</ul>
</div>