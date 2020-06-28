<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<!-- resources2 -->
		<%@ include file="/resources/templates/fixed_resources.jsp"%>
		
		<!-- TITLE -->
		<title>${contextTitle} - Inicia sesi�n</title>
	</head>
	
	<body>
		<!-- VALIDATIONS LOGIN -->
		<c:if test="${usuarioAutenticado}">
			<sec:authorize access="hasRole('ADMINISTRADOR')" >
				<c:redirect url="/admin/dashboard" />
			</sec:authorize>
			<sec:authorize access="hasRole('USUARIO')" >
				<c:redirect url="/usuario/dashboard" />
			</sec:authorize>
		</c:if>
		
		<!-- HEARDER -->
		<%@ include file="/resources/templates/header.jsp"%>
		
		<!-- MAIN -->
		<main>
			<div class="container hide-on-med-and-down" id="spaceDesktop">
				<div class="row">
					<div class="col s12">
						<div class="valign-wrapper">
							<div class="col s7">
								<div class="row">
									<h5 class="center">BIENVENIDO AL PROGRAMA LEZARD,  SISTEMA PARA EL REGISTRO DE CALIFICACIONES DE MATEM�TICAS</h5>
								</div>
<!-- 								<div class="row"> -->
<!-- 									<img class="center col s6 offset-s3" src="/foper_qa/resources/img/somos_uaq_srec.png"> -->
<!-- 								</div> -->
								<div class="row">
									<div class="card-panel hoverable">
										<span>BIENVENIDO AL PROGRAMA LEZARD. Tiene el prop�sito de 
											contribuir a la formaci�n de los estudiantes de la Universidad , mediante el conocimiento de las calificaciones y 
											�reas donde fallo el estudiante</span>
									</div>
								</div>
							</div>
							<div class="col s4 offset-s1 valign">
								<div class="card">
									<div class=" hoverable card-content center">
										<ul class="tabs" id="tabs-swipe-account">
											<li class="tab col s10 offset-s1"><a class="active" href="#swipe-login">Inicia Sesi�n</a></li>
										<li class="indicator" style="left: 20px; right: 20px;"></li></ul>
										
										<div id="swipe-login" class="active">
											
											<form action="/lezard/api/authenticate" id="formLogin" method="post" novalidate="novalidate">
											
												<br>
													<div class="input-field col s6 offset-s3">
														<input id="username" name="username" type="text" class="validate" maxlength="50" autofocus="autofocus">
														<label for="username" class="active">Expediente</label>
													</div>
													<div class="input-field col s6 offset-s3">
														<input id="password" name="password" type="password" class="validate" maxlength="30">
														<label for="password">Nipe</label>
													</div>
												<div class="row">
													<div class="col s8 offset-s2">

														<button class="btn-large waves-effect waves-light btnAceptar" id="btnLogin">�Entrar!</button>
													</div>
												</div>	 
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- 					<div class="col s12"> -->
<!-- 						<div class="card-panel hoverable red white-text"> -->
<!-- 							<span class="col s10 offset-s1">NOTA: Para el mejor funcionamiento del sistema FOPER, te recomendamos abrir esta p�gina desde el navegador Google Chrome. Tambi�n te recordamos que el sistema no cuenta con soporte para dispositivos m�viles.</span> -->
<!-- 							<br><br> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>			
			</div>
			
<!-- 			<div class="container hide-on-large-only" id="spaceMobile"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col s12"> -->
<!-- 						<div class="row"> -->
<!-- 							<h5 class="center">BIENVENIDO AL PROGRAMA DE SEGUIMIENTO DEL FONDO DE PROYECTOS ESPECIALES DE RECTOR�A FOPER</h5> -->
<!-- 						</div> -->
<!-- <!-- 						<div class="row"> --> 
<!-- <!-- 							<img class="center col s6 offset-s3" src="/foper_qa/resources/img/somos_uaq_srec.png"> --> 
<!-- <!-- 						</div> --> 
<!-- 						<div class="row"> -->
<!-- 							<div class="card-panel hoverable"> -->
<!-- 								<span>PROGRAMA DE SEGUIMIENTO DEL FONDO DE PROYECTOS ESPECIALES DE RECTOR�A (FOPER) Tiene el prop�sito de  -->
<!-- 									contribuir a la formaci�n de los estudiantes de la Universidad Aut�noma de Quer�taro, mediante el desarrollo  -->
<!-- 									de proyectos en las diferentes �reas del conocimiento; que impacten en la calidad de vida de la comunidad  -->
<!-- 									universitaria y de los Queretanos.</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col s12"> -->
<!-- 						<div class="card"> -->
<!-- 							<div class="card-content center"> -->
<!-- 								<ul class="tabs" id="tabs-swipe-account"> -->
<!-- 									<li class="tab col s10 offset-s1"><a class="active" href="#swipe-login-mobile">Inicia Sesi�n</a></li> -->
<!-- 								<li class="indicator" style="left: 41px; right: 1px;"></li></ul> -->
								
<!-- 								<div id="swipe-login-mobile" class="active"> -->
									
<!-- 									<form action="/lezard/api/authenticate" method="post" id="formLoginMobile" novalidate="novalidate"> -->
<!-- 										<br><br> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="input-field col s8 offset-s2"> -->
<!-- 												<input id="nombreUsuario" name="nombreUsuario" type="text" class="validate" maxlength="50"> -->
<!-- 												<label for="nombreUsuario">Expediente</label> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="input-field col s8 offset-s2"> -->
<!-- 												<input id="contrasena" name="contrasena" type="password" class="validate" maxlength="30"> -->
<!-- 												<label for="contrasena">Nip</label> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col s8 offset-s2"> -->
<!-- 												<br> -->
<!-- 												<button class="btn-large waves-effect waves-light btnAceptar" id="btnLoginMobile">�Entrar!</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</form> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col s12"> -->
<!-- 						<div class="card-panel hoverable red white-text col s10 offset-s1"> -->
<!-- 							<span>NOTA: Para el mejor funcionamiento del sistema FOPER, te recomendamos abrir esta p�gina desde el navegador Google Chrome. Tambi�n te recordamos que el sistema no cuenta con soporte para dispositivos m�viles.</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</main>
		
		<!-- FOOTER -->
		<%@ include file="/resources/templates/footer.jsp"%>
		
		<!-- GET MESSAGE -->
		<c:if test="${param.logout != null}">
			<c:set scope="request" var="userMessage" value="Has cerrado sesi�n exitosamente."></c:set>
		</c:if>
		
		<!-- GLOBAL VARIABLES JAVASCRIPT -->
		<script type="text/javascript">
			var MENSAJE_USUARIO = '${userMessage}'; 
		</script>
		
		<!-- MINE JAVASCRIPTS FILES -->
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/validations/login.js" />"></script>
		<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/login.js" />"></script>
	</body>
</html>