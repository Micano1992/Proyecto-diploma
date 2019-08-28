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
        SqlConnection nCon = new SqlConnection();

        public bool validarUsuario(string usuario)
        {

           string conex = "Data Source=DESKTOP-P3SLUJR;Initial Catalog=ProyectoAnalista;Integrated Security=True";

           string sql = string.Format("select count(*) from dbo.usuario where cod_usuario = '{0}'", usuario);

           SqlConnection nCon = new SqlConnection(conex);

            SqlCommand nCom = new SqlCommand(sql, nCon);

            nCom.CommandType = CommandType.Text;

            nCon.Open();

            if(int.Parse(nCom.ExecuteScalar().ToString()) > 0)
            {
                nCon.Close();

                return true;
            }

            nCon.Close();

            return false;    
        }

        public bool validarContraseña(string usuario, string contraseña)
        {
            bool resp = false;

            string conex = "Data Source=DESKTOP-P3SLUJR;Initial Catalog=ProyectoAnalista;Integrated Security=True";

            string sql = string.Format("select count(*) from dbo.usuario where cod_usuario = '{0}' and 'contraseña' = {1}", usuario, contraseña);

            nCon.ConnectionString = sql;

            SqlCommand nCom = new SqlCommand(sql, nCon);

            nCom.CommandType = CommandType.Text;

            nCon.Open();

            if (int.Parse(nCom.ExecuteScalar().ToString()) > 0)
            {
                nCon.Close();

                resp = true;
            }

            actualizarIngresosError(usuario, resp);

            nCon.Close();

            return resp;
        }

        public void actualizarIngresosError(string usuario, bool acceso)
        {
            //string conex = "Data Source=DESKTOP-P3SLUJR;Initial Catalog=ProyectoAnalista;Integrated Security=True";

            //SqlConnection nCon = new SqlConnection(conex);

            string sql = string.Format("select cantidad_ingresos_incorrectos from dbo.usuario where codUsuario = {0}", usuario);

            SqlCommand nCom = new SqlCommand();

            int intentos = int.Parse(nCom.ExecuteScalar().ToString());
            
            if(acceso == false)
            {
                intentos += 1;
            }

            if(intentos > 2)
            {
                sql = string.Format("Update Usuario Set canIntentosIncorrectos = {0} where codUsuario = {1}", usuario, "0");
            }

            string sql = string.Format("Update Usuario Set canIntentosIncorrectos = {0} where codUsuario = {1}", usuario, "0");

            SqlCommand nCom = new SqlCommand();

            nCom.CommandType = CommandType.Text;

            nCom.CommandText = string.Format("Update Usuario Set canIntentosIncorrectos = {0} where codUsuario = {1}", usuario, "0");

        }



    }
}
