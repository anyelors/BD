CREATE SCHEMA `banco`;

CREATE TABLE `banco`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(9) NOT NULL UNIQUE,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `banco`.`cuentas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `iban` VARCHAR(45) NOT NULL UNIQUE,
  `saldo` FLOAT,
  `interes` FLOAT,
  `id_cliente` INT NOT NULL,
  `fecha` DATE,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `banco`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	