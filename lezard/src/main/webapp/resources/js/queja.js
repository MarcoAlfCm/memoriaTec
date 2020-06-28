var $formCrearCaso = $("#formCrearCaso"), 
	$btnCrearCaso = $("#btnCrearCaso"), 
	$modalCrearCaso = $("#modalCrearCaso"), 
	$btnAceptarCrearCaso = $("#btnAceptarCrearCaso"),
	$tableCasos=$("#tableCasos"),
$modalCambiarEstatus=$("#modalCambiarEstatus"),
$btnAceptaCambiarEstatus =$(".btnAceptaCambiarEstatus"),
$formCambiarEstatus = $("#formCambiarEstatus"),
$modalCrearCaso=$("#modalCrearCaso"),
$btnAceptarCrearCaso=$("#btnAceptarCrearCaso");
	
$btnAceptarCrearCaso.on('click',function(e){
	e.preventDefault();
	if ($formCrearCaso.valid()) {
		e.preventDefault();
		$.ajax({
			type : "POST",
			url : CONTEXT_PLUS + "queja/createCaso",
			data : $formCrearCaso.serialize(),
			success : function(data) {
				
				listaCasos.ajax.reload(null, false);
			}
		})
	}	
})


$btnCrearCaso.on('click', function(e) {
	$modalCrearCaso.modal('open');


});




$btnAceptaCambiarEstatus.click(function (e){
	if($("#estatusSelect").val() > 0){
		var formCambiarEstatus = $formCambiarEstatus.serialize();
		formCambiarEstatus.estatus =$("#estatusSelect").val();
		$.ajax({
			type : "POST",
			url : CONTEXT_PLUS + "quejas/cambiarEstatus",
			data : formCambiarEstatus,
			success : function(data) {
				$modalCambiarEstatus.modal('close');
				listaCasos.ajax.reload(null, false);
			}
		})
	}
});

$document.ready(function() {
	listaCasos.init();
});

var listaCasos = function() {
	var columns = [
		{ "title" : "Folio", "data" :"folio","className": "tdText", "width" : "20%"},		
		{ "title" : "Adscripcion", "render" : function(data, type, full, meta) {
			var roles = "";
			var rolString = full.idAdscripcion.toString();
	    			roles += rolString+" - "+full.descripcionAdscripcion;	
	    	return roles;
		}, "className" : "tdText", "width" : "20%"}, //30
		{ "title" : "Campus", "data" : "campus", "className" : "tdText", "width" : "10%" },//40
		
		{ "title" : "Enlace", "data" : "usuario.nombreCompleto", "className" : "tdText", "width" : "20%" },//60
		
		{ "title" : "Fecha Registro", 'render' : function(data, type, full, meta) {
			return new Date(full.fechaRegistro).toLocaleString('en-GB');
		}, 'className' : 'tdText', 'width' : '15%'}, //75
		{ "title" : "Estatus", "data" : "estatus", "className" : "tdText", "width" : "10%" },
		{ "title" : "Acciones", "data" : null, "className" : "tdAccion", "width" : "5%" },
	];
	
	var actionColumns = [
     	{ "targets": -1, "title":"Acciones", "data": null, "orderable":false,
     		"render": function(data, type, full, meta) {
     			
     			console.log(data)
     			btnVer = '<button id="btnVer" class="btn-floating btn-small btnEditar waves-effect waves-light" title="Ver caso."><i class="material-icons">remove_red_eye</i></button>';
     			btnIngresar = '<button id="btnIngresar" class="btn-floating btn-small btnEditar waves-effect waves-light" title="Ingresar datos."><i class="material-icons">edit</i></button>';
 				btnContinuar = '<button id="btnContinuar" class="btn-floating btn-small btnEditar waves-effect waves-light" title="Ingresar datos."><i class="material-icons">replay</i></button>';
 				var htmlAcciones = '';
 				if(data.estatus==="EN PROCESO"){
     				htmlAcciones += btnVer;
     			}
 				htmlAcciones += '<button id="btnDescargaPDF" class="btn-floating red btn-small btnEditar waves-effect waves-light" title="Descargar PDF"><i class="material-icons">picture_as_pdf</i></button> ';
     			htmlAcciones += '<button id="btnCambiarEstatus" class="btn-floating green btn-small btnEditar waves-effect waves-light" title="Cambiar estatus"><i class="material-icons">sync</i></button> ';

 				if(data.estatus === "EN CAPTURA"){
 					htmlAcciones += btnIngresar;
 				}
				return htmlAcciones;
		   }
		}
    ];
	
	var searchData = function(d){

	};
	
	var ajaxConfig = {
		"url":  CONTEXT_PLUS + "quejas/list",
		"type": "POST",
		"data": searchData
	};
	
	var tableOptions = {
		"ajax": ajaxConfig,
    	"columnDefs" : actionColumns,
    	"columns": columns,
		"responsive" : true,
		"scrollX": false
	};
	
	var init = function() {
		listaCasos = $tableCasos.DataTable($.extend(JSON.parse(JSON.stringify(genericDatatable)), tableOptions));
		
		$tableCasos.on("click", "#btnVer", function() {
			var data = listaCasos.row($(this).parents('tr')).data();
			if(data === undefined)
				data = listaCasos.row($(this)).data();
			
			location.href="verCaso?idCaso="+data.folio;
		});
		
		$tableCasos.on("click", "#btnIngresar", function() {
			var data = listaCasos.row($(this).parents('tr')).data();
			if (data === undefined)
				data = listaCasos.row($(this)).data();

					location.href = "quejaLlenar?idCaso=" + data.folio;

		});
		
		$tableCasos.on("click", "#btnContinuar", function() {
			var data = listaCasos.row($(this).parents('tr')).data();
			if (data === undefined)
				data = listaCasos.row($(this)).data();
			location.href="continuarQueja?idCaso="+data.idCaso;

		});
		
		$tableCasos.on("click", "#btnCambiarEstatus", function() {
			var data = listaCasos.row($(this).parents('tr')).data();
			if(data === undefined)
				data = listaCasos.row($(this)).data();
			
			$modalCambiarEstatus.modal('open');
			$("#idCasoInput").val(data.idCaso);
		});
		
	}
	
	return {
		init : init
	};
}();
