
CREATE SCHEMA `comercio`;

CREATE TABLE `comercio`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
CREATE TABLE `comercio`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(5,2) NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `comercio`.`productos` AUTO_INCREMENT=101;  

CREATE TABLE `comercio`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `id_cliente` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_pedido_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `comercio`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
ALTER TABLE `comercio`.`pedidos` AUTO_INCREMENT=1001;	
	
CREATE TABLE `comercio`.`detalle_pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_pedido_idx` (`id_pedido` ASC) VISIBLE,
  CONSTRAINT `id_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `comercio`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `id_producto_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `comercio`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Ana Lopez', 'ana@email.com', '23', 'Bilbao');
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Juan Perez', 'juan@email.com', '29', 'Bilbao');
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Pedro Gomez', 'pedro@email.com', '20', 'Santurce');
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Lucia Fernandez', 'lucy@email.com', '32', 'Bilbao');
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Maria Torrez', 'maria@email.com', '30', 'Santurce');
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Beatriz', 'bea@email.com', '33', 'Santurce');
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Sebastian', 'sebas@email.com', '35', 'Portugalete');
INSERT INTO `comercio`.`clientes` (`nombre`, `mail`, `edad`, `localidad`) VALUES ('Lola Flores', 'lola@email.com', '20', 'Basauri');

INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Zapatos Deportivos', '55.00');	
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Camiseta Deportivos', '28.00');
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Pantalo Vaquero', '40.00');
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Sudadera con capucha', '20.00');
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Gorra ajustable', '12.00');
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Pantalon Corto', '25.00');
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Gorra deportiva', '12.00');
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Sudadera especial', '120.00');
INSERT INTO `comercio`.`productos` (`nombre`, `precio`) VALUES ('Plumifero', '120.45');

INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-01', '1');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-02', '2');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-03', '4');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-04', '4');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-31', '1');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-27', '4');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-27', '4');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-31', '1');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-27', '4');
INSERT INTO `comercio`.`pedidos` (`fecha`, `id_cliente`) VALUES ('2025-08-31', '1');

INSERT INTO `comercio`.`detalle_pedidos` (`id_pedido`, `id_producto`, `cantidad`) VALUES ('1001', '101', '1');
INSERT INTO `comercio`.`detalle_pedidos` (`id_pedido`, `id_producto`, `cantidad`) VALUES ('1001', '102', '2');
INSERT INTO `comercio`.`detalle_pedidos` (`id_pedido`, `id_producto`, `cantidad`) VALUES ('1002', '103', '1');
INSERT INTO `comercio`.`detalle_pedidos` (`id_pedido`, `id_producto`, `cantidad`) VALUES ('1004', '105', '3');
INSERT INTO `comercio`.`detalle_pedidos` (`id_pedido`, `id_producto`, `cantidad`) VALUES ('1005', '102', '1');
INSERT INTO `comercio`.`detalle_pedidos` (`id_pedido`, `id_producto`, `cantidad`) VALUES ('1005', '103', '1');

	