using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using tema3.Helpers;
using tema3.Models.Actions;
using tema3.Views;

namespace tema3.ViewModels
{
    class ProfVM : BaseVM
    {
        ProfActions profActions;

        public ProfVM()
        {
            this.profActions = new ProfActions(this);
        }

        #region Data Members

        private int id_prof;
        private string nume;
        private string prenume;
        private int id_clasa;
        private string username;
        private string parola;
        private string message;
        private int an;
        private string litera;
        private string semestru;
        private ObservableCollection<NoteElevVM> note;
        private ObservableCollection<AbsentaElevVM> absente;


        public int Id_prof
        {
            get
            {
                return id_prof;
            }
            set
            {
                id_prof = value;
                NotifyPropertyChanged("Id_prof");
            }
        }
        public string Nume
        {
            get
            {
                nume = profActions.GetNume();
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
                prenume = profActions.GetPreNume();
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

        public string Semestru
        {
            get
            {
                return semestru;
            }
            set
            {
                semestru = value;
                NotifyPropertyChanged("Semestru");
            }
        }

        public ObservableCollection<NoteElevVM> Note
        {
            get
            {
                note = profActions.FillNote();
                return note;
            }
            set
            {
                note = value;
                NotifyPropertyChanged("Note");
            }
        }

        public ObservableCollection<AbsentaElevVM> Absente
        {
            get
            {
                absente = profActions.FillAbsente();
                return absente;
            }
            set
            {
                absente = value;
                NotifyPropertyChanged("Absente");
            }
        }

        #endregion

        #region Command Members

        //asta este pt butonul Add
        private ICommand addNotaCommand;
        public ICommand AddNotaCommand
        {
            get
            {
                if (addNotaCommand == null)
                {
                    addNotaCommand = new RelayCommand(profActions.AddNotaMethod);
                }
                return addNotaCommand;
            }
        }

        private ICommand addAbsentaCommand;
        public ICommand AddAbsentaCommand
        {
            get
            {
                if (addAbsentaCommand == null)
                {
                    addAbsentaCommand = new RelayCommand(profActions.AddAbsentaMethod);
                }
                return addAbsentaCommand;
            }
        }

        private ICommand motiveazaAbsentaCommand;
        public ICommand MotiveazaAbsentaCommand
        {
            get
            {
                if (motiveazaAbsentaCommand == null)
                {
                    motiveazaAbsentaCommand = new RelayCommand(profActions.MotiveazaAbsentaMethod);
                }
                return motiveazaAbsentaCommand;
            }
        }

        private ICommand anuleazaNotaCommand;
        public ICommand AnuleazaNotaCommand
        {
            get
            {
                if (anuleazaNotaCommand == null)
                {
                    anuleazaNotaCommand = new RelayCommand(profActions.AnuleazaNotaMethod);
                }
                return anuleazaNotaCommand;
            }
        }

        private ICommand openWindowCommand;
        public ICommand OpenWindowCommand
        {
            get
            {
                if (openWindowCommand == null)
                {
                    openWindowCommand = new RelayCommand(profActions.OpenWindow);
                }
                return openWindowCommand;
            }
        }
        #endregion

    }
}
