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
    /// Interaction logic for LibraryPage.xaml
    /// </summary>
    public partial class LibraryPage : Page
    {
        Database.DatabaseOperations datOp = new Database.DatabaseOperations();


        public LibraryPage()
        {
            InitializeComponent();
            List<Database.Band> bands = datOp.GetBandsForKeyword("").ToList();
            foreach(var band in bands)
            {
                BandsList.Items.Add(band.BandName);
            }
            NumBands.Content = "Bands:  " + bands.Count();
        }

        private void Grid_SizeChanged(object sender, SizeChangedEventArgs e)
        {
            Thickness margin = SearchBtn.Margin;
            margin.Left = 174 + BandText.ActualWidth;
            SearchBtn.Margin = margin;
        }

        private void BandsList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (BandsList.SelectedItem != null)
            {
                ((MainWindow)System.Windows.Application.Current.MainWindow).Band((sender as ListBox).SelectedItem.ToString());
                ((MainWindow)System.Windows.Application.Current.MainWindow).MainFrame.Content = new BandPage();
            }
        }

        private void SearchBtn_Click(object sender, RoutedEventArgs e)
        {
            if(BandText.Text != null)
            {
                BandsList.Items.Clear();
                List<Database.Band> bands = datOp.GetBandsForKeyword(BandText.Text).ToList();
                foreach (var band in bands)
                {
                    BandsList.Items.Add(band.BandName);
                }
            }
        }

        private void BandText_GotFocus(object sender, RoutedEventArgs e)
        {
            BandText.Text = string.Empty;
        }


        private void BandText_LostFocus(object sender, RoutedEventArgs e)
        {
            if(BandText.Text == "")
            {
                BandText.Text = "Search";
            }
        }
    }
}
