ALTER TABLE Team  
ADD CONSTRAINT rankValue CHECK (Rank >= 1 );  


ALTER TABLE Team  
ADD CONSTRAINT contactValid CHECK (LEN(Contact) = 10 ); 



ALTER TABLE COACH  
ADD CONSTRAINT assignedValid UNIQUE(TeamName);  




