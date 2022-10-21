-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Blood_Bank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Blood_Bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Blood_Bank` DEFAULT CHARACTER SET utf8 ;
USE `Blood_Bank` ;

-- -----------------------------------------------------
-- Table `Blood_Bank`.`banco_de_sangre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`banco_de_sangre` (
  `bankname_id` VARCHAR(16) NOT NULL,
  `Adress_id` VARCHAR(80) NOT NULL,
  `Unidad_id` BIGINT(160000) NOT NULL,
  `Solicitud_id` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`bankname_id`),
  UNIQUE INDEX `Unidades_id_UNIQUE` (`Unidad_id` ASC) VISIBLE,
  UNIQUE INDEX `Solicitud_id_UNIQUE` (`Solicitud_id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `Blood_Bank`.`unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`unidad` (
  `id_donante` VARCHAR(16) NOT NULL,
  `tipo_sanguineo` TINYTEXT NOT NULL,
  `rh_id` INT NOT NULL,
  `unidad_id` BIGINT(160000) NOT NULL,
  `Factor` INT NOT NULL,
  `tipo_unid` TINYTEXT NOT NULL,
  PRIMARY KEY (`unidad_id`),
  UNIQUE INDEX `unidad_id_UNIQUE` (`unidad_id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `Blood_Bank`.`donante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`donante` (
  `id_donante` VARCHAR(25) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `id_nombre` TINYTEXT NOT NULL,
  `id_factorRH` TINYTEXT NOT NULL DEFAULT 'RH',
  `Nacimiento` DATETIME NOT NULL,
  `Unidad_id` BIGINT(160000) NOT NULL,
  `Peso` INT NULL,
  PRIMARY KEY (`id_donante`),
  INDEX `Banco_de_sangre` (`Unidad_id` ASC) VISIBLE,
  UNIQUE INDEX `id_donante_UNIQUE` (`id_donante` ASC) VISIBLE,
  CONSTRAINT `Donacion`
    FOREIGN KEY ()
    REFERENCES `Blood_Bank`.`banco_de_sangre` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Unidad_id`
    FOREIGN KEY ()
    REFERENCES `Blood_Bank`.`unidad` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Blood_Bank`.`recoleccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`recoleccion` (
  `id_recoleccion` INT NOT NULL,
  `id_estado` DECIMAL NOT NULL,
  `unidad_id` BIGINT(160000) NOT NULL,
  `fecha_recolec` DATE NOT NULL,
  UNIQUE INDEX `id_recoleccion_UNIQUE` (`id_recoleccion` ASC) VISIBLE,
  UNIQUE INDEX `unidad_id_UNIQUE` (`unidad_id` ASC) VISIBLE,
  PRIMARY KEY (`id_recoleccion`),
  CONSTRAINT `Unidad_id`
    FOREIGN KEY (`unidad_id`)
    REFERENCES `Blood_Bank`.`unidad` (`unidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Blood_Bank`.`solicitud_unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`solicitud_unidad` (
  `Solicitud_id` VARCHAR(32) NOT NULL,
  `SolicDate` DATETIME NOT NULL,
  `Unidad_id_donante` VARCHAR(16) NOT NULL,
  `Unidad_unidad_id` BIGINT(160000) NOT NULL,
  UNIQUE INDEX `Solicitud_id_UNIQUE` (`Solicitud_id` ASC) VISIBLE,
  INDEX `fk_Solicitud unidad_Unidad1_idx` (`Unidad_id_donante` ASC, `Unidad_unidad_id` ASC) VISIBLE,
  PRIMARY KEY (`Solicitud_id`),
  CONSTRAINT `Solicitud_id`
    FOREIGN KEY (`Solicitud_id`)
    REFERENCES `Blood_Bank`.`banco_de_sangre` (`Solicitud_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitud unidad_Unidad1`
    FOREIGN KEY (`Unidad_id_donante` , `Unidad_unidad_id`)
    REFERENCES `Blood_Bank`.`unidad` (`id_donante` , `unidad_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Blood_Bank`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`hospital` (
  `nombrehp_id` VARCHAR(16) NOT NULL,
  `adress_id` VARCHAR(80) NOT NULL,
  `Solicitud_hpid` VARCHAR(32) NOT NULL,
  `Fechasolicitud` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nombrehp_id`),
  INDEX `Solicitud unidad_idx` (`Solicitud_hpid` ASC) VISIBLE,
  UNIQUE INDEX `Solicitud_id_UNIQUE` (`Solicitud_hpid` ASC) VISIBLE,
  CONSTRAINT `Solicitud unidad`
    FOREIGN KEY (`Solicitud_hpid`)
    REFERENCES `Blood_Bank`.`solicitud_unidad` (`Solicitud_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Blood_Bank`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Blood_Bank`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`paciente` (
  `paciente_id` VARCHAR(16) NOT NULL,
  `email_pte` VARCHAR(40) NOT NULL,
  `dni_pte` INT NOT NULL,
  `solicitud_type` TINYTEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`paciente_id`),
  UNIQUE INDEX `paciente_id_UNIQUE` (`paciente_id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `Blood_Bank`.`pte_solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Blood_Bank`.`pte_solicitud` (
  `pte_id_hosp` VARCHAR(16) NOT NULL,
  `solicitud_id` VARCHAR(16) NOT NULL,
  INDEX `fk_user_has_hospital_hospital1_idx` (`solicitud_id` ASC) VISIBLE,
  INDEX `fk_user_has_hospital_user1_idx` (`pte_id_hosp` ASC) VISIBLE,
  UNIQUE INDEX `user_paciente_id_UNIQUE` (`pte_id_hosp` ASC) VISIBLE,
  PRIMARY KEY (`pte_id_hosp`),
  CONSTRAINT `fk_user_has_hospital_user1`
    FOREIGN KEY (`pte_id_hosp`)
    REFERENCES `Blood_Bank`.`paciente` (`paciente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_hospital_hospital1`
    FOREIGN KEY (`solicitud_id`)
    REFERENCES `Blood_Bank`.`hospital` (`nombrehp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
