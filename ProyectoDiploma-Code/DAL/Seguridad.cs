using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Seguridad
    {
        public bool validarUsuario(string usuario)
        {
            return true;    
        }

        public bool validarContraseña(string usuario, string contraseña)
        {
            bool acceso = true;

            actualizarIngresosError(usuario, acceso);

            return true;
        }

        public void actualizarIngresosError(string usuario, bool acceso)
        {

        }



    }
}
