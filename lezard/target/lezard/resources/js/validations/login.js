$("#formLogin").validate({
	rules: {
		nombreUsuario : {
			required: function(element) {
				var $nombreUsuario = $("#nombreUsuario");
				
				if($nombreUsuario.val().trim().length == 0)
					$nombreUsuario.val('');
				return true;
			}
		},
		contrasena : {
			required : true
		}
	},
	messages: {
		nombreUsuario: {
			required : "Ingrese su clave o correo"
		},
		contrasena : {
			required : "Ingrese su nip o contraseña"
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