package com.ingenio.ingenio_backend.dao;

import com.ingenio.ingenio_backend.entities.Producto;
import org.springframework.data.repository.CrudRepository;

public interface IProductoDao extends CrudRepository<Producto, Long> {



}
