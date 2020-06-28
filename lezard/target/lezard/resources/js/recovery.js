var $btnBuscar = $("#btnBuscar"),
	$lblCorreo = $("#lblCorreo"),
	$idUsuario = $("#idUsuario"),
	$lblCelular = $("#lblCelular"),
	$btnRecovery = $("#btnRecovery"),
	$lblTelefono = $("#lblTelefono"),
	$bsqUsername = $("#bsqUsername"),
	$formRecovery = $("#formRecovery"),
	$formRegister = $("#formRegister"),
	$modalCambioNip = $("#modalCambioNip"),
	$btnChangePassword = $("#btnChangePassword"),
	$lblCorreoInstitucional = $("#lblCorreoInstitucional");

$btnBuscar.on('click', function() {
	if($bsqUsername.val().trim() != '') {
		$.ajax({
			type: 'POST',
			url: CONTEXT_PATH + 'recovery/buscar',
			data: { clave : $bsqUsername.val().trim() },
			success: function(data, textStatus, jqXHR) {
				var usuario = (JSON.parse(jqXHR.responseText)).data;
				
				if(usuario != undefined) {
					$idUsuario.val(usuario.id);
					$lblCorreo.val(usuario.correo);
					$lblCorreoInstitucional.val(usuario.correoInstitucional);
					$lblTelefono.val(usuario.telefono);
					$lblCelular.val(usuario.celular);
					
					$formRecovery.valid();
				}
			}
		});
	} else {
		showErrorAlert("Para buscar debes llenar la clave");
	}
});

$btnRecovery.on('click', function(e) {
	// Comprobar
	e.preventDefault();
	
	if($bsqUsername.val().trim() != '') {
		if($formRecovery.valid()) {
			$.ajax({
				type: 'POST',
				url: CONTEXT_PATH + 'recovery/verificar',
				data: $formRecovery.customSerialize(),
				success: function(data, textStatus, jqXHR) {
					var usuario = (JSON.parse(jqXHR.responseText)).data;
					
					if(usuario != undefined) {
						$formRecovery[0].reset();
						$formRecovery.find('div.checked').remove();
						$formRecovery.find('label.lbl').addClass('active');
						$idUsuario.val(usuario.id);
						
						$modalCambioNip.modal('open');
					}
				}
			});
		}
	} else {
		showErrorAlert("Debes llenar el campo de la clave");
	}
});

$btnChangePassword.on('click', function(e) {
	e.preventDefault();
	
	if($formRegister.valid()) {
		$.ajax({
			type: 'POST',
			url: CONTEXT_PATH + 'recovery/cambiar',
			data: $formRegister.customSerialize() + '&id=' + $idUsuario.val(),
			success: function(data, textStatus, jqXHR) {
				var usuario = (JSON.parse(jqXHR.responseText)).data;
				
				if(usuario != undefined) {
					$modalCambioNip.modal('close');
					$formRecovery[0].reset();
					$formRegister[0].reset();
					$formRegister.find('div.checked').remove();
					$formRegister.find('label.lbl').addClass('active');
					$formRecovery.find('div.checked').remove();
					$formRecovery.find('label.lbl').addClass('active');
					
					window.location.href = CONTEXT_PATH + '?username=' + usuario.clave;
				}
			}
		})
	}
});