CREATE TABLE countries 
    ( country_id      CHAR(2) PRIMARY KEY
    , country_name    VARCHAR(40) 
); 

CREATE TABLE locations
    ( location_id    INT(4) PRIMARY KEY
    , street_address VARCHAR(40)
    , postal_code    VARCHAR(12)
    , city       VARCHAR(30) NOT NULL
    , state_province VARCHAR(25)
    , country_id  CHAR(2),
    FOREIGN KEY(country_id) REFERENCES countries(country_id)
  ) ;

CREATE TABLE departments
    ( department_id    INT(4) PRIMARY KEY
    , department_name  VARCHAR(30)  NOT NULL
    , manager_id       INT(6)
    , location_id      INT(4),
    FOREIGN KEY(location_id) REFERENCES locations(location_id)
) ;


CREATE TABLE employees
    ( employee_id    INT(6)
    , first_name     VARCHAR(20)
    , last_name      VARCHAR(25) NOT NULL
    , email          VARCHAR(25)  NOT NULL
    , phone_number   VARCHAR2(20)
    , hire_date      DATE NOT NULL
    , job_id         VARCHAR2(10)  NOT NULL
    , salary         DOUBLE(15,2)
    , commission_pct DOUBLE(4,2)
    , manager_id     INT(6)
    , department_id  INT(4),
    FOREIGN KEY(department_id) REFERENCES departments(department_id),
    FOREIGN KEY(manager_id) REFERENCES employees(employee_id) 
) ;

ALTER TABLE departments 
ADD CONSTRAINT dept_mgr_fk 
FOREIGN KEY(manager_id) REFERENCES employees(employee_id);


