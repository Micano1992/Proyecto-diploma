using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Tanque
    {
        public int idTanque { get; set; }
        public string codTanque { get; set; }
        public string descripcionTanque { get; set; }
        public BE.Terminal terminal { get; set; }
        public Producto producto { get; set; }
        public int cantidadMaxima { get; set; }
        public bool activo { get; set; }
        public int stock { get; set; }
    }
}
