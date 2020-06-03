--#1
SELECT * from Genre;

--#2
SELECT * from Artist
ORDER BY ArtistName;

--#3
SELECT 
	song.Title,
	artist.ArtistName
FROM Song song
JOIN Artist artist ON song.ArtistId = artist.Id;

--#4
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

--#5
SELECT * FROM Artist ar
LEFT JOIN Album al ON ar. Id = al.ArtistId
LEFT JOIN Genre g ON g.Id = al.GenreId
WHERE al.GenreId = 4 
OR al.GenreId = 3;

--#6
SELECT 
	album.Title
FROM Album album
LEFT JOIN Song song ON song.AlbumId = album.Id
WHERE song.AlbumId IS NULL;

--#7
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Ella Fitzgerald', 1950);

--#8
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Hello, Love', '1959', 3913, 'Verve', 33, 3);

--#9
INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, AlbumId, GenreId) VALUES ('Stairway to the Stars', 254, '1959', 33, 27, 3);

INSERT INTO Song (Title, SongLength, ReleaseDate, ArtistId, AlbumId, GenreId) VALUES ('Ill Never Be the Same', 427, '1959', 33, 27, 3);

--#10
SELECT 
	song.Title,
	artist.ArtistName,
	album.Title
FROM Song song
LEFT JOIN Artist artist ON song.ArtistId = artist.Id
LEFT JOIN Album album ON song.AlbumId = album.Id
WHERE artist.Id = 33;

--#11
SELECT 
	album.Title AS 'Album',
	COUNT(song.Id) AS '# Songs'
FROM Album album
LEFT JOIN Song song on album.Id = song.AlbumId
GROUP BY album.Title;

--#12
SELECT 
	artist.ArtistName AS 'Artist',
	COUNT(song.Id) AS '# Songs'
FROM Artist artist
LEFT JOIN Song song ON artist.Id = song.ArtistId
GROUP BY artist.ArtistName

--#13
SELECT 
	genre.Label AS 'Genre',
	COUNT(song.Id) AS '# Songs'
FROM Genre genre
LEFT JOIN Song song ON genre.Id = song.GenreId
GROUP BY genre.Label;

--#14
SELECT
	artist.ArtistName AS 'Artist',
	COUNT (DISTINCT album.Label) AS '# Labels'
FROM Album album
LEFT JOIN Artist artist ON artist.Id = album.ArtistId
GROUP BY artist.ArtistName
HAVING COUNT (DISTINCT album.Label) > 1;

--#15
SELECT
	album.Title AS 'Album',
	album.AlbumLength AS 'Length'
FROM Album album
WHERE album.AlbumLength = 
	(SELECT MAX(AlbumLength) FROM album);

--#16/17
SELECT 
	song.Title AS 'Song',
	album.Title AS 'Album',
	song.SongLength AS 'Length'
FROM Song song
JOIN Album album ON song.AlbumId = album.Id
WHERE song.SongLength =
	(SELECT MAX(SongLength) FROM song);
