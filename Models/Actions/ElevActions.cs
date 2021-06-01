using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.Helpers;
using tema3.ViewModels;

namespace tema3.Models.Actions
{
    class ElevActions
    {
        ScoalaEntities context = new ScoalaEntities();

        private ElevVM elevContext;
        private AdminVM adminContext;
        public ElevActions(ElevVM elevContext)
        {
            this.elevContext = elevContext;

        }

        public ElevActions(AdminVM adminContext)
        {
            this.adminContext = adminContext;

        }

        public string GetNume()
        {
            var id = context.GetIdElev(Helpers.Helper.UserCurent).FirstOrDefault();
            GetNumePrenumeElev_Result nume = context.GetNumePrenumeElev(id).FirstOrDefault();
            return nume.Nume;
        }

        public string GetPreNume()
        {
            var id = context.GetIdElev(Helpers.Helper.UserCurent).FirstOrDefault();
            GetNumePrenumeElev_Result nume = context.GetNumePrenumeElev(id).FirstOrDefault();
            return nume.Prenume;
        }
        public ObservableCollection<MaterieVM> FillMaterii()
        {
            var id = context.GetIdElev(Helpers.Helper.UserCurent).FirstOrDefault();
            List<AfisareMaterii_Result> afisareMaterii_Results = context.AfisareMaterii(id).ToList();
            ObservableCollection<MaterieVM> materii = new ObservableCollection<MaterieVM>();
            foreach (AfisareMaterii_Result mat in afisareMaterii_Results)
            {
                materii.Add(new MaterieVM()
                {
                    Id_materie = mat.id_materie,
                    Denumire = mat.denumire
                });
            }

            return materii;
        }

    }

}

