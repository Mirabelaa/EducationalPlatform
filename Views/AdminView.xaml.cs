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
    /// Interaction logic for AdminView.xaml
    /// </summary>
    public partial class AdminView : Window
    {
        public AdminView()
        {
            InitializeComponent();
        }

        private void elevi_Click(object sender, RoutedEventArgs e)
        {
            eleviGrid.Visibility = Visibility.Visible;
            profiGrid.Visibility = Visibility.Hidden;
            materieGrid.Visibility = Visibility.Hidden;
        }

        private void profi_Click(object sender, RoutedEventArgs e)
        {
            profiGrid.Visibility = Visibility.Visible;
            eleviGrid.Visibility = Visibility.Hidden;
            materieGrid.Visibility = Visibility.Hidden;
        }

        private void materii_Click(object sender, RoutedEventArgs e)
        {
            materieGrid.Visibility = Visibility.Visible;
            eleviGrid.Visibility = Visibility.Hidden;
            profiGrid.Visibility = Visibility.Hidden;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            AdaugaElevView adaugaElevView = new AdaugaElevView();
            adaugaElevView.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            AdaugareProfView adaugareProfView = new AdaugareProfView();
            adaugareProfView.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            AdaugareMaterie adaugareMaterie = new AdaugareMaterie();
            adaugareMaterie.Show();
        }
    }
}
