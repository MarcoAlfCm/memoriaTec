package mx.uaq.uavig.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import mx.uaq.uavig.filter.UsuarioFilter;
import mx.uaq.uavig.model.Usuario;

@Repository
public class UsuarioDAO extends AbstractjpaDao<Usuario> {
	public UsuarioDAO() {
		super(Usuario.class);
	}

	public Usuario findOneByClave(String clave) {
		try {
			final TypedQuery<Usuario> typedQuery = this.getEntityManager().createNamedQuery("Usuario.findByClave", Usuario.class);
			typedQuery.setParameter("clave", clave);			
			return typedQuery.getSingleResult();
		} catch (Exception e) {
			
			return null;
		}
	}

	public Long countUsuariosByFilter() {
		try {
			String sqlQuery =  "SELECT COUNT(ID_USUARIO)+1 "
				+ "FROM USUARIO ";
			Query query = this.getEntityManager().createNativeQuery(sqlQuery);
			
			return ((BigDecimal) query.getSingleResult()).longValue();
		} catch(NoResultException e) {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> getUsuariosByFilter(UsuarioFilter filter) {
		try {
			String sqlQuery = ""
				+ "SELECT * "
				+ "FROM USUARIO "
				+ filterUsuarios(filter, false);
			Query query = this.getEntityManager().createNativeQuery(sqlQuery, Usuario.class);
			query.setFirstResult(filter.getOffset());
			query.setMaxResults(filter.getLimit());
			
			return query.getResultList();
		} catch(NoResultException e) {
			return null;
		}
	}
	

	public Long countUsuariosByFilter(UsuarioFilter filter) {
		try {
			String sqlQuery = ""
				+ "SELECT COUNT(ID_USUARIO) "
				+ "FROM USUARIO "
				+ filterUsuarios(filter, true);
			Query query = this.getEntityManager().createNativeQuery(sqlQuery);
			
			return (long) ( (Number) query.getSingleResult()).longValue();
		} catch(NoResultException e) {
			return null;
		}
	}
	
	private String filterUsuarios(UsuarioFilter filter, boolean isCount) {
		StringBuilder where = new StringBuilder();
		
		if(StringUtils.isNotBlank(filter.getClave())) 
			where.append(" WHERE CLAVE = '" + filter.getClave() + "'");

		
		
//		if(StringUtils.isNotBlank(filter.getIdAdscripcion())) {
//			if(StringUtils.isNotBlank(where))
//				where.append(" AND ID_ADSCRIPCION = '" + filter.getIdAdscripcion() + "' ");
//			else
//				where.append(" WHERE ID_ADSCRIPCION = '" + filter.getIdAdscripcion() + "' ");
//		}
		
//		else {
//			where.append(" WHERE ESTATUS='BLOQUEADO");
//		}
		
		if(!isCount)
			where.append(" ORDER BY CLAVE ");
		
		return where.toString();
	}

}
