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

        List<string[]> lisIdiomas = new List<string[]>();

        public List<string[]> listadoIdiomas()
        {
            lisIdiomas.Clear();

            foreach(BE.Idioma idi in idiomaDAL.Retrieve())
            {
                string[] nIdiom = new string[2];

                nIdiom[0] = idi.idIdioma.ToString();

                nIdiom[1] = idi.descripcion_idioma;

                lisIdiomas.Add(nIdiom);
            }

            return lisIdiomas;

        }

        public List<string[]> mensajesIdioma(int idioma)
        {
            List<string[]> lisMensajes = new List<string[]>();

            BE.Idioma nIdioma = new BE.Idioma();

            nIdioma.idIdioma = idioma;

            idiomaDAL.mensajesIdioma(ref nIdioma);

            return nIdioma.mensajes;
            
        }

        public string obtenerDescripcion(int id)
        {
            BE.Idioma nIdiom = new BE.Idioma();

            nIdiom.idIdioma = id;

            return idiomaDAL.obtenerDescripcion(nIdiom).descripcion_idioma;
        }
    }
}
