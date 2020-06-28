<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<div id="tab-datos-agresion">
	<div class="row">

		<form id="formDatosAgresion">
			<input type="text"  id="idDatosAgresion" name="idDatosAgresion" hidden="">
			<input type="text" value="${idQueja}" id="idQuejaAG" name="idQuejaAG" hidden="">
			
			<div class="col s12 m4 l4 ">
				<p>	<span style="color: red">*</span>�Has recibido atenci�n en alg�n otro lugar?</p>
			</div>
			
			<div class="col s12 m4 l4 ">
				<p>�En d�nde?</p>
			</div>
			<div class="col s12 m4 l4 ">
				<p>�Otro lugar?</p>
			</div>
	
			
			<div class="input-field col s12 m4 l4">
				<select class="select2 browser-default validate" id="atencionAG" name="atencionAG">
					<option value="" selected >Seleccione...</option>
					<option value="SI">SI</option>
					<option value="NO">NO</option>
				</select>
			</div>
			
			<div class="input-field col s12 m4 l4 ">
				<select class="select2 browser-default validate" id="selectLugarAtencionAG" name="selectLugarAtencionAG" >
					<option selected="selected" disabled="disabled">Seleccione...</option>
					<option value="INSTANCIA INTERNA">INSTANCIA INTERNA</option>
					<option value="INSTANCIA GUBERNAMENTAL">INSTANCIA GUBERNAMENTAL</option>
					<option value="ORGANIZACI�N DE LA SOCIEDAD CIVIL">ORGANIZACI&Oacute;N DE LA SOCIEDAD CIVIL</option>
					<option value="OTRo">OTRO</option>
					<option value="N/A">N/A</option>
				</select>
			</div>
			
			<div class="input-field col s3 m4 l4 ">
				<input id="otroLugarAtencionAG" name="otroLugarAtencionAG" type="text" class="validate" maxlength="50" >
			</div>

	<div class="col m12 l12 s12"><br></div>
	
	
			<div class="col s12 m4 l3 ">
				<p><span style="color: red">*</span>�De qu&eacute; tipo?</p>
			</div>
			<div class="col s12 m4 l3 ">
				<p>Otro</p>
			</div>
			<div class="col s12 m12 l6 ">
				<p><span style="color: red">*</span>Motivo de la solicitud</p>
			</div>
			
			
			<div class="input-field col s12 m4 l3 ">
				<select class="select2 browser-default validate" id="selectTipoAtencionAG" name="selectTipoAtencionAG"  >
					<option selected="selected" disabled="disabled">Seleccione...</option>
					<option value="PSICOL�GICA">PSICOL�GICA</option>
					<option value="JUR�DICA">JUR&Iacute;DICA</option>
					<option value="M�DICA">M&Eacute;DICA</option>
					<option value="OTRO">OTRO</option>
				</select>
			</div>
			<div class="input-field col m4 l3 ">
				<input id="otroTipoAtencionAG" name="otroTipoAtencionAG" type="text" class="validate" maxlength="50" >
			</div>
			
			
			<div class="input-field col s12 m6 l6 center">
				<select class="select2 browser-default validate" id="selectMotivoSolicitudAG" name="selectMotivoSolicitudAG">
					<option value="" selected disabled="disabled">Seleccione...</option>
					<option value="SOLICITUD DE INFORMACI�N">SOLICITUD DE INFORMACI&Oacute;N</option>
					<option value="SOLICITUD DE APOYO">SOLICITUD DE APOYO</option>
				</select>
			</div>
			
			<div class="col m12 l12 s12"><br></div>
			
			<div class="col s12 m12 l12">
			<p><span style="color: red">*</span>De acuerdo con la narrativa y sin preguntar a qui�n denuncia.</p>
			</div>
			
			<div class="col s12 m6 l7">
			<div class="col s12 m12 l12">
				 <p>�La violencia ejercida se origina en la pertenencia o la percepci&oacute;n
					del agresor de que la persona denunciante pertenece a la comunidad LGBTTTIQA?</p>
					</div>
			</div>

			<div class="input-field col s12 m6 l5 ">
				<select class="select2 browser-default validate" id="selectPerteneceComunidadAG" name="selectPerteneceComunidadAG">
					<option value="" selected>Seleccione...</option>
					<option value="SI">SI</option>
					<option value="NO">NO</option>
				</select>
			</div>
			
						<div class="col m12 l12 s12"><br></div>
			
			
			<div class="col s12 m6 l6 ">
				<p><span style="color: red">*</span>Expresiones de Acoso Sexual y Hostigamiento Sexual:</p>
			</div>
			
			<div class="col s12 m6 l6 ">
				<p>Otra expresiones de violencia</p>
			</div>
			<div class="col m12 l12 s12"><br></div>
			
			
			<div class=" input-field col s12 m6 l6 ">
				<select  class="select2 browser-default validate" id="selectExpresionesAcosoAG" name="selectExpresionesAcosoAG">
					<option disabled selected="selected">Seleccione...</option>
					<option value="FISICAS">FISICAS</option>
					<option value="VERBALES">VERBALES</option>
					<option value="NO VERBALES">NO VERBALES</option>
					<option value="DIGITAL">DIGITAL</option>
					<option value="OTRO">OTRO</option>
				</select>
			</div>
			
		
			
			<div class="input-field col s6 m6 l6 ">
				<input id="otraExpresionViolenciaAG" name="otraExpresionViolenciaAG" type="text" class="validate" maxlength="50">
			</div>
			
						<div class="col m12 l12 s12"><br></div>
			
			<div class="col s12 m6 l6 ">
				<p><span style="color: red">*</span>Espacio donde se llev� a cabo la agresi�n</p>
			</div>
			
			<div class="col s12 m6 l6 ">
				<p>Otro, especif�que</p>
			</div>
			
			<div class="input-field col s12 m6 l6 ">
				<select  class="select2 browser-default validate" id="selectLugarAgresionAG" name="selectLugarAgresionAG">
					<option disabled selected="selected">Seleccione...</option>
					<option value="AULA">AULA</option>
					<option value="FACULTAD">FACULTAD</option>
					<option value="CAMPUS">CAMPUS</option>
					<option value="ZONA DE INFLUENCIA">ZONA DE INFLUENCIA</option>
					<option value="ESPACIOS F�SICOS QUE COMPRENDEN A LAS IES">ESPACIOS F�SICOS QUE COMPRENDEN A LAS IES</option>
					<option value="INTERNET / REDES SOCIALES DIGITALES">INTERNET / REDES SOCIALES DIGITALES</option>
					<option value="OTRO">OTRO</option> 
				</select>
			</div>
			
			<div class="input-field col s6 m6 l6 ">
				<input id="otroLugarAgresionAG" name="otroLugarAgresionAG" type="text" class="validate" maxlength="50">
			</div>
			
			
			<div class="col m12 l12 s12"><br></div>
			
			<div class="col s12 m12 l12 ">
				<p><span style="font-weight: bold;"><span style="color: red">*</span>Situaci&oacute;n de violencia</span> (Descripci�n de los hechos y actos relacionados con la queja, incluyendo el nombre y ubicaci�n de los
					testigos, en su caso de los que hubiere.)Es deseable que en la descripci�n de los hechos se contesten las siguientes interrogantes:
					�Qui�n es la persona que cometi� los hechos hostigamiento sexual o acoso sexual?�Desde cu�ndo sucedieron los hechos?�En qu�
					consistieron los hechos? �Qu�enes estuvieron presentes?�Hay videos, fotos, mensajes o documentos que se relacionen con estos hechos?
					�Cu�les han sido los efectos en su persona?�Con qu� acciones cree usted que se le puede reparar el da�o?�Desea hacer alguna otra
					manifestaci�n?):</p>
			</div>
			<div class="col l12">
				<textarea cols="40" name="textoHechosAG" class="materialize-textarea validate" id="textoHechosAG" data-length="2000" maxlength="2000"></textarea>
			</div>
			
			<div class="col m12 l12 s12"><br></div>

			<div class="col s12 m9 l9 ">
			<br>
				<p><span style="color: red">*</span>�Es la primera vez que la presunta persona agresora comente un hecho de violencia contra usted?</p>
				
			</div>
			
			<div class="input-field col s12 m13 l3 ">
				<select class="select2 browser-default validate" id="selectPrimeraVezAG" name="selectPrimeraVezAG">
					<option value="" selected>Seleccione...</option>
					<option value="SI">SI</option>
					<option value="NO">NO</option>
				</select>
			</div>
			
			<div class="col m12 l12 s12"><br></div>
			<div class="col s12 m12 l6 ">
				<p><span style="color: red">*</span>�Cu�l es el tiempo transcurrido desde el �LTIMO hecho de violencia?</p>
			</div>
			
			<div class="col s12 m12 l6">
				<p>M�s de un a�o?�Cu�ntos a�os?</p>
			</div>
			
			
			
			<div class="input-field col s12 m12 l6 ">
				<select class="select2 browser-default validate"  id="selectUltimoHechoViolenciaAG" name="selectUltimoHechoViolenciaAG">
					<option value="" selected>Seleccione...</option>
					<option value="MENOS DE UN MES">Menos de un mes</option>
					<option value="ENTRE UN MES Y SEIS MESES">Entre un mes y seis meses</option>
					<option value="ENTRE SEIS MESES Y UN A�O">Entre seis meses y un a�o</option>
					<option value="M�S DE UN A�O">Mas de un a�o</option>
				</select>
			</div>

			<div class="input-field col s12 m5 l6">
				<input class="validate"  type="text" id="masDeUnAnoAG" name="masDeUnAnoAG">
			</div>
			
			<div class="col m12 l12 s12"><br></div>

			<div class="col s12 m12 l6 ">
				<p><span style="color: red">*</span>Situaci�n de la persona agredida:</p>
			</div>
			<div class="col s12 m12 l6 ">
				<p>Otras:</p>
			</div>
			
			<div class="input-field col s12 m6 l6 ">
				<select  class="select2 browser-default validate" id="selectSituacionPersonaAgredidaAG" name="selectSituacionPersonaAgredidaAG">
					<option disabled selected="selected">Seleccione...</option>
					<option value="Lesiones f�sicas">Lesiones f�sicas</option>
					<option value="Afecci�n emocional">Afecci�n emocional</option>
					<option value="Confusiones">Confusiones</option>
					<option value="Social">Social</option>
					<option value="Miedo somatizaciones">Miedo somatizaciones</option>
					<option value="OTRO">OTRO</option>
				</select>
			</div>
			<div class="input-field col s6 ">
				<input id="otraSituacionPersonaAgredidaAG" name="otraSituacionPersonaAgredidaAG" type="text" class="validate" maxlength="50">
			</div>
			
		<div class="col s12 m12 l12"><br></div>
			
			<div class="col s12 m6 l4"><br></div>
			<div class="col s12 m12 l4 ">
				<p>Evaluaci�n de riesgo </p>
			</div>
			
			<div class="col s12 m6  l4"><br></div>
			<div class="col s12 m6  l4"><br></div>
			<div class="input-field col s12 m12 l4 ">
				<select class="select2 browser-default validate" id="evaluacionFisicaAG" name="evaluacionFisicaAG">
					<option value="" selected>Seleccione...</option>
					<option value="Alto">Alto</option>
					<option class="red" value="Medio">Medio</option>
					<option value="Bajo">Bajo</option>
				</select>
			</div>
			<div class="col s12 m6  l4"><br></div>
			<div class="col s12 m12 l12"><br></div>
			
			<div class="col s12 m12 l4 ">
				<p><span style="color: red">*</span>Desea ser apoyada/o para su atenci�n</p>
			</div>
			<div class="col s12 m12 l4 ">
				<p>�Qu� tipo de espacio de atenci�n se canaliza?</p>
			</div>
				
			<div class="col s12 m12 l4 ">
				<p>Otro</p>
			</div>
			
			
			<div class="input-field col s12 m12 l4 ">
				<select class="select2 browser-default validate" id="apoyoAG" name="apoyoAG">
					<option value="" selected>Seleccione...</option>
					<option value="Si">Si</option>
					<option class="No" >No</option>
				</select>
			</div>
			<div class="input-field col s12 m12 l4 ">
				<select class="select2 browser-default validate"  id="selectEspacioAtencionAG" name="selectEspacioAtencionAG">
					<option value="" selected>Seleccione...</option>
					<option value="Psicol�gica">Psicol�gica</option>
					<option value="Jur�dica">Jur�dica</option>
					<option value="M�dica">M�dica</option>
					<option value="Otro">Otro</option>
				</select>
			</div>
			
			<div class="input-field col s4 ">
				<input id="otroEspacioAtencionAG" name="otroEspacioAtencionAG" type="text" class="validate" maxlength="50" >

			</div> 
			
			
			<div class="col s12 m12 l12"> <br> </div>
			<div class="row">
				<div class="right">
					<br> <br>
					<button class="btn waves-effect waves-light btnAceptar pulse" id="btnAceptarDatosAgresion">
						�Guardar!<i class="material-icons right">save</i>
					</button>
					<script>
						
					</script>
				</div>
			</div>
			<script type="text/javascript">
				document.addEventListener('DOMContentLoaded', function() {

					var elems = document.querySelectorAll('.materialboxed');
					var instances = M.Materialbox.init(elems);

				});

				$(document).ready(function() {

					$("#textarea#textoHechos").characterCounter();
				});
			</script>
		</form>

	</div>
</div>