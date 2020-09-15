
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/nKOvqB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.




-- sql-challenge
-- Data Modeling & Engineering
-- UPDATED THE BELOW TO REMOVE DOUBLE QUOTES ==> TO MAKE QUERIES EASIER TO USE
-- ADDED THE DROP CLAUSES TO REMOVE EXISTING TABLES
-- UPDATED VARCHAR(200) TO  VARCHAR(200)(LENGTH) 



---DROP TABLES
DROP TABLE IF EXISTS DEPARTMENT		CASCADE;
DROP TABLE IF EXISTS EMPLOYEE		CASCADE;
DROP TABLE IF EXISTS SALARIES		CASCADE;
DROP TABLE IF EXISTS TITLES			CASCADE;
DROP TABLE IF EXISTS DEPT_EMPLOYEE;
DROP TABLE IF EXISTS DEPT_MANAGER;



CREATE TABLE DEPARTMENT (
    DEPT_NO VARCHAR(4)          NOT NULL,
    DEPT_NAME VARCHAR(200)      NOT NULL,
    CONSTRAINT pk_DEPARTMENT PRIMARY KEY (
        DEPT_NO
     )
);



CREATE TABLE EMPLOYEE (
    EMPLOYEE_NO INTEGER         NOT NULL,
    BIRTH_DATE DATE             NOT NULL,
    FIRST_NAME VARCHAR(200)     NOT NULL,
    LAST_NAME VARCHAR(200)      NOT NULL,
    GENDER VARCHAR(200)         NOT NULL,
    HIRE_DATE DATE              NOT NULL,
    CONSTRAINT pk_EMPLOYEE PRIMARY KEY (
        EMPLOYEE_NO
     )
);



CREATE TABLE DEPT_EMPLOYEE (
    EMPLOYEE_NO INTEGER         NOT NULL,
    DEPT_NO VARCHAR(4)          NOT NULL,
    FROM_DATE DATE              NOT NULL,
    TO_DATE DATE                NOT NULL
);



CREATE TABLE DEPT_MANAGER (
    DEPT_NO VARCHAR(4)          NOT NULL,
    EMPLOYEE_NO INTEGER         NOT NULL,
    FROM_DATE DATE              NOT NULL,
    TO_DATE DATE                NOT NULL
);



CREATE TABLE SALARIES (
    EMPLOYEE_NO INTEGER     NOT NULL,
    SALARY MONEY            NOT NULL,
    FROM_DATE DATE          NOT NULL,
    TO_DATE DATE            NOT NULL
);



CREATE TABLE TITLES (
    EMPLOYEE_NO INT         NOT NULL,
    TITLE VARCHAR(200)      NOT NULL,
    FROM_DATE DATE          NOT NULL,
    TO_DATE DATE            NOT NULL
);

ALTER TABLE DEPT_EMPLOYEE ADD CONSTRAINT fk_DEPT_EMPLOYEE_EMPLOYEE_NO FOREIGN KEY(EMPLOYEE_NO)
REFERENCES EMPLOYEE (EMPLOYEE_NO);

ALTER TABLE DEPT_EMPLOYEE ADD CONSTRAINT fk_DEPT_EMPLOYEE_DEPT_NO FOREIGN KEY(DEPT_NO)
REFERENCES DEPARTMENT (DEPT_NO);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_DEPT_NO FOREIGN KEY(DEPT_NO)
REFERENCES DEPARTMENT (DEPT_NO);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_EMPLOYEE_NO FOREIGN KEY(EMPLOYEE_NO)
REFERENCES EMPLOYEE (EMPLOYEE_NO);

ALTER TABLE SALARIES ADD CONSTRAINT fk_SALARIES_EMPLOYEE_NO FOREIGN KEY(EMPLOYEE_NO)
REFERENCES EMPLOYEE (EMPLOYEE_NO);

ALTER TABLE TITLES ADD CONSTRAINT fk_TITLES_EMPLOYEE_NO FOREIGN KEY(EMPLOYEE_NO)
REFERENCES EMPLOYEE (EMPLOYEE_NO);


