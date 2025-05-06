-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema StudentSubjects
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema StudentSubjects
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `StudentSubjects` DEFAULT CHARACTER SET utf8 ;
USE `StudentSubjects` ;


-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--                                                                         --
-- Свою базу даних я вирішив назвать по іншому, не StudentSubjects а unik. --
--                                                                         --
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------


-- -----------------------------------------------------
-- Table `StudentSubjects`.`Faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Faculty` (
  `Faculty ID` INT NOT NULL,
  `Faculty name` VARCHAR(45) NULL,
  PRIMARY KEY (`Faculty ID`))
ENGINE = InnoDB;


CREATE Table Faculty(
  FacultyID INT NOT NULL PRIMARY KEY,
  FacultyName VARCHAR(45)
);

-- to insert into table
insert into Faculty(FacultyID, FacultyName)
values
 (1, "f1"),
 (2, "f2"),
 (3, "f3"),
 (4, "f4"),
 (5, "f5");

-- -----------------------------------------------------
-- Table `StudentSubjects`.`Specialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Specialty` (
  `Specialty ID` INT NOT NULL,
  `Specialty name` VARCHAR(45) NULL,
  `Faculty_Faculty ID` INT NOT NULL,
  PRIMARY KEY (`Specialty ID`),
  INDEX `fk_Specialty_Faculty1_idx` (`Faculty_Faculty ID` ASC) VISIBLE,
  CONSTRAINT `fk_Specialty_Faculty1`
    FOREIGN KEY (`Faculty_Faculty ID`)
    REFERENCES `StudentSubjects`.`Faculty` (`Faculty ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE Specialty (
  SpecialtyID INT NOT NULL PRIMARY KEY,
  SpecialtyName VARCHAR(45),
  Faculty_FacultyID INT NOT NULL,
    FOREIGN KEY (Faculty_FacultyID)
    REFERENCES Faculty (FacultyID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- to insert into table
insert into Specialty(SpecialtyID, SpecialtyName, Faculty_FacultyID) values (1, "CS", 1);

insert into Specialty(SpecialtyID, SpecialtyName, Faculty_FacultyID)
values
 (1, "s1", 1),
 (2, "s2", 2),
 (3, "s3", 3),
 (4, "s4", 4),
 (5, "s5", 5);



-- -----------------------------------------------------
-- Table `StudentSubjects`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Group` (
  `Group ID` INT NOT NULL,
  `Group name` VARCHAR(10) NULL,
  `Specialty_Specialty ID` INT NOT NULL,
  PRIMARY KEY (`Group ID`),
  INDEX `fk_Group_Specialty1_idx` (`Specialty_Specialty ID` ASC) VISIBLE,
  CONSTRAINT `fk_Group_Specialty1`
    FOREIGN KEY (`Specialty_Specialty ID`)
    REFERENCES `StudentSubjects`.`Specialty` (`Specialty ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- created!
CREATE TABLE `Group` ( -- Group is a keyword in mysql
  GroupID INT NOT NULL PRIMARY KEY,
  GroupName VARCHAR(10),
  Specialty_SpecialtyID INT NOT NULL,
    FOREIGN KEY (Specialty_SpecialtyID)
    REFERENCES Specialty (SpecialtyID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

insert into `Group`(`GroupID`, `GroupName`, `Specialty_SpecialtyID`)
values
 (1, "Group1", 1),
 (2, "Group2", 2),
 (3, "Group3", 3),
 (4, "Group4", 4),
 (5, "Group5", 5);


-- -----------------------------------------------------
-- Table `StudentSubjects`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Student` (
  `StudentID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone number` VARCHAR(45) NULL,
  `Home adress` VARCHAR(45) NULL,
  `Record book number` INT NULL,
  `Birth date` DATE NULL,
  `Group_Group ID` INT NOT NULL,
  PRIMARY KEY (`StudentID`, `Group_Group ID`),
  INDEX `fk_Student_Group_idx` (`Group_Group ID` ASC) VISIBLE,
  CONSTRAINT `fk_Student_Group`
    FOREIGN KEY (`Group_Group ID`)
    REFERENCES `StudentSubjects`.`Group` (`Group ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- created!
CREATE TABLE Student (
  StudentID INT NOT NULL,
  `Name` VARCHAR(45),
  `Phone number` VARCHAR(45),
  `Home adress` VARCHAR(45),
  `Record book number` INT,
  `Birth date` DATE,
  GroupID INT NOT NULL,
  PRIMARY KEY (StudentID, GroupID),
    FOREIGN KEY (GroupID)
    REFERENCES `Group` (GroupID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- to insert
INSERT INTO Student (StudentID, `Name`, `Phone number`, `Home adress`, `Record book number`, `Birth date`, GroupID)
VALUES
  (1, 'Alice Johnson', '555-1234', '123 Elm St, Cityville', 101, '2000-03-15', 1),
  (2, 'Bob Smith', '555-5678', '456 Oak St, Townsville', 102, '1999-06-20', 2),
  (3, 'Charlie Brown', '555-8765', '789 Pine St, Villageburg', 103, '2001-02-10', 3),
  (4, 'Dana White', '555-1122', '321 Maple St, Suburbia', 104, '2000-09-05', 4),
  (5, 'Eve Green', '555-3344', '654 Birch St, Uptown', 105, '1998-11-30', 2),
  (6, 'Frank Black', '555-5566', '987 Cedar St, Midtown', 106, '2001-04-25', 1),
  (7, 'Grace Lee', '555-7788', '159 Willow St, Cityville', 107, '1999-08-19', 3),
  (8, 'Hank Davis', '555-9900', '753 Spruce St, Townsville', 108, '2000-12-01', 4),
  (9, 'Ivy Martin', '555-2233', '852 Redwood St, Suburbia', 109, '2001-01-14', 1),
  (10, 'Jack Miller', '555-4455', '963 Pine St, Villageburg', 110, '1999-07-22', 2),
  (11, 'Kathy Wilson', '555-6677', '135 Elm St, Uptown', 111, '2000-04-17', 3),
  (12, 'Leo Moore', '555-8899', '246 Oak St, Midtown', 112, '1998-02-28', 4),
  (13, 'Mona Harris', '555-1010', '357 Maple St, Cityville', 113, '2001-05-13', 1),
  (14, 'Nina Clark', '555-2323', '468 Birch St, Townsville', 114, '1999-10-02', 2),
  (15, 'Oscar Young', '555-4545', '579 Cedar St, Suburbia', 115, '2000-01-22', 3),
  (16, 'Paul Scott', '555-6767', '680 Willow St, Uptown', 116, '1998-03-10', 4),
  (17, 'Quincy Adams', '555-8989', '791 Spruce St, Villageburg', 117, '2001-07-18', 1),
  (18, 'Rita Baker', '555-1011', '902 Redwood St, Midtown', 118, '2000-11-09', 2),
  (19, 'Steve Allen', '555-3232', '104 Elm St, Cityville', 119, '1999-12-25', 5),
  (20, 'Tina Moore', '555-5454', '215 Oak St, Townsville', 120, '2001-08-30', 3);



-- -----------------------------------------------------
-- Table `StudentSubjects`.`Discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Discipline` (
  `Discipline ID` INT NOT NULL,
  `Discipline name` VARCHAR(45) NULL,
  `Number of hours` INT NULL,
  `amount of seminar classes` INT NULL,
  `amount of practical classes` INT NULL,
  PRIMARY KEY (`Discipline ID`))
ENGINE = InnoDB;



-- created!
CREATE TABLE  `Discipline` (
  DisciplineID INT NOT NULL PRIMARY KEY,
  `Discipline name` VARCHAR(45),
  `Number of hours` INT,
  `amount of seminar classes` INT,
  `amount of practical classes` INT
);


-- insert
INSERT INTO `Discipline` (DisciplineID, `Discipline name`, `Number of hours`, `amount of seminar classes`, `amount of practical classes`)
VALUES
  (1, 'Mathematics', 120, 30, 60),
  (2, 'Physics', 150, 40, 70),
  (3, 'Chemistry', 100, 25, 50),
  (4, 'Biology', 110, 30, 55),
  (5, 'Computer Science', 180, 50, 90),
  (6, 'English Literature', 90, 25, 45),
  (7, 'History', 80, 20, 40),
  (8, 'Philosophy', 75, 20, 35),
  (9, 'Economics', 130, 35, 65),
  (10, 'Psychology', 110, 30, 55),
  (11, 'Sociology', 95, 30, 45),
  (12, 'Geography', 100, 28, 50),
  (13, 'Political Science', 120, 32, 60),
  (14, 'Engineering Mechanics', 150, 40, 70),
  (15, 'Statistics', 120, 36, 60),
  (16, 'Environmental Science', 100, 25, 50),
  (17, 'Business Administration', 110, 30, 55),
  (18, 'Law', 150, 40, 70),
  (19, 'Medicine', 200, 55, 100),
  (20, 'Art History', 75, 20, 35);


-- -----------------------------------------------------
-- Table `StudentSubjects`.`Discipline_has_Specialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Discipline_has_Specialty` (
  `Discipline_Discipline ID` INT NOT NULL,
  `Specialty_Specialty ID` INT NOT NULL,
  PRIMARY KEY (`Specialty_Specialty ID`, `Discipline_Discipline ID`),
  INDEX `fk_Discipline_has_Specialty_Specialty1_idx` (`Specialty_Specialty ID` ASC) VISIBLE,
  INDEX `fk_Discipline_has_Specialty_Discipline1_idx` (`Discipline_Discipline ID` ASC) VISIBLE,
  CONSTRAINT `fk_Discipline_has_Specialty_Discipline1`
    FOREIGN KEY (`Discipline_Discipline ID`)
    REFERENCES `StudentSubjects`.`Discipline` (`Discipline ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Discipline_has_Specialty_Specialty1`
    FOREIGN KEY (`Specialty_Specialty ID`)
    REFERENCES `StudentSubjects`.`Specialty` (`Specialty ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- created!
CREATE TABLE Discipline_has_Specialty (
  `Discipline_Discipline ID` INT NOT NULL,
  `Specialty_Specialty ID` INT NOT NULL,
  PRIMARY KEY (`Specialty_Specialty ID`, `Discipline_Discipline ID`),
    FOREIGN KEY (`Discipline_Discipline ID`)
    REFERENCES Discipline (DisciplineID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Specialty_Specialty ID`)
    REFERENCES Specialty (SpecialtyID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- filled m:n table
INSERT INTO `Discipline_has_Specialty` (`Discipline_Discipline ID`, `Specialty_Specialty ID`)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 4),
  (4, 3),
  (4, 5),
  (5, 1),
  (5, 4),
  (6, 2),
  (6, 5),
  (7, 3),
  (7, 4),
  (8, 1),
  (8, 5),
  (9, 2),
  (9, 3),
  (10, 4),
  (10, 5),
  (11, 2),
  (11, 3),
  (12, 1),
  (12, 5),
  (13, 4),
  (13, 2),
  (14, 1),
  (14, 3),
  (15, 5),
  (15, 4),
  (16, 3),
  (16, 2),
  (17, 5),
  (17, 1),
  (18, 4),
  (18, 2),
  (19, 1),
  (19, 5),
  (20, 3);


-- -----------------------------------------------------
-- Table `StudentSubjects`.`Student_has_Discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Student_has_Discipline` (
  `Student_StudentID` INT NOT NULL,
  `Discipline_Discipline ID` INT NOT NULL,
  PRIMARY KEY (`Student_StudentID`, `Discipline_Discipline ID`),
  INDEX `fk_Student_has_Discipline_Discipline1_idx` (`Discipline_Discipline ID` ASC) VISIBLE,
  INDEX `fk_Student_has_Discipline_Student1_idx` (`Student_StudentID` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Discipline_Student1`
    FOREIGN KEY (`Student_StudentID`)
    REFERENCES `StudentSubjects`.`Student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Discipline_Discipline1`
    FOREIGN KEY (`Discipline_Discipline ID`)
    REFERENCES `StudentSubjects`.`Discipline` (`Discipline ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- created!
CREATE TABLE Student_has_Discipline (
  `Student_StudentID` INT NOT NULL,
  `Discipline_Discipline ID` INT NOT NULL,
  PRIMARY KEY (`Student_StudentID`, `Discipline_Discipline ID`),
    FOREIGN KEY (Student_StudentID)
    REFERENCES Student (StudentID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`Discipline_Discipline ID`)
    REFERENCES Discipline (DisciplineID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- goidly filled m:n table
INSERT INTO `Student_has_Discipline` (`Student_StudentID`, `Discipline_Discipline ID`)
VALUES
  (1, 1), 
  (1, 2), 
  (2, 1), 
  (2, 3), 
  (3, 4), 
  (3, 5), 
  (4, 2), 
  (4, 6), 
  (5, 7), 
  (5, 8), 
  (6, 9), 
  (6, 10),
  (7, 1), 
  (7, 11),
  (8, 3), 
  (8, 5), 
  (9, 4), 
  (9, 12),
  (10, 6),
  (10, 13),
  (11, 7), 
  (11, 14),
  (12, 8), 
  (12, 15),
  (13, 9), 
  (13, 5), 
  (14, 1), 
  (14, 16),
  (15, 3), 
  (15, 18),
  (16, 4), 
  (16, 17),
  (17, 2), 
  (17, 19),
  (18, 11),
  (18, 20),
  (19, 5), 
  (19, 20),
  (20, 10),
  (20, 13);




-- -----------------------------------------------------
-- Table `StudentSubjects`.`credit of passing the discipline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`credit of passing the discipline` (
  `Semester` INT NOT NULL,
  `Student_has_Discipline_Student_StudentID` INT NOT NULL,
  `Student_has_Discipline_Discipline_Discipline ID` INT NOT NULL,
  `date of passing` DATE NULL,
  `mark` INT NULL,
  `teacher's name` VARCHAR(45) NULL,
  PRIMARY KEY (`Semester`, `Student_has_Discipline_Student_StudentID`, `Student_has_Discipline_Discipline_Discipline ID`),
  INDEX `fk_credit of passing the discipline_has_Discipline_Student__idx` (`Student_has_Discipline_Student_StudentID` ASC, `Student_has_Discipline_Discipline_Discipline ID` ASC) VISIBLE,
  CONSTRAINT `fk_credit of passing the discipline_has_Discipline_Student_ha1`
    FOREIGN KEY (`Student_has_Discipline_Student_StudentID` , `Student_has_Discipline_Discipline_Discipline ID`)
    REFERENCES `StudentSubjects`.`Student_has_Discipline` (`Student_StudentID` , `Discipline_Discipline ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- created!
CREATE TABLE `credit of passing the discipline` (
  Semester INT NOT NULL,
  `Student_has_Discipline_Student_StudentID` INT NOT NULL,
  `Student_has_Discipline_Discipline_Discipline ID` INT NOT NULL,
  `date of passing` DATE,
  `mark` INT,
  `teacher's name` VARCHAR(45),
  PRIMARY KEY (`Semester`, `Student_has_Discipline_Student_StudentID`, `Student_has_Discipline_Discipline_Discipline ID`),
    FOREIGN KEY (`Student_has_Discipline_Student_StudentID` , `Student_has_Discipline_Discipline_Discipline ID`)
    REFERENCES `Student_has_Discipline` (`Student_StudentID` , `Discipline_Discipline ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



INSERT INTO `credit of passing the discipline` (Semester, `Student_has_Discipline_Student_StudentID`, `Student_has_Discipline_Discipline_Discipline ID`, `date of passing`, `mark`, `teacher's name`)
VALUES
  (1, 1, 1, '2023-01-15', 85, 'Prof. Williams'), 
  (1, 1, 2, '2023-01-15', 92, 'Dr. Roberts'), 
  (1, 2, 1, '2023-02-20', 78, 'Prof. Williams'), 
  (1, 2, 3, '2023-02-20', 83, 'Dr. Carter'), 
  (1, 3, 4, '2023-03-05', 70, 'Dr. Lee'), 
  (1, 3, 5, '2023-03-05', 88, 'Prof. Scott'), 
  (1, 4, 2, '2023-04-12', 91, 'Dr. Roberts'), 
  (1, 4, 6, '2023-04-12', 94, 'Dr. Green'),  
  (1, 5, 7, '2023-05-01', 85, 'Dr. Jackson'), 
  (1, 5, 8, '2023-05-01', 75, 'Prof. Turner'), 
  (1, 6, 9, '2023-06-10', 80, 'Prof. Harris'), 
  (1, 6, 10, '2023-06-10', 67, 'Dr. Campbell'), 
  (1, 7, 1, '2023-07-15', 90, 'Prof. Williams'), 
  (1, 7, 11, '2023-07-15', 77, 'Dr. Evans'), 
  (2, 8, 3, '2023-09-05', 82, 'Dr. Lee'), 
  (2, 8, 5, '2023-09-05', 79, 'Prof. Scott'), 
  (2, 9, 4, '2023-10-10', 66, 'Dr. Green'), 
  (2, 9, 12, '2023-10-10', 95, 'Prof. Harris'), 
  (2, 10, 6, '2023-11-01', 89, 'Dr. Campbell'), 
  (2, 10, 13, '2023-11-01', 90, 'Dr. Evans'), 
  (2, 11, 7, '2023-12-12', 92, 'Dr. Jackson'), 
  (2, 11, 14, '2023-12-12', 84, 'Prof. Turner'), 
  (2, 12, 8, '2024-01-10', 80, 'Prof. Turner'), 
  (2, 12, 15, '2024-01-10', 78, 'Prof. Harris'), 
  (2, 13, 9, '2024-02-25', 86, 'Dr. Carter'), 
  (2, 13, 5, '2024-02-25', 92, 'Prof. Scott'), 
  (2, 14, 1, '2024-03-15', 72, 'Prof. Williams'), 
  (2, 14, 16, '2024-03-15', 80, 'Dr. Lee'), 
  (3, 15, 3, '2024-04-20', 88, 'Dr. Green'), 
  (3, 15, 18, '2024-04-20', 91, 'Dr. Roberts'), 
  (3, 16, 4, '2024-05-30', 75, 'Prof. Turner'), 
  (3, 16, 17, '2024-05-30', 85, 'Dr. Jackson'), 
  (3, 17, 2, '2024-06-25', 89, 'Dr. Roberts'), 
  (3, 17, 19, '2024-06-25', 90, 'Prof. Harris'), 
  (3, 18, 11, '2024-07-18', 79, 'Dr. Campbell'), 
  (3, 18, 20, '2024-07-18', 91, 'Prof. Williams'), 
  (3, 19, 5, '2024-08-10', 92, 'Prof. Scott'), 
  (3, 19, 20, '2024-08-10', 84, 'Dr. Green'),  
  (3, 20, 10, '2024-09-01', 78, 'Dr. Campbell'), 
  (3, 20, 13, '2024-09-01', 91, 'Dr. Evans');  




-- -----------------------------------------------------
-- Table `StudentSubjects`.`Phone number`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StudentSubjects`.`Phone number` (
  `Phone ID` INT NOT NULL,
  `phone number` VARCHAR(45) NULL,
  `Student_StudentID` INT NOT NULL,
  PRIMARY KEY (`Phone ID`, `Student_StudentID`),
  INDEX `fk_Phone number_Student1_idx` (`Student_StudentID` ASC) VISIBLE,
  CONSTRAINT `fk_Phone number_Student1`
    FOREIGN KEY (`Student_StudentID`)
    REFERENCES `StudentSubjects`.`Student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE `Phone number` (
  `PhoneID` INT NOT NULL,
  `phone number` VARCHAR(45),
  `Student_StudentID` INT NOT NULL,
  PRIMARY KEY (`PhoneID`, `Student_StudentID`),
    FOREIGN KEY (`Student_StudentID`)
    REFERENCES Student (StudentID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `Phone number` (PhoneID, `phone number`, `Student_StudentID`)
VALUES
  (1, '555-1234', 1), 
  (2, '555-5678', 11),
  (3, '555-5678', 2), 
  (4, '555-8765', 13), 
  (5, '555-1122', 4), 
  (6, '555-3344', 5), 
  (7, '555-5566', 6), 
  (8, '555-7788', 17), 
  (9, '555-9900', 8), 
  (10, '555-2233', 10), 


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
