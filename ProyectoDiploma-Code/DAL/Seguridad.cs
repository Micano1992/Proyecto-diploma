using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

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

            //actualizarIngresosError(usuario, acceso);

            return true;
        }

        public void actualizarIngresosError(string usuario, bool acceso)
        {
            string conex = "conection string BD";

            SqlConnection nCon = new SqlConnection(conex);

            SqlCommand nCom = new SqlCommand();

            nCom.CommandType = CommandType.Text;

            nCom.CommandText = string.Format("Update Usuario Set canIntentosIncorrectos = {0} where codUsuario = {1}", usuario, "0");

        }



    }
}
