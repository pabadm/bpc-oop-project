using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.IO;
using System.Globalization;

namespace BandDatabaser.Database
{
    public class DatabaseOperations
    {
        DatabaseClassesDataContext db = new DatabaseClassesDataContext();
        public Guid AddBand(string bandName, int? foundationYear = null, int? idPic = null)
        {
            //nullable int to nullable date
            DateTime? intToDate = null;
            if (foundationYear.HasValue)
            {
                intToDate = new DateTime(foundationYear.Value);
            }
            Band newBand = new Band() { IdBand = Guid.NewGuid(), BandName = bandName, FoundationYear = intToDate, IdPic = idPic };
            db.Bands.InsertOnSubmit(newBand);
            db.SubmitChanges();
            return newBand.IdBand;
        }
        public Guid AddAlbum(string albumName, int? productionYear = null, int? idPic = null)
        {
            //nullable int to nullable date
            DateTime? intToDate = null;
            if (productionYear.HasValue)
            {
                intToDate = new DateTime(productionYear.Value);
            }
            Album newAlbum = new Album() { IdAlbum = Guid.NewGuid(), AlbumName = albumName, ProductionYear = intToDate, IdPic = idPic };
            db.Albums.InsertOnSubmit(newAlbum);
            db.SubmitChanges();
            return newAlbum.IdAlbum;
        }
        public Guid AddSong(string songName)
        {
            Song newSong = new Song() { IdSong = Guid.NewGuid(), SongName = songName };
            db.Songs.InsertOnSubmit(newSong);
            db.SubmitChanges();
            return newSong.IdSong;
        }
        public void AddBandAlbumSong(Guid idBand, Guid? idAlbum, Guid idSong)
        {
            if (!db.Bands.Any(b => b.IdBand == idBand))
            {
                throw new Exception("Band id not found");
            }
            if (idAlbum != null)
            {
                if (!db.Albums.Any(a => a.IdAlbum == idAlbum))
                {
                    throw new Exception("Album id not found");
                }
            }
            if (!db.Songs.Any(s => s.IdSong == idSong))
            {
                throw new Exception("Song id not found");
            }
            if (db.BandAlbumSongs.Any(bas => bas.IdBand == idBand && bas.IdSong == idSong))
            {
                throw new Exception("BandAlbumSong link already exists");
            }
            BandAlbumSong newBandAlbumSong = new BandAlbumSong() { IdBand = idBand, IdAlbum = idAlbum, IdSong = idSong };
            db.BandAlbumSongs.InsertOnSubmit(newBandAlbumSong);
            db.SubmitChanges();
        }
        public void RemoveBand(Guid idBand)
        {
            db.Bands.DeleteOnSubmit(db.Bands.Single(b => b.IdBand == idBand));
            db.SubmitChanges();
        }
        public void RemoveAlbum(Guid idAlbum)
        {
            db.Albums.DeleteOnSubmit(db.Albums.Single(a => a.IdAlbum == idAlbum));
            db.SubmitChanges();
        }
        public void RemoveSong(Guid idSong)
        {
            db.Songs.DeleteOnSubmit(db.Songs.Single(s => s.IdSong == idSong));
            db.SubmitChanges();
        }
        public void RemoveBandAlbumSong(Guid idBand, Guid? idAlbum, Guid idSong)
        {
            db.BandAlbumSongs.DeleteOnSubmit(db.BandAlbumSongs.Single(l => (l.IdSong == idSong && l.IdAlbum == idAlbum && l.IdSong == idAlbum)));
            db.SubmitChanges();
        }
        public IQueryable<Album> GetAlbumsForBand(Guid idBand)
        {
            return db.BandAlbumSongs.Where(bas => bas.IdBand == idBand)
                                    .OrderByDescending(bas => bas.Album.ProductionYear)
                                    .GroupBy(bas => bas.IdAlbum)
                                    .Select(bas => bas.First().Album);
        }
        public IQueryable<Song> GetSinglesForBand(Guid idBand)
        {
            return db.BandAlbumSongs.Where(bas => bas.IdBand == idBand && bas.IdAlbum == null)
                                    .Select(bas => bas.Song);
        }
        public IQueryable<Song> GetSongsForAlbum(Guid idAlbum)
        {
            return db.BandAlbumSongs.Where(bas => bas.IdAlbum == idAlbum)
                                    .GroupBy(bas => bas.IdSong)
                                    .Select(bas => bas.First().Song);
        }
        public IQueryable<Band> GetBandsForKeyword(string keyword)
        {
            return db.Bands.Where(b => b.BandName.ToLower().StartsWith(keyword.ToLower()))
                           .OrderBy(b => b.BandName);
        }
        public IQueryable<Album> GetAlbumsForKeyword(string keyword)
        {
            return db.Albums.Where(a => a.AlbumName.ToLower().StartsWith(keyword.ToLower()))
                            .OrderBy(a => a.AlbumName);
        }
        public IQueryable<Song> GetSongsForKeyword(string keyword)
        {
            return db.Songs.Where(s => s.SongName.ToLower().StartsWith(keyword.ToLower()))
                           .OrderBy(s => s.SongName);
        }
        public void SaveToCSV(string filePath)
        {
            StreamWriter outputFile = File.CreateText(filePath);
            foreach (Band band in db.Bands)
            {
                outputFile.WriteLine("B,{0},{1},{2},{3}", band.IdBand, band.BandName, band.FoundationYear, band.IdPic);
            }
            foreach (Album album in db.Albums)
            {
                outputFile.WriteLine("A,{0},{1},{2},{3}", album.IdAlbum, album.AlbumName, album.ProductionYear, album.IdPic);
            }
            foreach (Song song in db.Songs)
            {
                outputFile.WriteLine("S,{0},{1}", song.IdSong, song.SongName);
            }
            foreach (BandAlbumSong bas in db.BandAlbumSongs)
            {
                outputFile.WriteLine("BAS,{0},{1},{2}", bas.IdBand, bas.IdAlbum, bas.IdSong);
            }
            outputFile.Close();
        }
        public void LoadFromCSV(string filePath)
        {
            StreamReader inputFile = File.OpenText(filePath);
            string line = null;
            string[] data;
            List<Band> newBands = new List<Band>();
            List<Album> newAlbums = new List<Album>();
            List<Song> newSongs = new List<Song>();
            List<BandAlbumSong> newBAS = new List<BandAlbumSong>();
            while ((line = inputFile.ReadLine()) != null)
            {
                data = line.Split(',');
                switch (data[0])
                {
                    case "B":
                        newBands.Add(new Band() { IdBand = Guid.Parse(data[1]), BandName = data[2], FoundationYear = ToNullableDateTime(data[3]), IdPic = ToNullableInt(data[4]) });
                        break;
                    case "A":
                        newAlbums.Add(new Album() { IdAlbum = Guid.Parse(data[1]), AlbumName = data[2], ProductionYear = ToNullableDateTime(data[3]), IdPic = ToNullableInt(data[4]) });
                        break;
                    case "S":
                        newSongs.Add(new Song() { IdSong = Guid.Parse(data[1]), SongName = data[2] });
                        break;
                    case "BAS":
                        newBAS.Add(new BandAlbumSong() { IdBand = Guid.Parse(data[1]), IdAlbum = ToNullableGuid(data[2]), IdSong = Guid.Parse(data[3]) });
                        break;
                    default:
                        //invalid entry
                        break;
                }
            }
            inputFile.Close();
            var uniqueBands = newBands.Where(b => !db.Bands.Select(Bdb => Bdb.IdBand).Contains(b.IdBand))
                                      .GroupBy(b => b.IdBand)
                                      .Select(b => b.First());
            foreach (Band band in uniqueBands)
            {
                db.Bands.InsertOnSubmit(band);
            }
            var uniqueAlbums = newAlbums.Where(a => !db.Albums.Select(Adb => Adb.IdAlbum).Contains(a.IdAlbum))
                                        .GroupBy(a => a.IdAlbum)
                                        .Select(a => a.First());
            foreach (Album album in uniqueAlbums)
            {
                db.Albums.InsertOnSubmit(album);
            }
            var uniqueSongs = newSongs.Where(s => !db.Songs.Select(Sdb => Sdb.IdSong).Contains(s.IdSong))
                                      .GroupBy(s => s.IdSong)
                                      .Select(s => s.First());
            foreach (Song song in uniqueSongs)
            {
                db.Songs.InsertOnSubmit(song);
            }
            var uniqueBAS = newBAS.Where(bas => !db.BandAlbumSongs.Select(BASdb => BASdb.IdBand).Contains(bas.IdBand) && !db.BandAlbumSongs.Select(BASdb => BASdb.IdSong).Contains(bas.IdSong))
                                  .GroupBy(bas => new { bas.IdBand, bas.IdSong })
                                  .Select(bas => bas.First());
            foreach (BandAlbumSong BAS in uniqueBAS)
            {
                db.BandAlbumSongs.InsertOnSubmit(BAS);
            }
            db.SubmitChanges();
        }
        private static int? ToNullableInt(string s)
        {
            int result;
            if (Int32.TryParse(s, out result)) return result;
            return null;
        }
        private static Guid? ToNullableGuid(string s)
        {
            Guid result;
            if (Guid.TryParse(s, out result)) return result;
            return null;
        }
        private static DateTime? ToNullableDateTime(string s)
        {
            DateTime result;
            if (DateTime.TryParse(s, out result)) return result;
            return null;
        }
    }
}
