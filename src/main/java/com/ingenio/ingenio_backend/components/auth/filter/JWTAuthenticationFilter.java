package com.ingenio.ingenio_backend.components.auth.filter;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.ingenio.ingenio_backend.Constants.Constants;
import com.ingenio.ingenio_backend.components.auth.service.IJWTService;
import com.ingenio.ingenio_backend.components.auth.service.impl.JWTServiceImpl;
import com.ingenio.ingenio_backend.entities.Usuario;
import org.apache.hc.core5.http.ContentType;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;


public class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	private AuthenticationManager authenticationManager;
	private IJWTService jwtService;

	public JWTAuthenticationFilter(AuthenticationManager authenticationManager, IJWTService jwtService) {
		this.authenticationManager = authenticationManager;
		setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher(Constants.PATH_LOGIN_API, HttpMethod.POST.name()));
		
		this.jwtService = jwtService;
	}

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
		
		String username = obtainUsername(request);
		String password = obtainPassword(request);
		
		if(username != null && password !=null) {
			logger.info("Username desde request parameter (form-data): " + username);
			logger.info("Password desde request parameter (form-data): " + password);
			
		} else {
			final Usuario usuario;
			try {
				
				usuario = new ObjectMapper().readValue(request.getInputStream(), Usuario.class);
				
				username = usuario.getUsername();
				password = usuario.getPassword();
				
				logger.info("Username desde request InputStream (raw): " + username);
				logger.info("Password desde request InputStream (raw): " + password);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		username = Objects.requireNonNull(username).trim();
		
		UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(username, password);
		
		return authenticationManager.authenticate(authToken);
	}

	@Override
	protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException {

		String token = jwtService.create(authResult);
		
		response.addHeader(JWTServiceImpl.HEADER_STRING, JWTServiceImpl.TOKEN_PREFIX.concat(token));
		
		Map<String, Object> body = new HashMap<>();
		body.put("token", token);
		body.put("user", authResult.getPrincipal());
		body.put("message", String.format("Hola %s, has iniciado sesión con éxito!", ((User) authResult.getPrincipal()).getUsername()) );
		
		response.getWriter().write(new ObjectMapper().writeValueAsString(body));
		response.setStatus(HttpStatus.OK.value());
		response.setContentType(ContentType.APPLICATION_JSON.getMimeType());
	}

	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) throws IOException, ServletException {

		final Map<String, Object> body = new HashMap<>();
		body.put("error", "Authentication Error: username o password invalid!");
		body.put("message", failed.getMessage());
		
		response.getWriter().write(new ObjectMapper().writeValueAsString(body));
		response.setStatus(HttpStatus.UNAUTHORIZED.value());
		response.setContentType(ContentType.APPLICATION_JSON.getMimeType());

	}
	
	

}
