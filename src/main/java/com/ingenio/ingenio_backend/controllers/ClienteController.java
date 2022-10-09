package com.ingenio.ingenio_backend.controllers;

import com.ingenio.ingenio_backend.components.commons.controllers.CommonController;
import com.ingenio.ingenio_backend.entities.Cliente;
import com.ingenio.ingenio_backend.services.IClienteService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@Slf4j
@RestController
@RequestMapping("/cliente")
public class ClienteController extends CommonController<Cliente, IClienteService> {

    @PutMapping("/id")
    public ResponseEntity<?> editar(@RequestBody Cliente cliente, @PathVariable Long id) {
        Optional<Cliente> o = this.service.findById(id);

        if(o.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Cliente clienteDb = o.get();
        clienteDb.setNombre(cliente.getNombre());
        clienteDb.setApellido(cliente.getApellido());
        clienteDb.setTipoDocumento(clienteDb.getTipoDocumento());
        clienteDb.setNumeroDocumento(cliente.getNumeroDocumento());
        clienteDb.setPais(cliente.getPais());
        clienteDb.setCiudad(cliente.getCiudad());
        clienteDb.setDireccion(cliente.getDireccion());
        clienteDb.setCelular(cliente.getCelular());
        clienteDb.setEmail(clienteDb.getEmail());

        return ResponseEntity.status(HttpStatus.CREATED).body(this.service.save(clienteDb));
    }

}

