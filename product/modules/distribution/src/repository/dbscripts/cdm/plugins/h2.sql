
-- -----------------------------------------------------
-- Table `MBL_DEVICE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MBL_DEVICE` (
  `MOBILE_DEVICE_ID` VARCHAR(45) NOT NULL ,
  `REG_ID` VARCHAR(45) NULL DEFAULT NULL ,
  `IMEI` VARCHAR(45) NULL DEFAULT NULL ,
  `IMSI` VARCHAR(45) NULL DEFAULT NULL ,
  `OS_VERSION` VARCHAR(45) NULL DEFAULT NULL ,
  `DEVICE_MODEL` VARCHAR(45) NULL DEFAULT NULL ,
  `VENDOR` VARCHAR(45) NULL DEFAULT NULL ,
  `LATITUDE` VARCHAR(45) NULL DEFAULT NULL,
  `LONGITUDE` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`MOBILE_DEVICE_ID`) );


-- -----------------------------------------------------
-- Table `MBL_FEATURE`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MBL_FEATURE` (
  `FEATURE_ID` INT NOT NULL AUTO_INCREMENT ,
  `CODE` VARCHAR(45) NOT NULL ,
  `NAME` VARCHAR(100) NULL ,
  `DESCRIPTION` VARCHAR(200) NULL ,
  PRIMARY KEY (`FEATURE_ID`) );

-- -----------------------------------------------------
-- Table `MBL_OPERATION`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MBL_OPERATION` (
  `OPERATION_ID` INT NOT NULL AUTO_INCREMENT ,
  `FEATURE_CODE` VARCHAR(45) NOT NULL ,
  `CREATED_DATE` BIGINT NULL ,
  PRIMARY KEY (`OPERATION_ID`));

-- -----------------------------------------------------
-- Table `MBL_DEVICE_OPERATION_MAPPING`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MBL_DEVICE_OPERATION_MAPPING` (
  `DEVICE_ID` VARCHAR(45) NOT NULL ,
  `OPERATION_ID` INT NOT NULL ,
  `SENT_DATE` BIGINT NULL ,
  `RECEIVED_DATE` BIGINT NULL ,
  `STATUS` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`DEVICE_ID`, `OPERATION_ID`) ,
  CONSTRAINT `fk_MBL_DEVICE_OPERATION_MBL_DEVICE`
    FOREIGN KEY (`DEVICE_ID` )
    REFERENCES `MBL_DEVICE` (`MOBILE_DEVICE_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MBL_DEVICE_OPERATION_MBL_OPERATION1`
    FOREIGN KEY (`OPERATION_ID` )
    REFERENCES `MBL_OPERATION` (`OPERATION_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `MBL_OPERATION_PROPERTY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MBL_OPERATION_PROPERTY` (
  `OPERATION_ID` INT NOT NULL ,
  `PROPERTY` VARCHAR(45) NOT NULL ,
  `VALUE` TEXT NULL ,
  PRIMARY KEY (`OPERATION_ID`, `PROPERTY`) ,
  CONSTRAINT `fk_MBL_OPERATION_PROPERTY_MBL_OPERATION1`
    FOREIGN KEY (`OPERATION_ID` )
    REFERENCES `MBL_OPERATION` (`OPERATION_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `MBL_FEATURE_PROPERTY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MBL_FEATURE_PROPERTY` (
  `PROPERTY` VARCHAR(45) NOT NULL ,
  `FEATURE_ID` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`PROPERTY`) ,
  CONSTRAINT `fk_MBL_FEATURE_PROPERTY_MBL_FEATURE1`
    FOREIGN KEY (`FEATURE_ID` )
    REFERENCES `MBL_FEATURE` (`FEATURE_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
