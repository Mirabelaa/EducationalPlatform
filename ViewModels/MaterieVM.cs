using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.Helpers;
using tema3.Models;
using tema3.Models.Actions;

namespace tema3.ViewModels
{
    class MaterieVM : BaseVM
    {
        MaterieActions materieActions;

        public MaterieVM()
        {
            materieActions = new MaterieActions(this);
        }

        #region Data Members

        private int id_materie;
        private string denumire;
        private string numeProf;
        private string prenumeProf;
        private string specializare;

        public string Specializare
        {
            get
            {
                return specializare;
            }
            set
            {
                specializare = value;
                NotifyPropertyChanged("Specializare");
            }
        }
        
        public int Id_materie
        {
            get
            {
                return id_materie;
            }
            set
            {
                id_materie = value;
                NotifyPropertyChanged("Id_materie");
            }
        }

        public string Denumire
        {
            get
            {
                return denumire;
            }
            set
            {
                denumire = value;
                NotifyPropertyChanged("Denumire");
            }
        }

        public string NumeProf
        {
            get
            {
                return numeProf;
            }
            set
            {
                numeProf = value;
                NotifyPropertyChanged("NumeProf");
            }
        }

        public string PrenumeProf
        {
            get
            {
                return prenumeProf;
            }
            set
            {
                prenumeProf = value;
                NotifyPropertyChanged("PrenumeProf");
            }
        }

        #endregion
    }
}
