var $formCrearEditarUsuario = $("#formCrearEditarUsuario"), 
	$btnAceptarCrearEditarUsuario = $("#btnAceptarCrearEditarUsuario"), 
	$tipo = $("#tipo"), 
	$rol =$("#rol"),
	$clave = $("#clave"),
	$adscripcion = $("#adscripcion"),
	$nombre=$("#nombre"),
	$apellidoPaterno=$("#apellidoPaterno"),
	$apellidoMaterno=$("#apellidoMaterno"),
	$correo=$("#correo"),
	$telefono=$("#telefono"),
	$tableUsuarios = $("#tableUsuarios"),
	$bsqClave=$("#bsqClave"),
	$bsqNombre=$("#bsqNombre"),
	$modalAgregarUsuario=$("#modalAgregarUsuario"),
	$formAgregarEditarusuario=$("#formCrearEditarUsuario"),
	$btnAgregarUsuario=$("#btnAgregarUsuario"),
	$idUsuario = $("#idUsuario"),
	$modalDesbloquearUsuario = $("#modalDesbloquearUsuario"),
	$btnReactivarUsuario = $("#btnReactivarUsuario"),
	$modalInactivarUsuario=$("#modalInactivarUsuario"),
	$btnInactivarUsuario = $("#btnInactivarUsuario"),
	$descripAdscrip=$("#descripAdscrip"),
	$btnSearch=$("#btnBuscar"),
	$btnClear=$("#btnClear"),
	$bsqRol=$("#bsqRol"),
$bsqEstatus=$("#bsqEstatus"),
$bsqTipo=$("#bsqTipo"),
$bsqAdscr=$("#bsqAdscr"),
$rolList = $("#rolList"),
$edificio= $("#edificio")
;
	

$bsqNombre.keyup(function(){
    this.value = this.value.toUpperCase();
});

$clave.blur(function() {
	$.ajax({
		type : "POST",
		url : CONTEXT_PATH + "admin/usuario/consultaInterno",
		data : {
			clave : $("#clave").val()
		},
		success : function(data, textStatus, jqXHR) {
			$nombre.val(data.nombre);
			$apellidoPaterno.val(data.apellidoPaterno);
			$apellidoMaterno.val(data.apellidoMaterno);
			$correo.val(data.correoUaq)
			$telefono.val(data.telefono)
			$descripAdscrip.val(data.descripAdscrip)
			$adscripcion.val(data.idAdscripcion);
			$adscripcion.change();
		}
	});
});

$btnAceptarCrearEditarUsuario.on('click', function(e) {
	e.preventDefault();
	if ($formCrearEditarUsuario.valid()) {
		e.preventDefault();

		$.ajax({
			type : "POST",
			url : CONTEXT_PLUS + "usuario/createOrUpdate",
			data : $formCrearEditarUsuario.serialize(),
			success : function(data) {
				listaUsuarios.ajax.reload(null,false);
				$modalAgregarUsuario.modal('close');
				
			}

		})
	}else {
		showErrorAlert("Debes ingresar todos los campos requeridos.")
	}
})

$tipo.on('change', function() {
	if ($tipo.val() == ("Interno")) {
//		$clave.prop("disabled", false);
		$clave.val("");
//		$nombre.prop("disabled", true);
//		$apellidoPaterno.prop("disabled", true);
//		$apellidoMaterno.prop("disabled", true);
//		$correo.prop("disabled", true);
		$nombre.val("");
		$apellidoPaterno.val("");
		$apellidoMaterno.val("");
		$correo.val("");
		$rol.val("0");
		$rol.change();

		} else {
		if ($tipo.val() == ("Externo")) {
//			$clave.prop("disabled", true);
			$nombre.prop("disabled", false);
			$apellidoPaterno.prop("disabled", false);
			$apellidoMaterno.prop("disabled", false);
			$correo.prop("disabled", false);
			$rol.val("0");
			$rol.change();
			$clave.val("");
		}
	} 

})


$rol.on('change',function(){
	
	
	if($rol.val==("0")){
		alert("sa")
		
	}else{
	
		if($tipo.val() == ("EXTERNO") && ($rol.val()==("1") || $rol.val()==("2") || $rol.val()==("3") )){
			$clave.val("");
		$.ajax({
			type : "POST",
			url : CONTEXT_PATH + "admin/usuario/consultaExterno",
			data : {
				rol : $rol.val()
			},
			success : function(data, textStatus, jqXHR) {
				$("#clave").val(data);
			}
		});
		}
}
})



$btnInactivarUsuario.on('click', function() {
	$.ajax({
		type: 'POST',
		url: CONTEXT_PATH + "admin/usuarios/inactivar",
		data: { idUsuario : $idUsuario.val() },
		success: function(data, textStatus, jqXHR) {
			$idUsuario.val('');
			listaUsuarios.ajax.reload(null, false);
			$modalInactivarUsuario.modal('close');
		}
	});
});


$btnReactivarUsuario.on('click', function() {
	$.ajax({
		type: 'POST',
		url: CONTEXT_PATH + "admin/usuarios/desbloquear",
		data: { idUsuario : $idUsuario.val() },
		success: function(data, textStatus, jqXHR) {
			$idUsuario.val('');
			listaUsuarios.ajax.reload(null, false);
			$modalDesbloquearUsuario.modal('close');
		}
	});
});



$btnAgregarUsuario.on('click', function(){
	$formAgregarEditarusuario[0].reset();	
	$formAgregarEditarusuario.find('div.error').remove();
	$formAgregarEditarusuario.find('input.error').removeClass('error');
	$formAgregarEditarusuario.find('select').attr('selectedIndex', 0).select2();
	$("#textoTitle").text('AGREGAR USUARIO');
	$modalAgregarUsuario.modal('open');
})

function showModalDesbloquearUsuario(usuario) {
	
	$idUsuario.val(usuario.idUsuario);
	$modalDesbloquearUsuario.modal('open');
}

function showModalInactivarUsuario(usuario) {
	$idUsuario.val(usuario.idUsuario);
	$modalInactivarUsuario.modal('open');
}

function showModalEditUsuario(usuario) {
	console.log(usuario);
	$formAgregarEditarusuario[0].reset();	
	$formAgregarEditarusuario.find('div.error').remove();
	$formAgregarEditarusuario.find('input.error').removeClass('error');
	$formAgregarEditarusuario.find('select').attr('selectedIndex', 0).select2();
	$("#textoTitle").text('ACTUALIZAR USUARIO');
//	
	$rolList.val(handleList(usuario.roles, "rol")).select2();
	console.log(usuario) 
//	alert(usuario.roles) 
	
	$tipo.val(usuario.tipoUsuario);
	$tipo.change();
	$adscripcion.val(usuario.idAdscripcion);
	$adscripcion.change();
	
	populate('#formCrearEditarUsuario ', usuario);
	$rol.val(handleList(usuario.roles, "rol")).select2();
	
	$modalAgregarUsuario.modal('open');
}


$document.ready(function() {
	listaUsuarios.init();
	console.log(listaUsuarios)
});


$btnSearch.on('click', function() {
	listaUsuarios.ajax.reload();
});

$btnClear.on('click', function() {
	$bsqClave.val('').parent().find('label').removeClass('active');
	$bsqNombre.val('').parent().find('label').removeClass('active');
	$bsqRol.val('').select2();
	$bsqEstatus.val('').select2();
	$bsqTipo.val('').select2();
	$bsqAdscr.val('').select2();
	
//	$bsqNombre.val('').parent().find('label').removeClass('active');
//	$bsqCorreo.val('').parent().find('label').removeClass('active');
//	$bsqEstatus.val('').select2();
//	$bsqRol.val('').select2();
	listaUsuarios.ajax.reload();
});


var listaUsuarios = function() {
	var columns = [
		{ "title" : "Clave", "render" : function(data, type, full, meta) {
			return (full.clave != null) ? full.clave : "Sin clave...";
		}, "className" : "tdText", "width" : "10%"},
		{ "title" : "Nombre", "data" : "nombreCompleto", "className" : "tdText", "width" : "25%"},
		{ "title" : "Adscripci&oacute;n", "data" : "descripcionAdscripcion", "className" : "tdText", "width" : "15%"},
		{ "title" : "Correo", "data" : "correo", "className" : "tdText", "width" : "20%"},
		{ "title" : "Roles", "render" : function(data, type, full, meta) {
			console.log(data);
			var roles = "";
			$.each(full.roles, function(id, rol) {
	    		var rolString = (rol.tipoRol.toString().substring(5, rol.llength)).replace("_", " ");
	    		
	    		if(roles != "")
	    			roles += ", " + rolString;
	    		else
	    			roles += rolString;
	    	});
	    	
	    	return roles;
		}, "className" : "tdText", "width" : "15%" },
		{ "title" : "Estatus", "data" : "estatus", "className" : "tdText", "width" : "15%" },
		{ "title" : "Acciones", "data" : null, "className" : "tdAccion", "width" : "20%" },
	];
	
	var actionColumns = [
     	{ "targets": -1, "title":"Acciones", "data": null, "orderable":false,
     		"render": function(data, type, full, meta) {
     			var htmlAcciones = '',
     				btnEditar = '<button id="btnEditar" class="btn-floating btn-small btnEditar waves-effect waves-light" title="Editar usuario."><i class="material-icons">edit</i></button> ',
     				btnDesbloquear = '<button id="btnDesbloquear" class="btn-floating btn-small waves-effect waves-light green" title="Desbloquear/Reactivar usuario."><i class="material-icons">lock_open</i></button> ',
     				btnInactivar = '<button id="btnInactivar" class="btn-floating btn-small waves-effect waves-light red" title="Inactivar usuario."><i class="material-icons">do_not_disturb_alt</i></button> ';
				
     			htmlAcciones = btnEditar + btnDesbloquear + btnInactivar;
     	
     			console.log(data)

     			
				return htmlAcciones;
		   }
     	
		}
    ];
	
	var searchData = function(d){
		d.clave = $bsqClave.val();
		d.nombre = $bsqNombre.val();
//		d.correo = $bsqCorreo.val();
		d.estatus = $bsqEstatus.val();
		d.idRol = $bsqRol.val();
		d.tipo=$bsqTipo.val();
		d.idAdscripcion=$bsqAdscr.val();
	};
	
	var ajaxConfig = {
		"url":  CONTEXT_PLUS + "usuarios/list",
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
		listaUsuarios = $tableUsuarios.DataTable($.extend(JSON.parse(JSON.stringify(genericDatatable)), tableOptions));
		
		$tableUsuarios.on("click", "#btnEditar", function() {
			var data = listaUsuarios.row($(this).parents('tr')).data();
			if(data === undefined)
				data = listaUsuarios.row($(this)).data();
			
			showModalEditUsuario(data);
		});
		
		$tableUsuarios.on("click", "#btnDesbloquear", function() {
			var data = listaUsuarios.row($(this).parents('tr')).data();
			if(data === undefined)
				data = listaUsuarios.row($(this)).data();
			
			showModalDesbloquearUsuario(data);
		});
		
		$tableUsuarios.on("click", "#btnInactivar", function() {
			var data = listaUsuarios.row($(this).parents('tr')).data();
			if(data === undefined)
				data = listaUsuarios.row($(this)).data();
			
			showModalInactivarUsuario(data);
		});
	}
	
	return {
		init : init
	};
}();



