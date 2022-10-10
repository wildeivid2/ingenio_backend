package com.ingenio.ingenio_backend.controllers;

import com.ingenio.ingenio_backend.components.commons.controllers.CommonController;
import com.ingenio.ingenio_backend.entities.TipoDocumento;
import com.ingenio.ingenio_backend.services.ITipoDocumentoService;
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
@RequestMapping("/tipo-documento")
public class TipoDocumentoController extends CommonController<TipoDocumento, ITipoDocumentoService> {

    @PutMapping("/{id}")
    public ResponseEntity<?> editar(@RequestBody TipoDocumento tipoDocumento, @PathVariable Long id) {
        Optional<TipoDocumento> o = this.service.findById(id);

        if(o.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        TipoDocumento tipoDocumentoDb = o.get();
        tipoDocumentoDb.setTipo(tipoDocumento.getTipo());

        return ResponseEntity.status(HttpStatus.CREATED).body(this.service.save(tipoDocumentoDb));
    }

}
