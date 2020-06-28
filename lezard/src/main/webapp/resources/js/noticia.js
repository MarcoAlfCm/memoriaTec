var $btnAgregarNoticia=$("#btnAgregarNoticia");


$btnAgregarNoticia.on('click',function(){

	var contenido = CKEDITOR.instances['informacion'].getData();

//	console.log(contenido)
	
	
	$.ajax({
		type : "POST",
		url : CONTEXT_PATH + "admin/noticia/Crear",
		data : {
			informacion:contenido,
			idNoticia:$("#idNoticia").val()
		},
		success : function(data, textStatus, jqXHR) {
location.href=CONTEXT_PLUS + "/noticias";
		}
	});
	
})

