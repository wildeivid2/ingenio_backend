package com.ingenio.ingenio_backend.services;

import com.ingenio.ingenio_backend.components.commons.services.ICommonService;
import com.ingenio.ingenio_backend.entities.Cliente;
import com.ingenio.ingenio_backend.entities.Pedido;

import java.util.List;


public interface IPedidoService extends ICommonService<Pedido> {

    List<Pedido> findByCliente(Cliente cliente);

}
