using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.ViewModels;

namespace tema3.Models.Actions
{
    class DiriginteActions
    {
        ScoalaEntities context = new ScoalaEntities();
        Nullable<int> id;
        Nullable<int> id_clasa;

        private DiriginteVM dirigContext;
        public DiriginteActions(DiriginteVM dirigContext)
        {
            this.dirigContext = dirigContext;
            var i = context.GetIdProf(Helpers.Helper.UserCurent);
            id = i.FirstOrDefault();
            var idCls = context.ClasaDiriginte(id).ElementAtOrDefault(0);
            id_clasa = idCls.GetValueOrDefault();
        }

        public string GetNume()
        {
           
            GetNumePrenumeProf_Result nume = context.GetNumePrenumeProf(id).FirstOrDefault();
            return nume.Nume;
        }

        public string GetPreNume()
        {
            GetNumePrenumeProf_Result nume = context.GetNumePrenumeProf(id).FirstOrDefault();
            return nume.Prenume;
        }

        public ObservableCollection<AbsentaElevVM> FillAbsente()
        {
            List<AfisareAbsentePeClasa_Result> afisareAbsentePeClasa_Results = context.AfisareAbsentePeClasa(id_clasa).ToList();
            ObservableCollection<AbsentaElevVM> absente = new ObservableCollection<AbsentaElevVM>();
            foreach (AfisareAbsentePeClasa_Result absenta in afisareAbsentePeClasa_Results)
            {
                absente.Add(new AbsentaElevVM()
                {
                    Nume = absenta.nume,
                    Prenume = absenta.prenume,
                    Materie = absenta.materie,
                    Data = absenta.data.GetValueOrDefault(),
                    Motivata = absenta.motivata,
                    Motivabila = absenta.motivabila,
                    Semestru = absenta.semestru.GetValueOrDefault()
                });
            }
            return absente;
        }

        public ObservableCollection<AbsentaElevVM> FillAbsenteElev()
        {
            List<AfisareAbsente_Result> afisareAbsente_Results = context.AfisareAbsente(dirigContext.Elev.Id_elev).ToList();
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
                });
            }
            return absente;
        }

        public ObservableCollection<AbsentaElevVM> FillAbsenteNemotivate()
        {
            List<AfisareAbsenteNemotivatePeClasa_Result> afisareAbsentePeClasa_Results = context.AfisareAbsenteNemotivatePeClasa(id_clasa).ToList();
            ObservableCollection<AbsentaElevVM> absente = new ObservableCollection<AbsentaElevVM>();
            foreach (AfisareAbsenteNemotivatePeClasa_Result absenta in afisareAbsentePeClasa_Results)
            {
                absente.Add(new AbsentaElevVM()
                {
                    Nume = absenta.nume,
                    Prenume = absenta.prenume,
                    Materie = absenta.materie,
                    Data = absenta.data.GetValueOrDefault(),
                    Motivata = absenta.motivata,
                    Motivabila = absenta.motivabila,
                    Semestru = absenta.semestru.GetValueOrDefault()
                });
            }
            return absente;
        }

        public ObservableCollection<AbsentaElevVM> FillAbsenteNemotivateElev()
        {
            List<AfisareAbsenteNemotivateElev_Result> afisareAbsenteNemotivateElev_Results = context.AfisareAbsenteNemotivateElev(dirigContext.Elev.Id_elev).ToList();
            ObservableCollection<AbsentaElevVM> absente = new ObservableCollection<AbsentaElevVM>();
            foreach (AfisareAbsenteNemotivateElev_Result absenta in afisareAbsenteNemotivateElev_Results)
            {
                absente.Add(new AbsentaElevVM()
                {
                    Materie = absenta.materie,
                    Data = absenta.data.GetValueOrDefault(),
                    Motivata = absenta.motivata,
                    Motivabila = absenta.motivabila,
                    Semestru = absenta.semestru.GetValueOrDefault()
                });
            }
            return absente;
        }

        public Nullable<int> GetNrAbsente()
        {
            var nr = context.NumarareAbsentePeClasa(id_clasa).ElementAtOrDefault(0);
            return nr;
        }

        public Nullable<int> GetNrAbsenteNemotivate()
        {
            var nr = context.NumarareAbsenteNemotivatePeClasa(id_clasa).ElementAtOrDefault(0);
            return nr;
        }

        public Nullable<int> GetNrAbsenteElev()
        {
            var nr = context.NumarareAbsentePeClasa(dirigContext.Elev.Id_elev).ElementAtOrDefault(0);
            return nr;
        }

        public Nullable<int> GetNrAbsenteNemotivateElev()
        {
            var nr = context.NumarareAbsenteNemotivatePeClasa(dirigContext.Elev.Id_elev).ElementAtOrDefault(0);
            return nr;
        }

        public void MotiveazaAbsentaMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            AbsentaElevVM absenteElevVM = obj as AbsentaElevVM;


            if (absenteElevVM != null)
            {
                if (String.IsNullOrEmpty(absenteElevVM.Nume))
                {
                    dirigContext.Message = "Numele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Prenume))
                {
                    dirigContext.Message = "Prenumele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Materie))
                {
                    dirigContext.Message = "Materia trebuie precizata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Motivata))
                {
                    dirigContext.Message = "Spuneti daca absenta este motivata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Semestru.ToString()))
                {
                    dirigContext.Message = "Semestrul trebuie precizata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Motivabila))
                {
                    dirigContext.Message = "Spuneti daca absenta este motivabila";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Data.ToString()))
                {
                    dirigContext.Message = "Adaugati data";
                }
                else
                {
                    var id_elev = context.GetIdElevFromNume(absenteElevVM.Nume, absenteElevVM.Prenume).ElementAtOrDefault(0);
                    var elevClasa = context.GetIdClasaElev(id_elev).ElementAtOrDefault(0);
                    var id_materie = context.GetIdMaterie(absenteElevVM.Materie).ElementAtOrDefault(0);

                    if (elevClasa != null)
                    {
                       
                            if (absenteElevVM.Motivabila == "da")
                            {
                                if (absenteElevVM.Motivata == "da")
                                {
                                    var id_absenta = context.GetIdAbsenta(id_elev, id_materie, absenteElevVM.Data, absenteElevVM.Semestru).ElementAtOrDefault(0);
                                    context.MotiveazaAbsenta(id_absenta, true);
                                    context.SaveChanges();
                                    dirigContext.Absente = FillAbsente();
                                    dirigContext.Message = "Absenta motivata";
                                }
                                else if (absenteElevVM.Motivata == "nu")
                                {
                                    dirigContext.Message = "...";
                                }
                            }
                            else if (absenteElevVM.Motivabila == "nu")
                            {
                                dirigContext.Message = "Absenta nu poate fi motivata";
                            }
                            else
                                dirigContext.Message = "Scrieti doar da sau nu";
                    }
                    else
                    {
                    dirigContext.Message = "Elevul nu exista";
                    }

                }
            }
        }

        public ObservableCollection<ElevVM> FillElevi()
        {
            List<GetEleviClasa_Result> elevi_Results = context.GetEleviClasa(id_clasa).ToList();
            ObservableCollection<ElevVM> elevi = new ObservableCollection<ElevVM>();
            foreach (GetEleviClasa_Result elev in elevi_Results)
            {
                elevi.Add(new ElevVM()
                {
                    Id_elev=elev.id,
                    Nume1 = elev.nume,
                    Prenume1 = elev.prenume
                });
            }
            return elevi;
        }
    }
}
