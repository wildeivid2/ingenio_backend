package com.ingenio.ingenio_backend.dao;

import com.ingenio.ingenio_backend.entities.User;
import org.springframework.data.repository.CrudRepository;

public interface IUserDao extends CrudRepository<User, Long>{

	User findByUsername(String username);

}
