using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.ViewModels;

namespace tema3.Models.Actions
{
    class AdminActions
    {
        ScoalaEntities context = new ScoalaEntities();

        private AdminVM adminContext;

        public AdminActions(AdminVM adminContext)
        {
            this.adminContext = adminContext;
        }


        public string GetNume()
        {
            var id = context.GetIdAdmin(Helpers.Helper.UserCurent).FirstOrDefault();
            string nume = context.GetNumePrenumeAdmin(id).FirstOrDefault();
            return nume;
        }

        public ObservableCollection<MaterieVM> FillMaterii()
        {
            List<GetMaterii_Result> afisareMaterii_Results = context.GetMaterii().ToList();
            ObservableCollection<MaterieVM> materii = new ObservableCollection<MaterieVM>();
            materii = FillMateriiFaraProf();
            foreach (GetMaterii_Result mat in afisareMaterii_Results)
            {
                int da = 0;
                foreach(MaterieVM m in materii)
                {
                    if (m.Denumire.Equals(mat.materie))
                    {
                        da = 1;
                        m.NumeProf = mat.nume;
                        m.PrenumeProf = mat.prenume;
                    }
                }
                if (da == 0)
                {
                    materii.Add(new MaterieVM()
                    {
                        Denumire = mat.materie,
                        NumeProf = mat.nume,
                        PrenumeProf = mat.prenume
                    });
                }
            }

            return materii;
        }

        public ObservableCollection<MaterieVM> FillMateriiFaraProf()
        {
            List<GetMateriiFaraProf_Result> materiiR = context.GetMateriiFaraProf().ToList();
            ObservableCollection<MaterieVM> materii = new ObservableCollection<MaterieVM>();
            foreach (GetMateriiFaraProf_Result mat in materiiR)
            {
                materii.Add(new MaterieVM()
                {
                    Denumire = mat.materie,
                    NumeProf = "-",
                    PrenumeProf = "-"
                });
            }

            return materii;
        }

        public ObservableCollection<ElevVM> FillElevi()
        {

            List<GetElevi_Result> elevi_Results = context.GetElevi().ToList();
            ObservableCollection<ElevVM> elevi = new ObservableCollection<ElevVM>();
            foreach (GetElevi_Result elev in elevi_Results)
            {
                elevi.Add(new ElevVM()
                {
                    Nume = elev.nume,
                    Prenume = elev.prenume,
                    Username = elev.username,
                    An = elev.an.GetValueOrDefault(),
                    Litera = elev.litera,
                    Parola = elev.parola
                });
            }
            return elevi;
        }

        private bool verifCampuri(string nume, string prenume, string username, string parola, string an, string litera)
        {
            if (String.IsNullOrEmpty(nume))
            {
                adminContext.Message = "Numele trebuie precizat";
                return false;
            }
            else if (String.IsNullOrEmpty(username))
            {
                adminContext.Message = "Username-ul trebuie precizat";
                return false;
            }
            else if (String.IsNullOrEmpty(parola))
            {
                adminContext.Message = "Parola trebuie precizata";
                return false;
            }
            else if (String.IsNullOrEmpty(an))
            {
                adminContext.Message = "Clasa trebuie precizata";
                return false;
            }
            else if (String.IsNullOrEmpty(litera))
            {
                adminContext.Message = "Clasa trebuie precizata";
                return false;
            }
            else if (String.IsNullOrEmpty(prenume))
            {
                adminContext.Message = "Prenumele trebuie precizat";
                return false;
            }
            return true;
        }
        public void AddElevMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            ElevVM elevVM = obj as ElevVM;

            if (elevVM != null)
            {
                if(verifCampuri(elevVM.Nume1, elevVM.Prenume1, elevVM.Username, elevVM.Parola, elevVM.An.ToString(), elevVM.Litera))
                {
                    var ver = context.GetIdClasa(elevVM.An, elevVM.Litera);
                    var id_clasa = ver.ElementAtOrDefault(0);
                    var verClasa = context.Id_clasaExista(id_clasa);
                    var verUser = context.UsernameExista(elevVM.Username);
                    if (verClasa.ElementAtOrDefault(0) == 1)
                    {
                        if (verUser.ElementAtOrDefault(0) == 1)
                        {
                            adminContext.Message = "Username-ul exista deja!";
                        }
                        else
                        {
                            context.AdaugareInregistrare(elevVM.Username, elevVM.Parola, "elev", true);
                            context.AddElev(elevVM.Nume1, elevVM.Prenume1, elevVM.Username, id_clasa);
                            context.SaveChanges();
                            adminContext.Elevi = FillElevi();
                            adminContext.Message = "Elev adaugat";
                        }
                    }
                    else
                    {
                        adminContext.Message = "Clasa nu exista";
                    }

                }
            }
        }

        public ObservableCollection<ProfVM> FillProfi()
        {
            List<GetProfi_Result> profi_Results = context.GetProfi().ToList();
            ObservableCollection<ProfVM> profi = new ObservableCollection<ProfVM>();
            profi = FillDiriginti();
            foreach (GetProfi_Result prof in profi_Results)
            {
                int da = 0;
                foreach(ProfVM p in profi)
                {
                    if(p.Nume1.Equals(prof.nume) && p.Prenume1.Equals(prof.prenume))
                    {
                        da = 1;
                    }
                }
                if (da == 0)
                {
                    profi.Add(new ProfVM()
                    {
                        Nume1 = prof.nume,
                        Prenume1 = prof.prenume,
                        Username = prof.username,
                        Parola = prof.parola,
                        
                    });
                }
            }
            return profi;
        }

        public ObservableCollection<ProfVM> FillDiriginti()
        {
            List<GetDiriginti_Result> diriginti_Results = context.GetDiriginti().ToList();
            ObservableCollection<ProfVM> profi = new ObservableCollection<ProfVM>();
            foreach (GetDiriginti_Result prof in diriginti_Results)
            {
                profi.Add(new ProfVM()
                {
                    Nume1 = prof.nume,
                    Prenume1 = prof.prenume,
                    Username = prof.username,
                    Parola = prof.parola,
                    An = prof.an.GetValueOrDefault(),
                    Litera = prof.litera
                });
            }
            return profi;
        }
        public void AddProfMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            ProfVM profVM = obj as ProfVM;

            if (profVM != null)
            {
                if (String.IsNullOrEmpty(profVM.Nume1))
                {
                    adminContext.Message = "Numele trebuie precizat";
                    return;
                }
                else if (String.IsNullOrEmpty(profVM.Username))
                {
                    adminContext.Message = "Username-ul trebuie precizat";
                    return;
                }
                else if (String.IsNullOrEmpty(profVM.Parola))
                {
                    adminContext.Message = "Parola trebuie precizata";
                    return;
                }
                else if (String.IsNullOrEmpty(profVM.Prenume1))
                {
                    adminContext.Message = "Prenumele trebuie precizat";
                    return;
                }
                else
                {
                    var verUser = context.UsernameExista(profVM.Username);

                    if (verUser.ElementAtOrDefault(0) == 1)
                    {

                        adminContext.Message = "Username-ul exista deja";
                    }
                    else
                    {
                        context.AdaugareInregistrare(profVM.Username, profVM.Parola, "prof", true);
                        context.AddProf(profVM.Nume1, profVM.Prenume1, profVM.Username);
                        context.SaveChanges();
                        adminContext.Profesori = FillProfi();
                        adminContext.Message = "Profesor adaugat";
                    }


                }
            }
        }

        public void AddDirigMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            ProfVM profVM = obj as ProfVM;

            if (profVM != null)
            {
                if (verifCampuri(profVM.Nume1, profVM.Prenume1, profVM.Username, profVM.Parola, profVM.An.ToString(), profVM.Litera))
                {
                    var ver = context.GetIdClasa(profVM.An, profVM.Litera);
                    var id_clasa = ver.ElementAtOrDefault(0);
                    var verClasa = context.Id_clasaExista(id_clasa);
                    var verUser = context.UsernameExista(profVM.Username);
                    var verProf = context.GetIdProf(profVM.Username);
                    var id_prof = verProf.ElementAtOrDefault(0);

                    if (verClasa.ElementAtOrDefault(0) == 1)
                    {
                        if (verUser.ElementAtOrDefault(0) == 1)
                        {
                            var dir = context.DiriginteExista(id_prof, id_clasa);
                            var verifDiriginte = dir.ElementAtOrDefault(0);
                            if (verifDiriginte == 1)
                            {
                                adminContext.Message = "Profesorul este diriginte la aceasta clasa";
                            }
                            else if (verifDiriginte == 2)
                            {
                                adminContext.Message = "Profesorul este deja diriginte la o alta clasa";
                            }
                            else if (verifDiriginte == 3)
                            {
                                adminContext.Message = "Clasa are deja un diriginte";
                            }
                            else if (verifDiriginte == 0)
                            {
                                context.AdaugaDiriginte(id_prof, id_clasa);
                                context.SaveChanges();
                                adminContext.Profesori = FillProfi();
                                adminContext.Message = "Diriginte adaugat";
                            }
                        }
                        else
                        {

                            adminContext.Message = "Profesorul nu exista";
                        }
                    }
                    else
                        adminContext.Message = "Clasa nu exista";

                }
            }
        }

        public void AddMaterieMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            MaterieVM materieVM = obj as MaterieVM;

            if (materieVM != null)
            {
                if (String.IsNullOrEmpty(materieVM.Denumire))
                {
                    adminContext.Message = "Denumirea trebuie precizata";
                    return;
                }

                else
                {
                    context.AddMaterie(materieVM.Denumire);
                    context.SaveChanges();
                    adminContext.Materii = FillMaterii();
                    adminContext.Message = "Materie adaugata";
                }
            }
        }

        public void UpdateElevMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            ElevVM elevVM = obj as ElevVM;

            if (elevVM != null)
            {
                if (verifCampuri(elevVM.Nume1, elevVM.Prenume1, elevVM.Username, elevVM.Parola, elevVM.An.ToString(), elevVM.Litera))
                {
                    var ver = context.GetIdClasa(elevVM.An, elevVM.Litera);
                    var id_clasa = ver.ElementAtOrDefault(0);
                    var verClasa = context.Id_clasaExista(id_clasa);
                    var verUser = context.UsernameExista(elevVM.Username);
                    var id = context.GetIdElev(elevVM.Username).FirstOrDefault();
                    if (verClasa.ElementAtOrDefault(0) == 1)
                    {
                        if (verUser.ElementAtOrDefault(0) == 1)
                        {
                            context.UpdateInregistrare(elevVM.Username, elevVM.Parola);
                            adminContext.Message = "Parola updatata!";
                            context.UpdateElev(id, elevVM.Nume1, elevVM.Prenume1, elevVM.Username, id_clasa);
                            context.SaveChanges();
                            adminContext.Elevi = FillElevi();
                            adminContext.Message = "Elev updatat";
                        }
                        else
                        {
                            adminContext.Message = "Elevul nu exista";
                        }
                    }
                    else
                    {
                        adminContext.Message = "Clasa nu exista";
                    }

                }
            }
        }

        public void UpdateProfMethod(object obj)
        {
            ProfVM profVM = obj as ProfVM;

            if (profVM != null)
            {
                if (String.IsNullOrEmpty(profVM.Nume1))
                {
                    adminContext.Message = "Numele trebuie precizat";
                    return;
                }
                else if (String.IsNullOrEmpty(profVM.Username))
                {
                    adminContext.Message = "Username-ul trebuie precizat";
                    return;
                }
                else if (String.IsNullOrEmpty(profVM.Parola))
                {
                    adminContext.Message = "Parola trebuie precizata";
                    return;
                }
                else if (String.IsNullOrEmpty(profVM.Prenume1))
                {
                    adminContext.Message = "Prenumele trebuie precizat";
                    return;
                }
                else
                {
                    var verUser = context.UsernameExista(profVM.Username);
                    var id = context.GetIdProf(profVM.Username).FirstOrDefault();

                    if (verUser.ElementAtOrDefault(0) == 1)
                    {
                        context.UpdateInregistrare(profVM.Username, profVM.Parola);
                        adminContext.Message = "Parola updatata!";
                        context.UpdateProf(id, profVM.Nume1, profVM.Prenume1, profVM.Username);
                        context.SaveChanges();
                        adminContext.Profesori = FillProfi();
                        adminContext.Message = "Profesor updatat";
                    }
                    else
                    {
                        adminContext.Message = "Profesorul nu exista";
                    }
                }
            }
        }
        public void UpdateMaterieMethod(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            MaterieVM materieVM = obj as MaterieVM;
            var id = context.GetIdMaterie(materieVM.Denumire).FirstOrDefault();

            if (materieVM != null && id != null)
            {
                if (String.IsNullOrEmpty(materieVM.Denumire))
                {
                    adminContext.Message = "Denumirea trebuie precizata";
                    return;
                }
                else if (!String.IsNullOrEmpty(materieVM.NumeProf) && !String.IsNullOrEmpty(materieVM.PrenumeProf))
                {
                    var idProf = context.GetIdProfFromNumePrenume(materieVM.NumeProf, materieVM.PrenumeProf).FirstOrDefault();

                    if (context.ProfMaterieExista(idProf, id).ElementAtOrDefault(0) == 0)
                    {
                        if (idProf == null)
                            adminContext.Message = "Profesorul nu exista";
                        else
                        {
                            context.UpdateProfMaterie(idProf, id);
                            context.SaveChanges();
                            adminContext.Materii = FillMaterii();
                            adminContext.Message = "Materie conectata cu prof";
                        }
                    }
                    else
                        adminContext.Message = "Profesorul preda deja aceasta materie";
                }
                else if (!String.IsNullOrEmpty(materieVM.Specializare))
                {
                    var idS = context.GetIdSpecializare(materieVM.Specializare).FirstOrDefault();
                    if (context.SpecializareMaterieExista(idS, id).ElementAtOrDefault(0) == 0)
                    {
                        if (idS == null)
                            adminContext.Message = "Specializarea nu exista";
                        else
                        {
                            context.UpdateSpecializareMaterie(idS, id, false);
                            context.SaveChanges();
                            adminContext.Materii = FillMaterii();
                            adminContext.Message = "Materie conectata cu specializarea";
                        }
                    }
                    else
                        adminContext.Message = "Aceasta materie este predata la aceasta specializare";
                }


            }
        }

        public void DeleteElevMethod(Object obj)
        {
            ElevVM elevVM = obj as ElevVM;
            var id = context.GetIdElev(elevVM.Username).FirstOrDefault();
            if (elevVM != null)
            {
                if (String.IsNullOrEmpty(elevVM.Username))
                {
                    adminContext.Message = "Username-ul elevului trebuie precizat";
                }
                else
                {
                    var verUser = context.UsernameExista(elevVM.Username);
                    if (verUser.ElementAtOrDefault(0) == 1)
                    {
                        context.DeletePerson(id);

                        context.SaveChanges();
                        adminContext.Elevi = FillElevi();
                        adminContext.Message = "Elev sters!";
                    }
                    else
                        adminContext.Message = "Introduceti un username valid";

                }
            }
        }

        public void DeleteProfMethod(Object obj)
        {
            ProfVM profVM = obj as ProfVM;
            var id = context.GetIdProf(profVM.Username).FirstOrDefault();
            if (profVM != null)
            {
                if (String.IsNullOrEmpty(profVM.Username))
                {
                    adminContext.Message = "Username-ul trebuie precizat";
                }
                else
                {
                    var verUser = context.UsernameExista(profVM.Username);
                    if (verUser.ElementAtOrDefault(0) == 1)
                    {
                        context.DeleteProf(id);

                        context.SaveChanges();
                        adminContext.Elevi = FillElevi();
                        adminContext.Message = "Profesor sters!";
                    }
                    else
                        adminContext.Message = "Introduceti un username valid";

                }
            }
        }

        public void DeleteMaterieMethod(Object obj)
        {
            MaterieVM materieVM = obj as MaterieVM;
            var id = context.GetIdMaterie(materieVM.Denumire).FirstOrDefault();
            if (materieVM != null && id != null)
            {
                if (String.IsNullOrEmpty(materieVM.Denumire))
                {
                    adminContext.Message = "Denumirea trebuie precizata";
                    return;
                }
                else
                {
                    context.DeleteMaterie(id);
                    context.SaveChanges();
                    adminContext.Materii = FillMaterii();
                    adminContext.Message = "Materie stearsa!";
                }
            }
        }
    }
}
