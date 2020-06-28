<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- PLUGIN CSS -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-lite/1.1.0/material.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css">

<div id="tab-datos-agresor">
			<input hidden="" type="text" value="${idQueja}" id="idQuejaAgresor" name="idQuejaAgresor" >

<!-- <a id="btnAddAgresor" class="btn-floating btn-large waves-effect waves-light right Green"><i class="material-icons">add</i></a> -->
	<div class="row">
		<div class="row center">
			<table class="mdl-data-table striped centered" id="tableAgresores"></table>
		</div>	
	</div>
</div>
		<%@ include file="/WEB-INF/views/modals/verModalDatosAgresor.jsp"%>



<script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/verDatosAgresor.js" />"></script>
<%-- <script charset="utf-8" type="text/javascript" src="<c:url value="/resources/js/validations/datosAgresor.js" />"></script> --%>


		<!-- JAVASCRIPT AND JQUERY -->
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.material.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
		
		<!-- LOCAL JAVASCRIPTS FILES -->
		<script type="text/javascript" charset="utf-8" src="<c:url value="/resources/js/tables.js" />"></script>

