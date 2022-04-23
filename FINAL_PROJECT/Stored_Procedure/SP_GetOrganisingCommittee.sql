CREATE PROCEDURE GetOrganisingCommittee @date1 date , @date2 date
AS 
BEGIN 
Select CommitteeName , CommitteePresident , OfficeAddress 
FROM Organising_Committee 
where ExpiryDate BETWEEN @date1 AND @date2 

END 

Exec GetOrganisingCommittee @date1 = '1910-06-06' , @date2 = '2000-06-06' ;
