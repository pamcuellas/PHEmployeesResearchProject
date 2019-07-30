/*============================================================================*/
/* DBMS: PostgreSQL 11*/
/* Created on : 07/20/2019 21:13:58                                           */
/*============================================================================*/



/*============================================================================*/
/*                                  TABLES                                    */
/*============================================================================*/



DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;



CREATE TABLE "departments" ( 
  "dept_no"                     VARCHAR(10) NOT NULL,
  "dept_name"                   VARCHAR(100) NOT NULL,
CONSTRAINT "PK_departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "employees" ( 
  "emp_no"                      INTEGER NOT NULL,
  "birth_date"                  TIMESTAMP NOT NULL,
  "first_name"                  VARCHAR(100) NOT NULL,
  "last_name"                   VARCHAR(100) NOT NULL,
  "gender"                      CHARACTER(1) NOT NULL,
  "hire_date"                   TIMESTAMP NOT NULL,
CONSTRAINT "PK_employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE "dept_emp" ( 
  "emp_no"                      INTEGER NOT NULL,
  "dept_no"                     VARCHAR(10) NOT NULL,
  "from_date"                   TIMESTAMP NOT NULL,
  "to_date"                     TIMESTAMP NOT NULL
);

CREATE TABLE "dept_manager" ( 
  "dept_no"                     VARCHAR(10) NOT NULL,
  "emp_no"                      INTEGER NOT NULL,
  "from_date"                   TIMESTAMP NOT NULL,
  "to_date"                     TIMESTAMP NOT NULL
);

CREATE TABLE "salaries" ( 
  "emp_no"                      INTEGER NOT NULL,
  "salary"                      NUMERIC NOT NULL,
  "from_date"                   TIMESTAMP NOT NULL,
  "to_date"                     TIMESTAMP NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" 					INTEGER NOT NULL,
    "title" 					VARCHAR(100) NOT NULL,
    "from_date" 				TIMESTAMP NOT NULL,
    "to_date" 					TIMESTAMP NOT NULL
);

/*==============================================================*/
/* FOREIGN KEY CONSTRAINTS                                       */
/*==============================================================*/
ALTER TABLE "dept_manager"
    ADD CONSTRAINT "FK_dept_manager__REF__departments" FOREIGN KEY ("dept_no")
        REFERENCES "departments" ("dept_no")	
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
 ALTER TABLE "dept_manager"
    ADD CONSTRAINT "FK_dept_manager__REF__employees" FOREIGN KEY ("emp_no")
        REFERENCES "employees" ("emp_no")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;       
 
ALTER TABLE "dept_emp"
    ADD CONSTRAINT "FK_dept_emp__REF__departments" FOREIGN KEY ("dept_no")
        REFERENCES "departments" ("dept_no")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
 ALTER TABLE "dept_emp"
    ADD CONSTRAINT "FK_dept_emp__REF__employees" FOREIGN KEY ("emp_no")
        REFERENCES "employees" ("emp_no")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;   
            
         
ALTER TABLE "salaries"
    ADD CONSTRAINT "FK_salaries__REF__employees" FOREIGN KEY ("emp_no")
        REFERENCES "employees" ("emp_no")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;

ALTER TABLE "titles" 
	ADD CONSTRAINT "FK_titles__REF__employees" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
         

/*==============================================================*/
/* IMPORT FILES                                                 */
/*==============================================================*/
/*
COPY departments FROM '<Type your data directory here>\departments.csv' DELIMITERS','  HEADER CSV NULL'' ENCODING'UTF8';
COPY employees FROM '<Type your data directory here>\employees.csv' DELIMITERS','  HEADER CSV NULL'' ENCODING'UTF8';
COPY salaries FROM '<Type your data directory here>\salaries.csv' DELIMITERS','  HEADER CSV NULL'' ENCODING'UTF8';
COPY dept_emp FROM '<Type your data directory here>\dept_emp.csv' DELIMITERS','  HEADER CSV NULL'' ENCODING'UTF8';
COPY dept_manager FROM '<Type your data directory here>\dept_manager.csv' DELIMITERS','  HEADER CSV NULL'' ENCODING'UTF8';
COPY titles FROM '<Type your data directory here>\titles.csv' DELIMITERS','  HEADER CSV NULL'' ENCODING'UTF8';
*/

