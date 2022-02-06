-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tm2k21
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tm2k21
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tm2k21` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `tm2k21` ;

-- -----------------------------------------------------
-- Table `tm2k21`.`DRZAVLJANSTVO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`DRZAVLJANSTVO` (
  `idDrzavljanstva` INT NOT NULL AUTO_INCREMENT,
  `NazivDrzave` VARCHAR(50) NOT NULL,
  `ISO` VARCHAR(2) NULL,
  `ISO3` VARCHAR(3) NULL,
  PRIMARY KEY (`idDrzavljanstva`),
  UNIQUE INDEX `Drzava_UNIQUE` (`NazivDrzave` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`OSOBA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`OSOBA` (
  `idOsobe` INT NOT NULL AUTO_INCREMENT,
  `Ime` VARCHAR(30) NOT NULL,
  `Prezime` VARCHAR(30) NOT NULL,
  `DatumRodjenja` DATE NOT NULL,
  `MjestoRodjenja` VARCHAR(50) NOT NULL,
  `DRZAVLJANSTVO_idDrzavljanstva` INT NOT NULL,
  PRIMARY KEY (`idOsobe`),
  UNIQUE INDEX `Ime_UNIQUE` (`Ime` ASC) VISIBLE,
  UNIQUE INDEX `Prezime_UNIQUE` (`Prezime` ASC) VISIBLE,
  INDEX `fk_OSOBA_DRZAVLJANSTVO1_idx` (`DRZAVLJANSTVO_idDrzavljanstva` ASC) VISIBLE,
  CONSTRAINT `fk_OSOBA_DRZAVLJANSTVO1`
    FOREIGN KEY (`DRZAVLJANSTVO_idDrzavljanstva`)
    REFERENCES `tm2k21`.`DRZAVLJANSTVO` (`idDrzavljanstva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`AGENCIJA_ZA_IGRACE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`AGENCIJA_ZA_IGRACE` (
  `idAgencije` INT NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(50) NOT NULL,
  `Website` VARCHAR(50) NULL,
  `Mail` VARCHAR(50) NULL,
  PRIMARY KEY (`idAgencije`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`IGRAC`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`IGRAC` (
  `Pozicija` VARCHAR(30) NOT NULL,
  `Visina` INT NOT NULL,
  `Tezina` INT NOT NULL,
  `Cijena` DECIMAL(20,2) NOT NULL,
  `Noga` VARCHAR(20) NULL,
  `OSOBA_idOsobe` INT NOT NULL,
  `AGENCIJA_ZA_IGRACE_idAgencije` INT NULL,
  PRIMARY KEY (`OSOBA_idOsobe`),
  INDEX `fk_IGRAC_AGENCIJA_ZA_IGRACE1_idx` (`AGENCIJA_ZA_IGRACE_idAgencije` ASC) VISIBLE,
  CONSTRAINT `fk_IGRAC_OSOBA1`
    FOREIGN KEY (`OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`OSOBA` (`idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IGRAC_AGENCIJA_ZA_IGRACE1`
    FOREIGN KEY (`AGENCIJA_ZA_IGRACE_idAgencije`)
    REFERENCES `tm2k21`.`AGENCIJA_ZA_IGRACE` (`idAgencije`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`ADRESA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`ADRESA` (
  `idAdrese` INT NOT NULL AUTO_INCREMENT,
  `Ulica` VARCHAR(50) NOT NULL,
  `Broj` INT NOT NULL,
  PRIMARY KEY (`idAdrese`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`STADION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`STADION` (
  `NazivStadiona` VARCHAR(100) NOT NULL,
  `Kapacitet` INT NOT NULL,
  `GodinaIzgradnje` INT NULL,
  `ADRESA_idAdrese` INT NOT NULL,
  PRIMARY KEY (`NazivStadiona`),
  INDEX `fk_STADION_ADRESA1_idx` (`ADRESA_idAdrese` ASC) VISIBLE,
  CONSTRAINT `fk_STADION_ADRESA1`
    FOREIGN KEY (`ADRESA_idAdrese`)
    REFERENCES `tm2k21`.`ADRESA` (`idAdrese`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`KLUB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`KLUB` (
  `idKluba` INT NOT NULL AUTO_INCREMENT,
  `NazivKluba` VARCHAR(100) NOT NULL,
  `Liga` VARCHAR(70) NOT NULL,
  `Website` VARCHAR(50) NULL,
  `DatumOsnivanja` DATE NULL,
  `STADION_NazivStadiona` VARCHAR(100) NOT NULL,
  `ADRESA_idAdrese` INT NOT NULL,
  INDEX `fk_KLUB_STADION1_idx` (`STADION_NazivStadiona` ASC) VISIBLE,
  PRIMARY KEY (`idKluba`),
  INDEX `fk_KLUB_ADRESA1_idx` (`ADRESA_idAdrese` ASC) VISIBLE,
  CONSTRAINT `fk_KLUB_STADION1`
    FOREIGN KEY (`STADION_NazivStadiona`)
    REFERENCES `tm2k21`.`STADION` (`NazivStadiona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_KLUB_ADRESA1`
    FOREIGN KEY (`ADRESA_idAdrese`)
    REFERENCES `tm2k21`.`ADRESA` (`idAdrese`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`UGOVOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`UGOVOR` (
  `idUgovora` INT NOT NULL AUTO_INCREMENT,
  `DatumOd` DATE NOT NULL,
  `DatumDo` DATE NOT NULL,
  `Plata` DECIMAL(20,2) NULL,
  `OSOBA_idOsobe` INT NOT NULL,
  `KLUB_idKluba` INT NULL,
  PRIMARY KEY (`idUgovora`),
  INDEX `fk_UGOVOR_OSOBA1_idx` (`OSOBA_idOsobe` ASC) VISIBLE,
  INDEX `fk_UGOVOR_KLUB1_idx` (`KLUB_idKluba` ASC) VISIBLE,
  CONSTRAINT `fk_UGOVOR_OSOBA1`
    FOREIGN KEY (`OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`OSOBA` (`idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UGOVOR_KLUB1`
    FOREIGN KEY (`KLUB_idKluba`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`TRENER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`TRENER` (
  `Tip` VARCHAR(30) NOT NULL,
  `Licenca` VARCHAR(50) NOT NULL,
  `OmiljenaFormacija` VARCHAR(50) NULL,
  `OSOBA_idOsobe` INT NOT NULL,
  `KLUB_idKluba` INT NULL,
  PRIMARY KEY (`OSOBA_idOsobe`),
  INDEX `fk_TRENER_KLUB1_idx` (`KLUB_idKluba` ASC) VISIBLE,
  CONSTRAINT `fk_TRENER_OSOBA1`
    FOREIGN KEY (`OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`OSOBA` (`idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRENER_KLUB1`
    FOREIGN KEY (`KLUB_idKluba`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`SEZONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`SEZONA` (
  `NazivSezone` VARCHAR(50) NOT NULL,
  `DatumPocetka` DATE NULL,
  `DatumKraja` DATE NULL,
  PRIMARY KEY (`NazivSezone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`SPONZOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`SPONZOR` (
  `idSponzora` INT NOT NULL AUTO_INCREMENT,
  `NazivSponzora` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idSponzora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`AGENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`AGENT` (
  `Licenca` VARCHAR(50) NOT NULL,
  `AGENCIJA_ZA_IGRACE_idAgencije` INT NULL,
  `OSOBA_idOsobe` INT NOT NULL,
  INDEX `fk_AGENT_AGENCIJA_ZA_IGRACE_idx` (`AGENCIJA_ZA_IGRACE_idAgencije` ASC) VISIBLE,
  PRIMARY KEY (`OSOBA_idOsobe`),
  CONSTRAINT `fk_AGENT_AGENCIJA_ZA_IGRACE`
    FOREIGN KEY (`AGENCIJA_ZA_IGRACE_idAgencije`)
    REFERENCES `tm2k21`.`AGENCIJA_ZA_IGRACE` (`idAgencije`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AGENT_OSOBA1`
    FOREIGN KEY (`OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`OSOBA` (`idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`MENADZER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`MENADZER` (
  `Tip` VARCHAR(50) NOT NULL,
  `OSOBA_idOsobe` INT NOT NULL,
  PRIMARY KEY (`OSOBA_idOsobe`),
  CONSTRAINT `fk_MENADZER_OSOBA1`
    FOREIGN KEY (`OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`OSOBA` (`idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`DRES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`DRES` (
  `Broj` INT NOT NULL,
  `Natpis` VARCHAR(50) NOT NULL,
  `KLUB_idKluba` INT NULL,
  `IGRAC_OSOBA_idOsobe` INT NOT NULL,
  UNIQUE INDEX `Broj_UNIQUE` (`Broj` ASC) VISIBLE,
  INDEX `fk_DRES_KLUB1_idx` (`KLUB_idKluba` ASC) VISIBLE,
  INDEX `fk_DRES_IGRAC1_idx` (`IGRAC_OSOBA_idOsobe` ASC) VISIBLE,
  CONSTRAINT `fk_DRES_KLUB1`
    FOREIGN KEY (`KLUB_idKluba`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DRES_IGRAC1`
    FOREIGN KEY (`IGRAC_OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`IGRAC` (`OSOBA_idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`TELEFON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`TELEFON` (
  `idTelefona` INT NOT NULL AUTO_INCREMENT,
  `Broj` VARCHAR(30) NOT NULL,
  `Tip` VARCHAR(15) NULL,
  `KLUB_idKluba` INT NOT NULL,
  PRIMARY KEY (`idTelefona`),
  INDEX `fk_TELEFON_KLUB1_idx` (`KLUB_idKluba` ASC) VISIBLE,
  CONSTRAINT `fk_TELEFON_KLUB1`
    FOREIGN KEY (`KLUB_idKluba`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`SPONZOR_KLUBA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`SPONZOR_KLUBA` (
  `SPONZOR_idSponzora` INT NOT NULL,
  `KLUB_idKluba` INT NOT NULL,
  `DatumPotpisivanja` DATE NOT NULL,
  `GodinaTrajanja` INT NOT NULL,
  `Vrijednost` DECIMAL(20,2) NOT NULL,
  PRIMARY KEY (`SPONZOR_idSponzora`, `KLUB_idKluba`),
  INDEX `fk_SPONZOR_has_KLUB_SPONZOR1_idx` (`SPONZOR_idSponzora` ASC) VISIBLE,
  INDEX `fk_SPONZOR_KLUBA_KLUB1_idx` (`KLUB_idKluba` ASC) VISIBLE,
  CONSTRAINT `fk_SPONZOR_has_KLUB_SPONZOR1`
    FOREIGN KEY (`SPONZOR_idSponzora`)
    REFERENCES `tm2k21`.`SPONZOR` (`idSponzora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SPONZOR_KLUBA_KLUB1`
    FOREIGN KEY (`KLUB_idKluba`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`TRANSFER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`TRANSFER` (
  `idTransfera` INT NOT NULL AUTO_INCREMENT,
  `DatumTransfera` DATE NOT NULL,
  `Cijena` DECIMAL(20,2) NOT NULL,
  `OSOBA_idOsobe` INT NOT NULL,
  `KLUB_idKluba1` INT NULL,
  `KLUB_idKluba2` INT NULL,
  PRIMARY KEY (`idTransfera`),
  INDEX `fk_TRANSFER_OSOBA1_idx` (`OSOBA_idOsobe` ASC) VISIBLE,
  INDEX `fk_TRANSFER_KLUB1_idx` (`KLUB_idKluba1` ASC) VISIBLE,
  INDEX `fk_TRANSFER_KLUB2_idx` (`KLUB_idKluba2` ASC) VISIBLE,
  CONSTRAINT `fk_TRANSFER_OSOBA1`
    FOREIGN KEY (`OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`OSOBA` (`idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSFER_KLUB1`
    FOREIGN KEY (`KLUB_idKluba1`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSFER_KLUB2`
    FOREIGN KEY (`KLUB_idKluba2`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`STATISTIKA_IGRACA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`STATISTIKA_IGRACA` (
  `IGRAC_OSOBA_idOsobe` INT NOT NULL,
  `SEZONA_NazivSezone` VARCHAR(50) NOT NULL,
  `KLUB_idKluba` INT NOT NULL,
  `OdigranihUtakmica` INT NOT NULL,
  `Golova` INT NOT NULL,
  `Asistencija` INT NOT NULL,
  `BrojKartona` INT NOT NULL,
  PRIMARY KEY (`SEZONA_NazivSezone`, `KLUB_idKluba`),
  INDEX `fk_IGRAC_has_SEZONA_SEZONA1_idx` (`SEZONA_NazivSezone` ASC) VISIBLE,
  INDEX `fk_IGRAC_has_SEZONA_IGRAC1_idx` (`IGRAC_OSOBA_idOsobe` ASC) VISIBLE,
  INDEX `fk_STATISTIKA_IGRACA_KLUB1_idx` (`KLUB_idKluba` ASC) VISIBLE,
  CONSTRAINT `fk_IGRAC_has_SEZONA_IGRAC1`
    FOREIGN KEY (`IGRAC_OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`IGRAC` (`OSOBA_idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_IGRAC_has_SEZONA_SEZONA1`
    FOREIGN KEY (`SEZONA_NazivSezone`)
    REFERENCES `tm2k21`.`SEZONA` (`NazivSezone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STATISTIKA_IGRACA_KLUB1`
    FOREIGN KEY (`KLUB_idKluba`)
    REFERENCES `tm2k21`.`KLUB` (`idKluba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tm2k21`.`STATISTIKA_TRENERA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm2k21`.`STATISTIKA_TRENERA` (
  `SEZONA_NazivSezone` VARCHAR(50) NOT NULL,
  `TRENER_OSOBA_idOsobe` INT NOT NULL,
  `OdigranihUtakmica` INT NOT NULL,
  `Pobjeda` INT NOT NULL,
  `Nerijesenih` INT NOT NULL,
  `Poraza` INT NOT NULL,
  PRIMARY KEY (`SEZONA_NazivSezone`),
  INDEX `fk_SEZONA_has_TRENER_TRENER1_idx` (`TRENER_OSOBA_idOsobe` ASC) VISIBLE,
  INDEX `fk_SEZONA_has_TRENER_SEZONA1_idx` (`SEZONA_NazivSezone` ASC) VISIBLE,
  CONSTRAINT `fk_SEZONA_has_TRENER_SEZONA1`
    FOREIGN KEY (`SEZONA_NazivSezone`)
    REFERENCES `tm2k21`.`SEZONA` (`NazivSezone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SEZONA_has_TRENER_TRENER1`
    FOREIGN KEY (`TRENER_OSOBA_idOsobe`)
    REFERENCES `tm2k21`.`TRENER` (`OSOBA_idOsobe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
