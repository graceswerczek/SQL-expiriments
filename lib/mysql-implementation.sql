-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`JobUserLocation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`JobUserLocation` (
  `JobLocationID` INT GENERATED ALWAYS AS () VIRTUAL,
  `JobAddress` VARCHAR(100) NULL,
  `JobCity` VARCHAR(45) NULL,
  `JobState` VARCHAR(45) NULL,
  `JobZipCode` INT NULL,
  `UserAddress` VARCHAR(100) NULL,
  `UserCity` VARCHAR(45) NULL,
  `UserState` VARCHAR(45) NULL,
  `UserZipCode` VARCHAR(45) NULL,
  PRIMARY KEY (`JobLocationID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_qualifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_qualifications` (
  `userExperience` BLOB GENERATED ALWAYS AS () VIRTUAL,
  `certifications` VARCHAR(45) NULL,
  `educationLevel` VARCHAR(45) NULL,
  `userCitizen?` VARCHAR(45) NULL,
  PRIMARY KEY (`userExperience`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`time` (
  `timestamp` DATETIME GENERATED ALWAYS AS () VIRTUAL,
  `hour` VARCHAR(45) NULL,
  `month` VARCHAR(45) NULL,
  `day` VARCHAR(45) NULL,
  `year` VARCHAR(45) NULL,
  `userBirthdate` DATE NULL,
  `timecol` VARCHAR(45) NULL,
  PRIMARY KEY (`timestamp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Activity_Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Activity_Log` (
  `EventID` INT GENERATED ALWAYS AS () VIRTUAL,
  PRIMARY KEY (`EventID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_data` (
  `userID` INT GENERATED ALWAYS AS () VIRTUAL,
  `UserFirstName` VARCHAR(45) NULL,
  `UserLastName` VARCHAR(45) NULL,
  `UserMiddleInitial` VARCHAR(45) NULL,
  `UserPhoneNumber` VARCHAR(45) NULL,
  `UserEmail` VARCHAR(45) NULL,
  `UserSocialMedia` BLOB NULL,
  `UserUsername` VARCHAR(45) NULL,
  `UserPassword` VARCHAR(45) NULL,
  `LocationID` INT NULL,
  `user_qualifications_userExperience` BLOB NOT NULL,
  `time_timestamp` DATETIME NOT NULL,
  `Activity_Log_EventID` INT NOT NULL,
  PRIMARY KEY (`userID`),
  INDEX `FKLocation_idx` (`LocationID` ASC),
  INDEX `fk_User_data_user_qualifications1_idx` (`user_qualifications_userExperience` ASC),
  INDEX `fk_User_data_time1_idx` (`time_timestamp` ASC),
  INDEX `fk_User_data_Activity_Log1_idx` (`Activity_Log_EventID` ASC),
  CONSTRAINT `FKLocation`
    FOREIGN KEY (`LocationID`)
    REFERENCES `mydb`.`JobUserLocation` (`JobLocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_data_user_qualifications1`
    FOREIGN KEY (`user_qualifications_userExperience`)
    REFERENCES `mydb`.`user_qualifications` (`userExperience`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_data_time1`
    FOREIGN KEY (`time_timestamp`)
    REFERENCES `mydb`.`time` (`timestamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_data_Activity_Log1`
    FOREIGN KEY (`Activity_Log_EventID`)
    REFERENCES `mydb`.`Activity_Log` (`EventID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Job_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Job_type` (
  `JobTypeID` INT GENERATED ALWAYS AS () VIRTUAL,
  `JobInterests` BLOB NULL,
  `JobType` VARCHAR(45) NULL,
  PRIMARY KEY (`JobTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Job_postings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Job_postings` (
  `JobPostID` INT GENERATED ALWAYS AS () VIRTUAL,
  `JobTransportationProvided?` BIT(5) NULL,
  `JobOrganization` VARCHAR(45) NULL,
  `JobEmail` VARCHAR(60) NULL,
  `JobPhoneNumber` INT NULL,
  `JobWage` BLOB NULL,
  `JobFlexibleHours?` VARCHAR(45) NULL,
  `JobDescription` BLOB NULL,
  `JobApplicationDeadline` DATETIME NULL,
  `JobDatePosted` DATETIME GENERATED ALWAYS AS () VIRTUAL,
  `JobUserLocation_JobLocationID` INT NOT NULL,
  `Activity_Log_EventID` INT NOT NULL,
  `Job_type_JobTypeID` INT NOT NULL,
  `time_timestamp` DATETIME NOT NULL,
  `user_qualifications_userExperience` BLOB NOT NULL,
  `JobUserLocation_JobLocationID1` INT NOT NULL,
  PRIMARY KEY (`JobPostID`),
  INDEX `fk_Job_postings_JobUserLocation1_idx` (`JobUserLocation_JobLocationID` ASC),
  INDEX `fk_Job_postings_Activity_Log1_idx` (`Activity_Log_EventID` ASC),
  INDEX `fk_Job_postings_Job_type1_idx` (`Job_type_JobTypeID` ASC),
  INDEX `fk_Job_postings_time1_idx` (`time_timestamp` ASC),
  INDEX `fk_Job_postings_user_qualifications1_idx` (`user_qualifications_userExperience` ASC),
  INDEX `fk_Job_postings_JobUserLocation2_idx` (`JobUserLocation_JobLocationID1` ASC),
  CONSTRAINT `fk_Job_postings_JobUserLocation1`
    FOREIGN KEY (`JobUserLocation_JobLocationID`)
    REFERENCES `mydb`.`JobUserLocation` (`JobLocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_postings_Activity_Log1`
    FOREIGN KEY (`Activity_Log_EventID`)
    REFERENCES `mydb`.`Activity_Log` (`EventID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_postings_Job_type1`
    FOREIGN KEY (`Job_type_JobTypeID`)
    REFERENCES `mydb`.`Job_type` (`JobTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_postings_time1`
    FOREIGN KEY (`time_timestamp`)
    REFERENCES `mydb`.`time` (`timestamp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_postings_user_qualifications1`
    FOREIGN KEY (`user_qualifications_userExperience`)
    REFERENCES `mydb`.`user_qualifications` (`userExperience`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_postings_JobUserLocation2`
    FOREIGN KEY (`JobUserLocation_JobLocationID1`)
    REFERENCES `mydb`.`JobUserLocation` (`JobLocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Job_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Job_tags` (
  `Job_postings_JobPostID` INT NOT NULL,
  `User_data_userID` INT NOT NULL,
  INDEX `fk_Job_tags_Job_postings1_idx` (`Job_postings_JobPostID` ASC),
  INDEX `fk_Job_tags_User_data1_idx` (`User_data_userID` ASC),
  CONSTRAINT `fk_Job_tags_Job_postings1`
    FOREIGN KEY (`Job_postings_JobPostID`)
    REFERENCES `mydb`.`Job_postings` (`JobPostID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_tags_User_data1`
    FOREIGN KEY (`User_data_userID`)
    REFERENCES `mydb`.`User_data` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Job_postings_has_User_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Job_postings_has_User_data` (
  `Job_postings_JobPostID` INT NOT NULL,
  `User_data_userID` INT NOT NULL,
  PRIMARY KEY (`Job_postings_JobPostID`, `User_data_userID`),
  INDEX `fk_Job_postings_has_User_data_User_data1_idx` (`User_data_userID` ASC),
  INDEX `fk_Job_postings_has_User_data_Job_postings1_idx` (`Job_postings_JobPostID` ASC),
  CONSTRAINT `fk_Job_postings_has_User_data_Job_postings1`
    FOREIGN KEY (`Job_postings_JobPostID`)
    REFERENCES `mydb`.`Job_postings` (`JobPostID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_postings_has_User_data_User_data1`
    FOREIGN KEY (`User_data_userID`)
    REFERENCES `mydb`.`User_data` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
