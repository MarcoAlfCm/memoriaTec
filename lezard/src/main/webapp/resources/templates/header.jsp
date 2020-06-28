<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<header>
	<div class="navbar-fixed">
		<nav class="hide-on-small-only">
			<div class="nav-wrapper ">
				<div class="sidenav-trigger" data-target="slideNavMain">
										<sec:authorize access="isAuthenticated()" var="usuarioAuthenticado" />
						<c:if test="${usuarioAuthenticado}">
				
						<a id="btnLaunchNav" class="large" href="#"> <i class=" material-icons "
							title="Abrir o cerrar barra lateral">menu</i>
						</a>
					</c:if>
				</div>
				<!-- 				Logo UAQ -->
														
<%-- 		${usuarioAuthenticado} --%>
				<a href="https://www.uaq.mx/" target="_blank"> <img
					id="imgHeader"
					src="<c:url value="/resources/img/uteqBlanco.png" />
					">
					
				</a> <a class="center brand-logo truncate btnGoHome" href="#">LEZARD</a>
			</div>
		</nav>
		
	</div>
</header>