package com.ingenio.ingenio_backend.dao;

import com.ingenio.ingenio_backend.entities.Cliente;
import org.springframework.data.repository.CrudRepository;

public interface IClienteDao extends CrudRepository<Cliente, Long> {



}
