ALTER TABLE OWNER  

ADD Username VARCHAR(50), [Password] Varbinary(400) 

 

CREATE MASTER KEY 

ENCRYPTION BY PASSWORD = 'FinalProject123'; 

 

CREATE CERTIFICATE OwnerPass 

WITH SUBJECT = 'Owner Password' 

GO 

 

CREATE SYMMETRIC KEY OwnerPass_SM 

WITH ALGORITHM = AES_256 

ENCRYPTION BY CERTIFICATE OwnerPass 

 

OPEN SYMMETRIC KEY OwnerPass_SM 

DECRYPTION BY CERTIFICATE OwnerPass 

 

UPDATE [Owner] 

SET [Username] = OwnerEmailID, [Password] = ENCRYPTBYKEY(KEY_GUID('OwnerPass_SM'), CONVERT(varbinary,'Password123')) 

 

SELECT *, CONVERT(varchar,DECRYPTBYKEY([Password])) AS 'Decrypted Password' 

FROM [Owner] 