-- MySQL Script generated by MySQL Workbench
-- 06/20/24 10:30:05
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_marmitaria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_marmitaria` ;

-- -----------------------------------------------------
-- Schema db_marmitaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_marmitaria` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `db_marmitaria` ;

-- -----------------------------------------------------
-- Table `db_marmitaria`.`marmitas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`marmitas` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`marmitas` (
  `idMarmitas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `tamanho` VARCHAR(5) NOT NULL,
  `preco` DOUBLE NOT NULL,
  PRIMARY KEY (`idMarmitas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`bebidas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`bebidas` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`bebidas` (
  `idBebidas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `tamanho` VARCHAR(5) NOT NULL,
  `preco` DOUBLE NOT NULL,
  PRIMARY KEY (`idBebidas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`vendas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`vendas` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`vendas` (
  `idVendas` INT NOT NULL AUTO_INCREMENT,
  `data_da_venda` DATE NOT NULL,
  `valor` DOUBLE NOT NULL,
  PRIMARY KEY (`idVendas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`vendas_bebidas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`vendas_bebidas` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`vendas_bebidas` (
  `idVendas` INT NOT NULL,
  `idBebidas` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `total` DOUBLE NOT NULL,
  PRIMARY KEY (`idVendas`, `idBebidas`),
  INDEX `fk_Vendas_Bebidas_Bebidas1_idx` (`idBebidas` ASC),
  INDEX `fk_Vendas_Bebidas_Vendas_idx` (`idVendas` ASC),
  CONSTRAINT `fk_Vendas_Bebidas_Vendas`
    FOREIGN KEY (`idVendas`)
    REFERENCES `db_marmitaria`.`vendas` (`idVendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Bebidas_Bebidas1`
    FOREIGN KEY (`idBebidas`)
    REFERENCES `db_marmitaria`.`bebidas` (`idBebidas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`vendas_marmitas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`vendas_marmitas` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`vendas_marmitas` (
  `idVendas` INT NOT NULL,
  `idMarmitas` INT NOT NULL,
  `quantidades` INT NOT NULL,
  `total` DOUBLE NOT NULL,
  PRIMARY KEY (`idVendas`, `idMarmitas`),
  INDEX `fk_Vendas_Marmita_Marmita1_idx` (`idMarmitas` ASC),
  INDEX `fk_Vendas_Marmita_Vendas1_idx` (`idVendas` ASC),
  CONSTRAINT `fk_Vendas_Marmita_Vendas1`
    FOREIGN KEY (`idVendas`)
    REFERENCES `db_marmitaria`.`vendas` (`idVendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Marmita_Marmita1`
    FOREIGN KEY (`idMarmitas`)
    REFERENCES `db_marmitaria`.`marmitas` (`idMarmitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`usuarios` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NULL,
  `login` VARCHAR(30) NULL,
  `pass` VARCHAR(15) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`itens_adicionais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`itens_adicionais` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`itens_adicionais` (
  `iditens_adicionais` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `obs` VARCHAR(255) NULL,
  `preco` DOUBLE NOT NULL,
  PRIMARY KEY (`iditens_adicionais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`vendas_marmitas_itens_adicionais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`vendas_marmitas_itens_adicionais` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`vendas_marmitas_itens_adicionais` (
  `idVendas` INT NOT NULL,
  `idMarmitas` INT NOT NULL,
  `iditens_adicionais` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `total` DOUBLE NOT NULL,
  PRIMARY KEY (`idVendas`, `idMarmitas`, `iditens_adicionais`),
  INDEX `fk_vendas_marmitas_has_itens_adicionais_itens_adicionais1_idx` (`iditens_adicionais` ASC),
  INDEX `fk_vendas_marmitas_has_itens_adicionais_vendas_marmitas1_idx` (`idVendas` ASC, `idMarmitas` ASC),
  CONSTRAINT `fk_vendas_marmitas_itens_adicionais_vendas_marmitas1`
    FOREIGN KEY (`idVendas` , `idMarmitas`)
    REFERENCES `db_marmitaria`.`vendas_marmitas` (`idVendas` , `idMarmitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_marmitas_itens_adicionais_itens_adicionais1`
    FOREIGN KEY (`iditens_adicionais`)
    REFERENCES `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`sobremesas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`sobremesas` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`sobremesas` (
  `idsobremesas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `tamanho` VARCHAR(10) NOT NULL,
  `preco` DOUBLE NOT NULL,
  PRIMARY KEY (`idsobremesas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`itens_sobremesa_adicionais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`itens_sobremesa_adicionais` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`itens_sobremesa_adicionais` (
  `iditens_sobremesa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `obs` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  PRIMARY KEY (`iditens_sobremesa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`vendas_sobremesas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`vendas_sobremesas` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`vendas_sobremesas` (
  `idVendas` INT NOT NULL,
  `idsobremesas` INT NOT NULL,
  PRIMARY KEY (`idVendas`, `idsobremesas`),
  INDEX `fk_vendas_has_sobremesas_sobremesas1_idx` (`idsobremesas` ASC),
  INDEX `fk_vendas_has_sobremesas_vendas1_idx` (`idVendas` ASC),
  CONSTRAINT `fk_vendas_sobremesas_vendas1`
    FOREIGN KEY (`idVendas`)
    REFERENCES `db_marmitaria`.`vendas` (`idVendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_sobremesas_sobremesas1`
    FOREIGN KEY (`idsobremesas`)
    REFERENCES `db_marmitaria`.`sobremesas` (`idsobremesas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_marmitaria`.`vendas_sobremesas_itens_sobremesa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_marmitaria`.`vendas_sobremesas_itens_sobremesa` ;

CREATE TABLE IF NOT EXISTS `db_marmitaria`.`vendas_sobremesas_itens_sobremesa` (
  `idVendas` INT NOT NULL,
  `idsobremesas` INT NOT NULL,
  `iditens_sobremesa` INT NOT NULL,
  PRIMARY KEY (`idVendas`, `idsobremesas`, `iditens_sobremesa`),
  INDEX `fk_vendas_has_sobremesas_has_itens_sobremesa_itens_sobremes_idx` (`iditens_sobremesa` ASC),
  INDEX `fk_vendas_has_sobremesas_has_itens_sobremesa_vendas_has_sob_idx` (`idVendas` ASC, `idsobremesas` ASC),
  CONSTRAINT `fk_vendas_sobremesas_itens_sobremesa_vendas_sobre1`
    FOREIGN KEY (`idVendas` , `idsobremesas`)
    REFERENCES `db_marmitaria`.`vendas_sobremesas` (`idVendas` , `idsobremesas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_sobremesas_itens_sobremesa_itens_sobremesa1`
    FOREIGN KEY (`iditens_sobremesa`)
    REFERENCES `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`marmitas`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (1, 'prato tradicional', 'P', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (2, 'prato tradicional', 'M', 23.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (3, 'prato tradicional', 'G', 26.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (4, 'strogonoff ', 'P', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (5, 'strogonoff', 'M', 22.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (6, 'strogonoff', 'G', 24.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (7, 'parmegiana de frango', 'M', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (8, 'churrasco', 'P', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (9, 'churrasco', 'M', 26.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (10, 'churrasco', 'G', 29.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (11, 'só strogonoff', 'M', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (12, 'escondidinho de carne', 'P', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (13, 'escondidinho de carne', 'M', 23.50);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (14, 'escondidinho de carne', 'G', 27.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (15, 'bobo de camarao', 'M', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (16, 'bobo de camarao', 'G', 32.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (17, 'file mignon grelhado com molho de cogumelos', 'M', 26.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (18, 'file mignon grelhado com molho de cogumelos', 'G', 33.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (19, 'lagosta', 'unico', 150.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (20, 'salmom grelhado', 'M', 26.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (21, 'salmom grelhado', 'G', 29.50);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (22, 'feijoada', 'M', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (23, 'feijoada', 'G', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (24, 'lasanha de legumes assados', 'P', 16.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (25, 'lasanha de legumes assados', 'G', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (26, 'bolinho de quinoa e vegetais', 'unico', 29.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (27, 'macarrao com queijo gratinado', 'M', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (28, 'macarrao com queijo gratinado', 'G', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (29, 'cuzcuz', 'unico', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (30, 'Arroz carreteiro', 'P', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (31, 'Arroz carreteiro', 'M', 22.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (32, 'Arroz carreteiro', 'G', 24.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (33, 'risotto', 'unico', 35.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (34, 'file cubana', 'unico', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (35, 'caldo de carne', 'M', 20.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (36, 'caldo de carne', 'G', 25.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (37, 'picanha na brasa', 'inico', 45.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (38, 'tofu grelhado com legumes assado', 'unico', 35.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (39, 'carne de sol com queijo coalho', '600g', 63.00);
INSERT INTO `db_marmitaria`.`marmitas` (`idMarmitas`, `nome`, `tamanho`, `preco`) VALUES (40, 'panqueca', 'unico', 20.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`bebidas`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (1, 'coca-cola lata', '350ml', 5.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (2, 'coca-cola/fanta/sprite', '600ml', 7.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (3, 'cerveja/brahma/skol', '350ml', 7.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (4, 'cha gelado', '450ml', 7.50);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (5, 'agua com gas', '500ml', 3.50);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (6, 'agua mineral', '500ml', 3.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (7, 'suco natural laranja/limao/morango', '1.5l', 15.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (8, 'guarana kuat', '2l', 7.50);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (9, 'energetico monster', '473ml', 12.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (10, 'caipirinha', '350ml', 25.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (11, 'Sex on the Beach', '300ml', 50.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (12, 'margarita', '450ml', 35.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (13, 'suco de acai', '400ml', 20.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (14, 'suco de acai', '200ml', 15.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (15, 'suco de uva tinto integral garibaldi', '1.5l', 18.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (16, 'suco verde', '500ml', 25.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (17, 'suco de pitaya com acai', '200ml', 10.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (18, 'suco de pitaia com acai', '500ml', 16.00);
INSERT INTO `db_marmitaria`.`bebidas` (`idBebidas`, `nome`, `tamanho`, `preco`) VALUES (19, 'vinho DV catena cabernet malbec', '750ml', 116.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`vendas`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`vendas` (`idVendas`, `data_da_venda`, `valor`) VALUES (1, '2024-05-27', 121.00);
INSERT INTO `db_marmitaria`.`vendas` (`idVendas`, `data_da_venda`, `valor`) VALUES (2, '2024-05-27', 48.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`vendas_bebidas`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`vendas_bebidas` (`idVendas`, `idBebidas`, `quantidade`, `total`) VALUES (1, 2, 2, 14.00);
INSERT INTO `db_marmitaria`.`vendas_bebidas` (`idVendas`, `idBebidas`, `quantidade`, `total`) VALUES (2, 3, 1, 7.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`vendas_marmitas`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`vendas_marmitas` (`idVendas`, `idMarmitas`, `quantidades`, `total`) VALUES (1, 10, 2, 46.00);
INSERT INTO `db_marmitaria`.`vendas_marmitas` (`idVendas`, `idMarmitas`, `quantidades`, `total`) VALUES (1, 7, 3, 75.00);
INSERT INTO `db_marmitaria`.`vendas_marmitas` (`idVendas`, `idMarmitas`, `quantidades`, `total`) VALUES (2, 10, 1, 23.00);
INSERT INTO `db_marmitaria`.`vendas_marmitas` (`idVendas`, `idMarmitas`, `quantidades`, `total`) VALUES (2, 7, 1, 25.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`itens_adicionais`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (1, 'bata frita', '100g', 3.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (2, 'bife', '30g unidade', 5.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (3, 'salada', '100g unidade', 2.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (4, 'ovo', '1 unidade', 0.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (5, 'farofa', '60g', 1.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (6, 'linguica', '1 unidade', 1.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (7, 'torresmo', '70g', 4.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (8, 'arroz', 'P', 5.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (9, 'lugumes ao vapor', '120g', 5.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (10, 'torrada com pate', 'unico', 5.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (11, 'abacaxi grelhado', 'unico', 6.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (12, 'pimentao assado', 'unico', 4.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (13, 'molho de alho', '1 unidade', 2.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (14, 'molho de motarda e mel', '1 unidade', 2.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (15, 'vinagrete', '1 unidade', 2.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (16, 'mandioca', '200g', 4.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (17, 'aneis de cebola', '100g', 1.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (18, 'queijo coalho grelhado', '150g', 6.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (19, 'pure de batata com bacon', '150g', 12.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (20, 'manteiga de ervas ', '50ml', 5.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (21, 'carne seca', '100g', 5.50);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (22, 'arroz', 'M', 18.00);
INSERT INTO `db_marmitaria`.`itens_adicionais` (`iditens_adicionais`, `nome`, `obs`, `preco`) VALUES (23, 'arroz', 'G', 24.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`vendas_marmitas_itens_adicionais`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`vendas_marmitas_itens_adicionais` (`idVendas`, `idMarmitas`, `iditens_adicionais`, `quantidade`, `total`) VALUES (1, 10, 1, 2, 6.00);
INSERT INTO `db_marmitaria`.`vendas_marmitas_itens_adicionais` (`idVendas`, `idMarmitas`, `iditens_adicionais`, `quantidade`, `total`) VALUES (1, 10, 4, 1, 0.50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`sobremesas`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (1, 'bolo de chocolate', '15cm', 20.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (2, 'torta de maca a fatia', '11cm', 12.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (3, 'cheesecake', '12cm', 20.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (4, 'torta de morango', '11cm', 14.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (5, 'torta de limao', '11cm', 13.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (6, 'pudim de leite condensado', '100g', 12.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (7, 'pudim de pao', '100g', 10.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (8, 'tapioca doce', 'unidade', 10.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (9, 'pave de ouro branco', 'unidade', 9.50);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (10, 'pave de morango', 'unidade', 9.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (11, 'musse de maracuja', 'unidade', 10.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (12, 'crepe de nutella e banana', 'unidade', 15.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (13, 'brigadeiro', '2 unidade', 5.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (14, 'petit gateau', 'unidade', 15.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (15, 'salada de frutas', '350g', 5.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (16, 'acai', '300ml', 15.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (17, 'acai', '500ml', 20.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (18, 'milk shake ovomaltine', '500ml', 15.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (19, 'milk shake de oreo', '500ml', 18.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (20, 'milk sahake de morango', '500ml', 15.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (21, 'milk shake de maracuja', '500ml', 15.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (22, 'milk shake de chiclete', '200ml', 9.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (23, 'milk shake de ouro branco', '500ml', 18.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (24, 'bolo de kinder bueno', '15cm', 20.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (25, 'bolo de leite ninho com morango', '17cm', 25.00);
INSERT INTO `db_marmitaria`.`sobremesas` (`idsobremesas`, `nome`, `tamanho`, `preco`) VALUES (26, 'bolo de cenoura com chocolate', '15cm', 20.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db_marmitaria`.`itens_sobremesa_adicionais`
-- -----------------------------------------------------
START TRANSACTION;
USE `db_marmitaria`;
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (1, 'raspas de chocolate', '20g', 1.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (2, 'granaola', '20g', 1.50);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (3, 'sorvete de creme', '1 bola', 2.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (4, 'biscoito', '3 unidade', 4.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (5, 'coco ralado', '30g', 1.50);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (6, 'nozes ou castanhas ', '30g', 2.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (7, 'molho de caramelo salgado', '2 colheres', 1.99);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (8, 'molho de chocolate branco', '2 colheres', 2.25);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (9, 'creme de pistache', '30g', 3.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (10, 'merengue italiano', '2 colheres', 2.50);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (11, 'morango', 'unidade', 1.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (12, 'uva', '4 unidade', 1.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (13, 'kitkat', 'unidade', 4.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (14, 'cobertura de morango', '50g', 1.50);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (15, 'cobertura de morango', '50g', 1.50);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (16, 'cobertura de limao', '50g', 1.50);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (17, 'ouro branco', 'unidade', 1.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (18, 'sonho de valsa', 'unidade', 1.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (19, 'choco batao', 'unidade', 1.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (20, 'ferrero rocher', '2 unidade', 4.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (21, 'raffallo', '2 unidade', 4.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (22, 'bis', '4 unidade', 2.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (23, 'chocoball', 'unidade', 2.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (24, 'ovomaltine', '50g', 4.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (25, 'kiwi', 'unidade', 4.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (26, 'nutella', '2 colher', 5.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (27, 'cafe', 'xicara', 5.00);
INSERT INTO `db_marmitaria`.`itens_sobremesa_adicionais` (`iditens_sobremesa`, `nome`, `obs`, `preco`) VALUES (28, 'cafe expresso', 'xicara', 12.00);

COMMIT;

