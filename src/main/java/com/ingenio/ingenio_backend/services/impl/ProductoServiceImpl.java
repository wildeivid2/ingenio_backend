package com.ingenio.ingenio_backend.services.impl;

import com.ingenio.ingenio_backend.components.commons.services.CommonServiceImpl;
import com.ingenio.ingenio_backend.dao.IProductoDao;
import com.ingenio.ingenio_backend.entities.Producto;
import com.ingenio.ingenio_backend.services.IProductoService;
import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl extends CommonServiceImpl<Producto, IProductoDao> implements IProductoService {



}
