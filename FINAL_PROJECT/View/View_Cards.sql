CREATE VIEW Cards AS 
Select TeamID , count(Red_cards_overall)  as Red_Card_By_Team , count(Yellow_cards_overall) as Yellow_Card_By_Team , count(Penalty_goals) as Total_Penalty_Goals , count(Penalty_misses) as Total_Penalty_Misses
From Player 
where Red_cards_overall > 0 AND Yellow_cards_overall > 0
Group By TeamID ;

Select * from Cards ;