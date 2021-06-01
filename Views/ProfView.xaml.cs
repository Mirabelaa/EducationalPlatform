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
using System.Windows.Shapes;

namespace tema3.Views
{
    /// <summary>
    /// Interaction logic for ProfView.xaml
    /// </summary>
    public partial class ProfView : Window
    {
        public ProfView()
        {
            InitializeComponent();
        }

        private void absente_Click(object sender, RoutedEventArgs e)
        {
            absenteGrid.Visibility = Visibility.Visible;
            noteGrid.Visibility = Visibility.Hidden;
        }

        private void note_Click(object sender, RoutedEventArgs e)
        {
            noteGrid.Visibility = Visibility.Visible;
            absenteGrid.Visibility = Visibility.Hidden;
        }

        private void material_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ProfAbsenteView abseenteView = new ProfAbsenteView();
            abseenteView.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            ProfNoteView noteView = new ProfNoteView();
            noteView.Show();
        }
    }
}
