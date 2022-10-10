package com.ingenio.ingenio_backend.controllers;

import com.ingenio.ingenio_backend.components.commons.controllers.CommonController;
import com.ingenio.ingenio_backend.entities.TipoDocumento;
import com.ingenio.ingenio_backend.entities.Usuario;
import com.ingenio.ingenio_backend.services.IUsuarioService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@Slf4j
@RestController
@RequestMapping("/usuario")
public class UsuarioController extends CommonController<Usuario, IUsuarioService> {

    private final BCryptPasswordEncoder encryptPassword;

    public UsuarioController(final BCryptPasswordEncoder encryptPassword) {
        this.encryptPassword = encryptPassword;
    }

    @Override
    public ResponseEntity<?> crear(Usuario usuario) {
        usuario.setPassword(encryptPassword.encode(usuario.getPassword()));
        Usuario usuarioDb = super.service.save(usuario);
        return ResponseEntity.status(HttpStatus.CREATED).body(usuarioDb);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> editar(@RequestBody Usuario usuario, @PathVariable Long id) {
        Optional<Usuario> o = this.service.findById(id);

        if(o.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Usuario usuarioDb = o.get();
        usuarioDb.setPassword(encryptPassword.encode(usuario.getPassword()));
        usuarioDb.setEmail(usuario.getEmail());

        return ResponseEntity.status(HttpStatus.CREATED).body(this.service.save(usuarioDb));
    }

}
