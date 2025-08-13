-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema doancntt
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema doancntt
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `doancntt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `doancntt` ;

-- -----------------------------------------------------
-- Table `doancntt`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doancntt`.`users` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TaiKhoan` VARCHAR(50) NOT NULL,
  `MatKhau` VARCHAR(100) NOT NULL,
  `TenNguoiMua` VARCHAR(100) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Sdt` VARCHAR(100) NULL DEFAULT NULL,
  `DiaChi` VARCHAR(300) NULL DEFAULT NULL,
  `ChucVu` ENUM('USER', 'ADMIN') NULL DEFAULT 'USER',
  `google_id` VARCHAR(255) NULL DEFAULT NULL,
  `google_email` VARCHAR(100) NULL DEFAULT NULL,
  `GoogleId` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `TaiKhoan` (`TaiKhoan` ASC) VISIBLE,
  UNIQUE INDEX `Email` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `google_id` (`google_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `doancntt`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doancntt`.`products` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenSanPham` VARCHAR(100) NOT NULL,
  `Gia` INT NOT NULL,
  `MoTa` TEXT NULL DEFAULT NULL,
  `SoLuongCon` INT NOT NULL,
  `HinhAnh` VARCHAR(255) NULL DEFAULT NULL,
  `SoLuongTruyCap` INT NULL DEFAULT '0',
  `LoaiSanPham` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `doancntt`.`giohang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doancntt`.`giohang` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `soLuong` INT NOT NULL,
  `ngayThem` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `giohang_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `doancntt`.`users` (`ID`),
  CONSTRAINT `giohang_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `doancntt`.`products` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `doancntt`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doancntt`.`orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_NguoiMua` INT NOT NULL,
  `TongSoLuong` INT NOT NULL,
  `ThanhTien` INT NOT NULL,
  `TrangThai` VARCHAR(20) NOT NULL,
  `NgayMua` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  INDEX `ID_NguoiMua` (`ID_NguoiMua` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`ID_NguoiMua`)
    REFERENCES `doancntt`.`users` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `doancntt`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doancntt`.`order_items` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `SoLuong` INT NOT NULL,
  `DonGia` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `order_id` (`order_id` ASC) VISIBLE,
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `order_items_ibfk_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `doancntt`.`orders` (`ID`),
  CONSTRAINT `order_items_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `doancntt`.`products` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `doancntt`.`product_reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doancntt`.`product_reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NOT NULL,
  `review_text` TEXT NULL DEFAULT NULL,
  `review_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `product_reviews_ibfk_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `doancntt`.`products` (`ID`),
  CONSTRAINT `product_reviews_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `doancntt`.`users` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `doancntt`.`shipping_methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `doancntt`.`shipping_methods` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TenPhuongThuc` VARCHAR(100) NOT NULL,
  `PhiVanChuyen` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
