package mx.uaq.uavig.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Transactional
@NoArgsConstructor
public abstract class AbstractjpaDao<T extends Serializable> {

	private Class<T> clazz;

	public AbstractjpaDao(Class<T> clazzToSet) {
		this.clazz = clazzToSet;
	}

	@Getter
	@PersistenceContext
	private EntityManager entityManager;

	public T findOne(long id) {
		return entityManager.find(clazz, id);
	}

	public List<T> findAll() {
		return entityManager.createQuery("from " + clazz.getName(), clazz).getResultList();
	}

	public void create(T entity) {
		entityManager.persist(entity);
	}

	public T update(T entity) {
		return entityManager.merge(entity);
	}

	public void delete(T entity) {
		entityManager.remove(entity);
	}

	public void deleteById(long entityId) {
		T entity = findOne(entityId);
		delete(entity);
	}

}
