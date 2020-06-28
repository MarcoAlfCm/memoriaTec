var $btnAceptarDatosIdentificacion =  $("#btnAceptarDatosIdentificacion"), 
	$formDatosIdentificacion = $("#formDatosIdentificacion"),
    $selectSexoI=$("#selectSexoI"),
    $divGenero=$("#divGenero"),
    $divTextoGenero=$("#divTextoGenero"),
    $otroSexoI=$("#otroSexoI"),
    $divTextoDiversidad=$("#divTextoDiversidad"),
    $divDiversidad=$("#divDiversidad"),
    $otroDiversidadI=$("#otroDiversidadI"),
    $selectDiversidad=$("#selectDiversidadI"),
    $selectOcupacionI=$("#selectOcupacionI"),
    $divTextoOcupacion=$("#divTextoOcupacion"),
    $divOcupacion=$("#divOcupacion"),
    $otroOcupacionI=$("#otroOcupacionI"),
    $selectEscolaridadI=$("#selectEscolaridadI"),
    $selectAdscripcionI=$("#selectAdscripcionI"),
    $tipoTelefonoI=$("#tipoTelefonoI"),
    $finalidadTelefonoI=$("#finalidadTelefonoI"),
    $edadI=$("#edadI"),
    $nombreTutorI=$("#nombreTutorI")
    ;




$selectOcupacionI.on('change',function(){
	if($selectOcupacionI.val()===('6')){
//		$divTextoOcupacion.show();
//		$divOcupacion.show();
//		showErrorAlert($selectOcupacionI.val())
	}else{
//		$divOcupacion.hide();
//		$divTextoOcupacion.hide();
		$otroOcupacionI.val("");
//		showErrorAlert($selectOcupacionI.val())
	}
})

$selectDiversidad.on('change',function(){
	if($selectDiversidad.val()===('OTRO')){
//		$divDiversidad.show();
//		$divTextoDiversidad.show();
//		showErrorAlert($selectDiversidad.val())
		
	}else{
//		$divDiversidad.hide();
//		$divTextoDiversidad.hide();
		$otroDiversidadI.val("");
//		showErrorAlert($selectDiversidad.val())
	}
})




function revisarInputTutor(){
	if($edadI.val()<=18){
		 document.getElementById("nombreTutorI").disabled = true;
		 $nombreTutorI.val("");
		 document.getElementById("nombreTutorI").setAttribute("class","")
		 
	}else{
		 document.getElementById("nombreTutorI").disabled = false;
		 document.getElementById("nombreTutorI").setAttribute("class","validate")
	}
}

$document.ready(function(){
	showModalEditUsuario();
	revisarInputTutor();
})


function showModalEditUsuario() {
	$.ajax({
		type : "POST",
		url : CONTEXT_PLUS + "quejas/traerDatosIden",
		data : {
			idQueja:$("#idQuejaI").val()
		},
		success : function(data) {
		
			populate($formDatosIdentificacion, data);
			$selectSexoI.val(data.selectSexoI).select2();
			$selectDiversidad.val(data.selectDiversidadI).select2();
			$selectOcupacionI.val(data.selectOcupacionI).select2();
			$selectEscolaridadI.val(data.selectEscolaridadI).select2();
			$selectAdscripcionI.val(data.selectAdscripcionI).select2();
			$tipoTelefonoI.val(data.tipoTelefonoI).select2();
			$finalidadTelefonoI.val(data.finalidadTelefonoI).select2();
		}

	})
}


$btnAceptarDatosIdentificacion.on('click', function(e) {
//	alert("he")
//	e.preventDefault();
	if ($formDatosIdentificacion.valid()) {
//		alert("ya")
		e.preventDefault();
		$.ajax({
			type : "POST",
			url : CONTEXT_PLUS + "quejas/createDatosIdentificacion",
			data : $formDatosIdentificacion.serialize(),
			success : function(data) {
				document.getElementById("idTabDatosAgresion").setAttribute("class","tab");
				$("#tabs-swipe-account").tabs("select", "tab-datos-agresion");
				
				  $('body, html').animate({
		            scrollTop: '0px'
		        }, 300);
				
			}

		})
		
		
		

	}else{
		showErrorAlert("Debes ingresar todos los campos.")
	}
});


$otroSexoI.on('change',function(){
	$selectSexoI.val("OTRO").select2();
})
$otroDiversidadI.on('change',function(){
	$selectDiversidad.val("OTRO").select2();
}) 
$otroOcupacionI.on('change',function(){
	$selectOcupacionI.val("6").select2();
}) 


$selectSexoI.on('change',function(){
	if($selectSexoI.val()===('OTRO')){
		
	}else{
//		showErrorAlert($selectSexoI.val())
		$otroSexoI.val('');
//		$divGenero.hide();
//		$divTextoGenero.hide();
//		showErrorAlert($selectSexoI.val())
	}
})