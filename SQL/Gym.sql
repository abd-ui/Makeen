
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

