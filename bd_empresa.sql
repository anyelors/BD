CREATE SCHEMA `empresa`;

CREATE TABLE `empresa`.`departamentos` (
  `iddepartamento` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (`iddepartamento`));

CREATE TABLE `empresa`.`empleados` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(45) NOT NULL UNIQUE,
  `nombre` VARCHAR(45) NOT NULL,
  `sueldo` DECIMAL(8,2) NOT NULL,
  `iddepartamento` INT NOT NULL,
  PRIMARY KEY (`idempleado`),
  INDEX `iddepartamento_idx` (`iddepartamento` ASC) VISIBLE,
  CONSTRAINT `iddepartamento`
    FOREIGN KEY (`iddepartamento`)
    REFERENCES `empresa`.`departamentos` (`iddepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	