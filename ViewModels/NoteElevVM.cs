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
    class NoteElevVM : BaseVM
    {
        NoteElevActions noteElevActions;



        public NoteElevVM()
        {
            noteElevActions = new NoteElevActions(this);
        }
        #region Data Members

        private string nume;
        private string prenume;
        private string materie;
        private int nota;
        private DateTime data;
        private int semestru;
        private string teza;
        private ObservableCollection<NoteElevVM> note;

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

        public int Nota
        {
            get
            {
                return nota;
            }
            set
            {
                nota = value;
                NotifyPropertyChanged("Nota");
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

        public string Teza
        {
            get
            {
                return teza;
            }
            set
            {
                teza = value;
                NotifyPropertyChanged("Teza");
            }
        }

        public ObservableCollection<NoteElevVM> Note
        {
            get
            {
                note = noteElevActions.FillNote();
                return note;
            }
            set
            {
                note = value;
                NotifyPropertyChanged("Note");
            }
        }


        #endregion
    }
}
