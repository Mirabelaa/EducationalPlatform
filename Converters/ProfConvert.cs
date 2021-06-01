using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using tema3.ViewModels;

namespace tema3.Converters
{
    class ProfConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
                return new ProfVM()
                {
                    Nume1 = values[0].ToString(),
                    Prenume1 = values[1].ToString(),
                    Username = values[2].ToString(),
                    Parola = values[3].ToString(),
                };
        }
        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, System.Globalization.CultureInfo culture)
        {
            ProfVM pers = value as ProfVM;
            object[] result = new object[3] { pers.Nume1, pers.Prenume1, pers.Username };
            return result;
        }
    }
}
