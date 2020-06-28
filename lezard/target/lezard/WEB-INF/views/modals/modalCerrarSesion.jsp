<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="modalCerrarSesion" class="modal hoverable border-error">
	<div class="modal-content center">
		<h5 class="tituloModalCerrarSesion">¿Esta seguro que desea<br>cerrar sesión?</h5>
		<i class="material-icons iconCerarSesion">close</i><br>
		<div class="row center hide-on-med-and-down">
			<a class="btn waves-effect waves-light btnCerrarSesionCancelar btnCancelar modal-close">CANCELAR</a> 
			<a class="btn waves-effect waves-light btnCerrarSesionAceptar btnAceptar" href="${contextPath}api/logout">¡ACEPTAR!</a>
		</div>
		<div class="row center hide-on-large-only">
			<a class="btn waves-effect waves-light btnCerrarSesionAceptar btnCancelar modal-close"><i class="material-icons">close</i></a>
			<a class="btn waves-effect waves-light btnCerrarSesionCancelar btnAceptar" href="${contextPath}api/logout"><i class="material-icons">logout</i></a>
		</div>
	</div>
</div>