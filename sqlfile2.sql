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
-- -----------------------------------------------------
-- Schema usertest
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema usertest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `usertest` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`persoon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`persoon` ;

CREATE TABLE IF NOT EXISTS `mydb`.`persoon` (
  `persoonID` INT UNSIGNED NOT NULL,
  `telefoonnummer` INT NOT NULL,
  `voornaam` VARCHAR(45) NOT NULL,
  `achternaam` VARCHAR(45) NOT NULL,
  `geboorte datum` DATE NOT NULL,
  `geboorte stad` VARCHAR(45) NOT NULL,
  `nationaliteit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`persoonID`),
  UNIQUE INDEX `persoonID_UNIQUE` (`persoonID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`adres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`adres` ;

CREATE TABLE IF NOT EXISTS `mydb`.`adres` (
  `adresID` INT UNSIGNED NOT NULL,
  `straatnaam` VARCHAR(45) NOT NULL,
  `stad` VARCHAR(45) NOT NULL,
  `huisnummer` INT NOT NULL,
  `postcode` VARCHAR(45) NOT NULL,
  `persoon_persoonID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`adresID`),
  UNIQUE INDEX `adresID_UNIQUE` (`adresID` ASC) VISIBLE,
  INDEX `fk_adres_persoon_idx` (`persoon_persoonID` ASC) VISIBLE,
  CONSTRAINT `fk_adres_persoon`
    FOREIGN KEY (`persoon_persoonID`)
    REFERENCES `mydb`.`persoon` (`persoonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vlucht`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`vlucht` ;

CREATE TABLE IF NOT EXISTS `mydb`.`vlucht` (
  `vluchtnummer` VARCHAR(45) NOT NULL,
  `vliegtuig type` VARCHAR(45) NOT NULL,
  `vertrektijd` DATE NOT NULL,
  `aankomst tijd` DATE NOT NULL,
  `vertrek vluchthaven` VARCHAR(45) NOT NULL,
  `aankomst vluchthaven` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`vluchtnummer`),
  UNIQUE INDEX `vluchtnummer_UNIQUE` (`vluchtnummer` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`personeel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`personeel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`personeel` (
  `PersoonID` INT UNSIGNED NOT NULL,
  `naam` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PersoonID`),
  UNIQUE INDEX `PersoonID_UNIQUE` (`PersoonID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vlucht_has_personeel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`vlucht_has_personeel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`vlucht_has_personeel` (
  `vlucht_vluchtnummer` VARCHAR(45) NOT NULL,
  `personeel_PersoonID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`vlucht_vluchtnummer`, `personeel_PersoonID`),
  INDEX `fk_vlucht_has_personeel_personeel1_idx` (`personeel_PersoonID` ASC) VISIBLE,
  INDEX `fk_vlucht_has_personeel_vlucht1_idx` (`vlucht_vluchtnummer` ASC) VISIBLE,
  CONSTRAINT `fk_vlucht_has_personeel_vlucht1`
    FOREIGN KEY (`vlucht_vluchtnummer`)
    REFERENCES `mydb`.`vlucht` (`vluchtnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vlucht_has_personeel_personeel1`
    FOREIGN KEY (`personeel_PersoonID`)
    REFERENCES `mydb`.`personeel` (`PersoonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `usertest` ;

-- -----------------------------------------------------
-- Table `usertest`.`test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usertest`.`test` ;

CREATE TABLE IF NOT EXISTS `usertest`.`test` (
  `idtest` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idtest`),
  UNIQUE INDEX `idtest_UNIQUE` (`idtest` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`achievments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`achievments` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`achievments` (
  `one shot one kill` INT NOT NULL,
  `met gravity` VARCHAR(45) NULL DEFAULT NULL,
  `armory` VARCHAR(45) NULL DEFAULT NULL,
  `double pumper` VARCHAR(45) NULL DEFAULT NULL,
  `90's god` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`one shot one kill`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`stats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`stats` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`stats` (
  `W/L` INT NOT NULL,
  `K/D` VARCHAR(45) NULL DEFAULT NULL,
  `Vbucks` VARCHAR(45) NULL DEFAULT NULL,
  `locker` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`W/L`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`user info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`user info` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`user info` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `email address` VARCHAR(45) NULL DEFAULT NULL,
  `home address` VARCHAR(45) NULL DEFAULT NULL,
  `credit card info` VARCHAR(45) NULL DEFAULT NULL,
  `user infocol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
