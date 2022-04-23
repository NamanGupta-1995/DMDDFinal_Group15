CREATE VIEW ASSISTS_BY_TEAM AS
SELECT TeamID , max(Assists_overall) as Maximum_Number_Of_Assists , max(Assists_home) as Maximum_Assists_Home , max(Assists_away) as Maximum_Assists_Away
FROM Player 
Where Assists_overall > 0 
GROUP BY TeamID ;

Select * from ASSISTS_BY_TEAM ;