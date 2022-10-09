package com.ingenio.ingenio_backend.controllers;

import com.ingenio.ingenio_backend.components.commons.controllers.CommonController;
import com.ingenio.ingenio_backend.entities.Bodega;
import com.ingenio.ingenio_backend.services.IBodegaService;
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
@RequestMapping("/bodega")
public class BodegaController extends CommonController<Bodega, IBodegaService> {

    @PutMapping("/{id}")
    public ResponseEntity<?> editar(@RequestBody Bodega bodega, @PathVariable Long id) {
        Optional<Bodega> o = this.service.findById(id);

        if(o.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Bodega bodegaDb = o.get();
        bodegaDb.setTipoTransporte(bodega.getTipoTransporte());
        bodegaDb.setBodega(bodega.getBodega());

        return ResponseEntity.status(HttpStatus.CREATED).body(this.service.save(bodegaDb));
    }

}
