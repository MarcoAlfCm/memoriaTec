<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="modalDatosAgresor" class="modal">
	<div class="modal-content">
		<div>
			<div class="row center">
				<h4 id="textoTitle"></h4>
			</div>
			<hr>


			<form id="formDatosPersonaAgreso">


				<input hidden="" type="text" value="${idQueja}" id="id_QuejaAgresor"
					name="id_QuejaAgresor"> <input type="text" hidden=""
					id="idDatosAgresor" name="idDatosAgresor">


				<div class="col s12 m6 l6">
					<p>
						<span style="color: red">*</span>¿Conoces a la persona agresora?
					</p>
				</div>
				<div class="col s12 m6 l6">
					<p>
						<span style="color: red">*</span>Sexo de la persona agresora.
					</p>
				</div>


				<div class="input-field col s12 m6 l6">
					<select class="select2 browser-default validate"
						id="conoceAgresor" name="conoceAgresor">
						<option value="" selected disabled>Seleccione...</option>
						<option value="SI">SI</option>
						<option value="NO">NO</option>
					</select>
				</div>
				<div class="input-field col s12 m6 l6">
					<select class="select2 browser-default validate" id="sexoAgresor"
						name="sexoAgresor">
						<option value="" selected disabled>Seleccione...</option>
						<option value="HOMBRE">HOMBRE</option>
						<option value="MUJER">MUJER</option>
					</select>
				</div>
				<div class="col s12 m12 l12">
					<br>
				</div>

				<div class="input-field col s12 m4 l4">
					<label>Nombre</label>
				</div>
				<div class="input-field col s12 m4 l4">
					<label>Apellido paterno</label>
				</div>
				<div class="input-field col s12 m4 l4">
					<label>Apellido materno</label>
				</div>

				<div class="input-field col s10 m4 l4">
					<input class="validate" type="text" name="nombreAgresor"
						id="nombreAgresor">

				</div>

				<div class="input-field col s10 m4 l4">
					<input id="apellidopAgresor" name="apellidopAgresor" type="text"
						class="validate">
				</div>

				<div class="input-field col s10 m4 l4">
					<input id="apellidomAgresor" name="apellidomAgresor" type="text"
						class="validate">
				</div>


				<div class="col s12 m12 l12">
					<br>
				</div>

				<div class="col s12 l6 m6 ">
					<span style="color: red">*</span>Ocupación con relación a la UAQ
				</div>
				<div class="col s12 l6 m6 ">
					<span style="color: red">*</span>Especifíque ocupación con respecto
					a la UAQ
				</div>



				<div class="input-field col s12 m6 l6">
					<select class="select2 browser-default validate"
						id="selectOcupacionAgresor" name="selectOcupacionAgresor">
						<option value="" selected>Seleccione...</option>
						<c:forEach var="ocu" items="${ocupaciones}">
							<option value="${ocu.idOcupacion}">${ocu.descripcion}</option>
						</c:forEach>
						<option value="OTRO">OTRO</option>

					</select>
				</div>

				<div class="input-field col s12 m6 l6">
					<input class="validate" id="otroOcupacionAgresor" name="otroOcupacionAgresor"
						type="text" maxlength="50">
				</div>

				<div class="col s12 m12 l12">
					<br>
				</div>

				<div class="input-field col s12 m6 l6">
					<p>
						<span style="color: red">*</span>Vinculo con la presunta persona
						agresora
					</p>
				</div>

				<div class=" input-field col s12 m6 l6">
					<p>
						<span style="color: red">*</span>Área de adscripción
					</p>
				</div>


				<div class="col s12 m6 l6">

					<select class="select2 browser-default validate"
						id="vinculoPersonaAgresora" name="vinculoPersonaAgresora">
						<option value="" selected>Seleccione...</option>
						<c:forEach items="${vinculos}" var="vin">
							<option value="${vin.idVinculo }">${vin.descripcion}</option>
						</c:forEach>
					</select>
				</div>


				<div class="col s12 m6 l6">

					<select class="select2 browser-default validate"
						id="selectAdscripcionPersonaAgresora"
						name="selectAdscripcionPersonaAgresora">
						<option value="" selected>Seleccione...</option>
						<c:forEach items="${adscripciones}" var="ad">
							<option value="${ad.adscrip }">${ad.adscrip }-${ad.descripAdscrip}</option>
						</c:forEach>

					</select>
				</div>


				<div class="row right col s12 m12 l12">
					<br> <br>
			
					
							
					<button class="btn  waves-light btnAceptar right"
						id="btnAceptarDatosPersonaAgreso">
						¡Guardar!<i class="material-icons right">save</i>
					</button>
				</div>
			</form>
			<button class="btn  waves-light btnAceptar right red"
						id="btnAcerrarModalAgresor">
						¡Cerrar!<i class="material-icons right">close</i>
					</button>
		</div>
	</div>
</div>

