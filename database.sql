-- MySQL Script generated by MySQL Workbench
-- czw, 20 cze 2019, 20:19:46
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ExtentedChat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ExtentedChat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ExtentedChat` DEFAULT CHARACTER SET utf8 ;
USE `ExtentedChat` ;

-- -----------------------------------------------------
-- Table `ExtentedChat`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExtentedChat`.`users` (
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `question` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`login`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExtentedChat`.`sessions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExtentedChat`.`sessions` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `author` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `create_data` DATE NOT NULL,
  `drop_data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExtentedChat`.`archives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExtentedChat`.`archives` (
  `id` INT NOT NULL,
  `message` VARCHAR(45) NOT NULL,
  `date` DATE NULL,
  `sessions_id` INT NOT NULL,
  `users_login` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_archives_sessions1_idx` (`sessions_id` ASC),
  INDEX `fk_archives_users1_idx` (`users_login` ASC),
  CONSTRAINT `fk_archives_sessions1`
    FOREIGN KEY (`sessions_id`)
    REFERENCES `ExtentedChat`.`sessions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_archives_users1`
    FOREIGN KEY (`users_login`)
    REFERENCES `ExtentedChat`.`users` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ExtentedChat`.`logs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ExtentedChat`.`logs` (
  `id` INT NOT NULL,
  `action` VARCHAR(45) NOT NULL,
  `users_login` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_logs_users1_idx` (`users_login` ASC),
  CONSTRAINT `fk_logs_users1`
    FOREIGN KEY (`users_login`)
    REFERENCES `ExtentedChat`.`users` (`login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
