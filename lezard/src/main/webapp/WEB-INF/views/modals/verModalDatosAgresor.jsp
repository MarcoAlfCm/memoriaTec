<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="modalDatosAgresor" class="modal">
	<div class="modal-content">
		<div>
			<div class="row center">
				<h4 id="textoTitle"></h4>
			</div>
			<hr>





			<div class="col s12 m6 l6">
				<p>¿Conoces a la persona agresora?</p>
			</div>
			<div class="col s12 m6 l6">
				<p>Sexo de la persona agresora.</p>
			</div>


			<div class="input-field col s12 m6 l6">
				<div class="dat" id="conoceAgresorTxT">${conoceAgresor}</div>
			</div>
			<div class="input-field col s12 m6 l6">
				<div class="dat" id="sexoAgresorTxT">${sexo }</div>

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
				<div class="dat" id="nombreAgresorTxT"></div>
			</div>

			<div class="input-field col s10 m4 l4">
				<div class="dat" id="apellidopAgresorTxT"></div>
			</div>

			<div class="input-field col s10 m4 l4">
				<div class="dat" id="apellidomAgresorTxT"></div>
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
				<div class="dat" id="ocupacionAgresorTxT"></div>
			</div>

			<div class="input-field col s12 m6 l6">
				<div class="dat" id="otraoOupacionAgresorTxT"></div>
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
				<div class="dat" id="vinculoAgresorTxT"></div>
			</div>


			<div class="col s12 m6 l6">
				<div class="dat" id="asdscripcionAgresorTxT"></div>
			</div>


			<div class="row right col s12 m12 l12">
				<br> <br>

</div>
			</div>
		</div>
	</div>