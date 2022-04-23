CREATE VIEW Surface_Type_of_Venue AS
SELECT VenueName ,VenueAddress, Surface_type 
FROM Venue 
where Surface_type = 'Desso GrassMaster' 
group by VenueName , VenueAddress , Surface_type ;

Select * from Surface_Type_of_Venue ;