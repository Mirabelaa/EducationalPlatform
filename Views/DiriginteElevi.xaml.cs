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
using tema3.ViewModels;

namespace tema3.Views
{
    /// <summary>
    /// Interaction logic for DiriginteElevi.xaml
    /// </summary>
    public partial class DiriginteElevi : Window
    {
        public DiriginteElevi()
        {
            InitializeComponent();
        }
        //private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        //{
        //    DiriginteVM diriginteVM = DataContext as DiriginteVM;
        //    diriginteVM.AfiseazaAbsenteElev((sender as ComboBox).SelectedValue);
        //}

        private void Absente_Click(object sender, RoutedEventArgs e)
        {
            absenteGrid.Visibility = Visibility.Visible;
            absenteNemotivateGrid.Visibility = Visibility.Hidden;
            totA.Visibility = Visibility.Visible;
            totAb.Visibility = Visibility.Visible;
            totAN.Visibility = Visibility.Hidden;
            totAbN.Visibility = Visibility.Hidden;
        }

        private void AbsenteN_Click(object sender, RoutedEventArgs e)
        {
            absenteNemotivateGrid.Visibility = Visibility.Visible;
            absenteGrid.Visibility = Visibility.Hidden;
            totAN.Visibility = Visibility.Visible;
            totAbN.Visibility = Visibility.Visible;
            totA.Visibility = Visibility.Hidden;
            totAb.Visibility = Visibility.Hidden;
        }
    }
}
