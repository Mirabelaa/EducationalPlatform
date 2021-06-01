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
    /// Interaction logic for ElevView.xaml
    /// </summary>
    public partial class ElevView : Window
    {
        public ElevView()
        {
            InitializeComponent();
        }

        private void Nota_Click(object sender, RoutedEventArgs e)
        {
            noteGrid.Visibility = Visibility.Visible;
            absenteGrid.Visibility = Visibility.Hidden;
        }

        private void Medii_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void Absenta_Click(object sender, RoutedEventArgs e)
        {
            absenteGrid.Visibility = Visibility.Visible;
            noteGrid.Visibility = Visibility.Hidden;
        }
    }
}
