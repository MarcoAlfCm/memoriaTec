var $idQueja = $("#idQuejaTestigo"), $tableTestigos = $("#tableTestigos"), $btnAddTestigo = $("#btnAddTestigo"), $btncerrarModalTestigo = $("#btncerrarModalTestigo"), $btnAceptarDatosTestigo = $("#btnAceptarDatosTestigo"), $modalDatosTestigo = $("#modalDatosTestigo"), $formDatosTestigo = $("#formDatosTestigo"), $selectOcupacionTestigo = $("#selectOcupacionTestigo"), $vinculoTestigo = $("#vinculoTestigo"), $selectAdscripcionTestigo = $("#selectAdscripcionTestigo");

$btncerrarModalTestigo.on('click', function(e) {
	$modalDatosTestigo.modal('close');

})

function showModalVerTestugi(testigo) {
	console.log(testigo)

	$("#textoTitles").text('VER DATOS TESTIGO');
	$("#nombreTestigoTxT").text(testigo.nombreTestigo);
	$("#apellidopTestigoTxT").text(testigo.apellidopTestigo);
	$("#apellidomTestigoTxT").text(testigo.apellidomTestigo);
	$("#ocupacionTestigoTxT").text(testigo.ocupacion.descripcion);
	if(testigo.otroOcupacionTestigo==null){
		$("#otroOcupacionTestigoTxT").text("SIN DATOS");
	}else{
		$("#otroOcupacionTestigoTxT").text(testigo.otroOcupacionTestigo);	
	}
	$("#vinculoTestigoTxT").text(testigo.vinculo.descripcion);
	$("#adscripcionTestigoTxT").text(testigo.descripcionAdscripcion)
	

	$modalDatosTestigo.modal('open');
}

$btnAceptarDatosTestigo.on('click', function(e) {
	if ($formDatosTestigo.valid()) {
		e.preventDefault();
		$.ajax({
			type : "POST",
			url : CONTEXT_PLUS + "quejas/createOrUpdateTestigo",
			data : $formDatosTestigo.serialize(),
			success : function(data) {
				listaTestigos.ajax.reload(null, false);
				$modalDatosTestigo.modal('close');

			}

		})
	} else {
		showErrorAlert("Todavia te faltan campos por ingresar.")

	}
})

$document.ready(function() {
	listaTestigos.init();
});

var listaTestigos = function() {
	var columns = [
			{
				"title" : "Nombre del testigo",
				"render" : function(data, type, full, meta) {

					return (full.nombreCompleto != null) ? full.nombreCompleto
							: "Sin clave...";
				},
				"className" : "tdText",
				"width" : "80%"
			}, {
				"title" : "Acciones",
				"data" : null,
				"className" : "tdAccion",
				"width" : "20%"
			}, ];

	var actionColumns = [ {
		"targets" : -1,
		"title" : "Acciones",
		"data" : null,
		"orderable" : false,
		"render" : function(data, type, full, meta) {
			var htmlAcciones = '', btnMostrar = '<button id="btnMostrarTest" class="btn-floating btn-small  waves-effect waves-light" title="Ver datos Agresor."><i class="material-icons">remove_red_eye</i></button> ';

			htmlAcciones = btnMostrar;

			// console.log(data)

			return htmlAcciones;
		}

	} ];

	var searchData = function(d) {
		d.idQueja = $idQueja.val();
	};

	var ajaxConfig = {
		"url" : CONTEXT_PLUS + "testigo/list",
		"type" : "POST",
		"data" : searchData
	};

	var tableOptions = {
		"ajax" : ajaxConfig,
		"columnDefs" : actionColumns,
		"columns" : columns,
		"responsive" : true,
		"scrollX" : false
	};

	var init = function() {
		listaTestigos = $tableTestigos.DataTable($.extend(JSON.parse(JSON
				.stringify(genericDatatable)), tableOptions));

		$tableTestigos.on("click", "#btnMostrarTest", function() {
			var data = listaTestigos.row($(this).parents('tr')).data();
			if (data === undefined)
				data = listaTestigos.row($(this)).data();

			showModalVerTestugi(data);
		});

	}

	return {
		init : init
	};
}();