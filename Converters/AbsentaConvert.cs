using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using tema3.ViewModels;

namespace tema3.Converters
{
    class AbsentaConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            int sem;
            if (int.TryParse(values[6].ToString(), out sem)) { }
            DateTime data;
            if (DateTime.TryParse(values[3].ToString(), out data)) { }
            return new AbsentaElevVM()
            {

                Nume = values[0].ToString(),
                Prenume = values[1].ToString(),
                Materie = values[2].ToString(),
                Data = data,
                Motivabila = values[4].ToString(),
                Motivata = values[5].ToString(),
                Semestru = sem

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
