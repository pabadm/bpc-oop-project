using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BandDatabaser
{
    /// <summary>
    /// Interaction logic for BandPage.xaml
    /// </summary>
    public partial class BandPage : Page
    {
        Database.DatabaseOperations datOp = new Database.DatabaseOperations();
        Database.Band bandObj = new Database.Band();
        Database.Album albumObj = new Database.Album();
        Database.Song songObj = new Database.Song();
        public BandPage()
        {
            InitializeComponent();
            Songs.Items.Clear();
            Albums.Items.Clear();
            try
            {
                List<Database.Band> bands = datOp.GetBandsForKeyword(((MainWindow)System.Windows.Application.Current.MainWindow).SelectedBand).ToList();
                bandObj = bands[0];
                if (bandObj == null)
                {
                    BandLabel.Content = "Undefined";
                    FoundationYearLabel.Content = "Foundation year: unset";
                }
                else
                {
                    BandLabel.Content = bandObj.BandName;
                    if(bandObj.FoundationYear == null)
                    {
                        FoundationYearLabel.Content = "Foundation year: unset";
                    }
                    else
                    {
                        FoundationYearLabel.Content = "Foundation year: " + bandObj.FoundationYear.Value.Year;
                    }
                    List<Database.Album> albums = datOp.GetAlbumsForBand(bandObj.IdBand).ToList();

                    foreach (var album in albums)
                    {
                        Albums.Items.Add(album.AlbumName);
                    }
                }
            }
            catch
            {
                bandObj = null;
            }
            AlbumsLabel.Content = ("Albums:     " + Albums.Items.Count);

        }

        //public void Band(string band)
        //{
        //    List<Database.Band> bands = datOp.GetBandsForKeyword(band).ToList();
        //    bandObj = bands[0];
        //    BandLabel.Content = bandObj.BandName;
        //    FoundationYearLabel.Content = "Foundation year:     " + bandObj.FoundationYear;
        //    List<Database.Album> albums = datOp.GetAlbumsForBand(bandObj.IdBand).ToList();
        //    foreach (var album in albums)
        //    {
        //        Albums.Items.Add(album.AlbumName);
        //    }
        //}


        //private void Albums_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        //{
        //    if (Albums.SelectedItem != null)
        //    {
        //        Songs.Items.Clear();
        //        List<Database.Album> albums = datOp.GetAlbumsForKeyword(Albums.SelectedItem.ToString()).ToList();
        //        albumObj = albums[0];
        //        List<Database.Song> songs = datOp.GetSongsForAlbum(albumObj.IdAlbum).ToList();
        //        foreach (var song in songs)
        //        {
        //            Songs.Items.Add(song.SongName);
        //        }
        //    }
        //}

        private void AddAlbumButton_Click(object sender, RoutedEventArgs e)
        {
            if (AlbumNameBox != null)
            {
                Songs.Items.Clear();
                datOp.AddAlbum(AlbumNameBox.Text);
                Songs.Items.Clear();
                List<Database.Song> songs = datOp.GetSongsForAlbum(albumObj.IdAlbum).ToList();
                Songs.Items.Clear();
                foreach (var song in songs)
                {
                    Songs.Items.Add(song.SongName);
                }
                Albums.Items.Add(AlbumNameBox.Text);
                Albums.SelectedIndex = Albums.Items.Count-1;
                AlbumsLabel.Content = ("Albums:     " + Albums.Items.Count);
                AlbumNameBox.Text = "AlbumName";
            }
     

        }

        private void AddSongButton_Click(object sender, RoutedEventArgs e)
        {
            if (SongNameBox != null && Albums.SelectedItem != null)
            {
                datOp.AddBandAlbumSong(bandObj.IdBand, albumObj.IdAlbum, datOp.AddSong(SongNameBox.Text));
                Songs.Items.Clear();
                List<Database.Song> songs = datOp.GetSongsForAlbum(albumObj.IdAlbum).ToList();
                foreach (var song in songs)
                {
                    Songs.Items.Add(song.SongName);
                }
                SongsLabel.Content = ("Songs:     " + Songs.Items.Count);
                SongNameBox.Text = "SongName";
            }
            else
            {
                MessageBox.Show("Album not chosen or album name is empty.");
            }
        }

        private void RemoveAlbumButton_Click(object sender, RoutedEventArgs e)
        {
            Songs.Items.Clear();
            if (Albums.SelectedItem != null)
            {
                datOp.RemoveAlbum(albumObj.IdAlbum);
                Albums.Items.Remove(Albums.SelectedItem);
                Albums.SelectedIndex = Albums.Items.Count - 1;
                AlbumsLabel.Content = ("Albums:     " + Albums.Items.Count);
            }
        }
        private void RemoveSongButton_Click(object sender, RoutedEventArgs e)
        {
            if (Songs.SelectedItem != null)
            {
                Songs.Items.Clear();
                datOp.RemoveSong(songObj.IdSong);
                List<Database.Song> songs = datOp.GetSongsForAlbum(albumObj.IdAlbum).ToList();
                foreach (var song in songs)
                {
                    Songs.Items.Add(song.SongName);
                }
            }
        }

        private void Songs_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if(Songs.SelectedItem != null)
                {
                    List<Database.Song> songs = datOp.GetSongsForKeyword(Songs.SelectedItem.ToString()).ToList();
                    songObj = songs[0];
                }
            }
            catch
            {
                songObj = null;
            }
        }
        private void Albums_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Songs.Items.Clear();
            try
            {
                if (Albums.SelectedItem != null)
                {
                    List<Database.Album> albums = datOp.GetAlbumsForKeyword(Albums.SelectedItem.ToString()).ToList();
                    albumObj = albums[0];
                }
            }
            catch
            {
                albumObj = null;
            }
            List<Database.Song> songs = datOp.GetSongsForAlbum(albumObj.IdAlbum).ToList();
            foreach (var song in songs)
            {
                Songs.Items.Add(song.SongName);
            }
            SongsLabel.Content = ("Songs:     " + Songs.Items.Count);
        }

        private void RemoveButton_Click(object sender, RoutedEventArgs e)
        {

            datOp.RemoveBand(bandObj.IdBand);
            ((MainWindow)System.Windows.Application.Current.MainWindow).MainFrame.Content = new LibraryPage();
        }

        private void AlbumNameBox_GotFocus(object sender, RoutedEventArgs e)
        {
            AlbumNameBox.Text = string.Empty;
        }

        private void SongNameBox_GotFocus(object sender, RoutedEventArgs e)
        {
            SongNameBox.Text = string.Empty;
        }

        private void SongNameBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if(SongNameBox.Text == "")
            {
                SongNameBox.Text = "SongName";
            }
        }

        private void AlbumNameBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (AlbumNameBox.Text == "")
            {
                AlbumNameBox.Text = "AlbumName";
            }
        }
    }
}

