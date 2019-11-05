using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Security.Cryptography;

namespace BLL
{
    public class ConexionesSQL
    {
        DAL.ConexionesSQL conexionDAL = new DAL.ConexionesSQL();
        //BLL.Bitácora bitacoraBLL = new BLL.Bitácora();

        public string obtenerConnectionString()
        {
            return conexionDAL.obtenerConnectionString();
        }

        public void actualizarConexion(string userDB, string passDB, string nombreDB, string servidor, bool seguridadIntegrada)
        {
            string conncectionString = "Data Source=" + servidor + ";Initial Catalog=" + nombreDB + ";";
            if (seguridadIntegrada)
            {
                conncectionString += "Integrated Security=True;";
            }

            else
            {
                conncectionString += "User ID=" + userDB + ";Password=" + passDB + ";";
            }

            conexionDAL.actualizarConexion(conncectionString);

            //bitacoraBLL.guardarLog("-", 1, "Actualización de datos de conexión con Base de datos", "Login");
        }

        public Boolean ProbarConnectionString()
        {
            if (!conexionDAL.ProbarConexion(obtenerConnectionString()))
            {
                //bitacoraBLL.guardarLog("-", 1, "Error en conexión con Base de datos", "Login");

                return false;
            }

            return true;

        }

        public Boolean ProbarConnectionString(string user, string pass, string nombre, string servidor, bool seguridadIntegrada)
        {
            string conncectionString = "Data Source=" + servidor + ";Initial Catalog=" + nombre + ";";
            if (seguridadIntegrada)
                conncectionString += "Integrated Security=True;";
            else
                conncectionString += "User ID=" + user + ";Password=" + pass + ";";

            if (!conexionDAL.ProbarConexion(conncectionString))
            {
               //bitacoraBLL.guardarLog("-", 1, "Error en conexión con Base de datos", "Login");

                return false;
            }

            return true;

        }

    }
}
