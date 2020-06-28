var $tableQueja = $("#tableQuejas"), 
	$idCaso = $("#idCaso"), 
	$btnTerminarCaso = $("#btnTerminarCaso");

$btnTerminarCaso.on('click', function() {
	$.ajax({
		type : "POST",
		url : CONTEXT_PLUS + "queja/estatusEnProceso",
		data : {
			idCaso : $("#idCaso").val()
		},
		success : function(datos) {
			location.href="quejas"
		}
	})
})

$("#btnCrearQueja").on('click', function() {

	$.ajax({
		type : "POST",
		url : CONTEXT_PLUS + "queja/createQueja",
		data : {
			idCaso : $("#idCaso").val(),
		},
		success : function(data) {

			listaUsuarios.ajax.reload(null, false);

		}
	})

})

$document.ready(function() {
	listaUsuarios.init();

});

var listaUsuarios = function() {
	var columns = [
			{
				"title" : "Nombre de identificaci&oacute;n",
				"render" : function(data, type, full, meta) {
					var roles = "";
					var h = $.ajax({
						type : "POST",
						url : CONTEXT_PLUS + "queja/traerNombreQueja",
						async : false,
						data : {
							idQueja : full.idQueja
						},
						success : function(datos) {
							return datos;
						}
					}).responseJSON;

					if (h != null) {
						console.log(h)
						return h.nombre + " " + h.apellidoPaterno + " "
								+ h.apellidoMaterno;
					} else {

						return "Sin datos a&uacute;n";
					}

				},
				"className" : "tdText",
				"width" : "50%"
			}, {
				"title" : "Adscripci&oacute;n a la que pertenece",
				"render" : function(data, type, full, meta) {
					var roles = "";
					var h = $.ajax({
						type : "POST",
						url : CONTEXT_PLUS + "queja/traerNombreQueja",
						async : false,
						data : {
							idQueja : full.idQueja
						},
						success : function(datos) {
							return datos;
						}
					}).responseJSON;

					if (h != null) {
						console.log(h)
						return h.descripcionAdscripcion;
					} else {

						return "Sin datos a&uacute;n";
					}

				},
				"className" : "tdText",
				"width" : "50%"
			},
			// { "title" : "Estatus", "data" : "estatus", "className" :
			// "tdText", "width" : "15%" },
			{
				"title" : "Acciones",
				"data" : null,
				"className" : "tdAccion",
				"width" : "10%"
			}, ];

	var actionColumns = [ {
		"targets" : -1,
		"title" : "Acciones",
		"data" : null,
		"orderable" : false,
		"render" : function(data, type, full, meta) {
			var htmlAcciones = '', btnVer = '<button id="btnVer" class="btn-floating btn-small btnEditar waves-effect waves-light" title="Ver datos adscripci&oacute;n"><i class="material-icons">edit</i></button> ';
			htmlAcciones = btnVer;
			return htmlAcciones;
		}
	} ];

	var searchData = function(d) {
		d.idCaso = $idCaso.val();
	};

	var ajaxConfig = {
		"url" : CONTEXT_PLUS + "continuarQueja/list",
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
		listaUsuarios = $tableQueja.DataTable($.extend(JSON.parse(JSON
				.stringify(genericDatatable)), tableOptions));

		$tableQueja.on("click", "#btnVer", function() {
			var data = listaUsuarios.row($(this).parents('tr')).data();
			if (data === undefined)
				data = listaUsuarios.row($(this)).data();

			$.ajax({
				type : "POST",
				url : CONTEXT_PLUS + "queja/agregarSesion",
				data : {
					idCaso : data.caso.folio,
					idQueja : data.idQueja
				},
				complete : function() {
					location.href = "queja";
				}
			});



		});

	}

	return {
		init : init
	};
}();