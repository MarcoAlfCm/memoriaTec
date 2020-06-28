
$("#formDatosTestigo")
		.validate(
				{
					rules : {
						nombre : {
							required : function(element) {
								var $nombre = $("#nombre");
								if ($nombre.val().trim().length == 0)
									$nombre.val('');
								return true;
							},
							maxlength : 50
						},
						apellidoMaterno : {
							required : function(element) {
								var $apellidoPaterno = $("#apellidoPaterno");
								if ($apellidoPaterno.val().trim().length == 0)
									$apellidoPaterno.val('');
								return true;
							},
							maxlength : 50
						},
						apellidoPaterno : {
							required : function(element) {
								var $apellidoMaterno = $("#apellidoMaterno");
								if ($apellidoMaterno.val().trim().length == 0)
									$apellidoMaterno.val('');
								return true;
							},
							maxlength : 50
						},
						idOcupacion : {
							required : true
							
						},
						idVinculo : {
							
							required : true

						},
						idAdscripcion : {
							
							required : true

						}
					},
					messages : {
						nombre : {
							required : "Ingrese su(s) nombre(s).",
							maxlength : "No puede ingresar más de 50 carácteres."
						},
						apellidoPaterno : {
							required : "Ingrese su apellido paterno.",
							maxlength : "No puede ingresar más de 50 carácteres."
						},
						apellidoMaterno : {
							required : "Ingrese su apellido materno.",
							maxlength : "No puede ingresar más de 50 carácteres."
						},
						
						idOcupacion:{
							required : "Seleccione su ocupación."
						},
						idAdscripcion:{
							required: "Seleccione su adscripción."
						},
						idVinculo:{
							required: "Seleccione un vinculo"
						}
					},

					errorElement : 'div',
					errorPlacement : function(error, element) {
						
						
						 if (element.attr("type") == "radio") { error.insertBefore(element); }
						 else { error.insertAfter(element); } 
						
						var placement = $(element).data('error');
						if (placement) {
							$(placement).append(error);

						} else {
							error.insertAfter(element);
						}
						
						
						var select = (element[0].localName);
						if (select === "select"
								&& (!($(element).hasClass('select2')))) {
							var $input = $(element).parent().find("input");

							if (!($input.hasClass("error")))
								$input.addClass("validate error");
						}

						// SELECT2
						var elem = $(element);
						if (elem.hasClass("select2-hidden-accessible")) {
							$elemBase = $("#select2-" + elem.attr("id")
									+ "-container");
							if ($elemBase.parent().hasClass(
									'select2-selection--single')) {
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
							var $objectSingle = label
									.parent()
									.find(
											'span.select2-selection.select2-selection--single')
									.find('span.select2-selection__rendered')
									.addClass('valid').removeClass('error');

						// SELECT2 MULTIPLE
						if (label.parent().find('span.selection').length > 0)
							;
						var $objectMultiple = label
								.parent()
								.find('span.selection')
								.find(
										'span.select2-selection.select2-selection--multiple')
								.addClass('valid').removeClass('error');

						label.html("Correcto").addClass("checked");
					}
				})