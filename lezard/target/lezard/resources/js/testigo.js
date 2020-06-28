//$(document).ready(function(){
//		
//		$("#divSalir").hide();
//		
//})

$("#btnAddTestigo").on('click', function() {
	
	$('input').val("");
	$('select').prop('selectedIndex',0).select2();
	
})

$("#btnAceptarDatosTestigo").on('click', function(e) {
	e.preventDefault();
	if ($("#formDatosTestigo").valid()) {
		e.preventDefault();
		$.ajax({
			type : "POST",
			url : CONTEXT_PATH + "admin/queja/ingresarTestigo",
			data : $("#formDatosTestigo").serialize(),
			success : function(data) {
				showSuccessAlert( "Datos guardados correctamente.");
				$("#divSalir").prop("hidden", false);
			}
		})
		
	}		
})




$("#btnFinalizar").on('click', function(e) {
	e.preventDefault();
		const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})
	
			swalWithBootstrapButtons.fire({
			  title: 'Está seguro que desea finalizar?',
			  text: "No será posible modificar la información después",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonText: 'Aceptar',
			  cancelButtonText: 'Cancelar',
			  reverseButtons: true
			}).then((result) => {
			  if (result.value) {
			    swalWithBootstrapButtons.fire(
			      'Finalizado',
			      'Este registro se ha guardado',
			      'success'
			    );
	
			
				location.href="quejas"

			
			  } else if (
			    /* Read more about handling dismissals below */
			    result.dismiss === Swal.DismissReason.cancel
			  ) {
			    swalWithBootstrapButtons.fire(
			      'Cancelado',
			      'Puede seguir editando la información',
			      'error'
			    )
			  }
			})

})


