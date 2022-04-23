ALTER TABLE PLAYER  

ADD Username VARCHAR(50), [Password] Varbinary(400) 

 



 

CREATE CERTIFICATE PlayerPass 

WITH SUBJECT = 'Player Password' 

GO 

 

CREATE SYMMETRIC KEY PlayerPass_SM 

WITH ALGORITHM = AES_256 

ENCRYPTION BY CERTIFICATE PlayerPass 

 

OPEN SYMMETRIC KEY PlayerPass_SM 

DECRYPTION BY CERTIFICATE PlayerPass 

 

UPDATE [Player] 

SET [Username] = PlayerName, [Password] = ENCRYPTBYKEY(KEY_GUID('PlayerPass_SM'), CONVERT(varbinary,'Password123')) 

 

SELECT *, CONVERT(varchar,DECRYPTBYKEY([Password])) AS 'Decrypted Password' 

FROM [Player] 