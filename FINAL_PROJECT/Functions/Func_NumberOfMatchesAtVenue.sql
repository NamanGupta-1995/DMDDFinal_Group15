CREATE FUNCTION NumOfMatchesAtVenue (@venueName VARCHAR(20))
RETURNS INT
BEGIN
DECLARE @return int;
SELECT @return = COUNT(MatchID) from Match m 
JOIN Venue v on v.VenueID = m.VenueID
WHERE v.VenueName = @venueName 
RETURN @return
END;

select dbo.NumOfMatchesAtVenue('Ethihad Stadium') AS NumberofMatches;