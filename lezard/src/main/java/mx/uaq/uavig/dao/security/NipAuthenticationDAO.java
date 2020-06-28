package mx.uaq.uavig.dao.security;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.CallableStatementCreator;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import mx.uaq.uavig.dao.RolUsuarioDAO;
import mx.uaq.uavig.dao.UsuarioDAO;

@Repository
@Profile({"prod"})
public class NipAuthenticationDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired private UsuarioDAO usuarioDAO;
	@Autowired private RolUsuarioDAO rolUsuarioDAO;
//	@Autowired private UsuarioBusiness usuarioBusiness;

	
	public Boolean validaNipUsuario(final String clave, final String nip) {
		System.out.println("daofake");
		if (StringUtils.isNumeric(clave)) {
			return nip.contentEquals("uaq") ? true : false;
		}
		return false;
	}
	
//	public Boolean validaNipUsuario(final String clave, final String nip) {
//
//		if (StringUtils.isNumeric(clave)) {
//			 List<RolUsuario> rolesUsuario= rolUsuarioDAO.findAllByidUsuario( usuarioDAO.findOneByClave(clave).getIdUsuario());
//			 
//			 if(!rolesUsuario.isEmpty()) {
//				 return consultaValidaNip(clave, nip, "D");
//				 
//			 }
//			
//		}
//
//		return false;
//	}

	private Boolean consultaValidaNip(final String expediente, final String nip, final String tipoUsuario) {

		final String tipoUsuarioValida = "D";

		String result = jdbcTemplate.execute(new CallableStatementCreator() {

			@Override
			public CallableStatement createCallableStatement(Connection con) throws SQLException {
				CallableStatement cs = con.prepareCall("{? = call VALIDANIP(?, ?, ?)}");
				cs.registerOutParameter(1, Types.VARCHAR);
				cs.setString(2, expediente);
				cs.setString(3, nip);
				cs.setString(4, tipoUsuarioValida);
				return cs;
			}
		}, new CallableStatementCallback<String>() {

			@Override
			public String doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException {
				cs.execute();
				String result = cs.getString(1);
				return result;
			}
		});
		return result.toLowerCase().equalsIgnoreCase("ok") ? true : false;
	}

//	@Autowired private UsuarioBusiness usuarioBusiness;
//	
//	public Boolean validaNipUsuario(final String clave, final String nip) {
//		try {
//			Usuario usuario = usuarioBusiness.findOneByClave(clave);
//			
//			if(usuario != null) {
//				if(usuario.getEstatus().equals(EnumUsuarioEstatus.INACTIVO.getEstatus()))
//					throw new DisabledException("Authentication service reply");
//				else
//					return usuarioBusiness.encryptNip(nip).equals(usuario.getNip());
//			}
//				
//			return false;
//		} catch(Exception e) {
//			return false;
//		}
//	}

}
