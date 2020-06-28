var $formDatosIdentificacion = $("#formDatosIdentificacion");

$formDatosIdentificacion
		.validate({
			rules : {
				nombreI : {
					required : function(element) {
						var $nombre = $("#nombreI");

						if ($nombre.val().trim().length == 0)
							$nombre.val('');
						return true;
					},
				},
				apellidoPaternoI : {
					required : function(element) {
						var $apPaterno = $("#apellidoPaternoI");

						if ($apPaterno.val().trim().length == 0)
							$apPaterno.val('');
						return true;
					},
					maxlength : 50
				},
				apellidoMaternoI : {
					required : function(element) {
						var $apMaterno = $("#apellidoMaternoI");

						if ($apMaterno.val().trim().length == 0)
							$apMaterno.val('');
						return true;
					},
					maxlength : 50
				},
				edadI : {
					required : function(element) {
						var $edad = $("#edadI");

						if ($edad.val().trim().length == 0)
							$edad.val('');
						return true;
					},
					number : true
				},
				fechaNacimientoI : {
					required : function(element) {
						var $fechaNacimientoI = $("#fechaNacimientoI");

						if ($fechaNacimientoI.val().trim().length == 0)
							$fechaNacimientoI.val('');
						return true;
					}
				},
				nombreTutorI:{
					required : function(element) {
						var $nombreTutorI = $("#nombreTutorI");

						if ($nombreTutorI.val().trim().length == 0)
							$nombreTutorI.val('');
						return true;
					}
				},
				selectSexoI : {
					required : true
				},
				selectDiversidadI : {
					required : true
				},
				selectEscolaridadI : {
					required : true
				},
				selectOcupacionI : {
					required : true
				},
				selectAdscripcionI : {
					required : true
				},
				contactoTelefonicoI : {
					required : function(element) {
						var $contactoTelefonicoI = $("#contactoTelefonicoI");

						if ($contactoTelefonicoI.val().trim().length == 0)
							$contactoTelefonicoI.val('');
						return true;
					},
					number : true
				},
				tipoTelefonoI : {
					required : true
				},
				finalidadTelefonoI : {
					required : true
				},
				correoI : {
					required : function(element) {
						var $correoI = $("#correoI");

						if ($correoI.val().trim().length == 0)
							$correoI.val('');
						return true;
					},
					email : true
				}
			},

			messages : {
				nombreI : {
					required : "Ingrese el(los) nombre(s)."
				},
				apellidoPaternoI : {
					required : "Ingrese el apellido paterno."
				},
				apellidoMaternoI : {
					required : "Ingrese el apellido materno."
				},
				edadI : {
					required : "Ingrese la edad.",
					number : "Solo se permiten números"
				},
				fechaNacimientoI : {
					required : "Ingrese fecha de nacimiento."
				},
				nombreTutorI:{
					required : "Ingrese nombre del Tutor."
				},
				selectSexoI : {
					required : "Ingrese su género."
				},
				selectDiversidadI : {
					required : "Este campo es requerido."
				},
				selectEscolaridadI : {
					required : "Seleccione escolaridad."
				},
				selectOcupacionI : {
					required : "Seleccione ocupación."
				},
				selectAdscripcionI : {
					required : "Seleccione adscripción a la que pertenece."
				},
				contactoTelefonicoI : {
					required : "Ingrese el número telefónico.",
					number : "Solo se permiten números"
				},
				tipoTelefonoI : {
					required : "Ingrese el tipo."
				},
				finalidadTelefonoI : {
					required : "Ingrese la finalidad."
				},
				correoI : {
					required : "Ingrese correo electrónico.",
					email : "No es un correo valido"
				}
			},
			errorElement : "div",
			errorPlacement : function(error, element) {
				var placement = $(element).data('error');
				if (placement) {
					$(placement).append(error)

				} else {
					error.insertAfter(element);
				}
				var select = (element[0].localName);
				if (select === "select" && (!($(element).hasClass('select2')))) {
					var $input = $(element).parent().find("input");

					if (!($input.hasClass("error")))
						$input.addClass("validate error");
				}

				// SELECT2
				var elem = $(element);
				if (elem.hasClass("select2-hidden-accessible")) {
					$elemBase = $("#select2-" + elem.attr("id") + "-container");
					if ($elemBase.parent()
							.hasClass('select2-selection--single')) {
						$elemBase.addClass("error");
						element = $elemBase.parent();
						error.insertAfter(element);
					} else {
						var $parent = elem
								.parent()
								.find(
										'span.select2.select2-container.select2-container--default'), $object = $parent
								.find('span.select2-selection.select2-selection--multiple');

						$object.addClass('error');
						element = $object.parent();
						error.insertAfter(element);
					}
				} else {
					error.insertAfter(element);
				}
			},
			success : function(label) {
				var select = (label.prev('select'));

				if (select[0] != undefined) {
					if (select[0].localName === 'select') {
						var $input = select.prev().prev().prev();
						$input.removeClass('error').addClass('valid');
					}
				}

				// SELECT2 SINGLE
				if (label.parent().hasClass('selection'))
					var $objectSingle = label.parent().find(
							'span.select2-selection.select2-selection--single')
							.find('span.select2-selection__rendered').addClass(
									'valid').removeClass('error');

				// SELECT2 MULTIPLE
				if (label.parent().find('span.selection').length > 0);
				var $objectMultiple = label
						.parent()
						.find('span.selection')
						.find(
								'span.select2-selection.select2-selection--multiple')
						.addClass('valid').removeClass('error');

				label.html("Correcto").addClass("checked");
			}

		});
