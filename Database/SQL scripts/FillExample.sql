-- Insert 20 different bands
INSERT INTO Band (BandName, FoundationYear) VALUES ('Amon Amarth', '1992');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Metallica', '1981');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Led Zeppelin', '1968');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Pink Floyd', '1965');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Queen', '1970');
INSERT INTO Band (BandName, FoundationYear) VALUES ('The Beatles', '1960');
INSERT INTO Band (BandName, FoundationYear) VALUES ('AC/DC', '1973');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Nirvana', '1987');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Black Sabbath', '1968');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Guns N Roses', '1985');
INSERT INTO Band (BandName, FoundationYear) VALUES ('The Rolling Stones', '1962');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Iron Maiden', '1975');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Deep Purple', '1968');
INSERT INTO Band (BandName, FoundationYear) VALUES ('The Doors', '1965');
INSERT INTO Band (BandName, FoundationYear) VALUES ('System of a Down', '1994');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Megadeth', '1983');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Rammstein', '1994');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Tool', '1990');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Slayer', '1981');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Opeth', '1989');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Pantera', '1981');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Judas Priest', '1969');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Pearl Jam', '1990');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Radiohead', '1985');
INSERT INTO Band (BandName, FoundationYear) VALUES ('KISS', '1973');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Van Halen', '1972');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Rage Against the Machine', '1991');
INSERT INTO Band (BandName, FoundationYear) VALUES ('The Who', '1964');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Nine Inch Nails', '1988');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Foo Fighters', '1994');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Alice in Chains', '1987');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Bon Jovi', '1983');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Def Leppard', '1977');
INSERT INTO Band (BandName, FoundationYear) VALUES ('The Clash', '1976');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Rush', '1968');
INSERT INTO Band (BandName, FoundationYear) VALUES ('The Police', '1977');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Lynyrd Skynyrd', '1964');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Santana', '1966');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Cream', '1966');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Ramones', '1974');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Dire Straits', '1977');
INSERT INTO Band (BandName, FoundationYear) VALUES ('ZZ Top', '1969');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Soundgarden', '1984');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Green Day', '1986');
INSERT INTO Band (BandName, FoundationYear) VALUES ('The Smashing Pumpkins', '1988');
INSERT INTO Band (BandName, FoundationYear) VALUES ('Creedence Clearwater Revival', '1967');

-- Albums for Amon Amarth (ID: 1)
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Twilight of the Thunder God', '2008');

-- Albums for Metallica (ID: 2)
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Master of Puppets', '1986');

-- Albums for Led Zeppelin (ID: 3)
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Led Zeppelin', '1969');

-- Albums for Pink Floyd (ID: 4)
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('The Dark Side of the Moon', '1973');

-- Songs for Amon Amarth (ID: 1)
INSERT INTO Song (SongName) VALUES ('Death in Fire');

-- Songs for Metallica (ID: 2)
INSERT INTO Song (SongName) VALUES ('One');

-- Songs for Led Zeppelin (ID: 3)
INSERT INTO Song (SongName) VALUES ('Whole Lotta Love');

-- Songs for Pink Floyd (ID: 4-5)
INSERT INTO Song (SongName) VALUES ('Money');
INSERT INTO Song (SongName) VALUES ('Wish You Were Here');

DECLARE @AmonAmarthId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Amon Amarth');
DECLARE @AmonAmarthAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Twilight of the Thunder God');
DECLARE @AmonAmarthAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Versus the World');
DECLARE @AmonAmarthSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Death in Fire');
DECLARE @AmonAmarthSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Cry of the Black Birds');

-- Relations for Amon Amarth (ID: 1)
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@AmonAmarthId, @AmonAmarthAlbum1Id, @AmonAmarthSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@AmonAmarthId, @AmonAmarthAlbum2Id, @AmonAmarthSong2Id);

DECLARE @MetallicaId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Metallica');
DECLARE @MetallicaAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Master of Puppets' );
DECLARE @MetallicaAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = '...And Justice for All' );
DECLARE @MetallicaSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'One');
DECLARE @MetallicaSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Enter Sandman');

DECLARE @LedZeppelinId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Led Zeppelin');
DECLARE @LedZeppelinAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Led Zeppelin' );
DECLARE @LedZeppelinAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Led Zeppelin II');
DECLARE @LedZeppelinSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Whole Lotta Love');
DECLARE @LedZeppelinSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Stairway to Heaven');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@LedZeppelinId, @LedZeppelinAlbum1Id, @LedZeppelinSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@LedZeppelinId, @LedZeppelinAlbum2Id, @LedZeppelinSong2Id);

-- Relations for Pink Floyd (ID: 4)
DECLARE @PinkFloydId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Pink Floyd');
DECLARE @PinkFloydAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'The Dark Side of the Moon' );
DECLARE @PinkFloydAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Wish You Were Here' );
DECLARE @PinkFloydSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Money');
DECLARE @PinkFloydSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Wish You Were Here');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@PinkFloydId, @PinkFloydAlbum1Id, @PinkFloydSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@PinkFloydId, @PinkFloydAlbum2Id, @PinkFloydSong2Id);

-- Amon Amarth
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('The Crusher', '2001');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Versus the World', '2002');
INSERT INTO Song (SongName) VALUES ('Death in Fire');
INSERT INTO Song (SongName) VALUES ('Cry of the Black Birds');


-- Metallica
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('...And Justice for All', '1988');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Metallica', '1991');
INSERT INTO Song (SongName) VALUES ('One');
INSERT INTO Song (SongName) VALUES ('Enter Sandman');


-- Led Zeppelin
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Led Zeppelin', '1969');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Led Zeppelin II', '1969');
INSERT INTO Song (SongName) VALUES ('Stairway to Heaven');
INSERT INTO Song (SongName) VALUES ('Whole Lotta Love');


-- Pink Floyd
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('The Dark Side of the Moon', '1973');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Wish You Were Here', '1975');
INSERT INTO Song (SongName) VALUES ('Money');
INSERT INTO Song (SongName) VALUES ('Wish You Were Here');


-- Queen
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('A Night at the Opera', '1975');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('The Game', '1980');
INSERT INTO Song (SongName) VALUES ('Bohemian Rhapsody');
INSERT INTO Song (SongName) VALUES ('Another One Bites the Dust');

-- The Beatles
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Sgt. Pepper''s Lonely Hearts Club Band', '1967');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Abbey Road', '1969');
INSERT INTO Song (SongName) VALUES ('Hey Jude');
INSERT INTO Song (SongName) VALUES ('Come Together');
DECLARE @QueenId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Queen');
DECLARE @QueenAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'A Night at the Opera');
DECLARE @QueenAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'The Game' );
DECLARE @QueenSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Bohemian Rhapsody');
DECLARE @QueenSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Another One Bites the Dust');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@QueenId, @QueenAlbum1Id, @QueenSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@QueenId, @QueenAlbum2Id, @QueenSong2Id);

-- Relations for The Beatles (ID: 6)
DECLARE @TheBeatlesId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'The Beatles');
DECLARE @TheBeatlesAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Sgt. Pepper''s Lonely Hearts Club Band');
DECLARE @TheBeatlesAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Abbey Road');
DECLARE @TheBeatlesSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Hey Jude');
DECLARE @TheBeatlesSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Come Together');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@TheBeatlesId, @TheBeatlesAlbum1Id, @TheBeatlesSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@TheBeatlesId, @TheBeatlesAlbum2Id, @TheBeatlesSong2Id);


-- AC/DC
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Back in Black', '1980');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Highway to Hell', '1979');
INSERT INTO Song (SongName) VALUES ('Back in Black');
INSERT INTO Song (SongName) VALUES ('Highway to Hell');


-- Nirvana
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Nevermind', '1991');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('In Utero', '1993');
INSERT INTO Song (SongName) VALUES ('Smells Like Teen Spirit');
INSERT INTO Song (SongName) VALUES ('Heart-Shaped Box');


-- Black Sabbath
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Paranoid', '1970');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Master of Reality', '1971');
INSERT INTO Song (SongName) VALUES ('Iron Man');
INSERT INTO Song (SongName) VALUES ('Paranoid');
DECLARE @ACDCId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'AC/DC');
DECLARE @ACDCAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Back in Black');
DECLARE @ACDCAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Highway to Hell');
DECLARE @ACDCSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Back in Black');
DECLARE @ACDCSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Highway to Hell');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@ACDCId, @ACDCAlbum1Id, @ACDCSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@ACDCId, @ACDCAlbum2Id, @ACDCSong2Id);

-- Relations for Nirvana (ID: 8)
DECLARE @NirvanaId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Nirvana');
DECLARE @NirvanaAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Nevermind');
DECLARE @NirvanaAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'In Utero');
DECLARE @NirvanaSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Smells Like Teen Spirit');
DECLARE @NirvanaSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Heart-Shaped Box');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@NirvanaId, @NirvanaAlbum1Id, @NirvanaSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@NirvanaId, @NirvanaAlbum2Id, @NirvanaSong2Id);

-- Relations for Black Sabbath (ID: 9)
DECLARE @BlackSabbathId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Black Sabbath');
DECLARE @BlackSabbathAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Paranoid');
DECLARE @BlackSabbathAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Master of Reality' );
DECLARE @BlackSabbathSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Iron Man');
DECLARE @BlackSabbathSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Paranoid');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@BlackSabbathId, @BlackSabbathAlbum1Id, @BlackSabbathSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@BlackSabbathId, @BlackSabbathAlbum2Id, @BlackSabbathSong2Id);


-- Guns N Roses
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Appetite for Destruction', '1987');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Use Your Illusion I', '1991');
INSERT INTO Song (SongName) VALUES ('Sweet Child o'' Mine');
INSERT INTO Song (SongName) VALUES ('November Rain');


-- The Rolling Stones
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Sticky Fingers', '1971');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Let It Bleed', '1969');
INSERT INTO Song (SongName) VALUES ('Paint It, Black');
INSERT INTO Song (SongName) VALUES ('Sympathy for the Devil');


-- Iron Maiden
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('The Number of the Beast', '1982');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Powerslave', '1984');
INSERT INTO Song (SongName) VALUES ('Run to the Hills');
INSERT INTO Song (SongName) VALUES ('The Trooper');
-- Relations for Guns N Roses (ID: 10)
DECLARE @GunsNRosesId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Guns N Roses');
DECLARE @GunsNRosesAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Appetite for Destruction' );
DECLARE @GunsNRosesAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Use Your Illusion I');
DECLARE @GunsNRosesSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Sweet Child o'' Mine');
DECLARE @GunsNRosesSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'November Rain');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@GunsNRosesId, @GunsNRosesAlbum1Id, @GunsNRosesSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@GunsNRosesId, @GunsNRosesAlbum2Id, @GunsNRosesSong2Id);

-- Relations for The Rolling Stones (ID: 11)
DECLARE @RollingStonesId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'The Rolling Stones');
DECLARE @RollingStonesAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Sticky Fingers');
DECLARE @RollingStonesAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Let It Bleed');
DECLARE @RollingStonesSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Paint It, Black');
DECLARE @RollingStonesSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Sympathy for the Devil');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@RollingStonesId, @RollingStonesAlbum1Id, @RollingStonesSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@RollingStonesId, @RollingStonesAlbum2Id, @RollingStonesSong2Id);

-- Relations for Iron Maiden (ID: 12)
DECLARE @IronMaidenId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Iron Maiden');
DECLARE @IronMaidenAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'The Number of the Beast');
DECLARE @IronMaidenAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Powerslave');
DECLARE @IronMaidenSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Run to the Hills');
DECLARE @IronMaidenSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'The Trooper');
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@IronMaidenId, @IronMaidenAlbum1Id, @IronMaidenSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@IronMaidenId, @IronMaidenAlbum2Id, @IronMaidenSong2Id);


-- Deep Purple
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Machine Head', '1972');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('In Rock', '1970');
INSERT INTO Song (SongName) VALUES ('Smoke on the Water');
INSERT INTO Song (SongName) VALUES ('Highway Star');


-- The Doors
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('The Doors', '1967');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('L.A. Woman', '1971');
INSERT INTO Song (SongName) VALUES ('Light My Fire');
INSERT INTO Song (SongName) VALUES ('Riders on the Storm');


-- System of a Down
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Toxicity', '2001');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Mezmerize', '2005');
INSERT INTO Song (SongName) VALUES ('Chop Suey!');
INSERT INTO Song (SongName) VALUES ('Aerials');


-- Megadeth
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Rust in Peace', '1990');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Countdown to Extinction', '1992');
INSERT INTO Song (SongName) VALUES ('Symphony of Destruction');
INSERT INTO Song (SongName) VALUES ('Hangar 18');


-- Rammstein
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Mutter', '2001');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Sehnsucht', '1997');
INSERT INTO Song (SongName) VALUES ('Du Hast');
INSERT INTO Song (SongName) VALUES ('Sonne');


-- Tool
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Lateralus', '2001');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('?nima', '1996');
INSERT INTO Song (SongName) VALUES ('Schism');
INSERT INTO Song (SongName) VALUES ('Stinkfist');


-- Slayer
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Reign in Blood', '1986');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('South of Heaven', '1988');
INSERT INTO Song (SongName) VALUES ('Angel of Death');
INSERT INTO Song (SongName) VALUES ('Raining Blood');


-- Opeth
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Blackwater Park', '2001');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Ghost Reveries', '2005');
INSERT INTO Song (SongName) VALUES ('Ghost of Perdition');
INSERT INTO Song (SongName) VALUES ('The Drapery Falls');


-- Pantera
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Vulgar Display of Power', '1992');
INSERT INTO Album (AlbumName, ProductionYear) VALUES ('Cowboys from Hell', '1990');
INSERT INTO Song (SongName) VALUES ('Walk');
INSERT INTO Song (SongName) VALUES ('Cemetery Gates');


-- Relations for Deep Purple (ID: 13)
DECLARE @DeepPurpleId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Deep Purple');
DECLARE @DeepPurpleAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Machine Head');
DECLARE @DeepPurpleAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'In Rock');
DECLARE @DeepPurpleSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Smoke on the Water');
DECLARE @DeepPurpleSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Highway Star');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@DeepPurpleId, @DeepPurpleAlbum1Id, @DeepPurpleSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@DeepPurpleId, @DeepPurpleAlbum2Id, @DeepPurpleSong2Id);

-- Relations for The Doors (ID: 14)
DECLARE @TheDoorsId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'The Doors');
DECLARE @TheDoorsAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'The Doors' );
DECLARE @TheDoorsAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'L.A. Woman' );
DECLARE @TheDoorsSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Light My Fire');
DECLARE @TheDoorsSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Riders on the Storm');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@TheDoorsId, @TheDoorsAlbum1Id, @TheDoorsSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@TheDoorsId, @TheDoorsAlbum2Id, @TheDoorsSong2Id);

-- Relations for System of a Down (ID: 15)
DECLARE @SystemOfADownId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'System of a Down');
DECLARE @SystemOfADownAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Toxicity');
DECLARE @SystemOfADownAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Mezmerize');
DECLARE @SystemOfADownSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Chop Suey!');
DECLARE @SystemOfADownSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Aerials');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@SystemOfADownId, @SystemOfADownAlbum1Id, @SystemOfADownSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@SystemOfADownId, @SystemOfADownAlbum2Id, @SystemOfADownSong2Id);

-- Relations for Megadeth (ID: 16)
DECLARE @MegadethId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Megadeth');
DECLARE @MegadethAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Rust in Peace');
DECLARE @MegadethAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Countdown to Extinction');
DECLARE @MegadethSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Symphony of Destruction');
DECLARE @MegadethSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Hangar 18');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@MegadethId, @MegadethAlbum1Id, @MegadethSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@MegadethId, @MegadethAlbum2Id, @MegadethSong2Id);

-- Relations for Rammstein (ID: 17)
DECLARE @RammsteinId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Rammstein');
DECLARE @RammsteinAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Mutter' );
DECLARE @RammsteinAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Sehnsucht' );
DECLARE @RammsteinSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Du Hast');
DECLARE @RammsteinSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Sonne');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@RammsteinId, @RammsteinAlbum1Id, @RammsteinSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@RammsteinId, @RammsteinAlbum2Id, @RammsteinSong2Id);

-- Relations for Tool (ID: 18)
DECLARE @ToolId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Tool');
DECLARE @ToolAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Lateralus' );
DECLARE @ToolAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = '?nima');
DECLARE @ToolSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Schism');
DECLARE @ToolSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Stinkfist');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@ToolId, @ToolAlbum1Id, @ToolSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@ToolId, @ToolAlbum2Id, @ToolSong2Id);

-- Relations for Slayer (ID: 19)
DECLARE @SlayerId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Slayer');
DECLARE @SlayerAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Reign in Blood');
DECLARE @SlayerAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'South of Heaven');
DECLARE @SlayerSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Raining Blood');
DECLARE @SlayerSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Angel of Death');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@SlayerId, @SlayerAlbum1Id, @SlayerSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@SlayerId, @SlayerAlbum2Id, @SlayerSong2Id);

---- Relations for Queen (ID: 20)
--DECLARE @QueenId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Queen');
--DECLARE @QueenAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'A Night at the Opera' AND IdBand = @QueenId);
--DECLARE @QueenAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Queen II' AND IdBand = @QueenId);
--DECLARE @QueenSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Bohemian Rhapsody');
--DECLARE @QueenSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'We Will Rock You');

--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@QueenId, @QueenAlbum1Id, @QueenSong1Id);
--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@QueenId, @QueenAlbum2Id, @QueenSong2Id);

---- Relations for Led Zeppelin (ID: 21)
--DECLARE @LedZeppelinId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Led Zeppelin');
--DECLARE @LedZeppelinAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Led Zeppelin IV' AND IdBand = @LedZeppelinId);
--DECLARE @LedZeppelinAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Physical Graffiti' AND IdBand = @LedZeppelinId);
--DECLARE @LedZeppelinSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Stairway to Heaven');
--DECLARE @LedZeppelinSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Whole Lotta Love');

--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@LedZeppelinId, @LedZeppelinAlbum1Id, @LedZeppelinSong1Id);
--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@LedZeppelinId, @LedZeppelinAlbum2Id, @LedZeppelinSong2Id);

-- Relations for Pink Floyd (ID: 22)
--DECLARE @PinkFloydId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Pink Floyd');
--DECLARE @PinkFloydAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'The Dark Side of the Moon' AND IdBand = @PinkFloydId);
--DECLARE @PinkFloydAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Wish You Were Here' AND IdBand = @PinkFloydId);
--DECLARE @PinkFloydSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Comfortably Numb');
--DECLARE @PinkFloydSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Another Brick in the Wall');

--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@PinkFloydId, @PinkFloydAlbum1Id, @PinkFloydSong1Id);
--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@PinkFloydId, @PinkFloydAlbum2Id, @PinkFloydSong2Id);

---- Relations for Nirvana (ID: 23)
--DECLARE @NirvanaId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Nirvana');
--DECLARE @NirvanaAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Nevermind' AND IdBand = @NirvanaId);
--DECLARE @NirvanaAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'In Utero' AND IdBand = @NirvanaId);
--DECLARE @NirvanaSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Smells Like Teen Spirit');
--DECLARE @NirvanaSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Come As You Are');

--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@NirvanaId, @NirvanaAlbum1Id, @NirvanaSong1Id);
--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@NirvanaId, @NirvanaAlbum2Id, @NirvanaSong2Id);

-- Relations for Red Hot Chili Peppers (ID: 24)
DECLARE @RHCPId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'Red Hot Chili Peppers');
DECLARE @RHCPAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Blood Sugar Sex Magik');
DECLARE @RHCPAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Californication' );
DECLARE @RHCPSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Under the Bridge');
DECLARE @RHCPSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Scar Tissue');

INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@RHCPId, @RHCPAlbum1Id, @RHCPSong1Id);
INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@RHCPId, @RHCPAlbum2Id, @RHCPSong2Id);

---- Relations for AC/DC (ID: 25)
--DECLARE @ACDCId UNIQUEIDENTIFIER = (SELECT IdBand FROM Band WHERE BandName = 'AC/DC');
--DECLARE @ACDCAlbum1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Back in Black' AND IdBand = @ACDCId);
--DECLARE @ACDCAlbum2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdAlbum FROM Album WHERE AlbumName = 'Highway to Hell' AND IdBand = @ACDCId);
--DECLARE @ACDCSong1Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'Thunderstruck');
--DECLARE @ACDCSong2Id UNIQUEIDENTIFIER = (SELECT TOP 1 IdSong FROM Song WHERE SongName = 'You Shook Me All Night Long');

--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@ACDCId, @ACDCAlbum1Id, @ACDCSong1Id);
--INSERT INTO BandAlbumSong (IdBand, IdAlbum, IdSong) VALUES (@ACDCId, @ACDCAlbum2Id, @ACDCSong2Id);