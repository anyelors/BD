CREATE SCHEMA `mytube`;

CREATE TABLE `mytube`.`usuarios` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(9) NOT NULL UNIQUE,
  `nombre` VARCHAR(45) NOT NULL,
  `nacimiento` DATE NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuario`));
  
CREATE TABLE `mytube`.`generos` (
  `idgenero` INT NOT NULL AUTO_INCREMENT,
  `genero` VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (`idgenero`));  

CREATE TABLE `mytube`.`peliculas` (
  `idpelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL UNIQUE,
  `idgenero` INT NOT NULL,
  `adulto` BIT(1) NOT NULL,
  `anyo` INT NOT NULL,
  `visionados` INT DEFAULT 0,
  PRIMARY KEY (`idpelicula`),
  INDEX `idgenero_idx` (`idgenero` ASC) VISIBLE,
  CONSTRAINT `idgenero`
    FOREIGN KEY (`idgenero`)
    REFERENCES `mytube`.`generos` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `mytube`.`visionados` (
  `idvisionado` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idpelicula` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idvisionado`),
  INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `mytube`.`usuarios` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `idpelicula_idx` (`idpelicula` ASC) VISIBLE,
  CONSTRAINT `idpelicula`
    FOREIGN KEY (`idpelicula`)
    REFERENCES `mytube`.`peliculas` (`idpelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);