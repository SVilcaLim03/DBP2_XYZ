-- MySQL Script generated by MySQL Workbench
-- Fri Jul 30 15:13:48 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema electrodomesticos_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema electrodomesticos_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `electrodomesticos_store` DEFAULT CHARACTER SET utf8mb4 ;
USE `electrodomesticos_store` ;

-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`producto` (
  `id_producto` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `precio` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`tipo_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`tipo_producto` (
  `id_tipo` INT(11) NOT NULL,
  `nombre_tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`stock_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`stock_productos` (
  `id_stock` INT(11) NOT NULL,
  `tipo` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_stock`, `tipo`),
  INDEX `tipo_idx` (`tipo` ASC),
  CONSTRAINT `tipo`
    FOREIGN KEY (`tipo`)
    REFERENCES `electrodomesticos_store`.`tipo_producto` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`actualizacion_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`actualizacion_stock` (
  `id_stock` INT(11) NOT NULL,
  `id_prod` INT(11) NOT NULL,
  PRIMARY KEY (`id_stock`, `id_prod`),
  INDEX `producto_idx` (`id_prod` ASC),
  CONSTRAINT `producto`
    FOREIGN KEY (`id_prod`)
    REFERENCES `electrodomesticos_store`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stock`
    FOREIGN KEY (`id_stock`)
    REFERENCES `electrodomesticos_store`.`stock_productos` (`id_stock`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`cargos` (
  `id_cargos` INT(11) NOT NULL,
  `nombre_cargo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cargos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`persona` (
  `DNI` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `edad` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `genero` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`cliente_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`cliente_usuario` (
  `id_cliente` INT(11) NOT NULL,
  `DNI_cliente` INT(11) NOT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`, `DNI_cliente`),
  INDEX `dni_persona_idx` (`DNI_cliente` ASC),
  CONSTRAINT `dni_persona`
    FOREIGN KEY (`DNI_cliente`)
    REFERENCES `electrodomesticos_store`.`persona` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`personal` (
  `id_personal` INT(11) NOT NULL,
  `DNI_personal` INT(11) NOT NULL,
  `id_cargo` INT(11) NULL DEFAULT NULL,
  `sueldo` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id_personal`, `DNI_personal`),
  UNIQUE INDEX `id_cargo_UNIQUE` (`id_cargo` ASC),
  INDEX `DNI_personal_idx` (`DNI_personal` ASC),
  CONSTRAINT `DNI_personal`
    FOREIGN KEY (`DNI_personal`)
    REFERENCES `electrodomesticos_store`.`persona` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cargos`
    FOREIGN KEY (`id_cargo`)
    REFERENCES `electrodomesticos_store`.`cargos` (`id_cargos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`compra_presencial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`compra_presencial` (
  `id_cliente` INT(11) NOT NULL,
  `id_producto` INT(11) NOT NULL,
  `id_personal` INT(11) NOT NULL,
  PRIMARY KEY (`id_cliente`, `id_personal`, `id_producto`),
  INDEX `producto_compra_idx` (`id_producto` ASC),
  INDEX `producto_personal_idx` (`id_personal` ASC),
  CONSTRAINT `producto_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `electrodomesticos_store`.`cliente_usuario` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `producto_compra`
    FOREIGN KEY (`id_producto`)
    REFERENCES `electrodomesticos_store`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `producto_personal`
    FOREIGN KEY (`id_personal`)
    REFERENCES `electrodomesticos_store`.`personal` (`id_personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`entidad_federativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`entidad_federativa` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `entidad_sucursal_idx` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`sucursal` (
  `id_sucursal` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`entidad_sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`entidad_sucursal` (
  `id_entidad` INT(11) NOT NULL,
  `id_sucursal` INT(11) NOT NULL,
  PRIMARY KEY (`id_entidad`, `id_sucursal`),
  INDEX `entidad_fed_sucursal_idx` (`id_sucursal` ASC),
  CONSTRAINT `entidad_fed`
    FOREIGN KEY (`id_entidad`)
    REFERENCES `electrodomesticos_store`.`entidad_federativa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `entidad_fed_sucursal`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `electrodomesticos_store`.`sucursal` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`vale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`vale` (
  `id_vale` INT(11) NOT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id_vale`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`personal_vale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`personal_vale` (
  `id_personal` INT(11) NOT NULL,
  `id_vale` INT(11) NOT NULL,
  PRIMARY KEY (`id_personal`, `id_vale`),
  INDEX `vale_idx` (`id_vale` ASC),
  CONSTRAINT `vale`
    FOREIGN KEY (`id_vale`)
    REFERENCES `electrodomesticos_store`.`vale` (`id_vale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`reservacion` (
  `id_cliente` INT(11) NOT NULL,
  `id_producto` INT(11) NOT NULL,
  PRIMARY KEY (`id_cliente`, `id_producto`),
  INDEX `reservacion_prod_idx` (`id_producto` ASC),
  CONSTRAINT `reservacion_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `electrodomesticos_store`.`cliente_usuario` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reservacion_prod`
    FOREIGN KEY (`id_producto`)
    REFERENCES `electrodomesticos_store`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`sucursal_personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`sucursal_personal` (
  `id_sucursal` INT(11) NOT NULL,
  `id_personal` INT(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`, `id_personal`),
  INDEX `personal_idx` (`id_personal` ASC),
  CONSTRAINT `personal`
    FOREIGN KEY (`id_personal`)
    REFERENCES `electrodomesticos_store`.`personal` (`id_personal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sucursal`
    FOREIGN KEY (`id_personal`)
    REFERENCES `electrodomesticos_store`.`sucursal` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`sucursal_stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`sucursal_stock` (
  `id_sucursal` INT(11) NOT NULL,
  `id_stock` INT(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`, `id_stock`),
  INDEX `sucursal_stock_idx` (`id_stock` ASC),
  CONSTRAINT `sucursal_stock`
    FOREIGN KEY (`id_stock`)
    REFERENCES `electrodomesticos_store`.`stock_productos` (`id_stock`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sucursal_sucursal`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `electrodomesticos_store`.`sucursal` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`sucursal_stock_este`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`sucursal_stock_este` (
  `id_stock` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `tipo` INT(11) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`sucursal_stock_norte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`sucursal_stock_norte` (
  `id_stock` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `tipo` INT(11) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`sucursal_stock_oeste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`sucursal_stock_oeste` (
  `id_stock` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `tipo` INT(11) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`sucursal_stock_sur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`sucursal_stock_sur` (
  `id_stock` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `tipo` INT(11) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `electrodomesticos_store`.`vale_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `electrodomesticos_store`.`vale_cliente` (
  `id_vale` INT(11) NOT NULL,
  `id_cliente` INT(11) NOT NULL,
  PRIMARY KEY (`id_vale`, `id_cliente`),
  INDEX `vale_cliente_idx` (`id_cliente` ASC),
  CONSTRAINT `vale_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `electrodomesticos_store`.`cliente_usuario` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vale_vale`
    FOREIGN KEY (`id_vale`)
    REFERENCES `electrodomesticos_store`.`vale` (`id_vale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;