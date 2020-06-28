package mx.uaq.uavig.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@Table(name = "USUARIO")
@NamedQueries({ @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u"),
		@NamedQuery(name = "Usuario.findByClave", query = "SELECT u FROM Usuario u WHERE u.clave = :clave") })
public class Usuario implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@NotNull
	@Basic(optional = false)
	@Column(name = "ID_USUARIO")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_USUARIO")
	@SequenceGenerator(name = "SEQ_USUARIO", sequenceName = "SEQ_USUARIO", allocationSize = 1)
	private Long idUsuario;

	@Basic(optional = false)
	@Column(name = "CLAVE")
	private String clave;

	@Basic(optional = false)
	@Column(name = "CORREO")
	private String correo;

	@Basic(optional = false)
	@Column(name = "NOMBRE")
	private String nombre;

	@Basic(optional = false)
	@Column(name = "AP_PATERNO")
	private String apPaterno;

	@Basic(optional = false)
	@Column(name = "AP_MATERNO")
	private String apMaterno;

	@Basic(optional = false)
	@Column(name = "NOMBRE_COMPLETO")
	private String nombreCompleto;
	
	
	@Basic(optional = false)
	@Column(name = "TELEFONO")
	private String telefono;

	@Basic(optional=false)
	@Column(name="ESTATUS")
	private String estatus;
	
	@Basic(optional=false)
	@Column(name="FALLOS")
	private Integer fallos;
	
	@Transient
	private List<Long> rolList;

	@ManyToMany
	@JoinTable(name = "ROL_USUARIO", 
	joinColumns = @JoinColumn(name = "ID_USUARIO", referencedColumnName = "ID_USUARIO"), 
	inverseJoinColumns = @JoinColumn(name = "ID_ROL", referencedColumnName = "ID_ROL"))
	private List<Rol> roles;
	
	
}
