var	$formDatosAgresion=$("#formDatosAgresion"),
	$btnGuardarEditarDatosAgresion = $("#btnAceptarDatosAgresion"),
	
	$selectLugarAtencionAG=$("#selectLugarAtencionAG"),
	$selectTipoAtencionAG=$("#selectTipoAtencionAG"),
	$selectMotivoSolicitudAG=$("#selectMotivoSolicitudAG"),
	$selectPerteneceComunidadAG=$("#selectPerteneceComunidadAG"),
	$selectExpresionesAcosoAG=$("#selectExpresionesAcosoAG"),
	$selectLugarAgresionAG=$("#selectLugarAgresionAG"),
	$selectPrimeraVezAG=$("#selectPrimeraVezAG"),
	$selectUltimoHechoViolenciaAG=$("#selectUltimoHechoViolenciaAG"),
	$selectSituacionPersonaAgredidaAG=$("#selectSituacionPersonaAgredidaAG"),
	$evaluacionFisicaAG=$("#evaluacionFisicaAG"),
	$apoyoAG=$("#apoyoAG"),
	$selectEspacioAtencionAG=$("#selectEspacioAtencionAG"),
	$atencionAG=$("#atencionAG");


$document.ready(function(){
	$.ajax({
		type : "POST",
		url : CONTEXT_PLUS + "quejas/traerDatosAgresion",
		data : {
			idQueja:$("#idQuejaI").val()
		},
		success : function(data) {
		
			populate($formDatosAgresion, data);
			
			$atencionAG.val(data.atencionAG).select2();
			$selectLugarAtencionAG.val(data.selectLugarAtencionAG).select2();
			$selectTipoAtencionAG.val(data.selectTipoAtencionAG).select2();
			$selectMotivoSolicitudAG.val(data.selectMotivoSolicitudAG).select2();
			$selectPerteneceComunidadAG.val(data.selectPerteneceComunidadAG).select2();
			$selectExpresionesAcosoAG.val(data.selectExpresionesAcosoAG).select2();
			$selectLugarAgresionAG.val(data.selectLugarAgresionAG).select2();
			$selectPrimeraVezAG.val(data.selectPrimeraVezAG).select2();
			$selectUltimoHechoViolenciaAG.val(data.selectUltimoHechoViolenciaAG).select2();
			$selectSituacionPersonaAgredidaAG.val(data.selectSituacionPersonaAgredidaAG).select2();
			$evaluacionFisicaAG.val(data.evaluacionFisicaAG).select2();
			$apoyoAG.val(data.apoyoAG).select2();
			$selectEspacioAtencionAG.val(data.selectEspacioAtencionAG).select2();
		}

	})
})




$btnGuardarEditarDatosAgresion.on('click',function(e){
//	console.log("Esta cosa esta rar")
//	e.preventDefault();
	if($formDatosAgresion.valid()){
		e.preventDefault();
		$.ajax({
			type : "POST",
			url : CONTEXT_PLUS + "quejas/createDatosAgresion",
			data : $formDatosAgresion.serialize(),
			success : function(data) {
				document.getElementById("tab-datos-agresor").setAttribute("class","tab");
				$("#tabs-swipe-account").tabs("select", "tab-datos-agresion");
				
				  $('body, html').animate({
		            scrollTop: '0px'
		        }, 300);
				
			}

		})
	}else{
		showErrorAlert("Debes ingresar todos los campos requeridos");
	}
})



