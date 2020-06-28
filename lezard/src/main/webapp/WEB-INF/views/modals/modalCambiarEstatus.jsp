<div id="modalCambiarEstatus" class="modal">
	<div class="modal-content">
		<div>
			<div class="row center">
				<h4>Actualizar estatus</h4>
			</div>

			<hr>
			<div>
				<div class="row">
					<form id="formCambiarEstatus" name="formCambiarEstatus"class="col s12">
						<input type="hidden" name="idCaso" id="idCasoInput" >
						<div class="row">
							<div class="input-field col s4">
								<textarea id="observacionesPrevias"name="observacionesPrevias" class="materialize-textarea"></textarea>
								<label for="observacionesPrevias">Observaciones previas</label>
							</div>
							<div class="input-field col s8">
								<textarea id="observaciones"name="observaciones" class="materialize-textarea"></textarea>
								<label for="observaciones">Observaciones</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12 ">
								<select id="estatusSelect"name="estatusSelect">
									<option value="" disabled selected>Seleccione uno</option>
									<option value="1">EN CAPTURA</option>
									<option value="2">EN PROCESO</option>
									<option value="3">EN INVESTIGACIÓN</option>
									<option value="4">FINALIZADO</option>
								</select> <label>Estatus</label>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a class="modal-close green waves-effect waves-green btn-flat btnAceptaCambiarEstatus">Aceptar</a>
	</div>
</div>