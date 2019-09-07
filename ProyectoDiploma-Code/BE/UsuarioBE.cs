using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class UsuarioBE
    {
        public List<BE.PatenteBE> lPatente = new List<PatenteBE>();

        public string codUsuario { get; set; }

        public string nombre { get; set; }

        public string apellido { get; set; }

        public string contraseña { get; set; }

        public string nroDocumento { get; set; }

        public tipoDoc tipoDocumento { get; set; }

        public int idioma { get; set; }

        public string mail { get; set; }

        public int terminal { get; set; }

        public int bloqueado { get; set; }


        public enum tipoDoc
        {
            CUIT,
            DNI,
            CUIL,

        }
       
    }
}
