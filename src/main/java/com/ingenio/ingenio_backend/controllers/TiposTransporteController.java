package com.ingenio.ingenio_backend.controllers;

import com.ingenio.ingenio_backend.components.commons.controllers.CommonController;
import com.ingenio.ingenio_backend.entities.TipoTransporte;
import com.ingenio.ingenio_backend.services.ITipoTransporteService;
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
@RequestMapping("/tipo-transporte")
public class TiposTransporteController extends CommonController<TipoTransporte, ITipoTransporteService> {

    @PutMapping("/{id}")
    public ResponseEntity<?> editar(@RequestBody TipoTransporte tipoTransporte, @PathVariable Long id) {
        Optional<TipoTransporte> o = this.service.findById(id);

        if(o.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        TipoTransporte tipoTransporteDb = o.get();
        tipoTransporteDb.setTipoTransporte(tipoTransporte.getTipoTransporte());

        return ResponseEntity.status(HttpStatus.CREATED).body(this.service.save(tipoTransporteDb));
    }

}
