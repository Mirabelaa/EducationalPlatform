using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using tema3.Models;
using tema3.Helpers;
using System.Linq;

namespace tema3.ViewModels
{
    class Log
    {
        ScoalaEntities context = new ScoalaEntities();

        public string Login(string username, string parola)
        {
            Helper.UserCurent = username;
            
            var l = context.Logare(username, parola);
            var lo = l.ElementAtOrDefault(0);
            
            string rol;
            if (lo == 1)
            {
                rol = context.GetRol(username).ElementAtOrDefault(0);
                Helper.UserCurent = username;
                return rol;
            }
            return "none";
        }

    }
}
