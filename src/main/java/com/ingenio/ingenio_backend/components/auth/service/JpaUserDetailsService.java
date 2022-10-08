package com.ingenio.ingenio_backend.components.auth.service;


import com.ingenio.ingenio_backend.dao.IUserDao;
import com.ingenio.ingenio_backend.entities.Role;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("jpaUserDetailsService")
public class JpaUserDetailsService implements UserDetailsService {

	@Autowired
	private IUserDao iUserDao;
	
	private Logger logger = LoggerFactory.getLogger(JpaUserDetailsService.class);
	
	@Override
	@Transactional(readOnly=true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
        com.ingenio.ingenio_backend.entities.User user = iUserDao.findByUsername(username);
        
        if(user == null) {
        	logger.error("Error en el Login: no existe el user '".concat(username).concat("' en el sistema!"));
        	throw new UsernameNotFoundException("Username: ".concat(username).concat(" no existe en el sistema!"));
        }
        
        List<GrantedAuthority> authorities = new ArrayList<>();
        
        for(Role role: user.getRoles()) {
        	logger.info("Role: ".concat(role.getAuthority()));
        	authorities.add(new SimpleGrantedAuthority(role.getAuthority()));
        }
        
        if(authorities.isEmpty()) {
        	logger.error("Error en el Login: Usuario '" + username + "' no tiene roles asignados!");
        	throw new UsernameNotFoundException("Error en el Login: user '".concat(username).concat("' no tiene roles asignados!"));
        }
        
		return new User(user.getUsername(), user.getPassword(), user.getEnabled(), true, true, true, authorities);
	}

}
