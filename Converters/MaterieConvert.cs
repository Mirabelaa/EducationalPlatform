using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using tema3.ViewModels;

namespace tema3.Converters
{
    class MaterieConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            return new MaterieVM()
            {
                Denumire = values[0].ToString(),
               // NumeProf = values[1].ToString(),
                //PrenumeProf = values[2].ToString(),
                //Specializare =values[3].ToString()
            };
        }
        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, System.Globalization.CultureInfo culture)
        {
            MaterieVM pers = value as MaterieVM;
            object[] result = new object[1] { pers.Denumire };
            return result;
        }
    }
}
