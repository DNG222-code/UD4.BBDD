-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tipus_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipus_vehicle` (
  `idTipus_vehicle` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipus_vehicle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle` (
  `Matrícula` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Tipus_vehicle_idTipus_vehicle` INT NOT NULL,
  PRIMARY KEY (`Matrícula`),
  INDEX `fk_Vehicle_Tipus_vehicle1_idx` (`Tipus_vehicle_idTipus_vehicle` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Tipus_vehicle1`
    FOREIGN KEY (`Tipus_vehicle_idTipus_vehicle`)
    REFERENCES `mydb`.`Tipus_vehicle` (`idTipus_vehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `User` INT NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Població` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Teléfon` VARCHAR(45) NOT NULL,
  `Vehicle_Matrícula` INT NOT NULL,
  PRIMARY KEY (`User`, `DNI`),
  INDEX `fk_Client_Vehicle_idx` (`Vehicle_Matrícula` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Vehicle`
    FOREIGN KEY (`Vehicle_Matrícula`)
    REFERENCES `mydb`.`Vehicle` (`Matrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cita` (
  `Data` VARCHAR(10) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Vehicle_Matrícula` INT NOT NULL,
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_Matrícula` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_Matrícula`)
    REFERENCES `mydb`.`Vehicle` (`Matrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
