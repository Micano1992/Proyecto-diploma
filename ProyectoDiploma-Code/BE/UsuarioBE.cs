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

        public string contraseña { get; set; }

        public int bloqueado { get; set; }

       
    }
}
