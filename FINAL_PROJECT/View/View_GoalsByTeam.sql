CREATE VIEW GOALS_BY_TEAM AS 
SELECT  TeamID, max(Goals_overall) as Maximum_Number_Of_Goals , max(Goals_home) as Maximum_Goals_Home , max(Goals_away) as Maximum_Goals_Away 
FROM Player 
WHERE Goals_overall > 0 
GROUP BY TeamID ; 

Select * from GOALS_BY_TEAM ;