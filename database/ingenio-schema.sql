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

CREATE TABLE `bodegas` (
  `id` bigint(20) NOT NULL,
  `bodega` varchar(100) NOT NULL,
  `tipo_transporte_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `logistica_detalles` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `logistica_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pedidos` (
  `id` bigint(20) NOT NULL,
  `total_envio_normal` decimal(19,2) DEFAULT NULL,
  `total_envio` decimal(19,2) DEFAULT NULL,
  `total_monto_descuento` decimal(19,2) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `tipo_transporte_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tipo_documentos` (
  `id` bigint(20) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tipo_transportes` (
  `id` bigint(20) NOT NULL,
  `tipo_transporte` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bodegas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `logisticas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `logistica_detalles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tipo_documentos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `tipo_transportes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;


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
