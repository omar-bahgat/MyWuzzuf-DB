CREATE DATABASE jobsearch;

use jobsearch;

-- creating tables

CREATE TABLE Applicant(
Email VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
Country VARCHAR(50) NOT NULL,
FirstName VARCHAR(15) NOT NULL,
MiddleName VARCHAR(15),
LastName VARCHAR(15) NOT NULL,
Gender CHAR(1) NOT NULL,
Birthdate DATE NOT NULL,
Nationality VARCHAR(30) NOT NULL,
PhoneNumber VARCHAR(15) NOT NULL,
EducationLevel VARCHAR(50),
YearsOfExperience INT NOT NULL,
GPA FLOAT NOT NULL,
PRIMARY KEY (Email)
);

CREATE TABLE ApplicantLanguages(
Email VARCHAR(50) NOT NULL,
Languages VARCHAR(50),
PRIMARY KEY (Email, Languages)
);

CREATE TABLE ApplicantSkills(
Email VARCHAR(100) NOT NULL,
Skills VARCHAR(50) NOT NULL,
PRIMARY KEY (Email, Skills)
);

CREATE TABLE JobPost(
PostTitle VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
Name VARCHAR(100) NOT NULL,
Type VARCHAR(100) NOT NULL,
DatePosted DATE,
YearsOfExperience INT NOT NULL,
CareerLevel VARCHAR(50) NOT NULL,
EducationLevel VARCHAR(50),
Salary INT,
Description VARCHAR (1000),
PRIMARY KEY (PostTitle, City, Name)
);

CREATE TABLE JobPostSkills(
PostTitle VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
Name VARCHAR(100) NOT NULL,
Skills VARCHAR(50) NOT NULL,
PRIMARY KEY (PostTitle, City, Name, Skills)
);

CREATE TABLE JobPostCategories(
PostTitle VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
Name VARCHAR(100) NOT NULL,
Categories VARCHAR(50) NOT NULL,
PRIMARY KEY (PostTitle, City, Name, Categories)
);

CREATE TABLE ApplicantAppliesJob(
Email VARCHAR(100) NOT NULL,
PostTitle VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
Name VARCHAR(100) NOT NULL,
ApplicationDate DATE NOT NULL,
CoverLetter VARCHAR(2000),
PRIMARY KEY (Email, PostTitle, City, Name)
);

CREATE TABLE Company(
Name VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
Size INT NOT NULL,
FoundationDate DATE NOT NULL,
URL VARCHAR(500),
Description VARCHAR(10000),
PRIMARY KEY (Name)
);

CREATE TABLE CompanySectors(
Name VARCHAR(100) NOT NULL,
Sectors VARCHAR(50) NOT NULL,
PRIMARY KEY (Name, Sectors)
);

-- adding foreign keys

-- Create a unique index on City column in JobPost table
CREATE UNIQUE INDEX idx_unique_city ON JobPost(City);


ALTER TABLE ApplicantLanguages
ADD CONSTRAINT FOREIGN KEY (Email) REFERENCES Applicant(Email) ON DELETE RESTRICT
;

ALTER TABLE ApplicantSkills
ADD CONSTRAINT FOREIGN KEY (Email) REFERENCES Applicant(Email) ON DELETE RESTRICT
;

ALTER TABLE JobPost
ADD CONSTRAINT FOREIGN KEY (Name) REFERENCES Company(Name) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE JobPostSkills
ADD CONSTRAINT FOREIGN KEY (PostTitle) REFERENCES JobPost(PostTitle) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT FOREIGN KEY (City) REFERENCES JobPost(City) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT FOREIGN KEY (Name) REFERENCES JobPost(Name) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE JobPostCategories
ADD CONSTRAINT FOREIGN KEY (PostTitle) REFERENCES JobPost(PostTitle) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT FOREIGN KEY (City) REFERENCES JobPost(City) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT FOREIGN KEY (Name) REFERENCES JobPost(Name) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE ApplicantAppliesJob
ADD CONSTRAINT FOREIGN KEY (Email) REFERENCES Applicant(Email) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT FOREIGN KEY (PostTitle) REFERENCES JobPost(PostTitle) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT FOREIGN KEY (City) REFERENCES JobPost(City) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT FOREIGN KEY (Name) REFERENCES JobPost(Name) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE CompanySectors
ADD CONSTRAINT FOREIGN KEY (Name) REFERENCES Company(Name) ON DELETE RESTRICT ON UPDATE RESTRICT
;

-- inserting fake data

INSERT INTO Applicant
VALUES 	
		('omar_bahgat@aucegypt.edu', 
		'Cairo', 'Egypt', 
        'Omar', 'Ashraf', 'Bahgat', 
        'M', '2003-11-17', 'Egyptian', '01201998806', 
        'Bachelor''s Degree', 0, 3.88),
        
        ('zeinabahgat@aucegypt.edu', 
		'Cairo', 'Egypt', 
        'Zeina', 'Ashraf', 'Bahgat', 
        'F', '2003-11-17', 'Egyptian', '01201998807', 
        'Bachelor''s Degree', 0, 3.93),
        
        ('mohamedshaaban@agmail.com', 
		'Cairo', 'Egypt', 
        'Mohamed', 'Hesham', 'Shaaban', 
        'M', '1998-6-30', 'Egyptian', '01201743106', 
        'Master''s Degree', 3, 3.8),
        
        ('ahmed_khorshed@gmail.com', 
		'Giza', 'Egypt', 
        'Ahmed', 'Ehab', 'Khorshed', 
        'M', '1995-11-17', 'Egyptian', '01322354366', 
        'PhD', 6, 3.5),
        
         ('hanakhaled@hotmail.com', 
		'Alexandria', 'Egypt', 
        'Hana', 'Khaled', 'Elsaadany', 
        'F', '2004-5-12', 'Egyptian', '01357788902', 
        'Bachelor''s Degree', 2, 3.64),
        
        ('malaksalah@hotmail.com', 
		'Cairo', 'Egypt', 
        'Malak', 'Mahmoud', 'Salah', 
        'F', '2005-11-17', 'Egyptian', '01024546602', 
        'Bachelor''s Degree', 0, 3.4),
        
        ('karimabdelrahman@aucegypt.edu', 
		'Cairo', 'Egypt', 
        'Karim', 'Abdelrahman', 'Salem', 
        'M', '2001-12-31', 'Egyptian', '01289964522', 
        'Bachelor''s Degree', 1, 3.32),
        
        ('aliamohsen@yahoo.com', 
		'Cairo', 'Egypt', 
        'Alia', 'Mohsen', 'Elsaeed', 
        'M', '204-11-17', 'Egyptian', '01335678442', 
        'Bachelor''s Degree', 1, 3.5);
        
INSERT INTO ApplicantLanguages 
VALUES
		('omar_bahgat@aucegypt.edu', 'English'),
		('omar_bahgat@aucegypt.edu', 'Arabic'),
		('omar_bahgat@aucegypt.edu', 'German'),

		('zeinabahgat@aucegypt.edu', 'English'),
		('zeinabahgat@aucegypt.edu', 'Arabic'),

		('mohamedshaaban@agmail.com', 'English'),
		('mohamedshaaban@agmail.com', 'Arabic'),

		('ahmed_khorshed@gmail.com', 'English'),
		('ahmed_khorshed@gmail.com', 'Arabic'),

		('hanakhaled@hotmail.com', 'English'),
		('hanakhaled@hotmail.com', 'Arabic'),
		('hanakhaled@hotmail.com', 'French'),

		('malaksalah@hotmail.com', 'English'),
		('malaksalah@hotmail.com', 'Arabic'),

		('karimabdelrahman@aucegypt.edu', 'English'),
		('karimabdelrahman@aucegypt.edu', 'Arabic'),

		('aliamohsen@yahoo.com', 'English'),
		('aliamohsen@yahoo.com', 'Arabic');
        
INSERT INTO ApplicantSkills 
VALUES
		('omar_bahgat@aucegypt.edu', 'Machine Learning'),
		('omar_bahgat@aucegypt.edu', 'Python Programming'),
		('omar_bahgat@aucegypt.edu', 'Algorithms'),

		('zeinabahgat@aucegypt.edu', 'Data Analysis'),
		('zeinabahgat@aucegypt.edu', 'Statistical Analysis'),
		('zeinabahgat@aucegypt.edu', 'Research Methods'),

		('mohamedshaaban@agmail.com', 'Database Management'),
		('mohamedshaaban@agmail.com', 'SQL'),
		('mohamedshaaban@agmail.com', 'Data Modeling'),
		('mohamedshaaban@agmail.com', 'Database Administration'),

		('ahmed_khorshed@gmail.com', 'Computer Vision'),
		('ahmed_khorshed@gmail.com', 'Image Processing'),

		('hanakhaled@hotmail.com', 'Software Development'),
		('hanakhaled@hotmail.com', 'JavaScript'),

		('malaksalah@hotmail.com', 'Data Entry'),

		('karimabdelrahman@aucegypt.edu', 'Quality Assurance'),

		('aliamohsen@yahoo.com', 'Data Analysis'),
		('aliamohsen@yahoo.com', 'Data Visualization');
        

-- loading csv files

SHOW VARIABLES LIKE "secure_file_priv";
SET NAMES utf8;

ALTER TABLE Company MODIFY FoundationDate varchar(10);

LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/companies_table.csv' 
IGNORE INTO TABLE Company 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;  

LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/companies_sectors_table.csv' 
IGNORE INTO TABLE CompanySectors 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  

LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/jobPosts_table.csv' 
IGNORE INTO TABLE JobPost 
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;  

ALTER TABLE JobPost MODIFY DatePosted varchar(50);
ALTER TABLE JobPost MODIFY Salary varchar(50);

LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/jobPosts_skills_table.csv'  
IGNORE INTO TABLE JobPostSkills 
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;  

LOAD DATA  INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/jobPosts_categories_table.csv'  
IGNORE INTO TABLE JobPostCategories 
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  

INSERT INTO ApplicantAppliesJob 
VALUES
		('omar_bahgat@aucegypt.edu', 'Electrical Engineer', 'Dakahlia','AGA', '2022-17-11', 'Sample Cover Letter');
        
ALTER TABLE ApplicantAppliesJob MODIFY ApplicationDate varchar(10);
