using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using tema3.ViewModels;

namespace tema3.Models.Actions
{
    class MaterieActions
    {
        ScoalaEntities context = new ScoalaEntities();

        private MaterieVM materieContext;
        public MaterieActions(MaterieVM materieContext)
        {
            this.materieContext = materieContext;
        }

        
    }
}
