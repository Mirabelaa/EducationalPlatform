using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.Helpers;
using tema3.Models.Actions;
using tema3.Models;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace tema3.ViewModels
{
    class ElevVM : BaseVM
    {
        ElevActions elevActions;

        public ElevVM()
        {
            elevActions = new ElevActions(this);
        }

        #region Data Members

        private int id_elev;
        private string nume;
        private string prenume;
        private int id_clasa;
        private string username;
        private int an;
        private string litera;
        private string parola;
        private string message;
        private ObservableCollection<MaterieVM> materii;
        
        public ObservableCollection<MaterieVM> Materii
        {
            get
            {
                materii = elevActions.FillMaterii();
                return materii;
            }
            set
            {
                materii = value;
                NotifyPropertyChanged("Materii");
            }
        }


        public int Id_elev
        {
            get
            {
                return id_elev;
            }
            set
            {
                id_elev = value;
                NotifyPropertyChanged("Id_elev");
            }
        }
        public string Nume
        {
            get
            {
                nume = elevActions.GetNume();
                return nume;
            }
            set
            {
                nume = value;
                NotifyPropertyChanged("Nume");
            }
        }
        public string Prenume
        {
            get
            {
                prenume = elevActions.GetPreNume();
                return prenume;
            }
            set
            {
                prenume = value;
                NotifyPropertyChanged("Prenume");
            }
        }

        public string Nume1
        {
            get
            {
                return nume;
            }
            set
            {
                nume = value;
                NotifyPropertyChanged("Nume1");
            }
        }
        public string Prenume1
        {
            get
            {
                return prenume;
            }
            set
            {
                prenume = value;
                NotifyPropertyChanged("Prenume1");
            }
        }
        public int Id_clasa
        {
            get
            {
                return id_clasa;
            }
            set
            {
                id_clasa = value;
                NotifyPropertyChanged("id_clasa");
            }
        }

        public string Username
        {
            get
            {
                return username;
            }
            set
            {
                username = value;
                NotifyPropertyChanged("Username");
            }
        }

        public int An
        {
            get
            {
                return an;
            }
            set
            {
                an = value;
                NotifyPropertyChanged("An");
            }
        }

        public string Litera
        {
            get
            {
                return litera;
            }
            set
            {
                litera = value;
                NotifyPropertyChanged("Litera");
            }
        }

        public string Parola
        {
            get
            {
                return parola;
            }
            set
            {
                parola = value;
                NotifyPropertyChanged("Parola");
            }
        }

        public string Message
        {
            get
            {
                //message = elevActions.SetMessage();
                return message;
            }
            set
            {
                message = value;
                NotifyPropertyChanged("Message");
            }
        }
    #endregion

   
}
}
