package com.ingenio.ingenio_backend.dao;

import com.ingenio.ingenio_backend.entities.Pedido;
import org.springframework.data.repository.CrudRepository;

public interface IPedidoDao extends CrudRepository<Pedido, Long> {



}
