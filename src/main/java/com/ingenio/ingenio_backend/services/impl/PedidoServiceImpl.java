package com.ingenio.ingenio_backend.services.impl;

import com.ingenio.ingenio_backend.components.commons.services.CommonServiceImpl;
import com.ingenio.ingenio_backend.dao.IPedidoDao;
import com.ingenio.ingenio_backend.entities.Cliente;
import com.ingenio.ingenio_backend.entities.Pedido;
import com.ingenio.ingenio_backend.services.IPedidoService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PedidoServiceImpl extends CommonServiceImpl<Pedido, IPedidoDao> implements IPedidoService {


    @Override
    public List<Pedido> findByCliente(Cliente cliente) {
        return super.repository.findByCliente(cliente);
    }
}
