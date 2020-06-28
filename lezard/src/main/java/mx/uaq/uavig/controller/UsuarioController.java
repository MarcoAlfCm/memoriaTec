package mx.uaq.uavig.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import mx.uaq.uavig.business.UsuarioBusiness;
import mx.uaq.uavig.exception.MsgTransaction;
import mx.uaq.uavig.exception.UaqException;
import mx.uaq.uavig.filter.UsuarioFilter;
import mx.uaq.uavig.model.Usuario;
import mx.uaq.uavig.response.DataTableParams;
import mx.uaq.uavig.response.DataTableResponse;
import uaq.mx.uaqvig.enums.EnumMensajeError;

@RestController
public class UsuarioController {

	@Autowired
	private UsuarioBusiness usuarioBusiness;

	@RequestMapping(value = { "admin/usuarios/list" }, produces = "application/json; charset=utf-8", method = RequestMethod.POST)
	public DataTableResponse listaUsuarios(DataTableParams tableParams, UsuarioFilter filter) {
		filter.setLimit(tableParams.getLimit());
		filter.setOffset(tableParams.getOffset());

		DataResultFilter<Usuario> dataResultFilter = usuarioBusiness.getUsuariosByFilter(filter);

		return new DataTableResponse(tableParams, dataResultFilter.getData(), dataResultFilter.getRecordsTotal());
	}

	@RequestMapping(value = "admin/usuario/consultaExterno", method = RequestMethod.POST)
	public StringBuilder consultarCantidadUsuarios(@RequestParam("rol") String rol) {

		return usuarioBusiness.createClave(rol);
	}

	@ResponseBody
	@RequestMapping(value = { "admin/usuarios/desbloquear" }, method = RequestMethod.POST)
	public MsgTransaction reactiveUsuario(@RequestParam("idUsuario") Long idUsuario) {
		try {
			return usuarioBusiness.reactiveUsuario(idUsuario);
		} catch (Throwable e) {
			throw new UaqException(EnumMensajeError.USUARIO_ACTIVAR, e);
		}
	}

	@ResponseBody
	@RequestMapping(value = { "admin/usuarios/inactivar" }, method = RequestMethod.POST)
	public MsgTransaction disableUsuario(@RequestParam("idUsuario") Long idUsuario) {
		try {
			return usuarioBusiness.disableUsuario(idUsuario);
		} catch (Throwable e) {
			throw new UaqException(EnumMensajeError.USUARIO_INACTIVAR, e);
		}
	}

}
