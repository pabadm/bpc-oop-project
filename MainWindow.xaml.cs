using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Win32;
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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Databaser databaser = new Databaser();
        Database.DatabaseOperations datOp = new Database.DatabaseOperations();
        private string selectedBand;

        public string SelectedBand
        {
            get { return selectedBand; }
            set { selectedBand = value; }
        }
        public MainWindow()
        {
            InitializeComponent();
            LibraryPage libraryPage = new LibraryPage();
            MainFrame.Content = libraryPage;
        }

        public void Band(string band)
        {
            selectedBand = band;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            databaser.Button((sender as Button).Content.ToString());
            switch ((sender as Button).Content.ToString())
            {
                case "🔼 Export 🔼":
                    SaveFileDialog saveFileDialogExport = new SaveFileDialog();
                    saveFileDialogExport.ShowDialog();
                    try
                    {
                        datOp.SaveToCSV(saveFileDialogExport.FileName + ".csv");
                        MessageBox.Show("Database exported!","Export");
                    }
                    catch
                    {
                        MessageBox.Show("Inavlid data!","Export error");
                    }
                    break;

                case "🔽 Import 🔽":
                    OpenFileDialog openFileDialogImport = new OpenFileDialog();
                    openFileDialogImport.ShowDialog();
                    try
                    {
                        datOp.LoadFromCSV(openFileDialogImport.FileName);
                        MessageBox.Show("Database imported!", "Import");
                    }
                    catch
                    {
                        MessageBox.Show("Inavlid data!","Import error");
                    }
                    MainFrame.Content = new LibraryPage();
                    break;

                case "Add band 🎤🎸":
                    MainFrame.Content = new BandAdittionPage();
                    break;

                case "Bands 🎺🥁":
                    MainFrame.Content = new LibraryPage();
                    break;
            }
        }

    }
}
