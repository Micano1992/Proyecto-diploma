﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class UsuarioBE: ICRUD<UsuarioBE>
    {
        public string codUsuario { get; set; }

        public string contraseña { get; set; }

        public int bloqueado { get; set; }

        public bool Create(UsuarioBE objAlta)
        {
            throw new NotImplementedException();
        }

        public List<UsuarioBE> Retrieve()
        {
            throw new NotImplementedException();
        }

        public bool Update(UsuarioBE objUpdate)
        {
            throw new NotImplementedException();
        }

        public bool Delete(UsuarioBE objDelete)
        {
            throw new NotImplementedException();
        }
    }
}
