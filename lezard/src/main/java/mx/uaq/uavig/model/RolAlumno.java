package mx.uaq.uavig.model;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;



import lombok.Data;
import lombok.NoArgsConstructor;
import mx.uaq.uavig.model.vo.RolAlumnoVO;
import mx.uaq.uavig.model.vo.RolUsuarioVO;

@Data
@Entity
@NoArgsConstructor
@Table(name = "ROL_ALUMNO")
@NamedQueries({
	@NamedQuery(name = "RolAlumno.findAllbyIdUsuario", query = "SELECT ru FROM RolAlumno ru WHERE ru.idAlumno = :idAlumno")
	})
public class RolAlumno implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@NotNull
	@Column(name = "ID_ROL")
	@Basic(optional = false)
	private Long idRol;
	
	@JoinColumn(name = "ID_ROL", referencedColumnName = "ID_ROL", insertable = false, updatable = false, nullable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Rol rol;
	
	
	@Id
	@NotNull
	@Column(name = "ID_ALUMNO")
	@Basic(optional = false)
	private Long idAlumno;
	
	@JoinColumn(name = "ID_ALUMNO", referencedColumnName = "ID_ALUMNO", insertable = false, updatable = false, nullable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Alumno alumno;
	
	public RolAlumno(Long idRol, Long idAlumno) {
		super();
		this.idRol = idRol;
		this.idAlumno = idAlumno;
	}
	
	public RolAlumno(RolAlumnoVO rolAlumnoVO) {
		this.idRol=rolAlumnoVO.getIdRol();
		this.idAlumno=rolAlumnoVO.getIdAlumno();
	}


	
	
}
