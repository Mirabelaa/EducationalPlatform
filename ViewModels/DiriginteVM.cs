using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using tema3.Helpers;
using tema3.Models.Actions;

namespace tema3.ViewModels
{
    class DiriginteVM : BaseVM
    {
        DiriginteActions diriginteActions;

        public DiriginteVM()
        {
            this.diriginteActions = new DiriginteActions(this);
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
        private ElevVM elev;
        private Nullable<int> nrAbsente;
        private Nullable<int> nrAbsenteElev;
        private Nullable<int> nrAbsenteNemotivate;
        private Nullable<int> nrAbsenteNemotivateElev;
        private ObservableCollection<AbsentaElevVM> absente;
        private ObservableCollection<AbsentaElevVM> absenteNemotivate;
        private ObservableCollection<AbsentaElevVM> absenteElev;
        private ObservableCollection<AbsentaElevVM> absenteNemotivateElev;
        private ObservableCollection<ElevVM> elevi;

        public ElevVM Elev
        {
            get
            {
                return elev;
            }
            set
            {
                elev = value;
                AbsenteElev = diriginteActions.FillAbsenteElev();
                AbsenteNemotivateElev = diriginteActions.FillAbsenteNemotivateElev();
                NrAbsenteElev = diriginteActions.GetNrAbsenteElev();
                NrAbsenteNemotivateElev = diriginteActions.GetNrAbsenteNemotivateElev();
                NotifyPropertyChanged("Elev");
            }
        }
        public ObservableCollection<ElevVM> Elevi
        {
            get
            {
                elevi = diriginteActions.FillElevi();
                return elevi;
            }
            set
            {
                elevi = value;
                NotifyPropertyChanged("Elevi");
            }
        }


        public Nullable<int> NrAbsente
        {
            get
            {
                nrAbsente = diriginteActions.GetNrAbsente();
                return nrAbsente;
            }
            set
            {
                nrAbsente = value;
                NotifyPropertyChanged("NrAbsente");
            }
        }
        public Nullable<int> NrAbsenteElev
        {
            get
            {
                return nrAbsenteElev;
            }
            set
            {
                nrAbsenteElev = value;
                NotifyPropertyChanged("NrAbsenteElev");
            }
        }
        public Nullable<int> NrAbsenteNemotivate
        {
            get
            {
                nrAbsenteNemotivate = diriginteActions.GetNrAbsenteNemotivate();
                return nrAbsenteNemotivate;
            }
            set
            {
                nrAbsenteNemotivate = value;
                NotifyPropertyChanged("NrAbsenteNemotivate");
            }
        }
        public Nullable<int> NrAbsenteNemotivateElev
        {
            get
            {
                return nrAbsenteNemotivateElev;
            }
            set
            {
                nrAbsenteNemotivateElev = value;
                NotifyPropertyChanged("NrAbsenteNemotivateElev");
            }
        }
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
                nume = diriginteActions.GetNume();
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
                prenume = diriginteActions.GetPreNume();
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

        public ObservableCollection<AbsentaElevVM> Absente
        {
            get
            {
                absente = diriginteActions.FillAbsente();
                return absente;
            }
            set
            {
                absente = value;
                NotifyPropertyChanged("Absente");
            }
        }

        public ObservableCollection<AbsentaElevVM> AbsenteNemotivate
        {
            get
            {
                absenteNemotivate = diriginteActions.FillAbsenteNemotivate();
                return absenteNemotivate;
            }
            set
            {
                absenteNemotivate = value;
                NotifyPropertyChanged("AbsenteNemotivate");
            }
        }

        public ObservableCollection<AbsentaElevVM> AbsenteElev
        {
            get
            {
                //absenteElev = diriginteActions.FillAbsenteElev(Elev.Id_elev);
                return absenteElev;
            }
            set
            {
                absenteElev = value;
                NotifyPropertyChanged("AbsenteElev");
            }
        }

        public ObservableCollection<AbsentaElevVM> AbsenteNemotivateElev
        {
            get
            {
                //absenteNemotivateElev = diriginteActions.FillAbsenteNemotivateElev(Elev.Id_elev);
                return absenteNemotivateElev;
            }
            set
            {
                absenteNemotivateElev = value;
                NotifyPropertyChanged("AbsenteNemotivateElev");
            }
        }

        #endregion

        #region Command Members

        private ICommand motiveazaAbsentaCommand;
        public ICommand MotiveazaAbsentaCommand
        {
            get
            {
                if (motiveazaAbsentaCommand == null)
                {
                    motiveazaAbsentaCommand = new RelayCommand(diriginteActions.MotiveazaAbsentaMethod);
                }
                return motiveazaAbsentaCommand;
            }
        }

        #endregion

    }
}
