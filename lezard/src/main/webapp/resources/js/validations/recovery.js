$("#formRecovery").validate({
	rules: {
		correo : {
			required: function(element) {
				var $bsqCorreo = $("#bsqCorreo");
				
				if($bsqCorreo.val().trim().length == 0)
					$bsqCorreo.val('');
				return $("#lblCorreo").val().trim() != '';
			},
			email: true,
			maxlength: 50
		},
		correoInstitucional : {
			required: function(element) {
				var $bsqCorreo = $("#bsqCorreoInstitucional");
				
				if($bsqCorreo.val().trim().length == 0)
					$bsqCorreo.val('');
				return $("#lblCorreoInstitucional").val().trim() != '';
			},
			email: true,
			maxlength: 50
		},
		celular : {
			required: function(element) {
				var $bsqCelular = $("#bsqCelular");
				
				if($bsqCelular.val().trim().length == 0)
					$bsqCelular.val('');
				return $("#lblCelular").val().trim() != '';
			},
			maxlength: 30
		},
		telefono: {
			required: function(element) {
				var $bsqTelefono = $("#bsqTelefono");
				
				if($bsqTelefono.val().trim().length == 0)
					$bsqTelefono.val('');
				return $("#lblTelefono").val().trim() != '';
			},
			maxlength: 30
		}
	},
	messages: {
		correo : {
			required : "Ingrese su correo electrónico",
			email: "Debe ingresar un correo válido",
			maxlength: "No puedes agregar más de 50 carácteres"
		},
		correoInstitucional : {
			required : "Ingrese su correo electrónico",
			email: "Debe ingresar un correo válido",
			maxlength: "No puedes agregar más de 50 carácteres"
		},
		celular : {
			required : "Ingrese su celular",
			maxlength: "No puedes agregar más de 30 carácteres"
		},
		telefono : {
			required : "Ingrese su teléfono",
			maxlength: "No puedes agregar más de 30 carácteres"
		}
	},
	errorElement : 'div',
    errorPlacement: function(error, element) {
      var placement = $(element).data('error');
      if (placement) {
        $(placement).append(error)
        
      } else {
        error.insertAfter(element);
      }
      var select = (element[0].localName);
      if(select === "select") {
    	  var $input = $(element).parent().find("input");
    		
    	  if(!($input.hasClass("error"))) 
    		$input.addClass("error");
      }
    },
	success: function(label) {
    	var select = (label.prev('select'));
		
		if(select[0] != undefined) {
			if(select[0].localName === 'select') {
				var $input = select.prev().prev().prev();
				$input.removeClass('error').addClass('validate valid');
			}
		}
		
        label.html("Correcto").addClass("checked");
    }
});