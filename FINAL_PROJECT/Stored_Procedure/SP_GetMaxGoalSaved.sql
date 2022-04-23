CREATE  PROCEDURE GetMaxGoalSaved (@player_id int)
AS
BEGIN 
    select p.PlayerID ,p.PlayerName , max(gk.Goals_saved) 
    as Maximum_Goals_Saved from GoalKeeper gk 
    JOIN  Player p ON gk.PlayerID = p.PlayerID 
    where p.PlayerID = @player_id 
    group by p.PlayerID , p.PlayerName
    order by max(gk.Goals_saved) DESC ;
END ;

Exec GetMaxGoalSaved '4010'
