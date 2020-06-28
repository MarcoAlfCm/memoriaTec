package mx.uaq.uavig.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import mx.uaq.uavig.model.RolUsuario;

@Repository
public class RolUsuarioDAO extends AbstractjpaDao<RolUsuario> {

	public RolUsuarioDAO() {
		super(RolUsuario.class);
	}

	public List<RolUsuario> findAllByidUsuario(Long idUsuario) {
		try {
			final TypedQuery<RolUsuario> typedQuery = this.getEntityManager().createNamedQuery("RolUsuario.findAllbyIdUsuario", RolUsuario.class);
			typedQuery.setParameter("idUsuario", idUsuario);
			
			return typedQuery.getResultList();
		} catch(NoResultException e) {
			return Collections.emptyList();
		}
	}
	
	public boolean delete(Long idUsuario) {
	try {
		String sqlQuery =  " delete from ROL_USUARIO where ID_USUARIO="+idUsuario+" ";
		Query query = this.getEntityManager().createNativeQuery(sqlQuery, RolUsuario.class);
		  query.executeUpdate();
		  return true;
		
	}catch (Exception e) {
		e.printStackTrace();
		return false;
	}
}
}
