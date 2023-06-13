CREATE TABLE college(
    cl_code VARCHAR(3) PRIMARY KEY,
    cl_name VARCHAR(40),
    cl_dean VARCHAR(30)
);

ALTER TABLE college ALTER COLUMN cl_name VARCHAR(40) NOT NULL;

CREATE TABLE student(
    st_ID VARCHAR(6) PRIMARY KEY,
    st_major VARCHAR(30),
    st_cohort VARCHAR(4) NOT NULL
);

CREATE TABLE departmen(
    dp_code CHAR(4),
    dp_name VARCHAR(40) NOT NULL,
    dp_HOD VARCHAR(30),
    dp_col VARCHAR(3) 

    FOREIGN KEY (dp_col) REFERENCES college(cl_code)
    CONSTRAINT dep_pk PRIMARY KEY (dp_code)
);

CREATE TABLE borrower(
    br_ID VARCHAR(6),
    br_name VARCHAR(30) NOT NULL,
    br_dept CHAR(4),
    br_mobile VARCHAR(8),
    br_city VARCHAR(20),
    br_house# VARCHAR(4),
    br_type CHAR(1),

    CONSTRAINT br_pk PRIMARY KEY (br_ID),
    CONSTRAINT br_mobile_check CHECK (br_mobile >= 90000000),
    FOREIGN KEY (br_dept) REFERENCES departmen(dp_code)
);

CREATE TABLE book (
    bk_ID VARCHAR(6),
    bk_title VARCHAR(50),
    bk_edition VARCHAR(2),
    bk_#ofPages INT NOT NULL,
    bk_totalcopies INT,
    bk_remCopies INT,

    CONSTRAINT bk_key PRIMARY KEY (bk_ID),
    CONSTRAINT bk_check_#pages check (bk_#ofPages > 0)
);

CREATE TABLE booktopic (
    tp_bkID VARCHAR(6),
    tp_desc VARCHAR(30),


    FOREIGN KEY (tp_bkID) REFERENCES book(bk_ID)
);

CREATE TABLE course(
    cr_code VARCHAR(8) PRIMARY KEY,
    cr_title VARCHAR(40),
    cr_ch INT CHECK (cr_ch > 0),
    cr_#ofSec INT CHECK (cr_#ofSec > 0),
    cr_dept CHAR(4),

    FOREIGN KEY (cr_dept) REFERENCES departmen(dp_code)
);

CREATE TABLE link(
    li_CrCode VARCHAR(8),
    li_bkID VARCHAR(6),
    li_usage CHAR(1),

    FOREIGN KEY (li_CrCode) REFERENCES course(cr_code),
    FOREIGN KEY (li_bkID) REFERENCES book(bk_ID)
);

CREATE TABLE regestiration(
    re_brID VARCHAR(6),
    re_crCode VARCHAR(8),
    re_semester VARCHAR(6) NOT NULL,

    FOREIGN KEY (re_brID) REFERENCES book(bk_ID),
    FOREIGN KEY (re_crCode) REFERENCES course(cr_code)
);

CREATE TABLE issuing(
    is_brID VARCHAR(6),
    is_bkID VARCHAR(6),
    is_dateTaken DATE NOT NULL,
    is_dateReturn DATE,

    FOREIGN KEY (is_bkID) REFERENCES book(bk_ID),
    FOREIGN KEY (is_brID) REFERENCES borrower(br_ID)

);

INSERT INTO college(cl_code,cl_name,cl_dean)
VALUES('COM','Economey','Prof.Fahim')

SELECT * FROM college

INSERT INTO departmen(dp_code,dp_name,dp_col,dp_HOD)
VALUES('INFS','Information Systems','COM','Dr. Kamla')

SELECT * from departmen
