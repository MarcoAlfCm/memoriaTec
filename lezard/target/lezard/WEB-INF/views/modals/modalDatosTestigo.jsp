<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="modalDatosTestigo" class="modal">
	<div class="modal-content">
		<div>
			<div class="row center">
				<h4 id="textoTitles"></h4>
			</div>
			<hr>


			<form id="formDatosTestigo">


				<input hidden="" type="text" value="${idQueja}" id="id_QuejaTestigo"
					name="id_QuejaTestigo"> <input type="text" hidden=""
					id="idDatosTestigo" name="idDatosTestigo">



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
					<input class="validate" type="text" name="nombreTestigo"
						id="nombreTestigo">

				</div>

				<div class="input-field col s10 m4 l4">
					<input id="apellidopTestigo" name="apellidopTestigo" type="text"
						class="validate">
				</div>

				<div class="input-field col s10 m4 l4">
					<input id="apellidomTestigo" name="apellidomTestigo" type="text"
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
						id="selectOcupacionTestigo" name="selectOcupacionTestigo">
						<option value="" selected>Seleccione...</option>
						<c:forEach var="ocu" items="${ocupaciones}">
							<option value="${ocu.idOcupacion}">${ocu.descripcion}</option>
						</c:forEach>
						<option value="OTRO">OTRO</option>

					</select>
				</div>

				<div class="input-field col s12 m6 l6">
					<input id="otroOcupacionTestigo" name="otroOcupacionTestigo"
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
						id="vinculoTestigo" name="vinculoTestigo">
						<option value="" selected>Seleccione...</option>
						<c:forEach items="${vinculos}" var="vin">
							<option value="${vin.idVinculo }">${vin.descripcion}</option>
						</c:forEach>
					</select>
				</div>


				<div class="col s12 m6 l6">

					<select class="select2 browser-default validate"
						id="selectAdscripcionTestigo" name="selectAdscripcionTestigo">
						<option value="" selected>Seleccione...</option>
						<c:forEach items="${adscripciones}" var="ad">
							<option value="${ad.adscrip }">${ad.adscrip }-${ad.descripAdscrip}</option>
						</c:forEach>

					</select>
				</div>


				<div class="row right col s12 m12 l12">
					<br> <br>
					<button class="btn right waves-light btnAceptar "
						id="btnAceptarDatosTestigo">
						¡Guardar!<i class="material-icons right">save</i>
					</button>
				</div>
			</form>
			<button class="btn  waves-light right btnAceptar red "
				id="btncerrarModalTestigo">
				¡Cerrar!<i class="material-icons right">save</i>
			</button>
		</div>
	</div>
</div>

