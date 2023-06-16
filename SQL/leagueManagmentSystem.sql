-- Create League table
CREATE TABLE League (
    LeagueID VARCHAR(50),
    LeagueName VARCHAR(255),
    CONSTRAINT league_id_pk PRIMARY KEY (LeagueID)
);

-- Create Club table
CREATE TABLE Club (
    ClubID VARCHAR(50),
    ClubName VARCHAR(255),
    ClubLocation VARCHAR(255),
    ClubValue DECIMAL(10, 2),
    CurrentPosition INT,
    LeagueID VARCHAR(50),

    CONSTRAINT club_id_pk PRIMARY KEY (ClubID),
    CONSTRAINT club_name_unique UNIQUE (ClubName),
    CONSTRAINT club_location_not_null CHECK (ClubLocation IS NOT NULL),
    CONSTRAINT club_value_positive CHECK (ClubValue >= 0),
    CONSTRAINT current_position_positive CHECK (CurrentPosition >= 0),
    CONSTRAINT club_league_fk FOREIGN KEY (LeagueID) REFERENCES League(LeagueID),

);

-- Create Player table
CREATE TABLE Player (
  PlayerID VARCHAR(50),
  PlayerName VARCHAR(255),
  PlayerAge INT,
  Nationality VARCHAR(255),
  ClubID VARCHAR(50),
  PlayerSalary DECIMAL(10, 2),
  GoalsScored INT,

  CONSTRAINT player_id_pk PRIMARY KEY (PlayerID),
  CONSTRAINT player_age_positive CHECK (PlayerAge > 0),
  CONSTRAINT player_nationality_not_null CHECK (Nationality IS NOT NULL),
  CONSTRAINT player_club_fk FOREIGN KEY (ClubID) REFERENCES Club(ClubID),
  CONSTRAINT player_salary_positive CHECK (PlayerSalary >= 0),
  CONSTRAINT player_goals_positive CHECK (GoalsScored >= 0)
);


-- Create Referee table
CREATE TABLE Referee (
  RefereeID VARCHAR(50),
  RefereeName VARCHAR(255),
  Nationality VARCHAR(255),
  RefereeSalary DECIMAL(10, 2),

  CONSTRAINT referee_id_pk PRIMARY KEY (RefereeID),
  CONSTRAINT referee_name_unique UNIQUE (RefereeName),
  CONSTRAINT referee_nationality_not_null CHECK (Nationality IS NOT NULL),
  CONSTRAINT referee_salary_positive CHECK (RefereeSalary >= 0)
);

-- Create Stadium table
CREATE TABLE Stadium (
  StadiumID VARCHAR(50),
  StadiumName VARCHAR(255),
  StadiumLocation VARCHAR(255),
  Capacity INT,

  CONSTRAINT stadium_id_pk PRIMARY KEY (StadiumID),
  CONSTRAINT stadium_name_unique UNIQUE (StadiumName),
  CONSTRAINT stadium_location_not_null CHECK (StadiumLocation IS NOT NULL),
  CONSTRAINT stadium_capacity_positive CHECK (Capacity > 0)
);

-- Create Match table
CREATE TABLE Match (
  MatchID VARCHAR(50),
  MatchDate DATE,
  HomeClubScore INT,
  AwayClubScore INT,
  Attendance INT,
  HomeClubID VARCHAR(50),
  AwayClubID VARCHAR(50),
  RefereeID VARCHAR(50),
  StadiumID VARCHAR(50),

  CONSTRAINT match_id_pk PRIMARY KEY (MatchID),
  CONSTRAINT match_date_not_null CHECK (MatchDate IS NOT NULL),
  CONSTRAINT match_scores_positve CHECK (HomeClubScore >= 0 AND AwayClubScore >= 0),
  CONSTRAINT match_attendance_positve CHECK (Attendance >= 0),
  CONSTRAINT match_club_fk FOREIGN KEY (HomeClubID) REFERENCES Club(ClubID),
  CONSTRAINT match_away_club_fk FOREIGN KEY (AwayClubID) REFERENCES Club(ClubID),
  CONSTRAINT match_referee_fk FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID),
  CONSTRAINT match_stadium_fk FOREIGN KEY (StadiumID) REFERENCES Stadium(StadiumID)
);
-- Create Season table
CREATE TABLE Season (
  SeasonID VARCHAR(50),
  StartYear INT,
  EndYear INT,

  CONSTRAINT season_id_pk PRIMARY KEY (SeasonID),
  CONSTRAINT start_year_end_year_check CHECK (StartYear < EndYear)
);


-- Create Manager table
CREATE TABLE Manager (
  ManagerID VARCHAR(50),
  ManagerName VARCHAR(255),
  Nationality VARCHAR(255),
  ClubID VARCHAR(50),

  CONSTRAINT manager_id_pk PRIMARY KEY (ManagerID),
  CONSTRAINT manager_club_fk FOREIGN KEY (ClubID) REFERENCES Club(ClubID)
);

-- Create ClubSeason table
CREATE TABLE ClubSeason (
    ClubID VARCHAR(50),
    SeasonID VARCHAR(50),
    LeagueID VARCHAR(50),
    Position INT,

    CONSTRAINT clubseason_id_pk PRIMARY KEY (ClubID, SeasonID),
    CONSTRAINT clubseason_club_fk FOREIGN KEY (ClubID) REFERENCES Club(ClubID),
    CONSTRAINT clubseason_season_fk FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID),
    CONSTRAINT clubseason_league_fk FOREIGN KEY (LeagueID) REFERENCES League(LeagueID),
    CONSTRAINT position_positive CHECK (Position > 0)
);

