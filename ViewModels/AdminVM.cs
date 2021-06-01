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
    class AdminVM : BaseVM
    {
        AdminActions adminActions;

        public AdminVM()
        {
            adminActions = new AdminActions(this);
        }

        #region Data Members
        private int id_admin;
        private string nume;
        private string message;
        private ObservableCollection<ElevVM> elevi;
        private ObservableCollection<ProfVM> profi;
        private ObservableCollection<MaterieVM> materii;

        public ObservableCollection<MaterieVM> Materii
        {
            get
            {
                materii = adminActions.FillMaterii();
                return materii;
            }
            set
            {
                materii = value;
                NotifyPropertyChanged("Materii");
            }
        }

        public ObservableCollection<ProfVM> Profesori
        {
            get
            {
                profi = adminActions.FillProfi();
                return profi;
            }
            set
            {
                profi = value;
                NotifyPropertyChanged("Profesori");
            }
        }

        public ObservableCollection<ElevVM> Elevi
        {
            get
            {
                elevi = adminActions.FillElevi();
                return elevi;
            }
            set
            {
                elevi = value;
                NotifyPropertyChanged("Elevi");
            }
        }

        public int Id_admin
        {
            get
            {
                return id_admin;
            }
            set
            {
                id_admin = value;
                NotifyPropertyChanged("Id_admin");
            }
        }
        public string Nume
        {
            get
            {
                nume = adminActions.GetNume();
                return nume;
            }
            set
            {
                nume = value;
                NotifyPropertyChanged("Nume");
            }
        }

        public string Message
        {
            get
            {
                return message;
            }
            set
            {
                message = value;
                NotifyPropertyChanged("Message");
            }
        }


        #endregion

        #region Command Members

        //asta este pt butonul Add
        private ICommand addElevCommand;
        public ICommand AddElevCommand
        {
            get
            {
                if (addElevCommand == null)
                {
                    addElevCommand = new RelayCommand(adminActions.AddElevMethod);
                }
                return addElevCommand;
            }
        }

        private ICommand addProfCommand;
        public ICommand AddProfCommand
        {
            get
            {
                if (addProfCommand == null)
                {
                    addProfCommand = new RelayCommand(adminActions.AddProfMethod);
                }
                return addProfCommand;
            }
        }

        private ICommand addDirigCommand;
        public ICommand AddDirigCommand
        {
            get
            {
                if (addDirigCommand == null)
                {
                    addDirigCommand = new RelayCommand(adminActions.AddDirigMethod);
                }
                return addDirigCommand;
            }
        }

        private ICommand addMaterieCommand;
        public ICommand AddMaterieCommand
        {
            get
            {
                if (addMaterieCommand == null)
                {
                    addMaterieCommand = new RelayCommand(adminActions.AddMaterieMethod);
                }
                return addMaterieCommand;
            }
        }

        //asta este pt butonul Update
        private ICommand updateElevCommand;
        public ICommand UpdateElevCommand
        {
            get
            {
                if (updateElevCommand == null)
                {
                    updateElevCommand = new RelayCommand(adminActions.UpdateElevMethod);
                }
                return updateElevCommand;
            }
        }

        private ICommand updateProfCommand;
        public ICommand UpdateProfCommand
        {
            get
            {
                if (updateProfCommand == null)
                {
                    updateProfCommand = new RelayCommand(adminActions.UpdateProfMethod);
                }
                return updateProfCommand;
            }
        }

        private ICommand updateMaterieCommand;
        public ICommand UpdateMaterieCommand
        {
            get
            {
                if (updateMaterieCommand == null)
                {
                    updateMaterieCommand = new RelayCommand(adminActions.UpdateMaterieMethod);
                }
                return updateMaterieCommand;
            }
        }

        //asta este pt butonul Delete
        private ICommand deleteElevCommand;
        public ICommand DeleteElevCommand
        {
            get
            {
                if (deleteElevCommand == null)
                {
                    deleteElevCommand = new RelayCommand(adminActions.DeleteElevMethod);
                }
                return deleteElevCommand;
            }
        }

        private ICommand deleteProfCommand;
        public ICommand DeleteProfCommand
        {
            get
            {
                if (deleteProfCommand == null)
                {
                    deleteProfCommand = new RelayCommand(adminActions.DeleteProfMethod);
                }
                return deleteProfCommand;
            }
        }

        private ICommand deleteMaterieCommand;
        public ICommand DeleteMaterieCommand
        {
            get
            {
                if (deleteMaterieCommand == null)
                {
                    deleteMaterieCommand = new RelayCommand(adminActions.DeleteMaterieMethod);
                }
                return deleteMaterieCommand;
            }
        }

        #endregion
    }
}
