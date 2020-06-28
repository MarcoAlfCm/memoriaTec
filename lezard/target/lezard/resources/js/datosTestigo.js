var 	$idQueja=$("#idQuejaTestigo"),
		$tableTestigos=$("#tableTestigos"),
		$btnAddTestigo=$("#btnAddTestigo"),
		$btncerrarModalTestigo=$("#btncerrarModalTestigo"),
		$btnAceptarDatosTestigo=$("#btnAceptarDatosTestigo"),
		$modalDatosTestigo=$("#modalDatosTestigo"),
		$formDatosTestigo=$("#formDatosTestigo"),
		$selectOcupacionTestigo=$("#selectOcupacionTestigo"),
		$vinculoTestigo=$("#vinculoTestigo"),
		$selectAdscripcionTestigo=$("#selectAdscripcionTestigo");


$btnAddTestigo.on('click',function(){
	$btncerrarModalTestigo.hide();
	$btnAceptarDatosTestigo.show();
	
	$formDatosTestigo[0].reset();	
	$formDatosTestigo.find('div.error').remove();
	$formDatosTestigo.find('input.error').removeClass('error');
	$formDatosTestigo.find('select').attr('selectedIndex', 0).select2();
	
	$("#textoTitles").text('AGREGAR DATOS DEL TESTIGO');
	$modalDatosTestigo.modal('open');
})


	$btncerrarModalTestigo.on('click',function(e){
		$modalDatosTestigo.modal('close');
		
	})
	
	
	function showModalVerTestugi(testigo) {
console.log(testigo)
	$btncerrarModalTestigo.show();
	$btnAceptarDatosTestigo.hide();
	
	
	$formDatosTestigo[0].reset();	
	$formDatosTestigo.find('div.error').remove();
	$formDatosTestigo.find('input.error').removeClass('error');
	$formDatosTestigo.find('select').attr('selectedIndex', 0).select2();
	$("#textoTitle").text('VER DATOS TESTIGO');
	
	$selectOcupacionTestigo.val(testigo.idOcupacion).select2();
	$vinculoTestigo.val(testigo.idVinculo).select2();
	$selectAdscripcionTestigo.val(testigo.idAdscripcion).select2();
	
//	$conoceAgresor.val(agresor.conoceAgresor).select2();
//	$sexoAgresor.val(agresor.sexo).select2();
//	$selectOcupacionAgresor.val(agresor.idOcupacion).select2();
//	$vinculoPersonaAgresora.val(agresor.idVinculo).select2();
//	$selectAdscripcionPersonaAgresora.val(agresor.idAdscripcion).select2();
	
//	$tipo.val(usuario.tipoUsuario);
//	$tipo.change();
//	$adscripcion.val(usuario.idAdscripcion);
//	$adscripcion.change();
	
	populate('#formDatosTestigo ', testigo);
//	$rol.val(handleList(usuario.roles, "rol")).select2();

	$modalDatosTestigo.modal('open');
}
	

	
	
		$btnAceptarDatosTestigo.on('click',function(e){
		if($formDatosTestigo.valid()){
			e.preventDefault();
			$.ajax({
				type : "POST",
				url : CONTEXT_PLUS + "quejas/createOrUpdateTestigo",
				data : $formDatosTestigo.serialize(),
				success : function(data) {
					listaTestigos.ajax.reload(null,false);
					$modalDatosTestigo.modal('close');

					
				}

			})
		}else{
			showErrorAlert("Todavia te faltan campos por ingresar.")

		}
	})
	
	



	$document.ready(function() {
		listaTestigos.init();
	});


var listaTestigos = function() {
	var columns = [
		{ "title" : "Nombre del testigo", "render" : function(data, type, full, meta) {

			return (full.nombreCompleto != null) ? full.nombreCompleto : "Sin clave...";
		}, "className" : "tdText", "width" : "80%"},
		{ "title" : "Acciones", "data" : null, "className" : "tdAccion", "width" : "20%" },
	];
	
	var actionColumns = [
     	{ "targets": -1, "title":"Acciones", "data": null, "orderable":false,
     		"render": function(data, type, full, meta) {
     			var htmlAcciones = '',
     				btnMostrar = '<button id="btnMostrarTest" class="btn-floating btn-small  waves-effect waves-light" title="Ver datos Agresor."><i class="material-icons">remove_red_eye</i></button> ';
				
     			htmlAcciones = btnMostrar;
     	
//     			console.log(data)

     			
				return htmlAcciones;
		   }
     	
		}
    ];
	
	var searchData = function(d){
		d.idQueja = $idQueja.val();
	};
	
	var ajaxConfig = {
		"url":  CONTEXT_PLUS + "testigo/list",
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
		listaTestigos = $tableTestigos.DataTable($.extend(JSON.parse(JSON.stringify(genericDatatable)), tableOptions));
		
		$tableTestigos.on("click", "#btnMostrarTest", function() {
			var data = listaTestigos.row($(this).parents('tr')).data();
			if(data === undefined)
				data = listaTestigos.row($(this)).data();
			
			showModalVerTestugi(data);
		});
		
	
	}
	
	return {
		init : init
	};
}();