<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="modalAgregarUsuario" class="modal">
	<div class="modal-content">
		<div>
			<div class="row center">
				<h4 id="textoTitle"></h4>
			</div>
			<hr>


			<form id="formCrearEditarUsuario" action="" method="post">

				<input type="text" id="idUsuario" name="idUsuario" hidden="true">



				<div class="row">
					<div class="input-field col s8 m3 l4 ">
						<label>Tipo</label>
					</div>

					<div class="input-field col s8 m4 l4">
						<label>Rol</label>
					</div>

					<div class="input-field col s8 m3 l4">
						<label>Clave</label>
					</div>


				</div>

				<div class="row">
					<div class="input-field col s8 m3 l4 row">

						<select name="tipo" id="tipo" class="select browser-default validate" >
							<option value=""  disabled selected >Seleccione...</option>
							<option value="INTERNO">Interno</option>
							<option value="EXTERNO">Externo</option>

						</select>
				
					</div>
					
					
				

					<div class="input-field col s8 m4 l4">
						<select name="rolList" id="rolList" class="select2 browser-default validate" multiple>
							<option value="0" disabled>Seleccione..</option>
							<c:forEach var="rol" items="${roles}">
								<option value="${rol.idRol }">${rol.descripcion }</option>
							</c:forEach>

						</select>
					</div>

					<div class="input-field col s8 m3 l4">
						<input placeholder="" name="clave" id="clave" type="text"
							class="validate">
					</div>


				</div>

				<div class="row">

					<div class="input-field col s8 m3 l4">
						<label>Nombre</label>
					</div>
					<div class="input-field col s8 m3 l4">
						<label>Apellido Paterno</label>
					</div>
					<div class="input-field col s8 m3 l4">
						<label>Apellido Materno</label>
					</div>

				</div>
				<div class="row">

					<div class="input-field col s8 m3 l4">
						<input placeholder="" name="nombre" id="nombre" type="text"
							class="validate ">
					</div>
					<div class="input-field col s8 m3 l4">
						<input placeholder="" name="apellidoPaterno" id="apellidoPaterno"
							type="text" class="validate ">
					</div>
					<div class="input-field col s8 m3 l4">
						<input placeholder="" name="apellidoMaterno" id="apellidoMaterno"
							type="text" class="validate">
					</div>

				</div>

				<div class="row">

					<div class="input-field col s8 m5 l6">
						<input placeholder="" name="correo" id="correo" type="text"
							class="validate"> <label>Correo </label>
					</div>

					<div class="input-field col s8 m5 l6">
						<input placeholder="" name="telefono" id="telefono" type="text"
							class="validate "> <label>Teléfono</label>
					</div>

				</div>

				<div class="row">
					<div class="input-field col s8 m9 l6">
						<select name="adscripcion" id="adscripcion"
							class="select2 browser-default validate">
							<option value="" disabled="disabled" selected>Seleccione..</option>
							<c:forEach items="${adscripciones}" var="ad">
								<option value="${ad.adscrip }">${ad.adscrip }-${ad.descripAdscrip}</option>
							</c:forEach>
						</select> <label>Adscripción</label>
					</div>
					
					<div class="input-field col s8 m6 l6">
						<input name="edificio" id="edificio" type="text" placeholder="" class="validate" maxlength="100">
							
						<label>Edificio</label>
					
					</div>
					
				</div>
					<div class="row">
						<div class="col s2 push-s2 m3 push-m3">
							<a class="modal-close waves-effect waves-light btn-small red">Cancelar<i
								class="material-icons left">clear</i></a>
						</div>
						<div class="col s2 push-s2 m3 push-m3">
							<button id="btnAceptarCrearEditarUsuario"
								class="waves-effect waves-light btn-small blue">
								Aceptar<i class="material-icons left">check</i>
							</button>
						</div>
					</div>
			</form>
		</div>
	</div>
</div>

