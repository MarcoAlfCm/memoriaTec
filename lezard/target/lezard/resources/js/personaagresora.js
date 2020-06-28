$btnAceptarDatosPersonaAgresora = $("#btnAceptarDatosPersonaAgresora");
$btnAceptarDatosPersonaAgresora.click(function(e) {

	e.preventDefault();
	if ($("#formDatosPersonaAgresora").valid()) {
		$.ajax({
			type : "POST",
			url : CONTEXT_PATH + "admin/queja/ingresarPersonaAgresora",
			data : $("#formDatosPersonaAgresora").serialize(),
			success : function(data, textStatus, jqXHR) {
				showSuccessAlert( "Datos guardados correctamente.");

				$("#tabs-swipe-account").tabs("select", "tab-datos-testigo");
				$("body, html").animate({
					scrollTop : '0px'
				}, 300);
			}
		})

	}
})

$("#btnAddAgresor").on('click', function() {
	
	$('input').val("");
	$('select').prop('selectedIndex',0).select2();
	
})

