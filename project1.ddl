-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-04-14 21:58:08 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE Person CASCADE CONSTRAINTS;
DROP TABLE Project CASCADE CONSTRAINTS;
DROP TABLE child_parent CASCADE CONSTRAINTS;
DROP TABLE project_employees CASCADE CONSTRAINTS;


CREATE TABLE Department
  (
    dept_no   INTEGER NOT NULL ,
    dept_name VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE Department ADD CONSTRAINT Department_PK PRIMARY KEY ( dept_no ) ;


CREATE TABLE Person
  (
    person_id        INTEGER NOT NULL ,
    type             VARCHAR2 (255) ,
    first_name       VARCHAR2 (255) NOT NULL ,
    last_name        VARCHAR2 (255) NOT NULL ,
    home_address     VARCHAR2 (255) ,
    zipcode          INTEGER ,
    home_phone       INTEGER ,
    us_citizen       CHAR (1) NOT NULL ,
    employee_id      INTEGER ,
    salary           INTEGER ,
    salary_exception CHAR (1) ,
    bonus            INTEGER ,
    isFired          CHAR (1) ,
    person_id1       INTEGER ,
    person_id3       INTEGER ,
    dept_no          INTEGER
  ) ;
ALTER TABLE Person ADD CONSTRAINT Person_PK PRIMARY KEY ( person_id ) ;


CREATE TABLE Project
  (
    project_no       INTEGER NOT NULL ,
    type             VARCHAR2 (255) ,
    project_title    VARCHAR2 (20) NOT NULL ,
    project_active   CHAR (1) NOT NULL ,
    end_date_month   INTEGER ,
    end_date_day     INTEGER ,
    end_date_year    INTEGER ,
    est_person_hours INTEGER ,
    person_id        INTEGER NOT NULL ,
    project_no1      INTEGER NOT NULL ,
    dept_no          INTEGER NOT NULL
  ) ;
ALTER TABLE Project ADD CONSTRAINT Project_PK PRIMARY KEY ( project_no ) ;


CREATE TABLE child_parent
  (
    person_id  INTEGER NOT NULL ,
    person_id1 INTEGER NOT NULL
  ) ;


CREATE TABLE project_employees
  (
    person_id  INTEGER NOT NULL ,
    project_no INTEGER NOT NULL
  ) ;


ALTER TABLE child_parent ADD CONSTRAINT child FOREIGN KEY ( person_id ) REFERENCES Person ( person_id ) ON
DELETE CASCADE ;

ALTER TABLE Project ADD CONSTRAINT dept_projects FOREIGN KEY ( dept_no ) REFERENCES Department ( dept_no ) ON
DELETE CASCADE ;

ALTER TABLE project_employees ADD CONSTRAINT employees_of_project FOREIGN KEY ( person_id ) REFERENCES Person ( person_id ) ON
DELETE CASCADE ;

ALTER TABLE Person ADD CONSTRAINT manager_dept FOREIGN KEY ( dept_no ) REFERENCES Department ( dept_no ) ON
DELETE CASCADE ;

ALTER TABLE Person ADD CONSTRAINT manager_of_employee FOREIGN KEY ( person_id3 ) REFERENCES Person ( person_id ) ON
DELETE CASCADE ;

ALTER TABLE child_parent ADD CONSTRAINT parent_of_child FOREIGN KEY ( person_id1 ) REFERENCES Person ( person_id ) ON
DELETE CASCADE ;

ALTER TABLE project_employees ADD CONSTRAINT project_to_employees FOREIGN KEY ( project_no ) REFERENCES Project ( project_no ) ON
DELETE CASCADE ;

ALTER TABLE Project ADD CONSTRAINT projects_managing FOREIGN KEY ( person_id ) REFERENCES Person ( person_id ) ON
DELETE CASCADE ;

ALTER TABLE Person ADD CONSTRAINT spouse FOREIGN KEY ( person_id1 ) REFERENCES Person ( person_id ) ON
DELETE CASCADE ;

ALTER TABLE Project ADD CONSTRAINT sub_project FOREIGN KEY ( project_no1 ) REFERENCES Project ( project_no ) ON
DELETE CASCADE ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             1
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
