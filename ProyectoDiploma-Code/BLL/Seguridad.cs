using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class Seguridad
    {
        public void listarPatentes()
        {

        }

        public bool login(string usuario, string contraseña)
        {
            DAL.Seguridad nSeg = new DAL.Seguridad();

            if(nSeg.validarUsuario(usuario))
            {
                if (nSeg.validarContraseña(usuario, contraseña))
                {
                    return true;
                }
                                    
            }

            else
            {
 
            }
            
            return false;
        }





    }
}
