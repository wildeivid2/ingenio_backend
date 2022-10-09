package com.ingenio.ingenio_backend.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "clientes")
public class Cliente implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	private String nombre;

	@NotEmpty
	private String apellido;

	@OneToOne
	@JoinColumn(name = "tipo_documento_id", referencedColumnName = "id")
	private TipoDocumento tipoDocumento;

	@NotNull
	private Integer numeroDocumento;

	@NotEmpty
	private String pais;

	@NotEmpty
	private String ciudad;

	@NotEmpty
	private String direccion;

	@NotEmpty
	@Email
	private String email;

	@NotEmpty
	@Column(length = 20)
	private String celular;

	@NotNull
	@Column(name = "create_at")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date createAt;

	@OneToMany(mappedBy = "cliente", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
	@JsonManagedReference
	private List<Pedido> pedidos = new ArrayList<>();



	private static final long serialVersionUID = -6621287849575654850L;


	@PrePersist
	private void prePersist() {
		createAt = new Date();
	}

	public void addPedido(Pedido pedido) {
		pedidos.add(pedido);
	}

	@Override
	public String toString() {
		return nombre + " " + apellido;
	}

}
