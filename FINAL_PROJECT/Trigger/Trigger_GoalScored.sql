CREATE TRIGGER GoalScored
ON Goal
FOR  INSERT
AS
BEGIN

DECLARE @PlayerID INT, @MatchID INT, @TeamID INT

SET @PlayerID = (SELECT PlayerID from inserted)
SET @MatchID = (SELECT MatchID from inserted)

UPDATE Player
SET Goals_overall = Goals_overall + 1, @TeamID = Player.TeamID
WHERE PlayerID = @PlayerID

IF (SELECT TeamA FROM [Match] WHERE MatchID=@MatchID) = @TeamID
BEGIN 
    UPDATE [Match]
    SET TeamA_Score = TeamA_Score + 1
    WHERE MatchID=@MatchID
END
IF (SELECT TeamB FROM [Match] WHERE MatchID=@MatchID) = @TeamID
BEGIN
    UPDATE [Match]
    SET TeamB_Score = TeamB_Score + 1
    WHERE MatchID=@MatchID
END

END
