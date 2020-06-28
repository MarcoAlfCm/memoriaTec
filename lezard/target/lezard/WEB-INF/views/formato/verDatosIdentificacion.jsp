<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<div id="tab-datos-generales">
	<div class="row">
	

			<div class="col s10 m4 l4">
				<p>Nombre</p>
			</div>

			<div class="col s10 m4 l4">
				<p>Apellido paterno</p>
			</div>

			<div class="col s10 m4 l4">
				<p>Apellido materno</p>
			</div>


			<div class="input-field col s10 m4 l4">
				<div class="dat">${verDatosIden.nombre}</div>
			</div>


			<div class="input-field col s10 m4 l4">
				<div class="dat">${verDatosIden.apellidoPaterno}</div>
			</div>



			<div class="input-field col s10 m4 l4">
				<div class="dat">${verDatosIden.apellidoMaterno}</div>
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<div class="col s12 m12 l12 offset-m1 ">
				<p>Nombre preferente con el que desea ser llamada la persona:</p>
			</div>

			<div class="input-field col s12 m12 l12">
				<div class="dat">${verDatosIden.nombrePreferente}</div>
			</div>

			<!-- asdasd  -->
			<div class=" collection center" style="height: 25px">
				<label class="collection-item black-text" style="font-size: 9pt">OPCIONAL,solo
					si el nombre legal est&aacute; registrado. </label>
			</div>
			<div class="col s12 m12 l12">
				<br>
			</div>
			<!-- asdasd  -->
			<div class="col s10 m4 l3">
				<p>Edad</p>
			</div>
			<div class="col s12 m4 l3">
				<p>Fecha de nacimiento</p>
			</div>
			<div class="col s12 m4 l6">
				<p>En caso de ser menor de edad, colocar el nombre del padre,
					madre o tutor:</p>
			</div>
			<div class="input-field col s12 m4 l3">
				<div class="dat">${verDatosIden.edad}</div>
			</div>
			<div class="input-field col s12 m4 l3">
				<div class="dat">${verDatosIden.fechaNacimiento}</div>
			</div>

			<div class="input-field col s12 m4 l6">
				<div class="dat">
					<c:if test="${empty verDatosIden.tutor}">NO SE REGISTRARON DATOS</c:if>
					<c:if test="${not empty verDatosIden.tutor}">${verDatosIden.tutor}</c:if>
				</div>
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<!-- asdasd  -->

			<div class="col s12 m6 l6">
				<p>Genero:</p>
			</div>
			<div class="col s12 m6 l6">
				<p>Otro:</p>
			</div>


			<div class="input-field col s12 m6 l6">
				<div class="dat">${verDatosIden.sexo}</div>
			</div>
			<div class="input-field col s12 m6 l6" id="divGenero">
				<div class="dat">
					<c:if test="${empty verDatosIden.otroSexo}">NO SE REGISTRARON DATOS</c:if>
					<c:if test="${ not empty verDatosIden.otroSexo}">${verDatosIden.otroSexo}</c:if>
				</div>
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>
			<!-- asdasd  -->
			<div class="  col s12 m12 l12 collection center" style="height: 25px">
				<label class="collection-item black-text" style="font-size: 9pt">
					"OTRO" corresponde a personas que se identifiquen como no-binarias.
				</label>
			</div>

			<div class="col s12 l12 m12">
				<br>
			</div>

			<div class="col s12 m6 l6">
				<p>¿Perteneces a alguna diversidad social?</p>
			</div>

			<div class="col s12 m6 l6" id="divTextoDiversidad">
				<p>Especif&iacute;que</p>
			</div>



			<div class="input-field col s6 m6 l6">
				<div class="dat">${verDatosIden.diversidad}</div>
			</div>

			<div class="input-field col s12 m6 l6" id="divDiversidad">
				<div class="dat">
					<c:if test="${empty verDatosIden.otroDiversidad}">NO SE REGISTRARON DATOS</c:if>
					<c:if test="${not empty verDatosIden.otroDiversidad}">${verDatosIden.otroDiversidad}</c:if>
				</div>
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>
			<!-- asdasd  -->
			<div class="col s12 l6 m6">
				<p>Escolaridad</p>
			</div>

			<div class="col s12 l6 m6 ">

				<p>Ocupación con relación a la UAQ</p>
			</div>

			<div class="input-field col s12 m6 l6 ">
				<div class="dat">${verDatosIden.escolaridad.descripcion}</div>
			</div>

			<div class=" input-field col s12 m6 l6">
				<div class="dat">${verDatosIden.ocupacion.descripcion}</div>
			</div>

			<div class="col s12 m12 l12">
				<br>
			</div>

			<!-- asdasd  -->

			<div class="col s12 l6 m6 ">
				<p>Especifíque otra ocupación con respecto a la UAQ</p>
			</div>

			<div class="col s12 m6 l6">
				<p>Área de adscripción</p>
			</div>




			<div class="input-field col s12 m6 l6">
				<div class="dat">
					<c:if test="${empty verDatosIden.otroOcupacion}">NO SE REGISTRARON DATOS</c:if>
					<c:if test="${not empty verDatosIden.otroOcupacion}">${verDatosIden.otroOcupacion}</c:if>
				</div>
			</div>




			<div class="input-field col s12 m6 l6 ">
				<div class="dat">${verDatosIden.descripcionAdscripcion}</div>
			</div>

			<div class="col s12 m12 l12">
				<br> <br>
			</div>

			<div class="col s12 m4 l3">
				<p>Teléfono</p>
			</div>

			<div class="col s12 m4 l3">
				<p>Tipo Teléfono</p>
			</div>

			<div class="col s12 m4 l3">
				<p>Finalidad teléfono</p>
			</div>
			<div class="col s12 m3 l3">
				<p>Correo electrónico</p>
			</div>
			<div class="input-field col s12 m4 l3">
				<div class="dat">${verDatosIden.telefono}</div>
			</div>


			<div class="input-field col s12 m4 l3">
				<div class="dat">${verDatosIden.tipoTelefono}</div>
			</div>
			<div class="input-field col s12 m4 l3">
				<div class="dat">${verDatosIden.finalidadTelefono}</div>
			</div>


			<div class="input-field col s12 m12 l3">
				<div class="dat">${verDatosIden.correo}</div>
			</div>

			
	</div>
</div>
