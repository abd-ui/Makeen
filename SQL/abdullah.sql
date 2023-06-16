
--(a)	Retrieve full information stored in one table. 
SELECT * FROM borrower;

--(b)	Retrieve from any table the records which satisfy certain criteria. 
SELECT br_name FROM borrower WHERE (br_city = 'seeb');

--(c)	Using any table which contains a numeric field, retrieve the record which has the maximum value for that field. 
SELECT max(bk_remCopies) FROM book;

SELECT * FROM book
WHERE bk_remCopies = (
    SELECT MAX(bk_remCopies)
    FROM book
);

--(d)	List related information from two tables. The list must contain at least one field from each table. 
SELECT cr_title, dp_name FROM course c, department d
WHERE (c.cr_dept = d.dp_code);

--(f)	Produce a calculated list (Query) based on a single table. The list must have at least two columns, one of them is textual column while the 2nd column is calculated (e.g., summed-up) from other fields. 
SELECT dp_name , SUM(bk_totalcopies)
FROM department, book ,CBlink , course
WHERE (bk_ID = li_bkId) AND (cr_code = li_crCode) AND (cr_dept = dp_code)
GROUP BY (dp_name); 


--LAB 5
-- 1
-- a.	Add a new column named ‘re_serial#’ of type Integer.
ALTER TABLE regist
ADD re_serial# INT;

-- b
CREATE SEQUENCE seq_regist_serial#
INCREMENT BY 2
START WITH 1
MINVALUE 1
CYCLE;

-- c
UPDATE regist
SET re_serial# = NEXT VALUE FOR seq_regist_serial#;

-- d
INSERT INTO regist (re_serial#, re_brID, re_crCode, re_semester)
VALUES (NEXT VALUE FOR seq_regist_serial#, 10021, 'CHEM2000', 3),
       (NEXT VALUE FOR seq_regist_serial#, 92120, 'COMP4201', 6);

-- 2
-- a
ALTER TABLE CBlink ADD li_key CHARACTER(8);

-- b
CREATE SEQUENCE seq_CBlink_key
START WITH 0
INCREMENT BY 1
MAXVALUE 9999
CYCLE;

-- c
UPDATE CBlink
SET li_key = LEFT(li_crCode, 4) + RIGHT('0000' + CAST(NEXT VALUE FOR seq_CBlink_key AS VARCHAR(4)), 4);

-- 3
INSERT INTO CBlink (li_crCode, li_bkId, li_usage)
VALUES ('BIOL1000', '4001', 'T');

-- 4
CREATE UNIQUE INDEX idx_book_title ON book (bk_title);





SELECT bk_title , cr_title
FROM book , CBlink , course
WHERE (bk_ID = li_bkId) AND (cr_code = li_crCode);


SELECT bk_title , bk_totalcopies FROM book
WHERE (bk_totalcopies > 50) AND (bk_totalcopies <= 100);

SELECT br_name , br_dept FROM borrower
WHERE (br_city = 'seeb')
ORDER BY (br_dept);

SELECT dp_name , SUM(bk_totalcopies)
FROM department, book ,CBlink , course
WHERE (bk_ID = li_bkId) AND (cr_code = li_crCode) AND (cr_dept = dp_code)
GROUP BY (dp_name); 