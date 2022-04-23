CREATE VIEW AVERAGE_AGE AS
Select t.TeamID ,t.Name ,t.City ,  avg(p.Age) as Average_Age_of_Team
from Player p JOIN Team t ON p.TeamID = t.TeamID
where Age > 25
Group By t.TeamID , t.Name , t.City ; 


Select * from AVERAGE_AGE ;