var $username = $("#nombreUsuario"),
	$password = $("#contrasena"),
	$btnSignup = $("#btnLogin"),
	$formLogin = $("#formLogin"),
	$btnRecovery = $("#btnRecovery"),
	$formRegister = $("#formRegister"),
	$btnCancelSinup = $("#btnCancelSinup"),
	$tabsSwipeAccount = $("#tabs-swipe-account");

$(document).ready(function() {
	if(MENSAJE_USUARIO != "") {
		if(MENSAJE_USUARIO == "Has cerrado sesión exitosamente.")
			showNotificationAlert(MENSAJE_USUARIO);
		else
			showErrorAlert(MENSAJE_USUARIO);
	}
});

$password.keypress(function(e) {
	var count = $password.val().length,
		s = String.fromCharCode(e.which);
	
	if (s.toUpperCase() === s && s.toLowerCase() !== s && !e.shiftKey) {
		if(count === 0)
			showWarningAlert("El bloque de mayúsculas está activo.")
	} 
});

$btnCancelSinup.on('click', function() {
	$formRegister[0].reset();
	$formRegister.find('div.checked').remove();
});

$btnSignup.on('click', function(e) {
	e.preventDefault();
if($formLogin.submit().valid()){
	$formLogin.submit();
}


});


function login(usuario) {
	$tabsSwipeAccount.tabs("select", "tab-login");
	$username.val(usuario.clave).parent().find('label').addClass('active');
	$password.val(usuario.nipDescifrado).parent().find('label').addClass('active');
	$formLogin.submit();
}