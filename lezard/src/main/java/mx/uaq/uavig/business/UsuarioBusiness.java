package mx.uaq.uavig.business;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mx.uaq.uavig.controller.DataResultFilter;
import mx.uaq.uavig.dao.AlumnoDAO;
import mx.uaq.uavig.dao.UsuarioDAO;
import mx.uaq.uavig.exception.MsgTransaction;
import mx.uaq.uavig.exception.UaqException;
import mx.uaq.uavig.filter.UsuarioFilter;
import mx.uaq.uavig.model.Alumno;
import mx.uaq.uavig.model.Usuario;
import uaq.mx.uaqvig.enums.EnumEstatusUsuario;
import uaq.mx.uaqvig.enums.EnumMensajeError;
import uaq.mx.uaqvig.enums.EnumMensajeExito;
import uaq.mx.uaqvig.enums.EnumResponseType;

@Component
@Transactional
public class UsuarioBusiness {

	@Autowired
	private UsuarioDAO usuarioDAO;
	@Autowired
	private AlumnoDAO alumnoDAO;
//	@Autowired
//	private RolUsuarioDAO rolUsuarioDAO;
//	@Autowired
	@Value("${max.intentos.logueo}") private Integer maxIntentos;

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Throwable.class)
	public void resetFallos(String clave) {
		try {
			Usuario usuario = usuarioDAO.findOneByClave(clave.trim());

		if(usuario==null) {
			Alumno alumno=alumnoDAO.findOneByClave(clave.trim());
			if (!(alumno.getFallos() == 0)) {
				alumno.setFallos(0);
				alumnoDAO.update(alumno);
			}
		}else {
			if (!(usuario.getFallos() == 0)) {
				usuario.setFallos(0);
				usuarioDAO.update(usuario);
			}
		}

			
		} catch (Throwable e) {
			throw new UaqException(EnumMensajeError.USUARIO_INTENTOS_FALLIDOS, e);
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Throwable.class)
	public void processUserAutenticationFailure(String clave) {
		try {
			Usuario usuario = usuarioDAO.findOneByClave(clave);



			if (usuario != null) {
				if (usuario.getFallos() == (maxIntentos - 1)) {
					usuario.setFallos(usuario.getFallos() + 1);
					usuario.setEstatus(EnumEstatusUsuario.BLOQUEADO.getEstatus());
				} else {
					usuario.setFallos(usuario.getFallos() + 1);
				}
				usuarioDAO.update(usuario);
			}
		} catch (Throwable e) {
			throw new UaqException(EnumMensajeError.USUARIO_BLOQUEADO, e);
		}
	}
	
//	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Throwable.class)
//	public MsgTransaction crearActualizarUsuario(UsuarioVO usuario) throws Throwable {
//
//		System.out.println("adentro del busiine");
//		System.out.println(usuario);
//		
//		if (usuario != null) {
//			Usuario usu = null;
//
//			if (usuario.getIdUsuario() != null) {
//
//				usu = usuarioDAO.findOne(usuario.getIdUsuario());
//
//				
////				System.out.println(usuario);
//				if (usu != null) {
//					
//					System.out.println("si existe el usuario pero no se modifica");
//					System.out.println(usuario.getRolList());
//					usu.setClave(usuario.getClave());
//					usu.setCorreo(usuario.getCorreo());
//					usu.setNombre(usuario.getNombre());
//					usu.setApPaterno(usuario.getApellidoMaterno());
//					usu.setApellidoMaterno(usuario.getApellidoMaterno());
//					usu.setTelefono(usuario.getTelefono());
//					usu.setIdAdscripcion(usuario.getAdscripcion());
//					usu.setEdificio(usuario.getEdificio());
//					usu.setTipoUsuario(usuario.getTipo());
//					usu.setNombreCompleto((StringUtils.isNotBlank(usuario.getApellidoPaterno()))
//							? usuario.getNombre() + " " + usuario.getApellidoPaterno() + " "
//									+ usuario.getApellidoMaterno()
//							: usuario.getNombre() + " " + usuario.getApellidoPaterno());
//					usu.setRolList(usuario.getRolList());
//					
//					AdscripcionVista ads=adscripcionDAO.findOneAdscripcion(usuario.getAdscripcion());
//
//					usu.setDescripcionAdscripcion(ads.getDescripAdscrip());
//
//					if(CustomUtil.listIsNotBlank(usuario.getRolList())) updateRoles(usuario);
//					else return new MsgTransaction(EnumMensajeError.USUARIO_ROLES_MINIMOS.getIdMsg(), EnumResponseType.NOTIFICATION.getValue(), EnumMensajeError.USUARIO_ROLES_MINIMOS.getValue());
//
////					rolUsuarioDAO.delete(usu.getIdUsuario());
////					
////					RolUsuarioVO rolUsuarioVO = new RolUsuarioVO();
////
////					rolUsuarioVO.setIdUsuario(usu.getIdUsuario());
////					rolUsuarioVO.setIdRol(usuario.getRol());
////					RolUsuario rolUsuario = new RolUsuario(rolUsuarioVO);
////					rolUsuarioDAO.create(rolUsuario);
//
//					
//					return new MsgTransaction(EnumMensajeExito.USUARIO_ACTUALIZACION.getIdMsg(),
//							EnumResponseType.SUCCESS.getValue(), EnumMensajeExito.USUARIO_ACTUALIZACION.getValue());
//
//				}
//
//			} else {
//				
//				System.out.println("no entra el usuario");
//				AdscripcionVista ads=adscripcionDAO.findOneAdscripcion(usuario.getAdscripcion());
//
//				usuario.setDescripAdscrip(ads.getDescripAdscrip());
//				
//				usu = new Usuario(usuario);
//				
//				usuarioDAO.create(usu);
//				RolUsuarioVO rolUsuarioVO = new RolUsuarioVO();
//
//				rolUsuarioVO.setIdUsuario(usu.getIdUsuario());
//				
//				for (Long idRol : usuario.getRolList()) {
//									
//					
////					rolUsuarioDAO.create(new RolUsuario(idRol, usuario.getIdUsuario()));
//					rolUsuarioVO.setIdRol(idRol);
//					RolUsuario rolUsuario = new RolUsuario(rolUsuarioVO);
//					
//					rolUsuarioDAO.create(rolUsuario);
//
//			}
//				
//				
//				
//
//				return new MsgTransaction(EnumMensajeExito.USUARIO_REGISTRADO.getIdMsg(),
//						EnumResponseType.SUCCESS.getValue(), EnumMensajeExito.USUARIO_REGISTRADO.getValue());
//
//			}
//
//		}
//
//		return new MsgTransaction(EnumMensajeError.USUARIO_REGISTRADO.getIdMsg(), EnumResponseType.ERROR.getValue(),
//				EnumMensajeError.USUARIO_REGISTRADO.getValue());
//
//	}
	
	
//	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Throwable.class)
//	private void updateRoles(UsuarioVO usuario) throws Throwable {
//		System.out.println("antes del for adentro de updateRoles");
//		for (RolUsuario ru : rolUsuarioDAO.findAllByidUsuario(usuario.getIdUsuario())) {
//			if ((usuario.getRolList().contains(ru.getIdRol())))
//				System.out.println("adentro del for adentro del if");
//				rolUsuarioDAO.delete(ru);
//		}
//		
//		for (Long idRol : usuario.getRolList()) {
//			
//				rolUsuarioDAO.create(new RolUsuario(idRol, usuario.getIdUsuario()));
//		}
//
//
//	}
//				
////	

	public StringBuilder createClave(String rol) {

		String id = String.valueOf(usuarioDAO.countUsuariosByFilter());

		StringBuilder idAuxiliar = new StringBuilder();
		StringBuilder claveAuxiliar = new StringBuilder();

		if (rol.equals("1")) {
			StringBuilder clave = new StringBuilder("ADM");
			idAuxiliar.append(clave);
		}
		if (rol.equals("2")) {
			StringBuilder clave = new StringBuilder("ENL");
			idAuxiliar.append(clave);

		}
		if (rol.equals("3")) {
			StringBuilder clave = new StringBuilder("ENC");
			idAuxiliar.append(clave);

		}

		idAuxiliar.append("-0");
		idAuxiliar.append(id);
		claveAuxiliar.append(idAuxiliar);

		return claveAuxiliar;
	}

	public DataResultFilter<Usuario> getUsuariosByFilter(UsuarioFilter filter) {
		List<Usuario> listaUsuarios = new ArrayList<Usuario>();
		DataResultFilter<Usuario> dataResultFilter = new DataResultFilter<Usuario>();

		for (Usuario u : usuarioDAO.getUsuariosByFilter(filter))
			listaUsuarios.add(u);

		dataResultFilter.setData(listaUsuarios);
		dataResultFilter.setRecordsTotal(usuarioDAO.countUsuariosByFilter(filter));

		return dataResultFilter;
	}
	

	


	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Throwable.class)
	public MsgTransaction disableUsuario(Long idUsuario) throws Throwable {
		Usuario usuario = usuarioDAO.findOne(idUsuario);

		if (usuario != null) {
			if (!(usuario.getEstatus().equals(EnumEstatusUsuario.BLOQUEADO.getEstatus()))) {
				usuario.setEstatus(EnumEstatusUsuario.BLOQUEADO.getEstatus());
				usuarioDAO.update(usuario);

				return new MsgTransaction(EnumMensajeExito.USUARIO_INACTIVADO.getIdMsg(),
						EnumResponseType.SUCCESS.getValue(), EnumMensajeExito.USUARIO_INACTIVADO.getValue());
			} else {
				return new MsgTransaction(EnumMensajeError.USUARIO_YA_INACTIVO.getIdMsg(),
						EnumResponseType.NOTIFICATION.getValue(), EnumMensajeError.USUARIO_YA_INACTIVO.getValue());
			}
		}

		return new MsgTransaction(EnumMensajeError.USUARIO_INACTIVAR.getIdMsg(), EnumResponseType.ERROR.getValue(),
				EnumMensajeError.USUARIO_INACTIVAR.getValue());
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Throwable.class)
	public MsgTransaction reactiveUsuario(Long idUsuario) throws Throwable {
		Usuario usuario = usuarioDAO.findOne(idUsuario);

		if (usuario != null) {
			if (!(usuario.getEstatus().equals(EnumEstatusUsuario.ACTIVO.getEstatus()))) {
				usuario.setEstatus(EnumEstatusUsuario.ACTIVO.getEstatus());
				usuarioDAO.update(usuario);

				return new MsgTransaction(EnumMensajeExito.USUARIO_ACTIVADO.getIdMsg(),
						EnumResponseType.SUCCESS.getValue(), EnumMensajeExito.USUARIO_ACTIVADO.getValue());
			} else {
				return new MsgTransaction(EnumMensajeError.USUARIO_YA_ACTIVO.getIdMsg(),
						EnumResponseType.NOTIFICATION.getValue(), EnumMensajeError.USUARIO_YA_ACTIVO.getValue());
			}
		}

		return new MsgTransaction(EnumMensajeError.USUARIO_ACTIVAR.getIdMsg(), EnumResponseType.ERROR.getValue(),
				EnumMensajeError.USUARIO_ACTIVAR.getValue());
	}

}
