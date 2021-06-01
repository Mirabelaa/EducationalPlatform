using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.Helpers;
using tema3.Models.Actions;

namespace tema3.ViewModels
{
    class AbsentaElevVM : BaseVM
    {
        AbsentaElevActions absenteElevActions;

        public AbsentaElevVM()
        {
            this.absenteElevActions = new AbsentaElevActions(this);
        }
        #region Data Members

        private string nume;
        private string prenume;
        private string materie;
        private DateTime data;
        private string motivabila;
        private string motivata;
        private int semestru;
        private ObservableCollection<AbsentaElevVM> absente;

        public string Nume
        {
            get
            {
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
                return prenume;
            }
            set
            {
                prenume = value;
                NotifyPropertyChanged("Prenume");
            }
        }
        public string Materie
        {
            get
            {
                return materie;
            }
            set
            {
                materie = value;
                NotifyPropertyChanged("Materie");
            }
        }


        public DateTime Data
        {
            get
            {
                return data;
            }
            set
            {
                data = value;
                NotifyPropertyChanged("Data");
            }
        }

        public string Motivabila
        {
            get
            {
                return motivabila;
            }
            set
            {
                motivabila = value;
                NotifyPropertyChanged("Motivabila");
            }
        }

        public string Motivata
        {
            get
            {
                return motivata;
            }
            set
            {
                motivata = value;
                NotifyPropertyChanged("Motivata");
            }
        }
        public int Semestru
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
                absente = absenteElevActions.FillAbsente();
                return absente;
            }
            set
            {
                absente = value;
                NotifyPropertyChanged("Absente");
            }
        }


        #endregion
    }
}
