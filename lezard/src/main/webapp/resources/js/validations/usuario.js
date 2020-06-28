jQuery.validator.addMethod('lettersonly', function(value, element) {
	return this.optional(element)
			|| /^[a-z áãâäàéêëèíîïìóõôöòúûüùçñ]+$/i.test(value);
}, "Solamente letras, por favor");

$("#formCrearEditarUsuario")
		.validate(
				{
					rules : {
						tipo : {
							required : function(element) {
								var $tipo = $("#tipo");

								if ($tipo.val().trim().length == 0)
									$tipo.val('');
								return true;
							}
						},

						clave : {
							required : function(element) {
								var $clave = $("#clave");

								if ($clave.val().trim().length == 0)
									$clave.val('');
								return true;
							}
						},
						nombre : {
							lettersonly : true,
							required : function(element) {
								var $nombre = $("#nombre");

								if ($nombre.val().trim().length == 0)
									$nombre.val('');
								return true;
							}
						},
						apellidoPaterno : {
							lettersonly : true,
							required : function(element) {
								var $apellidoPaterno = $("#apellidoPaterno");

								if ($apellidoPaterno.val().trim().length == 0)
									$apellidoPaterno.val('');
								return true;
							}
						},
						apellidoMaterno : {
							lettersonly : true,
							required : function(element) {
								var $apellidoMaterno = $("#apellidoMaterno");

								if ($apellidoMaterno.val().trim().length == 0)
									$apellidoMaterno.val('');
								return true;
							}
						},
						rol : {
							required : true
						},

						correo : {
							required : true,
							email : true

						},

						telefono : {
							required : function(element) {
								var $telefono = $("#telefono");

								if ($telefono.val().trim().length == 0)
									$telefono.val('');
								return true;
							},
							number : true
						},
						adscripcion : {
							required : true
						}
					},

					messages : {
						tipo : {

							required : "Seleccione un tipo de usuario"
						},
						clave : {
							required : "Ingrese una clave"
						},
						nombre : {
							required : "Ingrese un nombre"
						},
						apellidoPaterno : {
							required : "Ingrese su apellido"
						},
						apellidoPaterno : {
							required : "Ingrese su apellido"
						},
						rol : {
							required : "Seleccione un rol"
						},
						estatus : {

							required : "Seleccione un estatus"
						},

						correo : {
							required : "Seleccione una cuenta de correo",
							email : "Escriba una cuenta valida"
						},
						telefono : {

							required : "Seleccione un número telef&oacute;nico",
							number : "Solo pueden utilizarse n&uacute;meros"
						},
						adscripcion : {

							required : "Seleccione una adscripci&oacute;n"
						},
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

				});
