package com.ingenio.ingenio_backend.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.annotation.PostConstruct;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "logisticas")
public class Logistica {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name = "tipo_logistica_id", nullable = false)
    private TipoTransporte tipoLogistica;

    @ManyToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name = "pedido_id", nullable = false)
    @JsonBackReference
    private Pedido pedido;

    @Column(name = "catidad_total_productos")
    private Integer catidadTotalProductos;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Column(name = "fecha_registro", nullable = false)
    private Date fechaRegistro;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    @Column(name = "fecha_entrega", nullable = false)
    private Date fechaEntrega;

    @ManyToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name = "bodega_id", nullable = false)
    private Bodega bodega;

    @Column(name = "precio_normal", nullable = false, precision = 19, scale = 2)
    private BigDecimal precioNormal;

    @Column(name = "precio_descuento", nullable = false, precision = 19, scale = 2)
    private BigDecimal precioDescuento;

    @Column(name = "precio_envio", nullable = false, precision = 19, scale = 2)
    private BigDecimal precioEnvio;

    @OneToMany(mappedBy = "logistica", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    private List<LogisticaDetalle> logisticaDetalles = new ArrayList<>();

    @PostConstruct
    private void init() {
        fechaEntrega = new Date();
    }

}