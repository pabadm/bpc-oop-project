using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace BandDatabaser
{
    class Databaser
    {
        //used for debug purposes for now, later will act as the link class between database and UI

        public void Button(string value)
        {
            switch (value)
            {
                case "🔼 Export 🔼":

                    break;


                case "🔽 Import 🔽":

                    break;

                case "Add band":

                    break;

                case "My library":

                    break;
            }
        }
        public static void test()
        {
            Database.DatabaseOperations datOp = new Database.DatabaseOperations();
            
            //datOp.LoadFromCSV("C:/File export/database.csv");
            
            Guid bandId1 = datOp.AddBand("Amon Amarth");
            Guid bandId2 = datOp.AddBand("Alestorm");
            Guid albumId1 = datOp.AddAlbum("Berserker");
            Guid albumId2 = datOp.AddAlbum("Curse of the Crystal Coconut");

            datOp.AddBandAlbumSong(bandId1, albumId1, datOp.AddSong("Fafner's Gold"));
            datOp.AddBandAlbumSong(bandId1, albumId1, datOp.AddSong("Crack the Sky"));
            datOp.AddBandAlbumSong(bandId1, albumId1, datOp.AddSong("Shield Wall"));
            datOp.AddBandAlbumSong(bandId1, null, datOp.AddSong("Burning Creation"));
            datOp.AddBandAlbumSong(bandId1, null, datOp.AddSong("The Arrival of the Fimbul Winter"));
            datOp.AddBandAlbumSong(bandId2, albumId2, datOp.AddSong("Tortuga"));
            datOp.AddBandAlbumSong(bandId2, null, datOp.AddSong("Big Ship Little Ship"));

            var a = datOp.GetAlbumsForBand(bandId1);
            var b = datOp.GetSinglesForBand(bandId1);
            var c = datOp.GetSongsForAlbum(albumId1);
            var d = datOp.GetBandsForKeyword("");
            var e = datOp.GetSongsForKeyword("t");
            
            //datOp.SaveToCSV("C:/File export/database.csv");
        }
    }
}
