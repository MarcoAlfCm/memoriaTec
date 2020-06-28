package mx.uaq.uavig.dao;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import mx.uaq.uavig.model.Alumno;

@Repository

public class AlumnoDAO extends AbstractjpaDao<Alumno>{
	
	public AlumnoDAO() {
		super(Alumno.class);
	}
	
	public Alumno findOneByClave(String clave) {
		try {
			final TypedQuery<Alumno> typedQuery = this.getEntityManager().createNamedQuery("Alumno.findByClave", Alumno.class);
			typedQuery.setParameter("clave", clave);			
			return typedQuery.getSingleResult();
		} catch (Exception e) {
			
			return null;
		}
	}

}
