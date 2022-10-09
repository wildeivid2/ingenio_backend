package com.ingenio.ingenio_backend.services.impl;

import com.ingenio.ingenio_backend.components.commons.services.CommonServiceImpl;
import com.ingenio.ingenio_backend.dao.IClienteDao;
import com.ingenio.ingenio_backend.entities.Cliente;
import com.ingenio.ingenio_backend.services.IClienteService;
import org.springframework.stereotype.Service;

@Service
public class ClienteServiceImpl extends CommonServiceImpl<Cliente, IClienteDao> implements IClienteService {



}
