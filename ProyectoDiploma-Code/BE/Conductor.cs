using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Conductor
    {
        public int idConductor { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string nroDocumento { get; set; }
        public string patente { get; set; }
        public bool activo { get; set; }
    }
}
