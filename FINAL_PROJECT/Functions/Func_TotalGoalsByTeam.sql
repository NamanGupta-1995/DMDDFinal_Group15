CREATE FUNCTION TotalGoalsByTeam (@TeamID int )
RETURNS INT 
BEGIN 
DECLARE @total int ;
Select @total = sum(Goals_overall)  from Team t 
JOIN Player p ON t.TeamID = p.TeamID 
where t.TeamID = @TeamID 
RETURN @total 
END ;


select dbo.TotalGoalsByTeam(1001) AS TotalGoals ;