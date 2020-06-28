
$("#formDatosPersonaAgreso")
		.validate(
				{
					rules : {
						conocesAgresor : {
							required : true
						}
					},
					messages : {
						conocesAgresor : {
							required : "Este dato es obligatorio"
						}
					},

					errorElement : 'div',
					errorPlacement : function(error, element) {

						if (element.attr("type") == "radio") {
							error.insertBefore(element);
						} else {
							error.insertAfter(element);
						}

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