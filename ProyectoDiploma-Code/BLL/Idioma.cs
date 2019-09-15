using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Idioma
    {
        DAL.Idioma idiomaDAL = new DAL.Idioma();

        List<string> lisIdiomas = new List<string>();

        public List<string> listadoIdiomas()
        {
            lisIdiomas.Clear();

            foreach(BE.Idioma idi in idiomaDAL.Retrieve())
            {
                lisIdiomas.Add(idi.descripcion_idioma);
            }

            return lisIdiomas;

        }
    }
}
