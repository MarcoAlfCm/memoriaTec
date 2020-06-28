package mx.uaq.uavig.model;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@Table(name = "ROL")
public class Rol implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@NotNull
	@Column(name = "ID_ROL")
	@Basic(optional = false)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_ROL")
	@SequenceGenerator(name = "SEQ_ROL", sequenceName = "SEQ_ROL", allocationSize = 1)
	private Long idROl;

	@NotNull
	@Column(name = "NOMBRE")
	@Basic(optional = false)
	private String nombre;

	@NotNull
	@Column(name = "DESCRIPCION")
	@Basic(optional = false)
	private String descripcion;
	


}
