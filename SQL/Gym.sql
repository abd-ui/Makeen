
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
VALUES ('G001', 'PowerFit', 'Los Angeles', '12345678', 'info@powerfit.com');

INSERT INTO Gym (gym_id, gym_name, gym_location, gym_contact#, gym_email)
VALUES ('G002', 'IronStrong', 'New York', '87654321', 'info@ironstrong.com');

INSERT INTO Gym (gym_id, gym_name, gym_location, gym_contact#, gym_email)
VALUES ('G003', 'FlexGym', 'San Francisco', '55555555', 'info@flexgym.com');

INSERT INTO Gym (gym_id, gym_name, gym_location, gym_contact#, gym_email)
VALUES ('G004', 'EliteFitness', 'Miami', '98765432', 'info@elitefitness.com');


INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN001', 'John Smith', '123 Main St, Los Angeles', '11111111', 'M', 'G001');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN002', 'Emily Brown', '456 Oak Ave, New York', '22222222', 'F', 'G002');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN003', 'David Lee', '789 Pine St, San Francisco', '33333333', 'M', 'G003');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN004', 'Sarah Davis', '321 Elm St, Miami', '44444444', 'F', 'G004');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN005', 'Michael Johnson', '987 Oak St, Los Angeles', '55555555', 'M', 'G001');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN006', 'Sophia Wilson', '456 Pine Ave, New York', '66666666', 'F', 'G002');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN007', 'Daniel Thompson', '789 Elm St, San Francisco', '77777777', 'M', 'G003');

INSERT INTO Trainer (t_id, t_name, t_address, t_mobile#, t_gender, t_gym_id)
VALUES ('TRN008', 'Olivia Davis', '321 Maple Ave, Miami', '88888888', 'F', 'G004');



INSERT INTO Membership (mr_id, mr_type)
VALUES ('M001', 'Basic');

INSERT INTO Membership (mr_id, mr_type)
VALUES ('M002', 'Premium');

INSERT INTO Membership (mr_id, mr_type)
VALUES ('M003', 'Gold');

INSERT INTO Membership (mr_id, mr_type)
VALUES ('M004', 'VIP');


INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB001', 'Michael Wong', '789 Maple Ave, Los Angeles', '1990-05-10', 'michael@example.com', '55555555', 'M', 'G001', 'M002');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB002', 'Jessica Chen', '123 Oak St, New York', '1985-09-22', 'jessica@example.com', '66666666', 'F', 'G002', 'M001');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB003', 'Alex Johnson', '456 Elm St, San Francisco', '1992-02-14', 'alex@example.com', '77777777', 'M', 'G003', 'M004');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB004', 'Emily Davis', '321 Pine Ave, Miami', '1988-11-30', 'emily@example.com', '88888888', 'F', 'G004', 'M003');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB005', 'David Johnson', '987 Oak St, Los Angeles', '1995-07-15', 'david@example.com', '99999999', 'M', 'G001', 'M001');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB006', 'Emily Wilson', '456 Pine Ave, New York', '1993-03-18', 'emily@example.com', '11111112', 'F', 'G002', 'M002');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB007', 'Daniel Thompson', '789 Elm St, San Francisco', '1991-11-24', 'daniel@example.com', '22222223', 'M', 'G003', 'M003');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB008', 'Olivia Davis', '321 Maple Ave, Miami', '1994-09-08', 'olivia@example.com', '33333334', 'F', 'G004', 'M004');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB009', 'Jacob Thompson', '123 Oak St, Los Angeles', '1996-02-20', 'jacob@example.com', '44444445', 'M', 'G001', 'M002');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB010', 'Sophia Wilson', '456 Pine Ave, New York', '1990-09-12', 'sophia@example.com', '55555556', 'F', 'G002', 'M001');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB011', 'Michael Johnson', '789 Elm St, San Francisco', '1993-06-27', 'michael@example.com', '66666667', 'M', 'G003', 'M003');

INSERT INTO Member (mb_id, mb_name, mb_address, mb_dob, mb_email, mb_mobile#, mb_gender, mb_gym_id, mr_mb_id)
VALUES ('MB012', 'Emma Davis', '321 Maple Ave, Miami', '1992-12-05', 'emma@example.com', '77777778', 'F', 'G004', 'M004');




INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ001', 'Treadmill', 'Life Fitness', 'G001');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ002', 'Dumbbells', 'Bowflex', 'G002');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ003', 'Exercise Bike', 'Schwinn', 'G003');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ004', 'Smith Machine', 'Hammer Strength', 'G004');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ005', 'Elliptical Trainer', 'NordicTrack', 'G001');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ006', 'Barbell Set', 'Rogue Fitness', 'G002');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ007', 'Rowing Machine', 'Concept2', 'G003');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ008', 'Leg Press Machine', 'Nautilus', 'G004');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ009', 'Stationary Bike', 'Schwinn', 'G001');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ010', 'Smith Machine', 'Life Fitness', 'G002');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ011', 'Dumbbell Set', 'Bowflex', 'G003');

INSERT INTO Equipment (eq_id, eq_name, eq_brand, eq_gym_id)
VALUES ('EQ012', 'Rowing Machine', 'WaterRower', 'G004');





SELECT * FROM Member;

SELECT gym_name, gym_location FROM Gym;

SELECT t_name, gym_name
FROM Trainer, Gym 
WHERE Trainer.t_gym_id = Gym.gym_id;

SELECT mb_name, gym_name, mr_type
FROM Member , Gym , Membership
WHERE (Member.mb_gym_id = Gym.gym_id) AND (Member.mr_mb_id = Membership.mr_id);

SELECT t_name, gym_name
FROM Trainer , Gym
WHERE (Trainer.t_gym_id = Gym.gym_id) AND (gym_location = 'Los Angeles');


