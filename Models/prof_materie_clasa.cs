//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace tema3.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class prof_materie_clasa
    {
        public int id_materie { get; set; }
        public int id_prof { get; set; }
        public int id_clasa { get; set; }
        public int id_material { get; set; }
    
        public virtual Clasa Clasa { get; set; }
        public virtual Materiale_didactice Materiale_didactice { get; set; }
        public virtual Prof_materie Prof_materie { get; set; }
    }
}
