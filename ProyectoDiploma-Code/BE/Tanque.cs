using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Tanque
    {
        public int codTanque { get; set; }
        public string descripcionTanque { get; set; }
        public BE.Terminal terminal { get; set; }
        public int codProducto { get; set; }
        public int cantidadMaxima { get; set; }
        public bool activo { get; set; }
        public int stock { get; set; }
    }
}
