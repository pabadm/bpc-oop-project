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
    /// Interaction logic for SearchPage.xaml
    /// </summary>
    public partial class BandAdittionPage : Page
    {
        Database.DatabaseOperations datOp = new Database.DatabaseOperations();
        public BandAdittionPage()
        {
            InitializeComponent();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if((BandNameBox.Text != null))
                {
                    if((FoundationYearBox.Text != "Year") && (FoundationYearBox.Text != ""))
                    {
                        if((0 < Int32.Parse(FoundationYearBox.Text)) && (Int32.Parse(FoundationYearBox.Text) < 5000))
                        {
                            datOp.AddBand(BandNameBox.Text, Int32.Parse(FoundationYearBox.Text));
                            MessageBox.Show("Added to library!", "Added");
                        }
                        else 
                        { 
                        datOp.AddBand(BandNameBox.Text);
                        MessageBox.Show("Added to library!", "Added");
                        }
                    }
                    else
                    {
                    datOp.AddBand(BandNameBox.Text);
                    MessageBox.Show("Added to library!", "Added");
                    }
                }
                else
                {
                    MessageBox.Show("Invalid Data", "Data error");
                }
            }
            catch
            {
                MessageBox.Show("Invalid Data", "Data error");
            }

        }

        private void BandNameBox_GotFocus(object sender, RoutedEventArgs e)
        {
            BandNameBox.Text = string.Empty;
        }

        private void FoundationYearBox_GotFocus(object sender, RoutedEventArgs e)
        {
            FoundationYearBox.Text = string.Empty;
        }

        private void BandNameBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if(BandNameBox.Text == "")
            {
                BandNameBox.Text = "Bandname";
            }

        }

        private void FoundationYearBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (FoundationYearBox.Text == "")
            {
                FoundationYearBox.Text = "Year";
            }
        }
    }
}
