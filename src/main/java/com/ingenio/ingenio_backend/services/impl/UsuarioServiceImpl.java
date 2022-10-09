package com.ingenio.ingenio_backend.services.impl;

import com.ingenio.ingenio_backend.components.commons.services.CommonServiceImpl;
import com.ingenio.ingenio_backend.dao.IUsuarioDao;
import com.ingenio.ingenio_backend.entities.Usuario;
import com.ingenio.ingenio_backend.services.IUsuarioService;
import org.springframework.stereotype.Service;

@Service
public class UsuarioServiceImpl extends CommonServiceImpl<Usuario, IUsuarioDao> implements IUsuarioService {



}
