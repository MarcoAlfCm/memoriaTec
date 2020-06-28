$("#formRegister").validate({
	rules: {
		nombre : {
			required: function(element) {
				var $nombre = $("#nombre");
				
				if($nombre.val().trim().length == 0)
					$nombre.val('');
				return true;
			},
			maxlength: 70
		},
		correo : {
			required: function(element) {
				var $correo = $("#correo");
				
				if($correo.val().trim().length == 0)
					$correo.val('');
				return false;
			},
			email: true,
			maxlength: 50
		},
		fechaNacimiento : {
			required: function(element) {
				var $fechaNacimiento = $("#fechaNacimiento");
				
				if($fechaNacimiento.val().trim().length == 0)
					$fechaNacimiento.val('');
				
				return true;
			}
		},
		telefono : {
			required: function(element) {
				var $telefono = $("#telefono");
				
				if($telefono.val().trim().length == 0)
					$telefono.val('');
				return false;
			},
			maxlength: 30
		},
		celular : {
			required: function(element) {
				var $celular = $("#celular");
				
				if($celular.val().trim().length == 0)
					$celular.val('');
				return false;
			},
			maxlength: 30
		},
		nip : {
			required: function(element) {
				var $nip = $("#nip");
				
				if($nip.val().trim().length == 0)
					$nip.val('');
				return true;
			},
			maxlength: 50,
			minlength: 8
		},
		nipValidation : {
			required: function(element) {
				var $nip = $("#nip");
				
				if($nip.val().trim().length == 0)
					$nip.val('');
				return true;
			},
			equalTo: "#nip",
			maxlength: 50,
			minlength: 8
		}
	},
	messages: {
		nombre: {
			required : "Ingrese su nombre",
			maxlength: "No puedes agregar más de 70 carácteres"
		},
		correo : {
			required : "Ingrese su correo electrónico",
			email: "Debe ingresar un correo válido",
			maxlength: "No puedes agregar más de 50 carácteres"
		},
		fechaNacimiento : {
			required : "Seleccione su fecha de nacimiento"
		},
		telefono : {
			required : "Ingrese su número de teléfono",
			maxlength: "No puedes agregar más de 30 carácteres"
		},
		celular : {
			required : "Ingrese su número de teléfono",
			maxlength: "No puedes agregar más de 30 carácteres"
		},
		nip : {
			required : "Ingrese su nip o contraseña",
			maxlength: "No puedes agregar más de 50 carácteres",
			minlength: "Deben ser por lo menos 8 carácteres" 
		},
		nipValidation : {
			required : "Repita su nip o contraseña",
			equalTo : "Las contraseñas o nip deben ser iguales",
			maxlength: "No puedes agregar más de 50 carácteres",
			minlength: "Deben ser por lo menos 8 carácteres"
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