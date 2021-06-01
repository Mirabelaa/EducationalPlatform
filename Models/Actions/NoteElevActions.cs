using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.ViewModels;

namespace tema3.Models.Actions
{
    class NoteElevActions
    {
        ScoalaEntities context = new ScoalaEntities();

        private NoteElevVM noteElevContext;
        public NoteElevActions(NoteElevVM noteElevContext)
        {
            this.noteElevContext = noteElevContext;
        }

        public ObservableCollection<NoteElevVM> FillNote()
        {
            var id = context.GetIdElev(Helpers.Helper.UserCurent).FirstOrDefault();
            List<AfisareNote_Result> afisareNote_Results = context.AfisareNote(id).ToList();
            ObservableCollection<NoteElevVM> note = new ObservableCollection<NoteElevVM>();
            foreach (AfisareNote_Result nota in afisareNote_Results)
            {
                note.Add(new NoteElevVM()
                {
                    Materie = nota.materie,
                    Nota = nota.nota.GetValueOrDefault(),
                    Data = nota.data.GetValueOrDefault(),
                    Semestru=nota.semestru.GetValueOrDefault(),
                    Teza=nota.teza

                });
            }
            return note;
        }
    }
}
