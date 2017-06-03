-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema elude
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema elude
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `elude` DEFAULT CHARACTER SET utf8 ;
USE `elude` ;

-- -----------------------------------------------------
-- Table `elude`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elude`.`usuario` (
  `identificacion` INT(11) NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `clave` INT(11) NOT NULL,
  PRIMARY KEY (`identificacion`),
  UNIQUE INDEX `idrompimiento_UNIQUE` (`identificacion` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elude`.`game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elude`.`game` (
  `idgame` INT(11) NOT NULL,
  `nombreGame` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgame`),
  UNIQUE INDEX `idjuego_UNIQUE` (`idgame` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elude`.`usuario_has_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `elude`.`usuario_has_game` (
  `usuario_identificacion` INT(11) NOT NULL,
  `game_idgame` INT(11) NOT NULL,
  `puntos` INT(11) NOT NULL,
  PRIMARY KEY (`usuario_identificacion`, `game_idgame`),
  INDEX `fk_usuario_has_game_game1_idx` (`game_idgame` ASC),
  INDEX `fk_usuario_has_game_usuario_idx` (`usuario_identificacion` ASC),
  CONSTRAINT `fk_usuario_has_game_usuario`
    FOREIGN KEY (`usuario_identificacion`)
    REFERENCES `elude`.`usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_game_game1`
    FOREIGN KEY (`game_idgame`)
    REFERENCES `elude`.`game` (`idgame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
