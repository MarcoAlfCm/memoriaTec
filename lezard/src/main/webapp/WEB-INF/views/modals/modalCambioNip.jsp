<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="modalCambioNip" class="modal">
	<div class="modal-content center">
		<div class="container">
			<br><h4>CAMBIO DE NIP</h4><br><hr><br>
			<h6>Debe llenar los campos correctamemte para realizar el ccambio</h6><br>
			<div class="row">
				<form id="formRegister">
					<div class="row">
						<div class="input-field col s12 m6">
							<input type="password" name="nip" id="nip" class="validate">
							<label for="nip">Nip o contraseña</label>
						</div>
						<div class="input-field col s12 m6">
							<input type="password" name="nipValidation" id="nipValidation" class="validate">
							<label for="nipValidation">Confirmación del nip</label>
						</div>
					</div>
					<div class="row">
						<br>
						<button type="button" class="btn waves-effect waves-light btnCancelar modal-close">¡limpiar!<i class="material-icons right">close</i></button>
						<button class="btn waves-effect waves-light btnAceptar" id="btnChangePassword">¡Aceptar!<i class="material-icons right">send</i></button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>