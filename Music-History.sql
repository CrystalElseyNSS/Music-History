SELECT * from Genre;

SELECT * from Artist
ORDER BY ArtistName;

SELECT 
	song.Title,
	artist.ArtistName
FROM Song song
JOIN Artist artist ON song.ArtistId = artist.Id;

SELECT
	album.Title,
	artist.ArtistName
FROM Album album
LEFT JOIN Genre genre on Album.GenreId = genre.Id
LEFT JOIN Artist artist on Album.ArtistId = artist.Id
WHERE album.GenreId = 7;

SELECT * from Artist ar
LEFT JOIN Album al ON ar.Id = al.artistId
LEFT JOIN Genre g ON g.Id = al.genreId
WHERE g.Label = 'Soul';

SELECT * FROM Artist ar
LEFT JOIN Album al ON ar. Id = al.ArtistId
LEFT JOIN Genre g ON g.Id = al.GenreId
WHERE al.GenreId = 4 
OR al.GenreId = 3;

SELECT 
	album.Title
FROM Album album
LEFT JOIN Song song ON song.AlbumId = album.Id
WHERE song.AlbumId IS NULL;

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Ella Fitzgerald', 1950);

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Hello, Love', '1959', 3913, 'Verve', 33, 3);

INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, AlbumId, GenreId) VALUES ('Stairway to the Stars', 254, '1959', 33, 27, 3);

INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, AlbumId, GenreId) VALUES ('Ill Never Be the Same', 427, '1959', 33, 27, 3);



