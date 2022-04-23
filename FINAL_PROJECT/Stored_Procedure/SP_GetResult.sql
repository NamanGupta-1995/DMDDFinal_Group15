CREATE PROCEDURE GetResult @result varchar(20) OUTPUT 
AS
BEGIN 
Select MatchID , MatchDate ,
CASE when TeamA_Score > TeamB_Score THEN 'Team_A_Winner ' ELSE 'Team_B_Winner' END AS Result 
FROM Match 
WHERE CASE WHEN  TeamA_Score > TeamB_Score THEN 'Team_A_Winner'  ELSE 'Team_B_Winner' END = @result

END

Exec GetResult 'Team_A_Winner' ;
