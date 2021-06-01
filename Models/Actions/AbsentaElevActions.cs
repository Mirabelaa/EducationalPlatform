using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.ViewModels;

namespace tema3.Models.Actions
{
    class AbsentaElevActions
    {
        ScoalaEntities context = new ScoalaEntities();

        private AbsentaElevVM absenteElevContext;
        public AbsentaElevActions(AbsentaElevVM absenteElevContext)
        {
            this.absenteElevContext = absenteElevContext;
        }

        public ObservableCollection<AbsentaElevVM> FillAbsente()
        {
            var id = context.GetIdElev(Helpers.Helper.UserCurent).FirstOrDefault();
            List<AfisareAbsente_Result> afisareAbsente_Results = context.AfisareAbsente(id).ToList();
            ObservableCollection<AbsentaElevVM> absente = new ObservableCollection<AbsentaElevVM>();
            foreach (AfisareAbsente_Result absenta in afisareAbsente_Results)
            {
                absente.Add(new AbsentaElevVM()
                {
                    Materie = absenta.materie,
                    Data = absenta.data.GetValueOrDefault(),
                    Motivata = absenta.motivata,
                    Motivabila = absenta.motivabila,
                    Semestru = absenta.semestru.GetValueOrDefault()
                }) ;
            }
            return absente;
        }
    }
}
