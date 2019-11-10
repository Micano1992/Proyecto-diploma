using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Idioma
    {
        public int idIdioma { get; set; }
        public string descripcion_idioma { get; set; }
        public List<string[]> mensajes { get; set; }

    }
}
