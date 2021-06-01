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
    /// Interaction logic for LoginView.xaml
    /// </summary>
    public partial class LoginView : Window
    {
        public LoginView()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Log log = new Log();
            string rol = log.Login(user.Text, parola.Password);
            if (rol.Equals("elev"))
            {
                ElevView elevView = new ElevView();
                elevView.Show();
            }
            else if(rol.Equals("admin"))
            {
                AdminView adminView = new AdminView();
                adminView.Show();
            }
            else if(rol.Equals("prof"))
            {
                ProfView profView = new ProfView();
                profView.Show();
            }
            else MessageBox.Show(rol);
        }
    }
}
