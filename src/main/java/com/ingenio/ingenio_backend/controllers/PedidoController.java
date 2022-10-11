package com.ingenio.ingenio_backend.controllers;

import com.ingenio.ingenio_backend.components.commons.controllers.CommonController;
import com.ingenio.ingenio_backend.entities.Pedido;
import com.ingenio.ingenio_backend.entities.Usuario;
import com.ingenio.ingenio_backend.services.IPedidoService;
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
@RequestMapping("/pedido")
public class PedidoController extends CommonController<Pedido, IPedidoService> {

    @PutMapping("/{id}")
    public ResponseEntity<?> editar(@RequestBody Pedido pedido, @PathVariable Long id) {
        Optional<Pedido> o = this.service.findById(id);

        if(o.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Pedido pedidoDb = o.get();
        pedidoDb.setLogisticas(pedido.getLogisticas());
        pedidoDb.setTotalEnvioNormal(pedido.getTotalEnvioNormal());
        pedidoDb.setTotalMontoDescuento(pedido.getTotalMontoDescuento());
        pedidoDb.setTotalEnvio(pedido.getTotalEnvio());

        return ResponseEntity.status(HttpStatus.CREATED).body(this.service.save(pedidoDb));
    }

}
