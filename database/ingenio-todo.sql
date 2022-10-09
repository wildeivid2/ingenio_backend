SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `ingenio` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ingenio`;

CREATE TABLE `authorities` (
  `id` bigint(20) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `authorities` (`id`, `authority`, `user_id`) VALUES
(1, 'ROLE_USER', 1),
(2, 'ROLE_ADMIN', 2),
(3, 'ROLE_USER', 2);

CREATE TABLE `bodegas` (
  `id` bigint(20) NOT NULL,
  `bodega` varchar(100) NOT NULL,
  `tipo_transporte_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bodegas` (`id`, `bodega`, `tipo_transporte_id`) VALUES
(1, 'HANGAR 1', 1),
(2, 'HANGAR 2', 1),
(3, 'PUERTO 1', 2),
(4, 'PUERTO 2', 2);

CREATE TABLE `clientes` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `create_at` date NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `numero_documento` int(11) NOT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `tipo_documento_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `clientes` (`id`, `apellido`, `celular`, `ciudad`, `create_at`, `direccion`, `email`, `nombre`, `numero_documento`, `pais`, `tipo_documento_id`) VALUES
(1, 'Cordero', '0573116723132', 'Medellín', '2022-10-08', 'Calle 1 Cra 2-3', 'wildeivid7@gmail.com', 'Wilson', 1126242683, 'Colombia', 1),
(2, 'Chacón', '0573136549887', 'Medellín', '2022-10-08', 'Carrera 16 H -29 # 35-98', 'dani@email.com', 'Daniela', 456789, 'Colombia', 2),
(3, 'Doe', '0016543232212', 'Dallas', '2022-10-08', 'Calle 5 FF # 52-85', 'joe.doe@email.com', 'Joe', 987654321, 'Estados Unidos', 3),
(4, 'Hoffman', '00165498765654', 'París', '2022-10-08', 'Transversal 8G # 65-98', 'Hoffman.dallas@gmail.com', 'Jhoe', 165443548, 'Francia', 4),
(5, 'Mercado', '0576549879879', 'Pereira', '2022-10-08', 'CAlle 2 # 65-45', 'nallivem@gmail.com', 'Nallive', 42499917, 'Colombia', 1);

CREATE TABLE `logisticas` (
  `id` bigint(20) NOT NULL,
  `catidad_total_productos` int(11) DEFAULT NULL,
  `fecha_entrega` date NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `precio_descuento` decimal(19,2) NOT NULL,
  `precio_envio` decimal(19,2) NOT NULL,
  `precio_normal` decimal(19,2) NOT NULL,
  `bodega_id` bigint(20) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `tipo_logistica_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `logisticas` (`id`, `catidad_total_productos`, `fecha_entrega`, `fecha_registro`, `precio_descuento`, `precio_envio`, `precio_normal`, `bodega_id`, `pedido_id`, `tipo_logistica_id`) VALUES
(1, 2, '2022-10-20', '2022-10-08 17:38:14', '0.00', '100.00', '100.00', 1, 3, 1),
(2, 2, '2022-10-20', '2022-10-08 17:38:14', '0.00', '150.00', '150.00', 4, 3, 2),
(7, 1, '2022-10-29', '2022-10-08 17:44:48', '0.00', '100.00', '100.00', 2, 1, 1),
(8, 2, '2022-10-29', '2022-10-09 00:44:48', '0.00', '200.00', '200.00', 3, 2, 2);

CREATE TABLE `logistica_detalles` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `logistica_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `logistica_detalles` (`id`, `cantidad`, `logistica_id`, `producto_id`) VALUES
(1, 1, 7, 7),
(2, 1, 8, 10),
(3, 1, 8, 11),
(4, 1, 1, 8),
(5, 1, 1, 9),
(6, 1, 2, 11),
(7, 1, 2, 12);

CREATE TABLE `pedidos` (
  `id` bigint(20) NOT NULL,
  `total_envio_normal` decimal(19,2) DEFAULT NULL,
  `total_envio` decimal(19,2) DEFAULT NULL,
  `total_monto_descuento` decimal(19,2) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `pedidos` (`id`, `total_envio_normal`, `total_envio`, `total_monto_descuento`, `cliente_id`, `usuario_id`) VALUES
(1, '100.00', '100.00', '0.00', 2, 1),
(2, '200.00', '200.00', '0.00', 1, 1),
(3, '250.00', '250.00', '0.00', 1, 2);

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `tipo_transporte_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `productos` (`id`, `matricula`, `producto`, `tipo_transporte_id`) VALUES
(7, 'ABC123', 'NISSAN MARCH 2015 SENSE PLATEADO', 1),
(8, 'DEF456', 'MAZDA ALLEGRO 2009 DORADO', 1),
(9, 'GHI789', 'TOYOTA COROLLA 2022 HYBRID NEGRO', 1),
(10, 'XYZA456B', 'YATE 2 YAMAHA', 2),
(11, 'QRST304U', 'CRUCERO 1500 TRASATLÁNTICO', 2),
(12, 'JKNO012P', 'MOTO ACUATICA SUZUKI 2001 ROJA', 2);

CREATE TABLE `tipo_documentos` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tipo_documentos` (`id`, `tipo`) VALUES
(1, 'CC'),
(2, 'CE'),
(3, 'PA'),
(4, 'PEP'),
(5, 'RC');

CREATE TABLE `tipo_transportes` (
  `id` bigint(20) NOT NULL,
  `tipo_transporte` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tipo_transportes` (`id`, `tipo_transporte`) VALUES
(2, 'Marítimo'),
(1, 'Terrestre');

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `email`, `enabled`, `password`, `username`) VALUES
(1, 'wildeivid7@gmail.com', b'1', '$2a$10$O9wxmH/AeyZZzIS09Wp8YOEMvFnbRVJ8B4dmAMVSGloR62lj.yqXG', 'wcordero'),
(2, 'fivecoop@gmail.com', b'1', '$2a$10$DOMDxjYyfZ/e7RcBfUpzqeaCs8pLgcizuiQWXPkU35nOhZlFcE9MS', 'admin');


ALTER TABLE `authorities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKrimuuii4fm3j9qt8uupyiy8nd` (`user_id`,`authority`);

ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_tm3c5fhnaninjbbh8ndpqnk4j` (`bodega`),
  ADD KEY `FKj8nnb7mbl4ku6bhi8flwtt435` (`tipo_transporte_id`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh4o07jv0n4yporrhavvj4h38e` (`tipo_documento_id`);

ALTER TABLE `logisticas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_4d2yfgjqeh8tn7qpttlakmmrh` (`bodega_id`),
  ADD KEY `FKk9wcj9lm3kemeikpdcul14kh6` (`pedido_id`),
  ADD KEY `UK_m4xpyhcsa28uboy6e6cho31gf` (`tipo_logistica_id`) USING BTREE;

ALTER TABLE `logistica_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKiseneqciegues744qpg3mtf3c` (`logistica_id`),
  ADD KEY `UK_m4e4tb553tdrj8wc9i8joxhak` (`producto_id`) USING BTREE;

ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg7202lk0hwxn04bmdl2thth5b` (`cliente_id`),
  ADD KEY `FKpfoceigjvyas04u9bhcllnjol` (`usuario_id`);

ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_bmk9u7ochoexf0d1rbrqeusoe` (`matricula`) USING BTREE,
  ADD KEY `UK_cdu4o2xkxvfttkvigmqojstb2` (`tipo_transporte_id`) USING BTREE;

ALTER TABLE `tipo_documentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_qi8m92g8kln0p0216ie7lt775` (`tipo`);

ALTER TABLE `tipo_transportes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_c011uw7cee0ay3dayk767vptd` (`tipo_transporte`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`);


ALTER TABLE `authorities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `bodegas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `logisticas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `logistica_detalles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `tipo_documentos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tipo_transportes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `authorities`
  ADD CONSTRAINT `FKk91upmbueyim93v469wj7b2qh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `bodegas`
  ADD CONSTRAINT `FKj8nnb7mbl4ku6bhi8flwtt435` FOREIGN KEY (`tipo_transporte_id`) REFERENCES `tipo_transportes` (`id`);

ALTER TABLE `clientes`
  ADD CONSTRAINT `FKh4o07jv0n4yporrhavvj4h38e` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documentos` (`id`);

ALTER TABLE `logisticas`
  ADD CONSTRAINT `FK9yx4huhemlstf6m8n6d8w7uip` FOREIGN KEY (`bodega_id`) REFERENCES `bodegas` (`id`),
  ADD CONSTRAINT `FKk9wcj9lm3kemeikpdcul14kh6` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FKlig43ag0db2a2u0jahffcjykh` FOREIGN KEY (`tipo_logistica_id`) REFERENCES `tipo_transportes` (`id`);

ALTER TABLE `logistica_detalles`
  ADD CONSTRAINT `FKb6jp05g8ed4j23aaj5bi88e58` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `FKiseneqciegues744qpg3mtf3c` FOREIGN KEY (`logistica_id`) REFERENCES `logisticas` (`id`);

ALTER TABLE `pedidos`
  ADD CONSTRAINT `FKg7202lk0hwxn04bmdl2thth5b` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `FKpfoceigjvyas04u9bhcllnjol` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`);

ALTER TABLE `productos`
  ADD CONSTRAINT `FK4stw90q8euhjs7qbsbcyrdg0j` FOREIGN KEY (`tipo_transporte_id`) REFERENCES `tipo_transportes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
