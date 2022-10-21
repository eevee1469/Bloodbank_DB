-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bb_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bb_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bb_db` DEFAULT CHARACTER SET utf8 ;
USE `bb_db` ;

-- -----------------------------------------------------
-- Table `bb_db`.`banco_de_sangre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`banco_de_sangre` (
  `bankname_id` VARCHAR(16) NOT NULL,
  `Adress_id` VARCHAR(80) NOT NULL,
  `Unidad_id` BIGINT NOT NULL,
  `Solicitud_id` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`bankname_id`));


-- -----------------------------------------------------
-- Table `bb_db`.`unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`unidad` (
  `id_donante` VARCHAR(16) NOT NULL,
  `tipo_sanguineo` TINYTEXT NOT NULL,
  `rh_id` INT NOT NULL,
  `unidad_id` BIGINT NOT NULL,
  `Factor` INT NOT NULL,
  `tipo_unid` TINYTEXT NOT NULL,
  PRIMARY KEY (`unidad_id`));


-- -----------------------------------------------------
-- Table `bb_db`.`donante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`donante` (
  `id_donante` VARCHAR(25) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `id_nombre` TINYTEXT NOT NULL,
  `id_factorRH` TINYTEXT NOT NULL,
  `Nacimiento` DATETIME NOT NULL,
  `Unidad_id` BIGINT NOT NULL,
  `Peso` INT NOT NULL,
  `unidad_donor_id` BIGINT NOT NULL,
  PRIMARY KEY (`id_donante`));


-- -----------------------------------------------------
-- Table `bb_db`.`recoleccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`recoleccion` (
  `id_recoleccion` INT NOT NULL,
  `id_estado` DECIMAL NOT NULL,
  `unidad_id` BIGINT NOT NULL,
  `fecha_recolec` DATE NOT NULL,
  PRIMARY KEY (`id_recoleccion`));


-- -----------------------------------------------------
-- Table `bb_db`.`hospital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`hospital` (
  `nombrehp_id` VARCHAR(16) NOT NULL,
  `adress_id` VARCHAR(80) NOT NULL,
  `Solicitud_hpid` VARCHAR(32) NOT NULL,
  `Fechasolicitud` DATE NOT NULL,
  `paciente_paciente_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`nombrehp_id`, `paciente_paciente_id`));


-- -----------------------------------------------------
-- Table `bb_db`.`solicitud_unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`solicitud_unidad` (
  `Solicitud_id` VARCHAR(32) NOT NULL,
  `unidad_unidad_id` BIGINT NOT NULL,
  `Unidad_id_donante` VARCHAR(16) NOT NULL,
  `SolicDate` DATETIME NOT NULL,
  PRIMARY KEY (`Solicitud_id`, `unidad_unidad_id`));


-- -----------------------------------------------------
-- Table `bb_db`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`paciente` (
  `paciente_id` VARCHAR(16) NOT NULL,
  `email_pte` VARCHAR(40) NOT NULL,
  `dni_pte` INT NOT NULL,
  `solicitud_type` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`paciente_id`));


-- -----------------------------------------------------
-- Table `bb_db`.`pte_solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`pte_solicitud` (
  `pte_id_hosp` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`pte_id_hosp`));


-- -----------------------------------------------------
-- Table `bb_db`.`solicitud_unidad_has_banco_de_sangre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`solicitud_unidad_has_banco_de_sangre` (
  `solicitud_unidad_Solicitud_id` VARCHAR(32) NOT NULL,
  `banco_de_sangre_bankname_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`solicitud_unidad_Solicitud_id`, `banco_de_sangre_bankname_id`));


-- -----------------------------------------------------
-- Table `bb_db`.`hospital_has_pte_solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`hospital_has_pte_solicitud` (
  `hospital_nombrehp_id` VARCHAR(16) NOT NULL,
  `hospital_paciente_paciente_id` VARCHAR(16) NOT NULL,
  `pte_solicitud_pte_id_hosp` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`hospital_nombrehp_id`, `hospital_paciente_paciente_id`, `pte_solicitud_pte_id_hosp`));


-- -----------------------------------------------------
-- Table `bb_db`.`hospital_has_banco_de_sangre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bb_db`.`hospital_has_banco_de_sangre` (
  `hospital_nombrehp_id` VARCHAR(16) NOT NULL,
  `hospital_paciente_paciente_id` VARCHAR(16) NOT NULL,
  `banco_de_sangre_bankname_id` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`hospital_nombrehp_id`, `hospital_paciente_paciente_id`, `banco_de_sangre_bankname_id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
