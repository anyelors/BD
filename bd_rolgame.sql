CREATE SCHEMA `rolgame`;

CREATE TABLE `rolgame`.`clases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (`id`));

CREATE TABLE `rolgame`.`personajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `id_clase` INT NOT NULL,
  `nivel` INT NOT NULL,
  `experiencia` INT NOT NULL,
  `vida` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_clase_idx` (`id_clase` ASC) VISIBLE,
  CONSTRAINT `id_clase`
    FOREIGN KEY (`id_clase`)
    REFERENCES `rolgame`.`clases` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);  

CREATE TABLE `rolgame`.`batallas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_atacante` INT NOT NULL,
  `id_defensor` INT NOT NULL,
  `id_vencedor` INT,
  `fecha` DATE NOT NULL,
  `resumen` VARCHAR(255),
  PRIMARY KEY (`id`),
  INDEX `id_atacante_idx` (`id_atacante` ASC) VISIBLE,
  CONSTRAINT `id_atacante`
    FOREIGN KEY (`id_atacante`)
    REFERENCES `rolgame`.`personajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `id_defensor_idx` (`id_defensor` ASC) VISIBLE,
  CONSTRAINT `id_defensor`
    FOREIGN KEY (`id_defensor`)
    REFERENCES `rolgame`.`personajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `id_vencedor_idx` (`id_vencedor` ASC) VISIBLE,
  CONSTRAINT `id_vencedor`
    FOREIGN KEY (`id_vencedor`)
    REFERENCES `rolgame`.`personajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
ALTER TABLE `rolgame`.`batallas` 
CHANGE COLUMN `fecha` `fecha` DATETIME NOT NULL ;

ALTER TABLE `rolgame`.`personajes` 
CHANGE COLUMN `nivel` `nivel` INT NOT NULL DEFAULT 0 ,
CHANGE COLUMN `experiencia` `experiencia` INT NOT NULL DEFAULT 0 ,
CHANGE COLUMN `vida` `vida` INT NOT NULL DEFAULT 100 ;

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
INSERT INTO `rolgame`.`clases` (`nombre`) VALUES ('Guerrero');
INSERT INTO `rolgame`.`clases` (`nombre`) VALUES ('Arquero');
INSERT INTO `rolgame`.`clases` (`nombre`) VALUES ('Mago');
INSERT INTO `rolgame`.`clases` (`nombre`) VALUES ('Paladin');