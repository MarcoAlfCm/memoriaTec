<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="modalCrearCaso" class="modal">
	<div class="modal-content row">
		<div class="container">
			<div class="row center col s12 m12 l12">
			<h4>NUEVO CASO</h4>
			<hr>	
			</div>
			
			<form id="formCrearCaso" action="" method="POST">
				<div class="col s3 m3 l3"><br></div>
				<div class="col s3 m3 l5 center">
				<p>Seleccione el campus</p>
				</div>
				<div class="col s3 m3 l3"><br></div>
				<div class="col s12 m12 l12"></div>				
				<div class="col s3 m3 l2"><br></div>
				<div class="col s3 m3 l7 center">
					<select name="campus" id="campus" class="select2 browser-default validate">
						<c:forEach var="campus" items="${campus}">
							<option value="${campus.descripcion }">${campus.descripcion }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col s3 m3 l2"><br></div>
				<input type="text" value="${usuario.idAdscripcion}" id="idAdscripcion" name="idAdscripcion" hidden="" > 
				<input type="text" value="${session.anio}" id="anio" name="anio" hidden="">
				
			</form>
			<div class="col s12 m12 l12"><br></div>
			<div class="col s12 m12 l12"><br></div>
			<div class="row center col s12 m12 l12">
				<button type="button"
					class="btn waves-effect waves-light s modal-close red left">
					Cancelar<i class="material-icons left">close</i>
				</button>
				<button type="button"
					class="btn waves-effect waves-light btnAceptar right"
					id="btnAceptarCrearCaso">
					Crear<i class="material-icons left">check</i>
				</button>
			</div>
		</div>
	</div>
</div>