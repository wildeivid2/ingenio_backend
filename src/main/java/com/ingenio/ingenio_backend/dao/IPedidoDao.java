package com.ingenio.ingenio_backend.dao;

import com.ingenio.ingenio_backend.entities.Cliente;
import com.ingenio.ingenio_backend.entities.Pedido;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface IPedidoDao extends CrudRepository<Pedido, Long> {

    List<Pedido> findByCliente(Cliente cliente);

}
