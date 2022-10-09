
--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (username, password, email, enabled) VALUES ('wcordero','$2a$10$O9wxmH/AeyZZzIS09Wp8YOEMvFnbRVJ8B4dmAMVSGloR62lj.yqXG', 'wildeivid7@gmail.com', 1);
INSERT INTO `users` (username, password, email, enabled) VALUES ('admin','$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS', 'fivecoop@gmail.com', 1);

--
-- Volcado de datos para la tabla `authorities`
--

INSERT INTO `authorities` (user_id, authority) VALUES (1,'ROLE_USER');
INSERT INTO `authorities` (user_id, authority) VALUES (2,'ROLE_ADMIN');
INSERT INTO `authorities` (user_id, authority) VALUES (2,'ROLE_USER');

--
-- Volcado de datos para la tabla `tipo_documentos`
--

INSERT INTO `tipo_documentos` (`id`, `tipo`) VALUES (1, 'CC');
INSERT INTO `tipo_documentos` (`id`, `tipo`) VALUES (2, 'CE');
INSERT INTO `tipo_documentos` (`id`, `tipo`) VALUES (3, 'PA');
INSERT INTO `tipo_documentos` (`id`, `tipo`) VALUES (4, 'PEP');
INSERT INTO `tipo_documentos` (`id`, `tipo`) VALUES (5, 'RC');

--
-- Volcado de datos para la tabla `tipo_transportes`
--

INSERT INTO `tipo_transportes` (`id`, `tipo_transporte`) VALUES (2, 'Marítimo');
INSERT INTO `tipo_transportes` (`id`, `tipo_transporte`) VALUES (1, 'Terrestre');

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`id`, `bodega`, `tipo_transporte_id`) VALUES (1, 'HANGAR 1', 1);
INSERT INTO `bodegas` (`id`, `bodega`, `tipo_transporte_id`) VALUES (2, 'HANGAR 2', 1);
INSERT INTO `bodegas` (`id`, `bodega`, `tipo_transporte_id`) VALUES (3, 'PUERTO 1', 2);
INSERT INTO `bodegas` (`id`, `bodega`, `tipo_transporte_id`) VALUES (4, 'PUERTO 2', 2);

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `matricula`, `producto`, `tipo_transporte_id`) VALUES (7, 'ABC123', 'NISSAN MARCH 2015 SENSE PLATEADO', 1);
INSERT INTO `productos` (`id`, `matricula`, `producto`, `tipo_transporte_id`) VALUES (8, 'DEF456', 'MAZDA ALLEGRO 2009 DORADO', 1);
INSERT INTO `productos` (`id`, `matricula`, `producto`, `tipo_transporte_id`) VALUES (9, 'GHI789', 'TOYOTA COROLLA 2022 HYBRID NEGRO', 1);
INSERT INTO `productos` (`id`, `matricula`, `producto`, `tipo_transporte_id`) VALUES (10, 'XYZA456B', 'YATE 2 YAMAHA', 2);
INSERT INTO `productos` (`id`, `matricula`, `producto`, `tipo_transporte_id`) VALUES (11, 'QRST304U', 'CRUCERO 1500 TRASATLÁNTICO', 2);
INSERT INTO `productos` (`id`, `matricula`, `producto`, `tipo_transporte_id`) VALUES (12, 'JKNO012P', 'MOTO ACUATICA SUZUKI 2001 ROJA', 2);

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `apellido`, `celular`, `ciudad`, `create_at`, `direccion`, `email`, `nombre`, `numero_documento`, `pais`, `tipo_documento_id`) VALUES (1, 'Cordero', '0573116723132', 'Medellín', '2022-10-08', 'Calle 1 Cra 2-3', 'wildeivid7@gmail.com', 'Wilson', 1126242683, 'Colombia', 1);
INSERT INTO `clientes` (`id`, `apellido`, `celular`, `ciudad`, `create_at`, `direccion`, `email`, `nombre`, `numero_documento`, `pais`, `tipo_documento_id`) VALUES (2, 'Chacón', '0573136549887', 'Medellín', '2022-10-08', 'Carrera 16 H -29 # 35-98', 'dani@email.com', 'Daniela', 456789, 'Colombia', 2);
INSERT INTO `clientes` (`id`, `apellido`, `celular`, `ciudad`, `create_at`, `direccion`, `email`, `nombre`, `numero_documento`, `pais`, `tipo_documento_id`) VALUES (3, 'Doe', '0016543232212', 'Dallas', '2022-10-08', 'Calle 5 FF # 52-85', 'joe.doe@email.com', 'Joe', 987654321, 'Estados Unidos', 3);
INSERT INTO `clientes` (`id`, `apellido`, `celular`, `ciudad`, `create_at`, `direccion`, `email`, `nombre`, `numero_documento`, `pais`, `tipo_documento_id`) VALUES (4, 'Hoffman', '00165498765654', 'París', '2022-10-08', 'Transversal 8G # 65-98', 'Hoffman.dallas@gmail.com', 'Jhoe', 165443548, 'Francia', 4);
INSERT INTO `clientes` (`id`, `apellido`, `celular`, `ciudad`, `create_at`, `direccion`, `email`, `nombre`, `numero_documento`, `pais`, `tipo_documento_id`) VALUES (5, 'Mercado', '0576549879879', 'Pereira', '2022-10-08', 'CAlle 2 # 65-45', 'nallivem@gmail.com', 'Nallive', 42499917, 'Colombia', 1);

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `total_envio_normal`, `total_envio`, `total_monto_descuento`, `cliente_id`, `usuario_id`) VALUES (1, '100.00', '100.00', '0.00', 2, 1);
INSERT INTO `pedidos` (`id`, `total_envio_normal`, `total_envio`, `total_monto_descuento`, `cliente_id`, `usuario_id`) VALUES (2, '200.00', '200.00', '0.00', 1, 1);
INSERT INTO `pedidos` (`id`, `total_envio_normal`, `total_envio`, `total_monto_descuento`, `cliente_id`, `usuario_id`) VALUES (3, '250.00', '250.00', '0.00', 1, 2);

--
-- Volcado de datos para la tabla `logisticas`
--

INSERT INTO `logisticas` (`id`, `catidad_total_productos`, `fecha_entrega`, `fecha_registro`, `precio_descuento`, `precio_envio`, `precio_normal`, `bodega_id`, `pedido_id`, `tipo_logistica_id`) VALUES (1, 2, '2022-10-20', '2022-10-08 17:38:14', '0.00', '100.00', '100.00', 1, 3, 1);
INSERT INTO `logisticas` (`id`, `catidad_total_productos`, `fecha_entrega`, `fecha_registro`, `precio_descuento`, `precio_envio`, `precio_normal`, `bodega_id`, `pedido_id`, `tipo_logistica_id`) VALUES (2, 2, '2022-10-20', '2022-10-08 17:38:14', '0.00', '150.00', '150.00', 4, 3, 2);
INSERT INTO `logisticas` (`id`, `catidad_total_productos`, `fecha_entrega`, `fecha_registro`, `precio_descuento`, `precio_envio`, `precio_normal`, `bodega_id`, `pedido_id`, `tipo_logistica_id`) VALUES (7, 1, '2022-10-29', '2022-10-08 17:44:48', '0.00', '100.00', '100.00', 2, 1, 1);
INSERT INTO `logisticas` (`id`, `catidad_total_productos`, `fecha_entrega`, `fecha_registro`, `precio_descuento`, `precio_envio`, `precio_normal`, `bodega_id`, `pedido_id`, `tipo_logistica_id`) VALUES (8, 2, '2022-10-29', '2022-10-09 00:44:48', '0.00', '200.00', '200.00', 3, 2, 2);

--
-- Volcado de datos para la tabla `logistica_detalles`
--

INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES (1, 1, 7, 7);
INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES (2, 1, 8, 10);
INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES (3, 1, 8, 11);
INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES (4, 1, 1, 8);
INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES (5, 1, 1, 9);
INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES (6, 1, 2, 11);
INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES (7, 1, 2, 12);




