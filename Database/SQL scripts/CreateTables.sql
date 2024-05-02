DROP TABLE IF EXISTS BandAlbumSong;
DROP TABLE IF EXISTS Band;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Song;

--Band table. Year can be unknown and pic can be unavailable
CREATE TABLE Band(IdBand UNIQUEIDENTIFIER default NEWID() NOT NULL, BandName varchar(50) NOT NULL, FoundationYear date, IdPic int,
PRIMARY KEY (IdBand))

--Album table. Year can be unknown and pic can be unavailable
CREATE TABLE Album(IdAlbum UNIQUEIDENTIFIER default NEWID() NOT NULL, AlbumName varchar(50) NOT NULL, ProductionYear date, IdPic int,
PRIMARY KEY (IdAlbum))

--Song table
CREATE TABLE Song(IdSong UNIQUEIDENTIFIER default NEWID() NOT NULL, SongName varchar(50) NOT NULL,
PRIMARY KEY (IdSong))

--Connecting table. Delete Entry on any reference deletion. IdAlbum can be NULL for singles
CREATE TABLE BandAlbumSong(IdBand UNIQUEIDENTIFIER NOT NULL, IdAlbum UNIQUEIDENTIFIER, IdSong UNIQUEIDENTIFIER NOT NULL,
PRIMARY KEY (IdBand, IdSong),
FOREIGN KEY (IdBand) REFERENCES Band(IdBand) ON DELETE CASCADE,
FOREIGN KEY (IdAlbum) REFERENCES Album(IdAlbum) ON DELETE CASCADE,
FOREIGN KEY (IdSong) REFERENCES Song(IdSong) ON DELETE CASCADE)
