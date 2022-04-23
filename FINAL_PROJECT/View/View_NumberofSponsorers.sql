CREATE VIEW Number_of_Sponsorers AS
select  TeamID , count(SponsorerID) as Number_of_Sponsorers 
from Sponsored_By 
where ContractSigned_Date IS NOT NULL 
group by TeamID ;

Select * from Number_of_Sponsorers ;