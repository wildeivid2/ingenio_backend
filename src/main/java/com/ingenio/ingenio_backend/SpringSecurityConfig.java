package com.ingenio.ingenio_backend;

import com.ingenio.ingenio_backend.Constants.Constants;
import com.ingenio.ingenio_backend.components.auth.filter.JWTAuthenticationFilter;
import com.ingenio.ingenio_backend.components.auth.filter.JWTAuthorizationFilter;
import com.ingenio.ingenio_backend.components.auth.service.IJWTService;
import com.ingenio.ingenio_backend.components.auth.service.impl.JpaUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@EnableGlobalMethodSecurity(securedEnabled=true, prePostEnabled=true)
@Configuration
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

	private final JpaUserDetailsService userDetailsService;
	private final BCryptPasswordEncoder passwordEncoder;
	private final IJWTService ijwtService;

	public SpringSecurityConfig(JpaUserDetailsService userDetailsService, BCryptPasswordEncoder passwordEncoder, IJWTService ijwtService) {
		this.userDetailsService = userDetailsService;
		this.passwordEncoder = passwordEncoder;
		this.ijwtService = ijwtService;
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.cors().and().authorizeRequests()
				.antMatchers(Constants.PATH_LOGIN_API).permitAll()
				.antMatchers(HttpMethod.POST, "/usuario").permitAll()
				.anyRequest().authenticated()
				.and()
				.addFilter(new JWTAuthenticationFilter(authenticationManager(), ijwtService))
				.addFilter(new JWTAuthorizationFilter(authenticationManager(), ijwtService))
				.csrf().disable()
				.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

	}

	@Autowired
	public void configurerGlobal(AuthenticationManagerBuilder build) throws Exception {

		build.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);

	}

	@Bean
	public CorsFilter corsFilter() {
		UrlBasedCorsConfigurationSource source = new
				UrlBasedCorsConfigurationSource();
		CorsConfiguration config = new CorsConfiguration();
		config.setAllowCredentials(true);
		config.addAllowedOrigin("http://localhost:4200");
		config.addAllowedHeader("*");
		config.addAllowedMethod("*");
		source.registerCorsConfiguration("/**", config);
		return new CorsFilter(source);
	}
}
