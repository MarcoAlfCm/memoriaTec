<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<div id="tab-datos-generales">
	<div class="row">
		<form id="formDatosIdentificacion" method="POST">

			<input type="text" id="idDatosidentificacion" name="idDatosidentificacion" hidden=""> 
			<input type="text" value="${idQueja}" id="idQuejaI" name="idQuejaI" hidden="">

			<div class="col s10 m4 l4">
				<p>
					<span style="color: red">*</span>Nombre
				</p>
			</div>

			<div class="col s10 m4 l4">
				<p>
					<span style="color: red">*</span>Apellido paterno
				</p>
			</div>

			<div class="col s10 m4 l4">
				<p>
					<span style="color: red">*</span>Apellido materno
				</p>
			</div>


			<div class="input-field col s10 m4 l4">
				<input type="text" name="nombreI" id="nombreI" class="validate" onkeyup="this.value = this.value.toUpperCase();" >
			</div>


			<div class="input-field col s10 m4 l4">
				<input id="apellidoPaternoI" name="apellidoPaternoI" type="text" class="validate" maxlength="50" onkeyup="this.value = this.value.toUpperCase();">
			</div>



			<div class="input-field col s10 m4 l4">
				<input class="validate" id="apellidoMaternoI" name="apellidoMaternoI" type="text" maxlength="50" onkeyup="this.value = this.value.toUpperCase();">
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<div class="col s12 m12 l12 offset-m1 ">
				<p>Nombre preferente con el que desea ser llamada la persona:</p>
			</div>

			<div class="input-field col s12 m12 l12">
				<input id="nombrePreferenteI" name="nombrePreferenteI" type="text" class="validate" maxlength="50">
			</div>

			<div class=" collection center" style="height: 25px">
				<label class="collection-item black-text" style="font-size: 9pt">OPCIONAL,solo si el nombre legal est&aacute; registrado. </label>
			</div>
			<div class="col s12 m12 l12">
				<br>
			</div>

			<div class="col s10 m4 l3">
				<p>
					<span style="color: red">*</span>Edad
				</p>
			</div>
			<div class="col s12 m4 l3">
				<p>
					<span style="color: red">*</span>Fecha de nacimiento
				</p>
			</div>
			<div class="col s12 m4 l6" >
				<p id="padreMenorEdad">En caso de ser menor de edad, colocar el nombre del padre, madre o tutor:</p>
			</div>
			<div class="input-field col s12 m4 l3">
				<input id="edadI" name="edadI" type="text" class="validate" maxlength="3" onchange="revisarInputTutor()">
			</div>
			<div class="input-field col s12 m4 l3">
				<input id="fechaNacimientoI" name="fechaNacimientoI" type="text" class=" datepicker validate">
			</div>

			<div class="input-field col s12 m4 l6">
				<input id="nombreTutorI" name="nombreTutorI" type="text" >
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<div class="col s12 m6 l6">
				<p>
					<span style="color: red">*</span>Genero:
				</p>
			</div>
			<div class="col s12 m6 l6">
				<p>Otro:</p>
			</div>


			<div class="input-field col s12 m6 l6">
				<select class="select2 browser-default validate" id="selectSexoI" name="selectSexoI">
					<option value="" selected>Seleccione...</option>
					<option value="MUJER">MUJER</option>
					<option value="HOMBRE">HOMBRE</option>
					<option value="OTRO">OTRO</option>
				</select>
			</div>

			<div class="input-field col s12 m6 l6" id="divGenero">
				<input id="otroSexoI" name="otroSexoI" type="text" class="validate" maxlength="50">
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<div class="  col s12 m12 l12 collection center" style="height: 25px">
				<label class="collection-item black-text" style="font-size: 9pt">
					"OTRO" corresponde a personas que se identifiquen como no-binarias.
				</label>
			</div>

			<div class="col s12 l12 m12">
				<br>
			</div>

			<div class="col s12 m6 l6">
				<p>
					<span style="color: red">*</span>¿Perteneces a alguna diversidad social?
				</p>
			</div>

			<div class="col s12 m6 l6" id="divTextoDiversidad">
				<p>
					<span style="color: red">*</span>Especif&iacute;que
				</p>
			</div>



			<div class="input-field col s6 m6 l6">
				<select class="select2 browser-default validate" id="selectDiversidadI" name="selectDiversidadI">
					<option value="" selected>Seleccione...</option>
					<option value="NO">NO</option>
					<option value="INDÍGENA">INDÍGENA</option>
					<option value="LGBTTTIQQA">LGBTTTIQQA</option>
					<option value="PERSONA CON DISCAPACIDAD">PERSONA CON DISCAPACIDAD</option>
					<option value="OTRO">OTRO</option>
				</select>
			</div>

			<div class="input-field col s12 m6 l6" id="divDiversidad">
				<input id="otroDiversidadI" name="otroDiversidadI" type="text" class="validate" maxlength="50">
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<div class="col s12 l6 m6">
				<p>
					<span style="color: red">*</span>Escolaridad
				</p>
			</div>

			<div class="col s12 l6 m6 ">

				<p>
					<span style="color: red">*</span>Ocupación con relación a la UAQ
				</p>
			</div>

			<div class="input-field col s12 m6 l6 ">
				<select class="select2 browser-default validate" id="selectEscolaridadI" name="selectEscolaridadI">
					<option value="" selected>Seleccione...</option>
					<c:forEach var="escolaridad" items="${escolaridades }">
						<option value="${escolaridad.idEscolaridad}">${escolaridad.descripcion}</option>
					</c:forEach>
				</select>
			</div>

			<div class=" input-field col s12 m6 l6">
				<select class="select2 browser-default validate" id="selectOcupacionI" name="selectOcupacionI">
					<option  value="" selected>Seleccione...</option>
					<c:forEach var="ocu" items="${ocupaciones}">
						<option value="${ocu.idOcupacion}">${ocu.descripcion}</option>
					</c:forEach>
				</select>
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>


			<div class="col s12 l6 m6 ">
				<p>
					Especifíque otra ocupación con respecto a la UAQ
				</p>
			</div>

			<div class="col s12 m6 l6">
				<p>
					<span style="color: red">*</span>Área de adscripción
				</p>
			</div>




			<div class="input-field col s12 m6 l6">
				<input id="otroOcupacionI" name="otroOcupacionI" type="text"
					maxlength="50" class="validate">
			</div>




			<div class="input-field col s12 m6 l6 ">
				<select class="select2 browser-default validate" id="selectAdscripcionI" name="selectAdscripcionI">
					<option value="" selected>Seleccione...</option>
					<c:forEach items="${adscripciones}" var="ad">
						<option value="${ad.adscrip }">${ad.adscrip }-${ad.descripAdscrip}</option>
					</c:forEach>
				</select>
			</div>

			<div class="col s12 m12 l12">
				<br> <br>
			</div>

			<div class="col s12 m4 l3">
				<p>
					<span style="color: red">*</span>Teléfono
				</p>
			</div>

			<div class="col s12 m4 l3">
				<p>
					<span style="color: red">*</span>Tipo Teléfono
				</p>
			</div>

			<div class="col s12 m4 l3">
				<p>
					<span style="color: red">*</span>Finalidad teléfono
				</p>
			</div>
			<div class="col s12 m3 l3">
				<p>
					<span style="color: red">*</span>Correo electrónico
				</p>
			</div>
			<div class="input-field col s12 m4 l3">
				<input id="contactoTelefonicoI" name="contactoTelefonicoI" type="text" class="validate" maxlength="50">
			</div>


			<div class="input-field col s12 m4 l3">
				<select class="select2 browser-default validate" id="tipoTelefonoI" name="tipoTelefonoI">
					<option value="" selected>Seleccione...</option>
					<option value="LOCAL">LOCAL</option>
					<option value="CELULAR">CELULAR</option>
				</select>
			</div>
			<div class="input-field col s12 m4 l3">
				<select class="select2 browser-default validate" id="finalidadTelefonoI" name="finalidadTelefonoI">
					<option value="" selected>Seleccione...</option>
					<option value="PROPIO">Propio</option>
					<option value="RECADOS">Recados</option>
				</select>
			</div>


			<div class="input-field col s12 m12 l3">
				<input type="email" name="correoI" id="correoI" class="validate">

			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<div class="row">
				<div class="right">
					<br> <br>
					<button class="btn waves-effect waves-light btnAceptar pulse" id="btnAceptarDatosIdentificacion">
						¡Guardar!<i class="material-icons right">save</i>
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
