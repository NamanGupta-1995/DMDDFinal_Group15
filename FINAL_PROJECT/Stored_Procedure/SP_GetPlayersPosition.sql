CREATE PROCEDURE GetPlayersPosition @position_type varchar(20)
AS 
BEGIN 
Select  PlayerID ,PlayerName ,Age , Nationality
From Player 
where [Position] = @position_type AND Goals_overall > 0 ;
END ;

Exec GetPlayersPosition @position_type = 'Defender' ;
