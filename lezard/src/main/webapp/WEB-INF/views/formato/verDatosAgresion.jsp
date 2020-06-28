<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<div id="tab-datos-agresion">
	<div class="row">



		<div class="col s12 m4 l4 ">
			<p>¿Has recibido atención en algún otro lugar?</p>
		</div>

		<div class="col s12 m4 l4 ">
			<p>¿En dónde?</p>
		</div>
		<div class="col s12 m4 l4 ">
			<p>¿Otro lugar?</p>
		</div>


		<div class="input-field col s12 m4 l4">
			<div class="dat">${verDatosAgre.recibidoAtencion}</div>
		</div>

		<div class="input-field col s12 m4 l4 ">
			<div class="dat">${verDatosAgre.enDonde}</div>
		</div>

		<div class="input-field col s3 m4 l4 ">
			<div class="dat">
				<c:if test="${empty verDatosAgre.enDondeOtro}">NO SE REGISTRARON DATOS</c:if>
				<c:if test="${not empty verDatosAgre.enDondeOtro}">${verDatosAgre.enDondeOtro}</c:if>
			</div>
		</div>

		<div class="col m12 l12 s12">
			<br>
		</div>


		<div class="col s12 m4 l3 ">
			<p>¿De qu&eacute; tipo?</p>
		</div>
		<div class="col s12 m4 l3 ">
			<p>Otro</p>
		</div>
		<div class="col s12 m12 l6 ">
			<p>Motivo de la solicitud</p>
		</div>


		<div class="input-field col s12 m4 l3 ">
			<div class="dat">${verDatosAgre.tipoAtencion}</div>
		</div>
		<div class="input-field col m4 l3 ">
			<div class="dat">
				<c:if test="${empty verDatosAgre.tipoAtencionOtro}">NO SE REGISTRARON DATOS</c:if>
				<c:if test="${not empty verDatosAgre.tipoAtencionOtro}">${verDatosAgre.tipoAtencionAOtro}</c:if>
			</div>
		</div>


		<div class="input-field col s12 m6 l6 center">
			<div class="dat">${verDatosAgre.motivoSolicitud}</div>
		</div>

		<div class="col m12 l12 s12">
			<br>
		</div>

		<div class="col s12 m12 l12">
			<p>De acuerdo con la narrativa y sin preguntar a quién denuncia.
			</p>
		</div>

		<div class="col s12 m6 l7">
			<div class="col s12 m12 l12">
				<p>¿La violencia ejercida se origina en la pertenencia o la
					percepci&oacute;n del agresor de que la persona denunciante
					pertenece a la comunidad LGBTTTIQA?</p>
			</div>
		</div>

		<div class="input-field col s12 m6 l5 ">
			<div class="dat">${verDatosAgre.comunidad}</div>
		</div>

		<div class="col m12 l12 s12">
			<br>
		</div>


		<div class="col s12 m6 l6 ">
			<p>Expresiones de Acoso Sexual y Hostigamiento Sexual:</p>
		</div>

		<div class="col s12 m6 l6 ">
			<p>Otra expresiones de violencia</p>
		</div>
		<div class="col m12 l12 s12">
			<br>
		</div>


		<div class=" input-field col s12 m6 l6 ">
			<div class="dat">${verDatosAgre.expresionesAcoso}</div>
		</div>



		<div class="input-field col s6 m6 l6 ">
			<div class="dat">
				<c:if test="${empty verDatosAgre.expresionesAcosoOtro}">NO SE REGISTRARON DATOS</c:if>
				<c:if test="${not empty verDatosAgre.expresionesAcosoOtro}">${verDatosAgre.expresionesAcosoOtro}</c:if>
			</div>
		</div>

		<div class="col m12 l12 s12">
			<br>
		</div>

		<div class="col s12 m6 l6 ">
			<p>Espacio donde se llevó a cabo la agresión</p>
		</div>

		<div class="col s12 m6 l6 ">
			<p>Otro, especifíque</p>
		</div>

		<div class="input-field col s12 m6 l6 ">
			<div class="dat">${verDatosAgre.espacioAcoso}</div>
		</div>

		<div class="input-field col s6 m6 l6 ">
			<div class="dat">
				<c:if test="${empty verDatosAgre.espacioAcosoOtro}">NO SE REGISTRARON DATOS</c:if>
				<c:if test="${not empty verDatosAgre.espacioAcosoOtro}">${verDatosAgre}</c:if>
			</div>

		</div>


		<div class="col m12 l12 s12">
			<br>
		</div>

		<div class="col s12 m12 l12 ">
			<p>
				<span style="font-weight: bold;">Situaci&oacute;n de
					violencia</span> (Descripción de los hechos y actos relacionados con la
				queja, incluyendo el nombre y ubicación de los testigos, en su caso
				de los que hubiere.)Es deseable que en la descripción de los hechos
				se contesten las siguientes interrogantes: ¿Quién es la persona que
				cometió los hechos hostigamiento sexual o acoso sexual?¿Desde cuándo
				sucedieron los hechos?¿En qué consistieron los hechos? ¿Quíenes
				estuvieron presentes?¿Hay videos, fotos, mensajes o documentos que
				se relacionen con estos hechos? ¿Cuáles han sido los efectos en su
				persona?¿Con qué acciones cree usted que se le puede reparar el
				daño?¿Desea hacer alguna otra manifestación?):
			</p>
		</div>
		<div class="col l12">
			<textarea disabled cols="40" class="materialize-textarea validate"
				data-length="2000" maxlength="2000">${verDatosAgre.situacionViolencia}</textarea>
		</div>

		<div class="col m12 l12 s12">
			<br>
		</div>

		<div class="col s12 m9 l9 ">
			<br>
			<p>¿Es la primera vez que la presunta persona agresora comente un
				hecho de violencia contra usted?</p>

		</div>

		<div class="input-field col s12 m13 l3 ">
			<div class="dat">${verDatosAgre.primeraVez}</div>
		</div>

		<div class="col m12 l12 s12">
			<br>
		</div>
		<div class="col s12 m12 l6 ">
			<p>¿Cuál es el tiempo transcurrido desde el ÚLTIMO hecho de
				violencia?</p>
		</div>

		<div class="col s12 m12 l6">
			<p>Más de un año?¿Cuántos años?</p>
		</div>



		<div class="input-field col s12 m12 l6 ">
			<div class="dat">${verDatosAgre.ultimoViolencia}</div>
		</div>

		<div class="input-field col s12 m5 l6">
			<div class="dat">
				<c:if test="${empty verDatosAgre.masUnAno}">NO SE REGISTRARON DATOS</c:if>
				<c:if test="${not empty verDatosAgre.masUnAno}">${verDatosAgre.masUnAno}</c:if>
			</div>
		</div>

		<div class="col m12 l12 s12">
			<br>
		</div>

		<div class="col s12 m12 l6 ">
			<p>Situación de la persona agredida:</p>
		</div>
		<div class="col s12 m12 l6 ">
			<p>Otras:</p>
		</div>

		<div class="input-field col s12 m6 l6 ">
			<div class="dat">${verDatosAgre.situacionAgredida}</div>
		</div>
		<div class="input-field col s6 ">
			<div class="dat">
				<c:if test="${empty verDatosAgre.situacionAgredidaOtro}">NO SE REGISTRARON DATOS</c:if>
				<c:if test="${not empty verDatosAgre.situacionAgredidaOtro}">${verDatosAgre.situacionAgredidaOtro}</c:if>
			</div>
		</div>

		<div class="col s12 m12 l12">
			<br>
		</div>

		<div class="col s12 m6 l4">
			<br>
		</div>
		<div class="col s12 m6 l4 ">
			<p>Evaluación de riesgo</p>
		</div>

		<div class="col s12 m6  l4">
			<br>
		</div>
		<div class="col s12 m6  l12"></div>
		<div class="col s12 m6  l4">
			<br>
		</div>
		<div class="input-field col s12 m12 l4 ">
			<div class="dat">${verDatosAgre.evaluacionRiesgo}</div>
		</div>
		<div class="col s12 m6  l4">
			<br>
		</div>
		<div class="col s12 m12 l12">
			<br>
		</div>

		<div class="col s12 m12 l4 ">
			<p>Desea ser apoyada/o para su atención</p>
		</div>
		<div class="col s12 m12 l4 ">
			<p>¿Qué tipo de espacio de atención se canaliza?</p>
		</div>

		<div class="col s12 m12 l4 ">
			<p>Otro</p>
		</div>


		<div class="input-field col s12 m12 l4 ">
			<div class="dat">${verDatosAgre.apoyo}</div>
		</div>
		<div class="input-field col s12 m12 l4 ">
			<div class="dat">${verDatosAgre.tipoApoyo}</div>
		</div>

		<div class="input-field col s4 ">
			<div class="dat">
				<c:if test="${empty verDatosAgre.tipoApoyoOtro}">NO SE REGISTRARON DATOS</c:if>
				<c:if test="${not empty verDatosAgre.tipoApoyoOtro}">${verDatosAgre.tipoApoyoOtro}</c:if>
			</div>
		</div>





	</div>
</div>