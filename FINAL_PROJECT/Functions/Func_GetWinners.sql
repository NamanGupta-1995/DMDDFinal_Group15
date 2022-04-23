CREATE FUNCTION GetWinners (@matchID int)
RETURNS varchar(25) 
BEGIN 
declare @result varchar(25)
select @result = CASE WHEN TeamA_Score > TeamB_Score THEN 'TeamA_Wins' ELSE 'TeamB_Wins' END 
from Match 
where MatchID = @matchID 

RETURN @result 

END 

select *,dbo.GetWinners(452) as Winner from [Match]
WHERE MatchID = 452
