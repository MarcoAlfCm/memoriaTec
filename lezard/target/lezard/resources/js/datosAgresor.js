var 	$idQueja=$("#idQuejaAgresor"),
		$tableAgresores=$("#tableAgresores"),
		$btnAddAgresor=$("#btnAddAgresor"),
		$formDatosPersonaAgresora=$("#formDatosPersonaAgreso"),
		$modalDatosAgresor=$("#modalDatosAgresor"),
		$btnAceptarDatosPersonaAgresora=$("#btnAceptarDatosPersonaAgreso"),
		$id_QuejaAgresor=$("#id_QuejaAgresor"),
		
		$conoceAgresor=$("#conoceAgresor"),
		$sexoAgresor=$("#sexoAgresor"),
		$selectOcupacionAgresor=$("#selectOcupacionAgresor"),
		$vinculoPersonaAgresora=$("#vinculoPersonaAgresora"),
		$selectAdscripcionPersonaAgresora=$("#selectAdscripcionPersonaAgresora"),
		$otroOcupacionAgresor=$("#otroOcupacionAgresor"),
		$btnAcerrarModalAgresor=$("#btnAcerrarModalAgresor");



	$document.ready(function() {
		listaAgresores.init();
	});

	$btnAcerrarModalAgresor.on('click',function(e){
		$modalDatosAgresor.modal('close');
		
	})
	
	
	
	$btnAceptarDatosPersonaAgresora.on('click',function(e){
		if($formDatosPersonaAgresora.valid()){
			e.preventDefault();
			$.ajax({
				type : "POST",
				url : CONTEXT_PLUS + "quejas/createOrUpdateAgresor",
				data : $formDatosPersonaAgresora.serialize(),
				success : function(data) {
					listaAgresores.ajax.reload(null,false);
					$modalDatosAgresor.modal('close');

					
				}

			})
		}else{
			showErrorAlert("Todavia te faltan campos por ingresar.")

		}
	})
	
	
	
	$btnAddAgresor.on('click', function(){
		$btnAcerrarModalAgresor.hide();
		$btnAceptarDatosPersonaAgresora.show();
		$formDatosPersonaAgresora[0].reset();	
		$formDatosPersonaAgresora.find('div.error').remove();
		$formDatosPersonaAgresora.find('input.error').removeClass('error');
		$formDatosPersonaAgresora.find('select').attr('selectedIndex', 0).select2();
		$("#textoTitle").text('AGREGAR DATOS PERSONA AGRESORA');
		$modalDatosAgresor.modal('open');
	})
	
function showModalEditarAgresor(agresor) {
		$btnAcerrarModalAgresor.show();
		$btnAceptarDatosPersonaAgresora.hide();
	$formDatosPersonaAgresora[0].reset();	
	$formDatosPersonaAgresora.find('div.error').remove();
	$formDatosPersonaAgresora.find('input.error').removeClass('error');
	$formDatosPersonaAgresora.find('select').attr('selectedIndex', 0).select2();
	$("#textoTitle").text('VER DATOS PERSONA AGRESORA');
	
	$conoceAgresor.val(agresor.conoceAgresor).select2();
	$sexoAgresor.val(agresor.sexo).select2();
	$selectOcupacionAgresor.val(agresor.idOcupacion).select2();
	$vinculoPersonaAgresora.val(agresor.idVinculo).select2();
	$selectAdscripcionPersonaAgresora.val(agresor.idAdscripcion).select2();
	
//	$tipo.val(usuario.tipoUsuario);
//	$tipo.change();
//	$adscripcion.val(usuario.idAdscripcion);
//	$adscripcion.change();
	
	populate('#formDatosPersonaAgreso ', agresor);
//	$rol.val(handleList(usuario.roles, "rol")).select2();

	$modalDatosAgresor.modal('open');
}
	
	
var listaAgresores = function() {
	var columns = [
		{ "title" : "Nombre del agresor", "render" : function(data, type, full, meta) {

			return (full.nombreCompleto != null) ? full.nombreCompleto : "Sin clave...";
		}, "className" : "tdText", "width" : "80%"},
		{ "title" : "Acciones", "data" : null, "className" : "tdAccion", "width" : "20%" },
	];
	
	var actionColumns = [
     	{ "targets": -1, "title":"Acciones", "data": null, "orderable":false,
     		"render": function(data, type, full, meta) {
     			var htmlAcciones = '',
     				btnMostrar = '<button id="btnMostrar" class="btn-floating btn-small  waves-effect waves-light" title="Ver datos Agresor."><i class="material-icons">remove_red_eye</i></button> ';
				
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
		"url":  CONTEXT_PLUS + "agresor/list",
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
		listaAgresores = $tableAgresores.DataTable($.extend(JSON.parse(JSON.stringify(genericDatatable)), tableOptions));
		
		$tableAgresores.on("click", "#btnMostrar", function() {
			var data = listaAgresores.row($(this).parents('tr')).data();
			if(data === undefined)
				data = listaAgresores.row($(this)).data();
			
			showModalEditarAgresor(data);
		});
		
	
	}
	
	return {
		init : init
	};
}();