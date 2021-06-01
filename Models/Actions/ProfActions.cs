using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.ViewModels;
using tema3.Views;

namespace tema3.Models.Actions
{
    class ProfActions
    {
        ScoalaEntities context = new ScoalaEntities();

        private ProfVM profContext;
        public ProfActions(ProfVM profContext)
        {
            this.profContext = profContext;

        }

        public string GetNume()
        {
            var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
            GetNumePrenumeProf_Result nume = context.GetNumePrenumeProf(id).FirstOrDefault();
            return nume.Nume;
        }

        public string GetPreNume()
        {
            var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
            GetNumePrenumeProf_Result nume = context.GetNumePrenumeProf(id).FirstOrDefault();
            return nume.Prenume;
        }

        public ObservableCollection<NoteElevVM> FillNote()
        {
            var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
            List<AfisareNoteProf_Result> afisareNoteProf_Results = context.AfisareNoteProf(id).ToList();
            ObservableCollection<NoteElevVM> note = new ObservableCollection<NoteElevVM>();
            foreach (AfisareNoteProf_Result nota in afisareNoteProf_Results)
            {
                note.Add(new NoteElevVM()
                {
                    Nume=nota.nume,
                    Prenume=nota.prenume,
                    Materie = nota.materie,
                    Nota = nota.nota.GetValueOrDefault(),
                    Data = nota.data.GetValueOrDefault(),
                    Semestru = nota.semestru.GetValueOrDefault(),
                    Teza = nota.teza

                });
            }
            return note;
        }

        public ObservableCollection<AbsentaElevVM> FillAbsente()
        {
            var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
            List<AfisareAbsenteProf_Result> afisareAbsenteProf_Results = context.AfisareAbsenteProf(id).ToList();
            ObservableCollection<AbsentaElevVM> absente = new ObservableCollection<AbsentaElevVM>();
            foreach (AfisareAbsenteProf_Result absenta in afisareAbsenteProf_Results)
            {
                absente.Add(new AbsentaElevVM()
                {
                    Nume=absenta.nume,
                    Prenume=absenta.prenume,
                    Materie = absenta.materie,
                    Data = absenta.data.GetValueOrDefault(),
                    Motivata = absenta.motivata,
                    Motivabila = absenta.motivabila,
                    Semestru = absenta.semestru.GetValueOrDefault()
                });
            }
            return absente;
        }

        public void AddNotaMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            NoteElevVM noteElevVM  = obj as NoteElevVM;
            

            if (noteElevVM != null)
            {
                if (String.IsNullOrEmpty(noteElevVM.Nume))
                {
                    profContext.Message = "Numele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Prenume))
                {
                    profContext.Message = "Prenumele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Materie))
                {
                    profContext.Message = "Materia trebuie precizata";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Nota.ToString()))
                {
                    profContext.Message = "Nota trebuie precizata";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Semestru.ToString()))
                {
                    profContext.Message = "Semestrul trebuie precizata";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Teza))
                {
                    profContext.Message = "Spuneti daca aceasta nota este teza sau nu";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Data.ToString()))
                {
                    profContext.Message = "Adaugati data";
                }
                else
                {
                    var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
                    var id_elev = context.GetIdElevFromNume(noteElevVM.Nume, noteElevVM.Prenume).ElementAtOrDefault(0);
                    var elevClasa = context.GetIdClasaElev(id_elev).ElementAtOrDefault(0);
                    var id_materie = context.GetIdMaterie(noteElevVM.Materie).ElementAtOrDefault(0);
                    var profMatCls = context.ProfMaterieClasaExista(id, id_materie, elevClasa).ElementAtOrDefault(0);
                    if (elevClasa != null)
                    {
                        if (profMatCls == 1)
                        {
                            if (noteElevVM.Teza == "da")
                            {
                                context.AddNota(id_elev, id, id_materie, noteElevVM.Data, noteElevVM.Nota, true, noteElevVM.Semestru);
                                profContext.Message = "Nota adaugata";
                            }
                            else if (noteElevVM.Teza == "nu")
                            {
                                context.AddNota(id_elev, id, id_materie, noteElevVM.Data, noteElevVM.Nota, false, noteElevVM.Semestru);
                                profContext.Message = "Nota adaugata";
                            }
                            else
                                profContext.Message = "Scrieti doar da sau nu";

                        }
                        else if(profMatCls == 2)
                        {
                            profContext.Message = "Profesorul preda aceasta materie, dar nu preda la clasa elevului ales";
                        }
                        else if (profMatCls == 3)
                        {
                            profContext.Message = "Profesorul nu preda aceasta materie";
                        }
                        else if (profMatCls == 4)
                        {
                            profContext.Message = "Profesorul preda la clasa elevului ales, dar nu aceasta materie";
                        }
                        else if (profMatCls == 0)
                        {
                            profContext.Message = "Profesorul nu preda la clasa elevului ales si nici nu preda aceasta materie";
                        }
                    }
                    else
                    {
                        profContext.Message = "Elevul nu exista";
                    }

                }
            }
        }

        public void AddAbsentaMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            AbsentaElevVM absenteElevVM = obj as AbsentaElevVM;


            if (absenteElevVM != null)
            {
                if (String.IsNullOrEmpty(absenteElevVM.Nume))
                {
                    profContext.Message = "Numele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Prenume))
                {
                    profContext.Message = "Prenumele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Materie))
                {
                    profContext.Message = "Materia trebuie precizata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Motivata))
                {
                    profContext.Message = "Spuneti daca absenta este motivata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Semestru.ToString()))
                {
                    profContext.Message = "Semestrul trebuie precizata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Motivabila))
                {
                    profContext.Message = "Spuneti daca absenta este motivabila";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Data.ToString()))
                {
                    profContext.Message = "Adaugati data";
                }
                else
                {
                    var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
                    var id_elev = context.GetIdElevFromNume(absenteElevVM.Nume, absenteElevVM.Prenume).ElementAtOrDefault(0);
                    var elevClasa = context.GetIdClasaElev(id_elev).ElementAtOrDefault(0);
                    var id_materie = context.GetIdMaterie(absenteElevVM.Materie).ElementAtOrDefault(0);
                    var profMatCls = context.ProfMaterieClasaExista(id, id_materie, elevClasa).ElementAtOrDefault(0);
                    if (elevClasa != null)
                    {
                        if (profMatCls == 1)
                        {
                            if (absenteElevVM.Motivabila == "da")
                            {
                                if (absenteElevVM.Motivata == "da")
                                {
                                    context.AddAbsenta(id_elev, id, id_materie, absenteElevVM.Data, true, true, absenteElevVM.Semestru);
                                    context.SaveChanges();
                                    profContext.Absente = FillAbsente();
                                    profContext.Message = "Absenta adaugata";
                                }
                                else if (absenteElevVM.Motivata == "nu")
                                {
                                    context.AddAbsenta(id_elev, id, id_materie, absenteElevVM.Data, false, true, absenteElevVM.Semestru);
                                    context.SaveChanges();
                                    profContext.Absente = FillAbsente();
                                    profContext.Message = "Absenta adaugata";
                                }
                            }
                            else if (absenteElevVM.Motivabila == "nu")
                            {
                                context.AddAbsenta(id_elev, id, id_materie, absenteElevVM.Data, false, false, absenteElevVM.Semestru);
                                context.SaveChanges();
                                profContext.Absente = FillAbsente();
                                profContext.Message = "Absenta adaugata";
                            }
                            else
                                profContext.Message = "Scrieti doar da sau nu";

                        }
                        else if (profMatCls == 2)
                        {
                            profContext.Message = "Profesorul preda aceasta materie, dar nu preda la clasa elevului ales";
                        }
                        else if (profMatCls == 3)
                        {
                            profContext.Message = "Profesorul nu preda aceasta materie";
                        }
                        else if (profMatCls == 4)
                        {
                            profContext.Message = "Profesorul preda la clasa elevului ales, dar nu aceasta materie";
                        }
                        else if (profMatCls == 0)
                        {
                            profContext.Message = "Profesorul nu preda la clasa elevului ales si nici nu preda aceasta materie";
                        }
                    }
                    else
                    {
                        profContext.Message = "Elevul nu exista";
                    }

                }
            }
        }

        public void MotiveazaAbsentaMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            AbsentaElevVM absenteElevVM = obj as AbsentaElevVM;


            if (absenteElevVM != null)
            {
                if (String.IsNullOrEmpty(absenteElevVM.Nume))
                {
                    profContext.Message = "Numele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Prenume))
                {
                    profContext.Message = "Prenumele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Materie))
                {
                    profContext.Message = "Materia trebuie precizata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Motivata))
                {
                    profContext.Message = "Spuneti daca absenta este motivata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Semestru.ToString()))
                {
                    profContext.Message = "Semestrul trebuie precizata";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Motivabila))
                {
                    profContext.Message = "Spuneti daca absenta este motivabila";
                }
                else if (String.IsNullOrEmpty(absenteElevVM.Data.ToString()))
                {
                    profContext.Message = "Adaugati data";
                }
                else
                {
                    var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
                    var id_elev = context.GetIdElevFromNume(absenteElevVM.Nume, absenteElevVM.Prenume).ElementAtOrDefault(0);
                    var elevClasa = context.GetIdClasaElev(id_elev).ElementAtOrDefault(0);
                    var id_materie = context.GetIdMaterie(absenteElevVM.Materie).ElementAtOrDefault(0);
                    var profMatCls = context.ProfMaterieClasaExista(id, id_materie, elevClasa).ElementAtOrDefault(0);
                    
                    if (elevClasa != null)
                    {
                        if (profMatCls == 1)
                        {
                            if (absenteElevVM.Motivabila == "da")
                            {
                                if (absenteElevVM.Motivata == "da")
                                {
                                    var id_absenta = context.GetIdAbsenta(id_elev, id_materie, absenteElevVM.Data, absenteElevVM.Semestru).ElementAtOrDefault(0);
                                    context.MotiveazaAbsenta(id_absenta, true);
                                    context.SaveChanges();
                                    profContext.Absente = FillAbsente();
                                    profContext.Message = "Absenta motivata";
                                }
                                else if (absenteElevVM.Motivata == "nu")
                                {
                                    profContext.Message = "...";
                                }
                            }
                            else if (absenteElevVM.Motivabila == "nu")
                            {
                                profContext.Message = "Absenta nu poate fi motivata";
                            }
                            else
                                profContext.Message = "Scrieti doar da sau nu";

                        }
                        else if (profMatCls == 2)
                        {
                            profContext.Message = "Profesorul preda aceasta materie, dar nu preda la clasa elevului ales";
                        }
                        else if (profMatCls == 3)
                        {
                            profContext.Message = "Profesorul nu preda aceasta materie";
                        }
                        else if (profMatCls == 4)
                        {
                            profContext.Message = "Profesorul preda la clasa elevului ales, dar nu aceasta materie";
                        }
                        else if (profMatCls == 0)
                        {
                            profContext.Message = "Profesorul nu preda la clasa elevului ales si nici nu preda aceasta materie";
                        }
                    }
                    else
                    {
                        profContext.Message = "Elevul nu exista";
                    }

                }
            }
        }

        public void AnuleazaNotaMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            NoteElevVM noteElevVM = obj as NoteElevVM;


            if (noteElevVM != null)
            {
                if (String.IsNullOrEmpty(noteElevVM.Nume))
                {
                    profContext.Message = "Numele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Prenume))
                {
                    profContext.Message = "Prenumele trebuie precizat";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Materie))
                {
                    profContext.Message = "Materia trebuie precizata";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Nota.ToString()))
                {
                    profContext.Message = "Nota trebuie precizata";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Semestru.ToString()))
                {
                    profContext.Message = "Semestrul trebuie precizata";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Teza))
                {
                    profContext.Message = "Spuneti daca aceasta nota este teza sau nu";
                }
                else if (String.IsNullOrEmpty(noteElevVM.Data.ToString()))
                {
                    profContext.Message = "Adaugati data";
                }
                else
                {
                    var id = context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault();
                    var id_elev = context.GetIdElevFromNume(noteElevVM.Nume, noteElevVM.Prenume).ElementAtOrDefault(0);
                    var elevClasa = context.GetIdClasaElev(id_elev).ElementAtOrDefault(0);
                    var id_materie = context.GetIdMaterie(noteElevVM.Materie).ElementAtOrDefault(0);
                    var profMatCls = context.ProfMaterieClasaExista(id, id_materie, elevClasa).ElementAtOrDefault(0);

                    if (elevClasa != null)
                    {
                        if (profMatCls == 1)
                        {
                            if (profMatCls == 1)
                            {
                                if (noteElevVM.Teza == "da")
                                {
                                    var id_nota = context.GetIdNota(id_elev, id, id_materie, noteElevVM.Data, noteElevVM.Nota, noteElevVM.Semestru, true).ElementAtOrDefault(0);
                                    context.DeleteNota(id_nota);
                                    context.SaveChanges();
                                    profContext.Note = FillNote();
                                    profContext.Message = "Nota stearsa";
                                }
                                else if (noteElevVM.Teza == "nu")
                                {
                                    var id_nota = context.GetIdNota(id_elev, id, id_materie, noteElevVM.Data, noteElevVM.Nota, noteElevVM.Semestru, false).ElementAtOrDefault(0);
                                    context.DeleteNota(id_nota);
                                    context.SaveChanges();
                                    profContext.Note = FillNote();
                                    profContext.Message = "Nota stearsa";
                                }
                                else
                                    profContext.Message = "Scrieti doar da sau nu";

                            }

                        }
                        else if (profMatCls == 2)
                        {
                            profContext.Message = "Profesorul preda aceasta materie, dar nu preda la clasa elevului ales";
                        }
                        else if (profMatCls == 3)
                        {
                            profContext.Message = "Profesorul nu preda aceasta materie";
                        }
                        else if (profMatCls == 4)
                        {
                            profContext.Message = "Profesorul preda la clasa elevului ales, dar nu aceasta materie";
                        }
                        else if (profMatCls == 0)
                        {
                            profContext.Message = "Profesorul nu preda la clasa elevului ales si nici nu preda aceasta materie";
                        }
                    }
                    else
                    {
                        profContext.Message = "Elevul nu exista";
                    }

                }
            }
        }

        public void OpenWindow(object obj)
        {
            var esteDiri = context.EsteDiriginte(context.GetIdProf(Helpers.Helper.UserCurent).FirstOrDefault()).ElementAtOrDefault(0);
            if (esteDiri == 1)
            {
                DiriginteView d = new DiriginteView();
                d.ShowDialog();
            }
            else
                profContext.Message = "Nu sunteti diriginte!";
        }
    }
}
