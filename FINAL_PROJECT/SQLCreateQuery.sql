Create Table Sponsorer(   

SponsorerID int NOT NULL IDENTITY(1,1),       

Name varchar(20) ,   

BrandName varchar(20),   

ExpiryDate Date ,  

CONSTRAINT Sponsorer_PK PRIMARY KEY(SponsorerID) );   

 

Create Table Venue (   

    VenueID int NOT NULL IDENTITY(50,1) ,   

    VenueName varchar(20),   

    VenueAddress varchar(30),   

    Field_Size int ,   

    Capacity int ,   

    Surface_type varchar(20),   

      CONSTRAINT Venue_PK PRIMARY KEY(VenueID) );   

 

Create Table Team (   

    TeamID int NOT NULL IDENTITY(1001,1) ,   

    VenueID int NOT NULL ,   

    Name varchar(25),   

    Rank int ,   

    City varchar(20) ,   

    Address varchar(25),    

    Contact varchar(10),   

     CONSTRAINT Team_PK PRIMARY KEY(TeamID),   

    CONSTRAINT TeamVenue_FK FOREIGN KEY(VenueID) REFERENCES Venue(VenueID));   

 

  Create Table Owner (   

    OwnerID int NOT NULL IDENTITY(150,1),   

    TeamID int NOT NULL ,   

    OwnerName varchar(25),   

    OwnerAddress varchar(25),   

    OwnerEmailID varchar(30),   

    ExpiryDate Date ,   

    CONSTRAINT Owner_PK PRIMARY KEY(OwnerID),   

    CONSTRAINT OwnerTeam_FK FOREIGN KEY(TeamID) REFERENCES Team(TeamID));   

 

   Create Table Sponsored_By(   

     ID int NOT NULL IDENTITY(200,1),   

     ContractSigned_Date Date ,   

     TeamID int NOT NULL ,   

     SponsorerID int NOT NULL  ,   

       CONSTRAINT SponsoredBy_PK  PRIMARY KEY (SponsorerID,TeamID),   

     CONSTRAINT SponsoredBy_Team_FK FOREIGN KEY(TeamID) REFERENCES Team(TeamID),   

     CONSTRAINT Sponsorer_FK FOREIGN KEY(SponsorerID) REFERENCES Sponsorer(SponsorerID)) ; 

 

   Create Table Organising_Committee (   

    CommitteeID int NOT NULL IDENTITY(250,1),   

    CommitteeName varchar(25),   

    CommitteePresident varchar(25),   

    OfficeAddress varchar(25),   

   ExpiryDate Date ,  

  CONSTRAINT  Organising_C_PK PRIMARY KEY(CommitteeID));   

           Create Table Player (   

PlayerID INT NOT NULL IDENTITY(4000,1),  

TeamID  INT NOT NULL,  

PlayerName  varchar(40) NOT NULL,  

Age INT NOT NULL,  

Nationality varchar(20) NOT NULL,  

Position varchar(20),  

Assists_overall INT,  

Assists_home	INT,  

Assists_away	INT,  

Penalty_goals   INT,  

Penalty_misses  INT,  

Yellow_cards_overall	INT,  

Red_cards_overall   INT,  

Dominant_leg	varchar(10) NOT NULL,  

Goals_overall INT,  

Goals_home INT,  

Goals_away INT  

              CONSTRAINT  Player_PK PRIMARY KEY(PlayerID),   

CONSTRAINT  PlayerTeam_FK FOREIGN KEY(TeamID) REFERENCES Team(TeamID));   

 

 

 

 

Create Table Coach (   

 CoachID int NOT NULL IDENTITY(350,1),   

 TeamID int NOT NULl ,   

 TeamName varchar(25),   

 Name varchar(25),   

 PhoneNumber VARCHAR (10),   

 Coach_Contract_SD Date ,   

 Coach_Contract_ED Date,   

 Nationality varchar(25),   

 ExpiryDate Date ,    

  CONSTRAINT Coach_PK PRIMARY KEY (CoachID),   

 CONSTRAINT CoachTeam_FK FOREIGN KEY(TeamID) REFERENCES Team(TeamID));   

 

 

   Create Table Referee (   

    RefereeID int NOT NULL IDENTITY(400,1) ,   

    Country varchar(25),   

    Name varchar (25) ,   

   ExpiryDate Date ,   

    CONSTRAINT Referee_PK PRIMARY KEY (RefereeID) );   

 

 

Create Table Match (   

MatchID int NOT NULL IDENTITY(450,1),   

CommitteeID int NOT NULL  ,   

RefereeID int NOT NULL ,   

VenueID int NOT NULL ,   

TeamA int NOT NULL ,   

TeamB int NOT NULL,   

TeamA_Score int NOT NULL,   

TeamB_Score int NOT NULL ,   

Extra_Time int NOT NULL ,  

MatchDate Date NOT NULL   

   

CONSTRAINT Match_PK PRIMARY KEY(MatchID),   

CONSTRAINT MatchCommittee_FK FOREIGN KEY (CommitteeID) REFERENCES Organising_Committee(CommitteeID),   

CONSTRAINT MatchReferee_FK FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID),   

CONSTRAINT MatchVenue_FK FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),   

CONSTRAINT MatchWin_FK FOREIGN KEY(TeamA) REFERENCES Team(TeamID),   

CONSTRAINT MatchLose_FK FOREIGN KEY(TeamB) REFERENCES Team(TeamID) ) ; 

  

 

 

 

 

CREATE TABLE Defender  (  

PlayerID INT NOT NULL,  

Rank_in_league_top_defenders	INT  

           CONSTRAINT Defender_FK FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID) );  

 

 

CREATE TABLE MidFielder  (  

PlayerID	INT NOT NULL,  

Rank_in_league_top_midfielders  INT  

             CONSTRAINT MidFielder_FK FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID) );  

 

 

CREATE TABLE GoalKeeper  (  

PlayerID	INT NOT NULL,  

Goals_saved INT   

           CONSTRAINT GoalKeeper_FK FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID) );  

 

 

CREATE TABLE Attack  (  

PlayerID	INT NOT NULL,  

Rank_in_league_top_attackers	INT,  

Penalty_Scored  INT  

            CONSTRAINT Attack_FK FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID) );  

 

Create Table Goal(   

     GoalID int NOT NULL IDENTITY(500,1),   

     MatchID int NOT NULL ,   

     PlayerID int NOT NULL ,   

     Time datetime ,   

       

     CONSTRAINT Goal_PK  PRIMARY KEY (GoalID),   

     CONSTRAINT GoalMatch_FK FOREIGN KEY(MatchID) REFERENCES Match(MatchID),   

     CONSTRAINT GoalPlayer_FK FOREIGN KEY(PlayerID) REFERENCES Player(PlayerID));   

 

 