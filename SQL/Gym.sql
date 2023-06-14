
CREATE TABLE Gym(
    gym_id VARCHAR(4) NOT NULL,
    gym_name VARCHAR(30) NOT NULL,
    gym_location VARCHAR(30) NOT NULL,
    gym_contact# CHAR(8) NOT NULL,
    gym_email VARCHAR(40),

    CONSTRAINT gym_id_pk PRIMARY KEY (gym_id),
    CONSTRAINT gym_contact#_unq UNIQUE (gym_contact#)
);

CREATE TABLE Trainer (
    t_id VARCHAR(8) NOT NULL,
    t_name VARCHAR(30) NOT NULL,
    t_address VARCHAR(50),
    t_mobile# CHAR(8),
    t_gender CHAR(1),
    t_gym_id VARCHAR(4),

    CONSTRAINT t_id_pk PRIMARY KEY (t_id),
    CONSTRAINT t_#mobile_unq UNIQUE (t_mobile#),
    CONSTRAINT t_gender_fm CHECK(t_gender IN ('F','M')),
    FOREIGN KEY (t_gym_id) REFERENCES Gym(gym_id),
    
);

CREATE TABLE Membership (
    mr_id VARCHAR(4) NOT NULL,
    mr_type VARCHAR(20) NOT NULL,

    CONSTRAINT mr_id_pk PRIMARY KEY (mr_id),
);

CREATE TABLE Member (
    mb_id VARCHAR(8) NOT NULL,
    mb_name VARCHAR(30) NOT NULL,
    mb_address VARCHAR(50),
    mb_dob DATE,
    mb_email VARCHAR(40),
    mb_mobile# CHAR(8) NOT NULL,
    mb_gender CHAR(1) NOT NULL,
    mb_gym_id VARCHAR(4) NOT NULL,
    mr_mb_id VARCHAR(4) NOT NULL,


    CONSTRAINT mb_id_pk PRIMARY KEY (mb_id),
    CONSTRAINT mb_mobile#_unq UNIQUE (mb_mobile#),
    CONSTRAINT mb_gender_fm CHECK(mb_gender IN ('F','M')),
    FOREIGN KEY (mb_gym_id) REFERENCES Gym(gym_id),
    FOREIGN KEY (mr_mb_id) REFERENCES Membership(mr_id)

);

CREATE TABLE Equipment (
    eq_id VARCHAR(8) NOT NULL,
    eq_name VARCHAR(30) NOT NULL,
    eq_brand VARCHAR(40),
    eq_gym_id VARCHAR(4) NOT NULL,

    CONSTRAINT eq_id_pk PRIMARY KEY (eq_id),
    FOREIGN KEY (eq_gym_id) REFERENCES Gym(gym_id)
);

INSERT INTO Gym (gym_id, gym_name, gym_location, gym_contact#, gym_email)
VALUES ('GYM1', 'PowerFit', 'Los Angeles', '12345678', 'info@powerfit.com');

INSERT INTO Gym (gym_id, gym_name, gym_location, gym_contact#, gym_email)
VALUES ('GYM2', 'IronStrong', 'New York', '87654321', 'info@ironstrong.com');

INSERT INTO Gym (gym_id, gym_name, gym_location, gym_contact#, gym_email)
VALUES ('GYM3', 'FlexGym', 'San Francisco', '55555555', 'info@flexgym.com');

INSERT INTO Gym (gym_id, gym_name, gym_location, gym_contact#, gym_email)
VALUES ('GYM4', 'EliteFitness', 'Miami', '98765432', 'info@elitefitness.com');


INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN001', 'John Smith', '123 Main St, Los Angeles', '11111111', 'M', 'GYM1');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN002', 'Emily Brown', '456 Oak Ave, New York', '22222222', 'F', 'GYM2');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN003', 'David Lee', '789 Pine St, San Francisco', '33333333', 'M', 'GYM3');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN004', 'Sarah Davis', '321 Elm St, Miami', '44444444', 'F', 'GYM4');


INSERT INTO Membership (mr_id, mr_type)
VALUES ('M001', 'Basic');

INSERT INTO Membership (mr_id, mr_type)
VALUES ('M002', 'Premium');

INSERT INTO Membership (mr_id, mr_type)
VALUES ('M003', 'Gold');

INSERT INTO Membership (mr_id, mr_type)
VALUES ('M004', 'VIP');



SELECT * FROM Membership;
