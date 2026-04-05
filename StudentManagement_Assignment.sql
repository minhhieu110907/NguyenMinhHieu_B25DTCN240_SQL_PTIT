CREATE DATABASE IF NOT EXISTS PTIT_Student_Management;
USE PTIT_Student_Management;

CREATE TABLE Class (
    class_id VARCHAR(20) PRIMARY KEY,       
    class_name VARCHAR(100) NOT NULL,      
    academic_year INT NOT NULL              
);

CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,     
    full_name VARCHAR(100) NOT NULL,       
    dob DATE,                              
    class_id VARCHAR(20),                  
    CONSTRAINT FK_Student_Class FOREIGN KEY (class_id) 
    REFERENCES Class(class_id)
);


CREATE TABLE Subject (
    subject_id VARCHAR(20) PRIMARY KEY,    
    subject_name VARCHAR(100) NOT NULL UNIQUE, 
    credits INT NOT NULL,                   
    CONSTRAINT CHK_Credits CHECK (credits > 0) 
);


CREATE TABLE Enrollment (
    student_id VARCHAR(20),                
    subject_id VARCHAR(20),                 
    registration_date DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (student_id, subject_id),
    
    CONSTRAINT FK_Enroll_Student FOREIGN KEY (student_id) 
    REFERENCES Student(student_id),
    
    CONSTRAINT FK_Enroll_Subject FOREIGN KEY (subject_id) 
    REFERENCES Subject(subject_id)
);

SHOW TABLES;