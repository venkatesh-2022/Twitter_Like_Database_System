-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Twitter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Twitter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Twitter` DEFAULT CHARACTER SET utf8 ;
USE `Twitter` ;

-- -----------------------------------------------------
-- Table `Twitter`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Twitter`.`User` (
  `user_id` INT(11) NOT NULL,
  `first_name` VARCHAR(150) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(300) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(150) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `country` VARCHAR(25) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `mobile_number` VARCHAR(45) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `userName_UNIQUE` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `mobileNumber_UNIQUE` (`mobile_number` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Twitter`.`Followers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Twitter`.`Followers` (
  `id` INT(20) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `follower_user_id` INT(11) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `User_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `followerId_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Followers_User_idx` (`User_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Followers_User`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `Twitter`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Twitter`.`Following`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Twitter`.`Following` (
  `id` INT(20) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `following_user_id` INT(11) NOT NULL,
  `created` DATETIME(6) NOT NULL,
  `User_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `followingId_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Following_User_idx` (`User_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Following_User`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `Twitter`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Twitter`.`Feed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Twitter`.`Feed` (
  `id` INT(20) NOT NULL,
  `created_at` DATETIME(6) NOT NULL,
  `feed` LONGTEXT NOT NULL,
  `user_id` INT(11) NOT NULL,
  `User_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Feed_User1_idx` (`User_user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Feed_User1`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `Twitter`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Twitter`.`Comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Twitter`.`Comments` (
  `id` INT(20) NOT NULL,
  `feed_id` INT(20) NOT NULL,
  `comment` LONGTEXT NOT NULL,
  `created_at` DATETIME(6) NOT NULL,
  commented_by_id INT(11) NOT NULL,
  `Feed_id1` INT(20) NOT NULL,
  `Feed_user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comments_Feed1_idx` (`Feed_id1` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Comments_Feed1`
    FOREIGN KEY (`Feed_id1`)
    REFERENCES `Twitter`.`Feed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Twitter`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Twitter`.`likes` (
  `id` INT(20) NOT NULL,
  `created_at` DATETIME(6) NOT NULL,
  `feed_id` INT(20) NOT NULL,
  `liked_by_id` INT(20) NOT NULL,
  `Feed_id1` INT(20) NOT NULL,
  `Feed_user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_likes_Feed1_idx` (`Feed_id1` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_Feed1`
    FOREIGN KEY (`Feed_id1`)
    REFERENCES `Twitter`.`Feed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Twitter`.`Retweet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Twitter`.`Retweet` (
  `id` INT(20) NOT NULL,
  `feed_id` INT(20) NOT NULL,
  `created_at` DATETIME(6) NOT NULL,
  `retweet_by_id` INT(20) NOT NULL,
  `Feed_id1` INT(20) NOT NULL,
  `Feed_user_user_id` INT(11) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Retweet_Feed1_idx` (`Feed_id1` ASC) VISIBLE,
  CONSTRAINT `fk_Retweet_Feed1`
    FOREIGN KEY (`Feed_id1`)
    REFERENCES `Twitter`.`Feed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- INSERT OPERATIONS-- 
-- (user_id, first_name, last_name, email, gender, password, user_name, date_of_birth, country, is_active, mobile_number, date_joined)-- 
INSERT INTO USER
VALUES(1, 'John', 'Len', 'johnlen@email.com', 'Male', 'johnlen3', 'johnlen', '1990-01-01', 'USA', 1, 9384384846, '2022-07-28 13:42:37');

INSERT INTO USER
VALUES(2, 'John', 'Karry', 'johnkarry@email.com', 'Male', 'johnkar@3', 'johnkar', '2000-03-29', 'Canada', 1, 8384284746, '2022-07-28 13:42:37'),(3, 'Kiran', 'N', 'kiranking@email.com', 'Male', 'kiran@7', 'kingkiran', '1998-11-23', 'USA', 1, 7346284729, '2022-07-28 13:42:37'),(4, 'James', 'Northan', 'jamesnorthan@email.com', 'Male', 'james@7', 'jamesnorthan', '1988-10-13', 'USA', 1, 8346384820, '2022-07-28 13:42:37'),(5, 'Mary', 'K', 'marykary@email.com', 'Female', 'Maryk$5', 'marykary5', '1953-03-30', 'Germany', 1, 6839583958, '2022-07-28 13:42:37'),(6, 'Robert', 'klawn', 'robertklawn@email.com', 'Male', 'robert@7', 'robertklawn', '1968-11-23', 'USA', 1, 9473857395, '2022-07-28 13:42:37'),(7, 'Patricia', 'sonar', 'patriciasonar@email.com', 'Female', 'patricia@7', 'patrisonar', '2003-10-11', 'USA', 1, 4959384038, '2022-07-28 13:42:37'),(8, 'Michael', 'Mickey', 'michaelm@email.com', 'Male', 'mickry@8', 'michaelm3', '1998-12-23', 'USA', 1, 6839483948, '2022-07-28 13:42:37'),(9, 'Jennifer', 'jen', 'jenniferjen@email.com', 'Female', 'jenny@7', 'jenny$3', '2003-01-13', 'USA', 1, 5637483947, '2022-07-28 13:42:37'),(10, 'David', 'Dariel', 'daviddariel3@email.com', 'Male', 'dariel@7', 'daviddariel', '1974-05-17', 'Canada', 0, 4869274859, '2022-07-28 13:42:37'),(11, 'Linda', 'Lir', 'lindalir@email.com', 'Female', 'Linda$9', 'lindalion', '2005-07-30', 'USA', 1, 9485837596, '2022-07-28 13:42:37'),(12, 'Elizabeth', 'Ellen', 'elizabethellen@email.com', 'Female', 'ellen$371', 'elizabethellen3', '1969-02-17', 'USA', 1, 4857263946, '2022-07-28 13:42:37'),(13, 'Wiliam', 'warry', 'williamw3@email.com', 'Male', 'william@31', 'william4', '1997-05-05', 'USA', 0, 8573034039, '2022-07-28 13:42:37'),(14, 'Barbara', 'bari', 'barbarabari4@email.com', 'Female', 'barbar@7', 'barbarabari2', '1968-04-14', 'USA', 1, 8903456193, '2022-07-28 13:42:37'),(15, 'Richard', 'Ranson', 'richardran@email.com', 'Male', 'richard@7', 'richardran3', '1988-09-19', 'USA', 1, 5729105648, '2022-07-28 13:42:37'),(16, 'susan', 'sunny', 'susansunny@email.com', 'Female', 'sunnysusan@7', 'susansunny', '2000-04-04', 'USA', 1, 6291057395, '2022-07-28 13:42:37'),(17, 'Joseph', 'Jonny', 'josephjonny4@email.com', 'Male', 'jonnyjos@7', 'josephjon3', '2002-02-12', 'USA', 1, 5739204759, '2022-07-28 13:42:37'),(18, 'Jessica', 'Jessi', 'Jessicajessi@email.com', 'Female', 'jessica@7', 'jessicajessi', '1996-12-31', 'USA', 1, 4901246294, '2022-07-28 13:42:37'),(19, 'Thomas', 'Nivetha', 'nivethathomas@email.com', 'Female', 'Nivethathomas@7', 'nivethathom3', '1997-12-25', 'India', 1, 5820461945, '2022-07-28 13:42:37'),(20, 'Christopher', 'Nolan', 'christophernolan4@email.com', 'Male', 'christopher@7', 'christopher3', '1957-10-20', 'USA', 1, 6734294850, '2022-07-28 13:42:37'),(21, 'Obama', 'Barac', 'obamabarac@email.com', 'Male', 'obama3@7', 'obamaarac34', '1971-05-10', 'USA', 1, 9013759450, '2022-07-28 13:42:37'),(22, 'Nancy', 'Nerin', 'nancynerin@email.com', 'Female', 'nancyner@7', 'nancynerin3', '1983-07-07', 'USA', 1, 6701235185, '2022-07-28 13:42:37'),(23, 'Amy', 'Jackson', 'amyjackson@email.com', 'Female', 'amyjack@7', 'amyjackson3', '1970-02-18', 'USA', 1, 4859124385, '2022-07-28 13:42:37'),(24, 'Scott', 'Fleming', 'scottflem3@email.com', 'Male', 'scottflem@7', 'scotfmem3', '1984-06-27', 'USA', 1, 9017539546, '2022-07-28 13:42:37'),(25, 'Catherine', 'Teresa', 'catherineteresa@email.com', 'Female', 'catherine@7', 'catherineteresa2', '1964-05-02', 'USA', 1, 8572934094, '2022-07-28 13:42:37'),(26, 'mahesh', 'gattamneni', 'maheshgattam3@email.com', 'Male', 'maheshbabu@7', 'maheshbabu3', '1973-10-11', 'India', 1, 8572934019, '2022-07-28 13:42:37'),(27, 'Tom', 'Crusie', 'tomcruise@email.com', 'Male', 'tomcruise@7', 'tomcruise5', '1965-12-03', 'USA', 1, 9013254718, '2022-07-28 13:42:37'),(28, 'Selena', 'Gomez', 'selenagomez3@email.com', 'Female', 'selenagom@7', 'selenagomez5', '1997-10-26', 'USA', 1, 9018549230, '2022-07-28 13:42:37'),(29, 'Christian', 'Corell', 'christiancorell3@email.com', 'Male', 'christian@7', 'christiancor3', '1985-03-09', 'USA', 1, 5481045729, '2022-07-28 13:42:37'),(30, 'Grace', 'Garry', 'gracegarry@email.com', 'Female', 'gracegarry@7', 'gracegarry5', '2001-09-12', 'USA', 1, 9823418495, '2022-07-28 13:42:37'),(31, 'Jordan', 'jonath', 'jordanjonath3@email.com', 'Male', 'jordanjon@7', 'jordanjonath1', '1963-03-18', 'USA', 1, 9018543921, '2022-07-28 13:42:37'),(32, 'Sophia', 'Sony', 'sophiasony@email.com', 'Female', 'sophiasony@7', 'sophiasony5', '1957-07-03', 'USA', 1, 4513859420, '2022-07-28 13:42:37'),(33, 'Albert', 'Einstein', 'einstein321@email.com', 'Male', 'einstein@7', 'alberteinstein3', '1931-08-24', 'USA', 1, 8437591034, '2022-07-28 13:42:37'),(34, 'Newton', 'Alison', 'newtonalison3@email.com', 'Male', 'newtonalison@7', 'newtonalison', '1949-04-10', 'USA', 1, 9012396329, '2022-07-28 13:42:37'),(35, 'Jason', 'Roy', 'jasonroy3@email.com', 'Male', 'jasonroy@7', 'jasonroy1', '1985-07-10', 'England', 1, 9018643026, '2022-07-28 13:42:37'),(36, 'Bruce', 'Lee', 'brucelee3@email.com', 'Male', 'brucelee@7', 'brucelee7', '1950-05-21', 'USA', 1, 6028569236, '2022-07-28 13:42:37'),(37, 'Alice', 'Ally', 'aliceally3@email.com', 'Female', 'aliceally@91', 'aliceally', '1989-04-05', 'USA', 1, 9814385492, '2022-07-28 13:42:37'),(38, 'Julia', 'Julius', 'juliajulius@email.com', 'Female', 'juliajulius@7', 'juliajulius4', '1974-10-01', 'USA', 1, 9018560923, '2022-07-28 13:42:37'),(39, 'Kayla', 'Kali', 'kaylakali3@email.com', 'Female', 'kaylakali@7', 'kaylakali4', '1992-03-19', 'USA', 1, 9017693740, '2022-07-28 13:42:37'),(40, 'Gerald', 'grandy', 'geraldgrandy3@email.com', 'Male', 'geraldgrandy@7', 'geraldgrandy3', '1996-05-03', 'USA', 1, 9048575710, '2022-07-28 13:42:37'),(41, 'Sara', 'Nara', 'saranara3@email.com', 'Female', 'saranara@7', 'saranara3', '1995-06-29', 'USA', 1, 4517395748, '2022-07-28 13:42:37'),(42, 'Roger', 'Reign', 'rogerreign3@email.com', 'Male', 'rogerreign3@7', 'rogerreign', '1978-04-29', 'USA', 1, 8475837582, '2022-07-28 13:42:37'),(43, 'Janice', 'Janial', 'janicejanial@email.com', 'Female', 'janialjanice@7', 'janialjanice2', '1988-12-01', 'USA', 1, 9012495472, '2022-07-28 13:42:37'),(44, 'Diana', 'Danny', 'DianaDany@email.com', 'Female', 'Dianadany@7', 'dnaydiana3', '1999-08-25', 'USA', 1, 9013842120, '2022-07-28 13:42:37'),(45, 'Marie', 'Moza', 'mariemoza@email.com', 'Female', 'mariemoza@7', 'mariemoza2', '2000-10-04', 'USA', 1, 9016781452, '2022-07-28 13:42:37'),(46, 'Mason', 'George', 'georgemason3@email.com', 'Male', 'masongeorge@7', 'georgemason3', '1993-07-22', 'USA', 1, 9815723491, '2022-07-28 13:42:37'),(47, 'Alexa', 'Ally', 'alexaally3@email.com', 'Female', 'alexaally@7', 'alexaally5', '1993-03-13', 'USA', 1, 6713491548, '2022-07-28 13:42:37'),(48, 'Logan', 'Larry', 'loganlarry5@email.com', 'Male', 'loganlarry@7', 'loganlarry3', '1992-01-13', 'USA', 1, 8329451023, '2022-07-28 13:42:37'),(49, 'will', 'smith', 'willsmith3@email.com', 'Male', 'willsmith@7', 'willsmith3', '1963-03-29', 'USA', 1, 8710341954, '2022-07-28 13:42:37'),(50, 'Martha', 'Maggie', 'marthamaggie3@email.com', 'Female', 'marthamaggie@7', 'marthamaggie2', '1977-07-03', 'USA', 1, 9012841953, '2022-07-28 13:42:37');

select * from user;

-- (id, user_id, follower_user_id, created, User_user_id)-- 
INSERT INTO Followers
VALUES(1, 1, 2, '2022-07-28 13:42:37', 1);

INSERT INTO Followers
VALUES(2, 2, 3, '2022-07-28 13:42:37', 2), (3, 3, 4, '2022-07-28 13:42:37', 3), (4, 4, 5, '2022-07-28 13:42:37', 4), (5, 5, 6, '2022-07-28 13:42:37', 5), (6, 6, 7, '2022-07-28 13:42:37', 6), (7, 7, 8, '2022-07-28 13:42:37', 7), (8, 8, 9, '2022-07-28 13:42:37', 8), (9, 9, 10, '2022-07-28 13:42:37', 9), (10, 10, 11, '2022-07-28 13:42:37', 10), (11, 11, 12, '2022-07-28 13:42:37', 11), (12, 12, 13, '2022-07-28 13:42:37', 12), (13, 13, 14, '2022-07-28 13:42:37', 13), (14, 14, 15, '2022-07-28 13:42:37', 14), (15, 15, 16, '2022-07-28 13:42:37', 15), (16, 16, 17, '2022-07-28 13:42:37', 16), (17, 17, 18, '2022-07-28 13:42:37', 17), (18, 18, 19, '2022-07-28 13:42:37', 18), (19, 19, 20, '2022-07-28 13:42:37', 19), (20, 20, 21, '2022-07-28 13:42:37', 20), (21, 21, 22, '2022-07-28 13:42:37', 21), (22, 22, 23, '2022-07-28 13:42:37', 22), (23, 23, 24, '2022-07-28 13:42:37', 23), (24, 24, 25, '2022-07-28 13:42:37', 24), (25, 25, 26, '2022-07-28 13:42:37', 25), (26, 26, 27, '2022-07-28 13:42:37', 26), (27, 27, 28, '2022-07-28 13:42:37', 27), (28, 28, 29, '2022-07-28 13:42:37', 28), (29, 29, 30, '2022-07-28 13:42:37', 29), (30, 30, 31, '2022-07-28 13:42:37', 30), (31, 31, 32, '2022-07-28 13:42:37', 31), (32, 32, 33, '2022-07-28 13:42:37', 32), (33, 33, 34, '2022-07-28 13:42:37', 33), (34, 34, 35, '2022-07-28 13:42:37', 34), (35, 35, 36, '2022-07-28 13:42:37', 35), (36, 36, 37, '2022-07-28 13:42:37', 36), (37, 37, 38, '2022-07-28 13:42:37', 37), (38, 38, 39, '2022-07-28 13:42:37', 38), (39, 39, 40, '2022-07-28 13:42:37', 39), (40, 40, 41, '2022-07-28 13:42:37', 40), (41, 41, 42, '2022-07-28 13:42:37', 41), (42, 42, 43, '2022-07-28 13:42:37', 42), (43, 43, 44, '2022-07-28 13:42:37', 43), (44, 44, 45, '2022-07-28 13:42:37', 44), (45, 45, 46, '2022-07-28 13:42:37', 45), (46, 46, 47, '2022-07-28 13:42:37', 46), (47, 47, 48, '2022-07-28 13:42:37', 47), (48, 48, 49, '2022-07-28 13:42:37', 48), (49, 49, 50, '2022-07-28 13:42:37', 49), (50, 50, 1, '2022-07-28 13:42:37', 50);

INSERT INTO Followers
VALUES(51, 1, 3, '2022-07-28 13:42:37', 1), (52, 1, 4, '2022-07-28 13:42:37', 1), (53, 1, 5, '2022-07-28 13:42:37', 1), (54, 1, 6, '2022-07-28 13:42:37', 1);

select * from Followers;

-- (id, user_id, following_user_id, created, User_user_id)-- 
INSERT INTO Following
VALUES(1, 1, 2, '2022-07-28 13:42:37', 1);

INSERT INTO Following
VALUES(2, 2, 3, '2022-07-28 13:42:37', 2), (3, 3, 4, '2022-07-28 13:42:37', 3), (4, 4, 5, '2022-07-28 13:42:37', 4), (5, 5, 6, '2022-07-28 13:42:37', 5), (6, 6, 7, '2022-07-28 13:42:37', 6), (7, 7, 8, '2022-07-28 13:42:37', 7), (8, 8, 9, '2022-07-28 13:42:37', 8), (9, 9, 10, '2022-07-28 13:42:37', 9), (10, 10, 11, '2022-07-28 13:42:37', 10), (11, 11, 12, '2022-07-28 13:42:37', 11), (12, 12, 13, '2022-07-28 13:42:37', 12), (13, 13, 14, '2022-07-28 13:42:37', 13), (14, 14, 15, '2022-07-28 13:42:37', 14), (15, 15, 16, '2022-07-28 13:42:37', 15), (16, 16, 17, '2022-07-28 13:42:37', 16), (17, 17, 18, '2022-07-28 13:42:37', 17), (18, 18, 19, '2022-07-28 13:42:37', 18), (19, 19, 20, '2022-07-28 13:42:37', 19), (20, 20, 21, '2022-07-28 13:42:37', 20), (21, 21, 22, '2022-07-28 13:42:37', 21), (22, 22, 23, '2022-07-28 13:42:37', 22), (23, 23, 24, '2022-07-28 13:42:37', 23), (24, 24, 25, '2022-07-28 13:42:37', 24), (25, 25, 26, '2022-07-28 13:42:37', 25), (26, 26, 27, '2022-07-28 13:42:37', 26), (27, 27, 28, '2022-07-28 13:42:37', 27), (28, 28, 29, '2022-07-28 13:42:37', 28), (29, 29, 30, '2022-07-28 13:42:37', 29), (30, 30, 31, '2022-07-28 13:42:37', 30), (31, 31, 32, '2022-07-28 13:42:37', 31), (32, 32, 33, '2022-07-28 13:42:37', 32), (33, 33, 34, '2022-07-28 13:42:37', 33), (34, 34, 35, '2022-07-28 13:42:37', 34), (35, 35, 36, '2022-07-28 13:42:37', 35), (36, 36, 37, '2022-07-28 13:42:37', 36), (37, 37, 38, '2022-07-28 13:42:37', 37), (38, 38, 39, '2022-07-28 13:42:37', 38), (39, 39, 40, '2022-07-28 13:42:37', 39), (40, 40, 41, '2022-07-28 13:42:37', 40), (41, 41, 42, '2022-07-28 13:42:37', 41), (42, 42, 43, '2022-07-28 13:42:37', 42), (43, 43, 44, '2022-07-28 13:42:37', 43), (44, 44, 45, '2022-07-28 13:42:37', 44), (45, 45, 46, '2022-07-28 13:42:37', 45), (46, 46, 47, '2022-07-28 13:42:37', 46), (47, 47, 48, '2022-07-28 13:42:37', 47), (48, 48, 49, '2022-07-28 13:42:37', 48), (49, 49, 50, '2022-07-28 13:42:37', 49), (50, 50, 1, '2022-07-28 13:42:37', 50);

INSERT INTO Following
VALUES(51, 1, 3, '2022-07-28 13:42:37', 1), (52, 1, 4, '2022-07-28 13:42:37', 1), (53, 1, 5, '2022-07-28 13:42:37', 1), (54, 1, 6, '2022-07-28 13:42:37', 1);

select * from Following;

-- (id, created_at, feed, user_id, User_user_id)-- 
INSERT INTO Feed
VALUES(1, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems', 1, 1);

INSERT INTO Feed
VALUES(2, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-2', 2, 2), (3, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-3', 3, 3), (4, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-4', 4, 4), (5, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-5', 5, 5), (6, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-6', 6, 6), (7, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-7', 7, 7), (8, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-8', 8, 8), (9, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-9', 9, 9), (10, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-10', 10, 10), (11, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-11', 11, 11), (12, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-12', 12, 12), (13, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-13', 13, 13), (14, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-14', 14, 14), (15, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-15', 15, 15), (16, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-16', 16, 16), (17, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-17', 17, 17), (18, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-18', 18, 18), (19, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-19', 19, 19), (20, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-20', 20, 20), (21, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-21', 21, 21), (22, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-22', 22, 22), (23, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-23', 23, 23), (24, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-24', 24, 24), (25, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-25', 25, 25), (26, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-26', 26, 26), (27, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-27', 27, 27), (28, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-28', 28, 28), (29, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-29', 29, 29), (30, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-30', 30, 30), (31, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-31', 31, 31), (32, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-32', 32, 32), (33, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-33', 33, 33), (34, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-34', 34, 34), (35, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-35', 35, 35), (36, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-36', 36, 36), (37, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-37', 37, 37), (38, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-38', 38, 38), (39, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-39', 39, 39), (40, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-40', 40, 40), (41, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-41', 41, 41), (42, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-42', 42, 42), (43, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-43', 43, 43), (44, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-44', 44, 44), (45, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-45', 45, 45), (46, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-46', 46, 46), (47, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-47', 47, 47), (48, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-48', 48, 48), (49, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-49', 49, 49), (50, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-50', 50, 50);

INSERT INTO Feed
VALUES(52, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-52 ', 1, 1), (53, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-53 ', 1, 1), (54, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-54 ', 1, 1), (55, '2022-07-28 13:42:37', 'Hello, Welcome to Database systems-55 ', 1, 1);

select * from Feed;

-- (id, feed_id, comment, created_at, commented_by_id, Feed_id1, Feed_user_user_id)-- 
INSERT INTO Comments
VALUES(1, 1, 'Hello, Good Morning', '2022-07-28 13:42:37', 2, 1, 1);

INSERT INTO Comments
VALUES(2, 2, 'Hello, Good Morning-2', '2022-07-28 13:42:37', 3, 2, 2), (3, 3, 'Hello, Good Morning-3', '2022-07-28 13:42:37', 4, 3, 3), (4, 4, 'Hello, Good Morning-4', '2022-07-28 13:42:37', 5, 4, 4), (5, 5, 'Hello, Good Morning-5', '2022-07-28 13:42:37', 6, 5, 5), (6, 6, 'Hello, Good Morning-6', '2022-07-28 13:42:37', 7, 6, 6), (7, 7, 'Hello, Good Morning-7', '2022-07-28 13:42:37', 8, 7, 7), (8, 8, 'Hello, Good Morning-8', '2022-07-28 13:42:37', 9, 8, 8), (9, 9, 'Hello, Good Morning-9', '2022-07-28 13:42:37', 10, 9, 9), (10, 10, 'Hello, Good Morning-10', '2022-07-28 13:42:37', 11, 10, 10), (11, 11, 'Hello, Good Morning-11', '2022-07-28 13:42:37', 12, 11, 11), (12, 12, 'Hello, Good Morning-12', '2022-07-28 13:42:37', 13, 12, 12), (13, 13, 'Hello, Good Morning-13', '2022-07-28 13:42:37', 14, 13, 13), (14, 14, 'Hello, Good Morning-14', '2022-07-28 13:42:37', 15, 14, 14), (15, 15, 'Hello, Good Morning-15', '2022-07-28 13:42:37', 16, 15, 15), (16, 16, 'Hello, Good Morning-16', '2022-07-28 13:42:37', 17, 16, 16), (17, 17, 'Hello, Good Morning-17', '2022-07-28 13:42:37', 18, 17, 17), (18, 18, 'Hello, Good Morning-18', '2022-07-28 13:42:37', 19, 18, 18), (19, 19, 'Hello, Good Morning-19', '2022-07-28 13:42:37', 20, 19, 19), (20, 20, 'Hello, Good Morning-20', '2022-07-28 13:42:37', 21, 20, 20), (21, 21, 'Hello, Good Morning-21', '2022-07-28 13:42:37', 22, 21, 21), (22, 22, 'Hello, Good Morning-22', '2022-07-28 13:42:37', 23, 22, 22), (23, 23, 'Hello, Good Morning-23', '2022-07-28 13:42:37', 24, 23, 23), (24, 24, 'Hello, Good Morning-24', '2022-07-28 13:42:37', 25, 24, 24), (25, 25, 'Hello, Good Morning-25', '2022-07-28 13:42:37', 26, 25, 25), (26, 26, 'Hello, Good Morning-26', '2022-07-28 13:42:37', 27, 26, 26), (27, 27, 'Hello, Good Morning-27', '2022-07-28 13:42:37', 28, 27, 27), (28, 28, 'Hello, Good Morning-28', '2022-07-28 13:42:37', 29, 28, 28), (29, 29, 'Hello, Good Morning-29', '2022-07-28 13:42:37', 30, 29, 29), (30, 30, 'Hello, Good Morning-30', '2022-07-28 13:42:37', 31, 30, 30), (31, 31, 'Hello, Good Morning-31', '2022-07-28 13:42:37', 32, 31, 31), (32, 32, 'Hello, Good Morning-32', '2022-07-28 13:42:37', 33, 32, 32), (33, 33, 'Hello, Good Morning-33', '2022-07-28 13:42:37', 34, 33, 33), (34, 34, 'Hello, Good Morning-34', '2022-07-28 13:42:37', 35, 34, 34), (35, 35, 'Hello, Good Morning-35', '2022-07-28 13:42:37', 36, 35, 35), (36, 36, 'Hello, Good Morning-36', '2022-07-28 13:42:37', 37, 36, 36), (37, 37, 'Hello, Good Morning-37', '2022-07-28 13:42:37', 38, 37, 37), (38, 38, 'Hello, Good Morning-38', '2022-07-28 13:42:37', 39, 38, 38), (39, 39, 'Hello, Good Morning-39', '2022-07-28 13:42:37', 40, 39, 39), (40, 40, 'Hello, Good Morning-40', '2022-07-28 13:42:37', 41, 40, 40), (41, 41, 'Hello, Good Morning-41', '2022-07-28 13:42:37', 42, 41, 41), (42, 42, 'Hello, Good Morning-42', '2022-07-28 13:42:37', 43, 42, 42), (43, 43, 'Hello, Good Morning-43', '2022-07-28 13:42:37', 44, 43, 43), (44, 44, 'Hello, Good Morning-44', '2022-07-28 13:42:37', 45, 44, 44), (45, 45, 'Hello, Good Morning-45', '2022-07-28 13:42:37', 46, 45, 45), (46, 46, 'Hello, Good Morning-46', '2022-07-28 13:42:37', 47, 46, 46), (47, 47, 'Hello, Good Morning-47', '2022-07-28 13:42:37', 48, 47, 47), (48, 48, 'Hello, Good Morning-48', '2022-07-28 13:42:37', 49, 48, 48), (49, 49, 'Hello, Good Morning-49', '2022-07-28 13:42:37', 50, 49, 49), (50, 50, 'Hello, Good Morning-50', '2022-07-28 13:42:37', 1, 50, 50);

INSERT INTO Comments
VALUES(51, 1, 'Hello, Good Morning-51', '2022-07-28 13:42:37', 3, 1, 1), (52, 1, 'Hello, Good Morning-52', '2022-07-28 13:42:37', 4, 1, 1), (53, 1, 'Hello, Good Morning-53', '2022-07-28 13:42:37', 5, 1, 1), (54, 1, 'Hello, Good Morning-54', '2022-07-28 13:42:37', 6, 1, 1);

select * from Comments;

-- (id, created_at, feed_id, liked_by_id, Feed_id1, Feed_user_user_id)-- 
INSERT INTO likes
VALUES(1, '2022-07-28 13:42:37', 1, 2, 1, 1);

INSERT INTO likes
VALUES(2, '2022-07-28 13:42:37', 2, 3, 2, 2), (3, '2022-07-28 13:42:37', 3, 4, 3, 3), (4, '2022-07-28 13:42:37', 4, 5, 4, 4), (5, '2022-07-28 13:42:37', 5, 6, 5, 5), (6, '2022-07-28 13:42:37', 6, 7, 6, 6), (7, '2022-07-28 13:42:37', 7, 8, 7, 7), (8, '2022-07-28 13:42:37', 8, 9, 8, 8), (9, '2022-07-28 13:42:37', 9, 10, 9, 9), (10, '2022-07-28 13:42:37', 10, 11, 10, 10), (11, '2022-07-28 13:42:37', 11, 12, 11, 11), (12, '2022-07-28 13:42:37', 12, 13, 12, 12), (13, '2022-07-28 13:42:37', 13, 14, 13, 13), (14, '2022-07-28 13:42:37', 14, 15, 14, 14), (15, '2022-07-28 13:42:37', 15, 16, 15, 15), (16, '2022-07-28 13:42:37', 16, 17, 16, 16), (17, '2022-07-28 13:42:37', 17, 18, 17, 17), (18, '2022-07-28 13:42:37', 18, 19, 18, 18), (19, '2022-07-28 13:42:37', 19, 20, 19, 19), (20, '2022-07-28 13:42:37', 20, 21, 20, 20), (21, '2022-07-28 13:42:37', 21, 22, 21, 21), (22, '2022-07-28 13:42:37', 22, 23, 22, 22), (23, '2022-07-28 13:42:37', 23, 24, 23, 23), (24, '2022-07-28 13:42:37', 24, 25, 24, 24), (25, '2022-07-28 13:42:37', 25, 26, 25, 25), (26, '2022-07-28 13:42:37', 26, 27, 26, 26), (27, '2022-07-28 13:42:37', 27, 28, 27, 27), (28, '2022-07-28 13:42:37', 28, 29, 28, 28), (29, '2022-07-28 13:42:37', 29, 30, 29, 29), (30, '2022-07-28 13:42:37', 30, 31, 30, 30), (31, '2022-07-28 13:42:37', 31, 32, 31, 31), (32, '2022-07-28 13:42:37', 32, 33, 32, 32), (33, '2022-07-28 13:42:37', 33, 34, 33, 33), (34, '2022-07-28 13:42:37', 34, 35, 34, 34), (35, '2022-07-28 13:42:37', 35, 36, 35, 35), (36, '2022-07-28 13:42:37', 36, 37, 36, 36), (37, '2022-07-28 13:42:37', 37, 38, 37, 37), (38, '2022-07-28 13:42:37', 38, 39, 38, 38), (39, '2022-07-28 13:42:37', 39, 40, 39, 39), (40, '2022-07-28 13:42:37', 40, 41, 40, 40), (41, '2022-07-28 13:42:37', 41, 42, 41, 41), (42, '2022-07-28 13:42:37', 42, 43, 42, 42), (43, '2022-07-28 13:42:37', 43, 44, 43, 43), (44, '2022-07-28 13:42:37', 44, 45, 44, 44), (45, '2022-07-28 13:42:37', 45, 46, 45, 45), (46, '2022-07-28 13:42:37', 46, 47, 46, 46), (47, '2022-07-28 13:42:37', 47, 48, 47, 47), (48, '2022-07-28 13:42:37', 48, 49, 48, 48), (49, '2022-07-28 13:42:37', 49, 50, 49, 49), (50, '2022-07-28 13:42:37', 50, 1, 50, 50);

INSERT INTO likes
VALUES(51, '2022-07-28 13:42:37', 1, 3, 1, 1), (52, '2022-07-28 13:42:37', 1, 4, 1, 1), (53, '2022-07-28 13:42:37', 1, 5, 1, 1), (54, '2022-07-28 13:42:37', 1, 6, 1, 1);

select * from likes;

-- (id, feed_id, created_at, retweet_by_id, Feed_id1, Feed_user_user_id)-- 
INSERT INTO Retweet
VALUES (1, 1, '2022-07-28 13:42:37', 2, 1, 1);

INSERT INTO Retweet
VALUES (2, 2, '2022-07-28 13:42:37', 3, 2, 2), (3, 3, '2022-07-28 13:42:37', 4, 3, 3), (4, 4, '2022-07-28 13:42:37', 5, 4, 4), (5, 5, '2022-07-28 13:42:37', 6, 5, 5), (6, 6, '2022-07-28 13:42:37', 7, 6, 6), (7, 7, '2022-07-28 13:42:37', 8, 7, 7), (8, 8, '2022-07-28 13:42:37', 9, 8, 8), (9, 9, '2022-07-28 13:42:37', 10, 9, 9), (10, 10, '2022-07-28 13:42:37', 11, 10, 10), (11, 11, '2022-07-28 13:42:37', 12, 11, 11), (12, 12, '2022-07-28 13:42:37', 13, 12, 12), (13, 13, '2022-07-28 13:42:37', 14, 13, 13), (14, 14, '2022-07-28 13:42:37', 15, 14, 14), (15, 15, '2022-07-28 13:42:37', 16, 15, 15), (16, 16, '2022-07-28 13:42:37', 17, 16, 16), (17, 17, '2022-07-28 13:42:37', 18, 17, 17), (18, 18, '2022-07-28 13:42:37', 19, 18, 18), (19, 19, '2022-07-28 13:42:37', 20, 19, 19), (20, 20, '2022-07-28 13:42:37', 21, 20, 20), (21, 21, '2022-07-28 13:42:37', 22, 21, 21), (22, 22, '2022-07-28 13:42:37', 23, 22, 22), (23, 23, '2022-07-28 13:42:37', 24, 23, 23), (24, 24, '2022-07-28 13:42:37', 25, 24, 24), (25, 25, '2022-07-28 13:42:37', 26, 25, 25), (26, 26, '2022-07-28 13:42:37', 27, 26, 26), (27, 27, '2022-07-28 13:42:37', 28, 27, 27), (28, 28, '2022-07-28 13:42:37', 29, 28, 28), (29, 29, '2022-07-28 13:42:37', 30, 29, 29), (30, 30, '2022-07-28 13:42:37', 31, 30, 30), (31, 31, '2022-07-28 13:42:37', 32, 31, 31), (32, 32, '2022-07-28 13:42:37', 33, 32, 32), (33, 33, '2022-07-28 13:42:37', 34, 33, 33), (34, 34, '2022-07-28 13:42:37', 35, 34, 34), (35, 35, '2022-07-28 13:42:37', 36, 35, 35), (36, 36, '2022-07-28 13:42:37', 37, 36, 36), (37, 37, '2022-07-28 13:42:37', 38, 37, 37), (38, 38, '2022-07-28 13:42:37', 39, 38, 38), (39, 39, '2022-07-28 13:42:37', 40, 39, 39), (40, 40, '2022-07-28 13:42:37', 41, 40, 40), (41, 41, '2022-07-28 13:42:37', 42, 41, 41), (42, 42, '2022-07-28 13:42:37', 43, 42, 42), (43, 43, '2022-07-28 13:42:37', 44, 43, 43), (44, 44, '2022-07-28 13:42:37', 45, 44, 44), (45, 45, '2022-07-28 13:42:37', 46, 45, 45), (46, 46, '2022-07-28 13:42:37', 47, 46, 46), (47, 47, '2022-07-28 13:42:37', 48, 47, 47), (48, 48, '2022-07-28 13:42:37', 49, 48, 48), (49, 49, '2022-07-28 13:42:37', 50, 49, 49), (50, 50, '2022-07-28 13:42:37', 1, 50, 50);

INSERT INTO Retweet
VALUES (51, 1, '2022-07-28 13:42:37', 3, 1, 1), (52, 1, '2022-07-28 13:42:37', 4, 1, 1), (53, 1, '2022-07-28 13:42:37', 5, 1, 1), (54, 1, '2022-07-28 13:42:37', 6, 1, 1);

select * from Retweet;

-- USER CASES-- 
-- 1 REGISTRATION QUERY-- 
INSERT INTO Twitter.user (user_id, first_name, last_name, email, gender, password, user_name, date_of_birth, country, is_active, mobile_number, date_joined)
VALUES(52, 'siva', 'p', 'sivap@email.com', 'Male', 'siva@137', 'siva.p', '2000-03-26', 'USA', 1, 9015439210, '2022-07-28 13:42:37');

select * from user;

-- 2 LOGIN QUERY-- 
SELECT CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0
END STATUS
FROM USER WHERE user_name = 'siva.p' AND password = 'siva@137';

-- 3 GETTING USER PROFILE-- 
SELECT * FROM USER WHERE user_name = 'siva.p';

-- 4 ADDING A FEED-- 
INSERT INTO Twitter.Feed (id, created_at, feed, user_id, User_user_id)
VALUES(56, '2022-07-28 13:42:37', 'Hello, I am Siva!', 52, 52);

select * from Feed;

-- 5 GETTING ALL FEEDS OF A SPECIFIC USER-- 
SELECT * FROM Feed WHERE user_id = (SELECT user_id FROM USER WHERE user_name = 'siva.p');
-- OR-- 
SELECT feed FROM Feed WHERE user_id = (SELECT user_id FROM USER WHERE user_name = 'siva.p');

-- 6 UPDATING A FEED -- 
UPDATE Feed SET feed = 'Hello all, I am Siva, How are you?' WHERE id = 56;

SELECT * from Feed where id = 56;

-- 7 DELETING A FEED -- 
DELETE FROM Feed WHERE id = 51;

-- 8 ADDING LIKE TO A FEED-- 
INSERT INTO Twitter.likes (id, created_at, feed_id, liked_by_id, Feed_id1, Feed_user_user_id)
VALUES(55, '2022-07-28 13:42:37', 56, 1, 56, 52);

SELECT * FROM LIKES;

-- 9 GETTING TOTAL NUMBER OF COMMENTS FOR A SPECIFIC FEED-- 
SELECT COUNT(*) FROM Comments WHERE feed_id = 1;

-- 10 GETTING TOTAL NUMBER OF LIKES FOR A SPECIFIC FEED-- 
SELECT COUNT(*) FROM likes WHERE feed_id = 1;

-- 11 GETTING TOTAL NUMBER OF RETWEETS FOR A SPECIFIC TWEET(FEED)-- 
SELECT COUNT(*) FROM Retweet WHERE feed_id = 1;

-- 12 GETTING FOLLOWER DETAILS-- 
SELECT * FROM Twitter.user WHERE user_id in (SELECT follower_user_id FROM Followers WHERE user_id = 1);

-- 13 GETTING TOTAL NUMBER OF FOLLOWERS FOR A SPECIFIC USER-- 
SELECT COUNT(*) FROM Followers WHERE user_id = 1;
-- OR
SELECT COUNT(*) FROM Followers WHERE user_id = (SELECT user_id FROM USER WHERE user_name = 'johnlen');

-- 14 DELETING A LIKE FOR A SPECIFIC FEED-- 
DELETE FROM likes WHERE id = 41;

-- 15 DELETING A RETWEET FOR A SPECIFIC TWEET(FEED)
DELETE FROM Retweet WHERE id = 51;


-- Testing-- 
SELECT COUNT(*) FROM FOLLOWERS WHERE user_id = 1;
SELECT COUNT(*) FROM FOLLOWING WHERE user_id = 1;
SELECT COUNT(*) FROM RETWEET WHERE feed_id = 1;
SELECT COUNT(*) FROM LIKES WHERE feed_id = 1;
SELECT COUNT(*) FROM COMMENTS WHERE feed_id = 1;
SELECT COUNT(*) FROM FEED WHERE user_id = 1;

SELECT feed FROM FEED WHERE user_id = 1;
SELECT comment FROM COMMENTS WHERE feed_id = 1;

-- TABLES-- 
select * from  user;
select * from Feed;
select * from following;
select * from followers;
select * from retweet;
select * from likes;
select * from comments;


DROP Table Followers;
DROP Table Following;
DROP TABLE COMMENTS;
DROP DATABASE Twitter;
SHOW DATABASES;
SHOW TABLES;
Delete from user where user_id = 51;