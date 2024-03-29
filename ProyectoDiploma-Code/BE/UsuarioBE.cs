﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class UsuarioBE
    {
        public List<BE.Patente> lPatente = new List<Patente>();

        public string codUsuario { get; set; }

        public string nombre { get; set; }

        public string apellido { get; set; }

        public string contraseña { get; set; }

        public string nroDocumento { get; set; }

        public tipoDoc tipoDocumento { get; set; }

        public int idioma { get; set; }

        public string mail { get; set; }

        public Terminal terminal { get; set; }

        public bool bloqueado { get; set; }

        public int DVH { get; set; }


        public enum tipoDoc
        {
            CUIT = 1,
            DNI = 2,
            CUIL = 3,

        }
       
    }
}
