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
-- Table `mydb`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleat` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Data_naixement` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Edat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ticket` (
  `Identificador` INT NOT NULL,
  `Nºfactura` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Preu_IVA_inclòs` VARCHAR(45) NOT NULL,
  `Empleat_DNI` INT NOT NULL,
  PRIMARY KEY (`Identificador`),
  INDEX `fk_Ticket_Empleat_idx` (`Empleat_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleat`
    FOREIGN KEY (`Empleat_DNI`)
    REFERENCES `mydb`.`Empleat` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producte` (
  `Codi_intern` INT NOT NULL,
  `Codi_barres` VARCHAR(45) NOT NULL,
  `Preu_Unitari` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  `IVA` VARCHAR(45) NOT NULL,
  `Preu_Final` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codi_intern`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Linea_de_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Linea_de_ticket` (
  `Indentificador` INT NOT NULL,
  `Ticket_Identificador` INT NOT NULL,
  `Producte_Codi_intern` INT NOT NULL,
  `Descripció_producte` VARCHAR(45) NOT NULL,
  `Unitats_descompte` VARCHAR(45) NOT NULL,
  `Preu_Unitari` VARCHAR(45) NOT NULL,
  `Preu_Total` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Indentificador`),
  INDEX `fk_Linea_de_ticket_Ticket1_idx` (`Ticket_Identificador` ASC) VISIBLE,
  INDEX `fk_Linea_de_ticket_Producte1_idx` (`Producte_Codi_intern` ASC) VISIBLE,
  CONSTRAINT `fk_Linea_de_ticket_Ticket1`
    FOREIGN KEY (`Ticket_Identificador`)
    REFERENCES `mydb`.`Ticket` (`Identificador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linea_de_ticket_Producte1`
    FOREIGN KEY (`Producte_Codi_intern`)
    REFERENCES `mydb`.`Producte` (`Codi_intern`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
