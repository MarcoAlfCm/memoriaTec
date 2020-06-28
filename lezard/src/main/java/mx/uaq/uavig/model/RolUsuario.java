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
import mx.uaq.uavig.model.vo.RolUsuarioVO;

@Data
@Entity
@NoArgsConstructor
@Table(name = "ROL_USUARIO")
@NamedQueries({
	@NamedQuery(name = "RolUsuario.findAllbyIdUsuario", query = "SELECT ru FROM RolUsuario ru WHERE ru.idUsuario = :idUsuario")
	})
public class RolUsuario implements Serializable {

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
	@Column(name = "ID_USUARIO")
	@Basic(optional = false)
	private Long idUsuario;
	
	@JoinColumn(name = "ID_USUARIO", referencedColumnName = "ID_USUARIO", insertable = false, updatable = false, nullable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Usuario usuario;
	
	public RolUsuario(Long idRol, Long idUsuario) {
		super();
		this.idRol = idRol;
		this.idUsuario = idUsuario;
	}
	
	public RolUsuario(RolUsuarioVO rolUsuarioVO) {
		this.idRol=rolUsuarioVO.getIdRol();
		this.idUsuario=rolUsuarioVO.getIdUsuario();
	}


	
	
}
