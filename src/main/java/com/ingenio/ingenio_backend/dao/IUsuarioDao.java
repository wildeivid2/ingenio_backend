package com.ingenio.ingenio_backend.dao;

import com.ingenio.ingenio_backend.entities.Usuario;
import org.springframework.data.repository.CrudRepository;

public interface IUsuarioDao extends CrudRepository<Usuario, Long>{

	Usuario findByUsername(String username);

}
