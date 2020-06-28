var $delay = 5000,
	$document = $(document),
	sideNavGlobal = undefined,
	$simpleLoading = $(".simpleLoading"),
	$modalCerrarSesion = $("#modalCerrarSesion"),
	$menuEmergenteSession = $(".menuEmergenteSession");

$document.ready(function() {
	//	========== INIT BLOCK ==========
	$('ul.tabs').tabs();
	$('.sidenav').sidenav({
		edge: 'left'
	});
	$('.select2').select2({
		language: {
			noResults: function() {
				return "No hay resultado";        
			},
			searching: function() {
				return "Buscando..";
			}
		},
		placeholder: 'Seleccione...'
	});
	$('.modal').modal();
	$('select').formSelect().on('change', function(e) {
		if($(this).hasClass('validate'))
			$(this).valid();
	});
	$("input.select-dropdown.dropdown-trigger").focusout(function() {
		var $this = $(this); 
		if($this.hasClass('validate')) {
			setTimeout(function() {
				$this.valid();
			}, 50);
		}
	});
	$('body').on('DOMSubtreeModified', 'ul.select2-selection__rendered', function(event) {
		event.stopImmediatePropagation();
		
		if($(this).parent().hasClass('select2-selection--multiple')) {
			var $object = $(this).parent().parent().parent().parent().find('select');
			$object.valid();
		}
	});
	$('.collapsible').collapsible();
		var elem = document.querySelector('.collapsible.expandable');
		var instance = M.Collapsible.init(elem, {
			accordion: false
	});
	$('.datepicker').datepicker({
		container: 'body',
		format: 'dd/mm/yyyy',
		yearRange: 100,
	    i18n: {
	        clear: 'Limpiar',
	        today: 'Hoy',
	        done: 'Aceptar',
	        cancel: 'Cancelar',
	        previousMonth: '‹',
	        nextMonth: '›',
	        months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	        monthsShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
	        weekdaysShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
	        weekdays: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	        weekdaysAbbrev: ['D', 'L', 'M', 'M', 'J', 'V', 'S']
	    }
	}).on('change', function(e) {
		if($(this).hasClass('validate'))
			$(this).valid();
	});
	$('.timepicker').timepicker({
		container: 'body',
		twelveHour: true,
		i18n: {
			clear: 'Limpiar',
			done: 'Aceptar',
			cancel: 'Cancelar'
		}
	});
	
	// ========== SIMPLE LOADING ==========
    $simpleLoading.fadeOut();  
    
    // ========== INITIAL MESSAGE ==========
	var message = getUrlParameter('inicioSesion');
	if(message != undefined)
		showNotificationAlert("¡Bienvenido " + USER_NAME.trim() + "! Has iniciado sesión correctamente.");
	
	var message = getUrlParameter('permisoDenegado');
	if(message != undefined)
		showErrorAlert("No tienes los permisos necesarios para navegar en esta dirección.");
	
	var message = getUrlParameter('expiredSession');
	if(message != undefined) {
		$.alertBox({
			type: "notification",
			title: "NOTIFICACIÓN",
			text: "Sesión finalizada correctamente.",
			delay: -1,
			position: "upRight"
		});
		
		window.history.pushState(null, null, CONTEXT_PATH);
	}
	
	// ========== TIMEOUT FOR SESSION ==========
	inactivityTime();
	
//	// ========== SET COLOR FOR CARDS ==========
//	$(".card").each(function(index) {
//		if(!($(this).hasClass("cardWithOutBorder")))
//			$(this).css("border-top","10px solid "+generarColorCard());
//	});
//	$(".card-panel").each(function(index) {
//		if(!($(this).hasClass("cardWithOutBorder")))
//			$(this).css("border-top","10px solid "+generarColorCard());
//	});
});

//========== IS NOT EMPTY FUNCTION ==========
function isNotEmpty($element) {
	return ($element.val() != null && $element.val() != undefined && $element.val() != '') ? true : false;
}

function isNotEmptyValue(element) {
	return (element != null && element != undefined) ? true : false;
}

//========== SESSION FRAME ==========
$document.on('mouseenter', '.sessionBtn', function() {
	$menuEmergenteSession = $(".menuEmergenteSession");
	$menuEmergenteSession.show().animate({opacity:1});
});

$document.on('click', '.sessionBtn', function(e) {
	e.stopPropagation();
	$menuEmergenteSession = $(".menuEmergenteSession");
	$menuEmergenteSession.show().animate({opacity:1});
});

$document.on('click', function() {
	$menuEmergenteSession.animate({opacity:0}).hide();
});

// ========== CLICK BTNS GO BACK ==========
$document.on('click', '.btnGoBack', function() {
	goBack();
});

//========== CLICK BTNS GO BACK ==========
$document.on('click', '.btnGoHome', function() {
	window.location.href = CONTEXT_PATH;
});


// ========== GET PARAMETER BY URL ==========
function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}

// ========== AJAX ==========
$document.ajaxStart(function() {
	$simpleLoading.fadeIn();
});
$document.ajaxComplete(function() {
	$simpleLoading.delay(500).fadeOut();
});
$document.ajaxError(function(event, xhr, settings, exc) {
	if (xhr.responseJSON != undefined) {
		var parsedResponse = JSON.parse(xhr.responseJSON);
		showAlert(parsedResponse.status, parsedResponse.result);
		$simpleLoading.fadeOut();
	}
});
$document.ajaxSuccess(function(event, xhr, settings) {
	if (xhr.responseJSON != undefined && xhr.responseText != undefined) {
		var parsedResponse = JSON.parse(xhr.responseText);
		if(!((settings.url).indexOf("registroActividad") >= 0)) {
			showAlert(parsedResponse.status, parsedResponse.result);
			$simpleLoading.fadeOut();
		} else {
			if(parsedResponse.status != "success") {
				showAlert(parsedResponse.status, parsedResponse.result);
				$simpleLoading.fadeOut();
			}
		}
	}
});

// ========== REFRESH ==========
var inactivityTime = function () {
    var time;
    window.onload = resetTimer;
    // DOM Events
    document.onmousemove = resetTimer;
    document.onkeypress = resetTimer;

    function logout() {
    	if(IS_AUTHENTICATED)
    		location.reload();    	
    }

    function resetTimer() {
        clearTimeout(time);
        time = setTimeout(logout, ((30 * 60000) + 100));
    }
};

// ========== LOGOUT MODAL DEPLOY ==========
function cerrarSesion() {
	$modalCerrarSesion.modal("open");
}

// ========== GO BACK ==========
function goBack() {
	window.history.back();
}

// ========== FUNCION PARA SERIALIZAR PERSONALIZADA ==========
$.fn.customSerialize = function() {
	var data = undefined,
		$form = $(this).eq(0);
	
	if($form.valid()) {
		$.each($form.find('input, textarea'), function(index, field) {
			$(this).val($(this).val().trim());
		});
		
		data = $form.serialize();
	}
	
	return data;
};

//========== LIMPIAR UN FORMULARIO ==========
$.fn.resetForm = function() {
	// Detener la ejecución si el objeto NO es una forma
	if (!$(this).is('form'))
		return;
	
	$form = $(this);
	// Limpiar los campos de tipo input y textarea
	$.each($form.find('input, textarea'), function(index, field) {
		$(this).val('').removeClass('valid').removeClass('invalid').removeClass('error').parent().find('label').removeClass('active').parent().find('div').remove();
	});
	// Limpiar los campos de tipo select
	$.each($form.find('select'), function(index, field) {
		$(this).val('').select2();
	});
};

//========== HANDLE LIST FOR SELECT MULTIPLE ==========
function handleList(list, type) {
	var auxArray = new Array();
	if(type === "rol") {
		$.each(list, function(index, object) {
			auxArray[index] = object.id;
		});
	} else if(type === "adscripcion") {
		$.each(list, function(index, object) {
			auxArray[index] = object.clave;
		});
	}
	
	return auxArray;
}


// ========== SLIDENAV IN ==========
$document.on('click', '#btnLaunchNav', function() {
	var instance = M.Sidenav.getInstance($("#slideNavMain"));
		
	if(sideNavGlobal == undefined) {
		instance.open();		
		sideNavGlobal = "activo";
	} else {
		instance.close();		
		sideNavGlobal = undefined;
	}
});

//=============== CLOSE SLIDENAV WHEN CLICKING ON SCREEN ===============
$($document).on('click', 'main', function() {
	var instance = M.Sidenav.getInstance($("#slideNavMain"));
	instance.close();
	
	if(sideNavGlobal != undefined) {
		instance.close();
		sideNavGlobal = undefined;
	}
});


//========== GENERIC DATATABLE OPTIONS SET ==========
var genericDatatable = {
		"responsive": true,
		"searching": false,
		"pageLength": 5,
		"bFilter": false,
		"ordering": false,
		"autoWidth": false,
		"lengthChange": false,
		"sPaginationType": "numbers_no_ellipses",
		"processing" : true,
		"serverSide" : true,
		"oLanguage" : { 
			"sProcessing" : "Procesando...",
			"sLengthMenu" : "Mostrar _MENU_ registros",
			"sZeroRecords" : "No se encontraron resultados",
		   	"sEmptyTable" : "No se encontraron registros",
		   	"sInfo" : "Mostrando registros del _START_ al _END_ de _TOTAL_ registros",
		   	"sError" : "Ocurrió un error al obtener la información",
		   	"sInfoEmpty" : "Mostrando registros del 0 al 0",
		   	"sInfoFiltered" : "",
		   	"sInfoPostFix" : "",
		   	"sSearch" : "Buscar:",
		   	"sUrl" : "",
		   	"sInfoThousands" : ",",
		   	"sLoadingRecords" : " ",
		   	"oPaginate" : {
		   		"sFirst" : "&laquo;",
		   		"sNext" : "&rsaquo;",
		   		"sPrevious" : "&lsaquo;",
		   		"sLast" : "&raquo;"
		   	},
		   	"oAria" : { 
		   		"sSortAscending" : ": Activar para ordenar la columna de manera ascendente",
		   		"sSortDescending" : ": Activar para ordenar la columna de manera descendente"
		   	}
		}
};

//========== ACTIVE SELECT2 IN MODALS ==========
function enableModalSelects(parent) {
	$('#' + parent + ' .select2').each(function() {  
	   var $p = $(this).parent(); 
	   $(this).select2({  
	     dropdownParent: $p  
	   });  
	});
}

// ========== POPULATE FORMS ==========
function populate(frm, data, active) {	
	$.each(data, function(key, value) {
		if(value != undefined && value != null && value != '')
			$('[name='+key+']', frm).val(value).parent().find('label').addClass('active');
		else
			$('[name='+key+']', frm).parent().find('label').removeClass('active');
	});
}





// ========== MESSAGE DEPLOY FUNCITONS ==========
function showAlert(status, msg) {
	switch(status) {
		case 'success':
			showSuccessAlert(msg);
			break;
		case 'error':
			showErrorAlert(msg);
			break;
		case 'notification':
			showNotificationAlert(msg);
			break;
		case 'warning':
			showWarningAlert(msg);
			break;
	}
}

// ========== ALERTS ==========
function showErrorAlert(msg) {
	$.alertBox({
		type: "error",
		title: "Error",
		text: msg,
		delay: $delay,
		position: "upRight"
	});
}

function showSuccessAlert(msg) {
	$.alertBox({
		type: "success",
		title: "Éxito",
		text: msg,
		delay: $delay,
		position: "upRight"
	});
}

function showNotificationAlert(msg) {
	$.alertBox({
		type: "notification",
		title: "Notificación",
		text: msg,
		delay: $delay,
		position: "upRight"
	});
}

function showWarningAlert(msg) {
	$.alertBox({
		type: "warning",
		title: "Advertencia",
		text: msg,
		delay: $delay,
		position: "upRight"
	});
}