using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class DigitoVerificador
    {

        ConexionesSQL nConexion = new ConexionesSQL();

        public int obtenerSumaDVH(string entidad)
        {
            string sql = "SELECT SUM(DVH) FROM " + entidad;

            int returnVal;

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            try
            {
                if (reader.HasRows)
                {
                    reader.Read();
                    returnVal = reader[0] is System.DBNull ? 0 : Convert.ToInt32(reader[0]);
                    return returnVal;
                }
                else
                {
                    return -1;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("DAL DigitoVerificador obtenerSumaDVH: " + ex.Message);
                return -1;
            }
            finally
            {
                nConexion.conexionBD(0);
            }
        }

        public Boolean actualizarDVV(string entidad, int valor)
        {
            string sql = "UPDATE DVV SET valor_dv=" + valor + " WHERE entidad='" + entidad + "'";

            nConexion.conexionBD(1, sql);

            try
            {
                return nConexion.nCom.ExecuteNonQuery() > -1;
            }
            catch (Exception ex)
            {
                Console.WriteLine("DAL DigitoVerificador actualizarDVV: " + ex.Message);
                return false;
            }

            finally
            {
                nConexion.conexionBD(0);
            }
        }


    }
}
