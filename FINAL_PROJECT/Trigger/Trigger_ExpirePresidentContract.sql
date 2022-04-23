CREATE TRIGGER ExpireLastCommitteePresidentContract
ON Organising_Committee
FOR  INSERT
AS
BEGIN

DECLARE @LastPresident INT, @CurrentPresident INT, @TeamID INT

SET @CurrentPresident = (SELECT CommitteeID from inserted)
SET @LastPresident = (SELECT CommitteeID from Organising_Committee Where ExpiryDate IS NULL AND CommitteeID <> @CurrentPresident)

UPDATE Organising_Committee
SET ExpiryDate = GETDATE() 
WHERE CommitteeID = @LastPresident
END
