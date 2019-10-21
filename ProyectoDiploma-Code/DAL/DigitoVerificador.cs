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

        public int calcularDVH(string registroStr)
        {
            int valorFinal = 0;
            int valorAscPosicion;
            char[] valorCharArray = registroStr.ToCharArray();
            for (int i = 0; i < valorCharArray.Length; i++)
            {
                valorAscPosicion = (valorCharArray[i] * (i + 1));
                valorFinal = valorFinal + valorAscPosicion;
            }


            return valorFinal;
        }

        public string verificarDVH(string entidad, ref string verificacion)
        {
            string sql = "";
            string regis = "";
            SqlDataReader reader;
            
            switch (entidad)
            {
                #region Usuario
                case "Usuario":

                    sql = "Select Nombre, Apellido, Tipo_documento, Nro_documento, Email, Terminal, DVH, Cod_usuario from dbo.Usuario";

                    nConexion.conexionBD(1, sql);

                    reader = nConexion.nCom.ExecuteReader();

                    while (reader.Read())
                    {
                        regis = "";

                        for (int i = 0; i < 6; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        int calcu = calcularDVH(regis);

                        if (calcu != Convert.ToInt64(reader[6].ToString()))
                        {
                            verificacion += entidad + " - " + reader[7] + "\n";
                        }

                    }

                    nConexion.conexionBD(0);


                    break;
                #endregion

                #region bitacora
                case "Bitacora":
                           
                    break;

                #endregion

                #region UsuarioPatente
                case "UsuarioPatente":

                    sql = "select a.cod_usuario, a.Id_patente, a.DVH, b.Descripcion_patente from dbo.UsuarioPatente a  left join dbo.Patente b on b.Id_patente = a.Id_patente";

                    nConexion.conexionBD(1, sql);

                    reader = nConexion.nCom.ExecuteReader();

                    while (reader.Read())
                    {
                        regis = "";

                        for (int i = 0; i < 2; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        int calcu = calcularDVH(regis);

                        if (calcu != Convert.ToInt64(reader[2].ToString()))
                        {
                            verificacion += entidad + "-" + reader[0].ToString() + "/" + reader[3].ToString() + "\n";
                        }

                    }

                    nConexion.conexionBD(0);

                    break;
                #endregion

                #region FamiliaPatente
                case "FamiliaPatente":

                    sql = "select a.Id_familia, a.Id_patente, a.DVH, b.Descripcion_patente, c.Descripcion_familia from dbo.FamiliaPatente a left join dbo.Patente b on b.Id_patente = a.Id_patente left join dbo.Familia c on c.Id_familia = a.Id_familia";

                    nConexion.conexionBD(1, sql);

                    reader = nConexion.nCom.ExecuteReader();

                    int calcul, entr = 0;

                    while (reader.Read())
                    {
                        regis = "";

                        calcul = 0;

                        entr = 0;

                        for (int i = 0; i < 2; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        calcul = calcularDVH(regis);

                        entr = Convert.ToInt32(reader[2].ToString());

                        if (calcul != entr)
                        {
                            verificacion += entidad + " - " + reader[3].ToString() + "/" + reader[4].ToString() + "\n";
                        }
                    }

                    nConexion.conexionBD(0);
                    break;
                #endregion

                #region Documento
                case "Documento":

                    break;
                #endregion

                #region Tanque
                case "Tanque":

                    break;
                    #endregion
            }

            return verificacion;
        }

        public string verificarDVV(string entidad, ref string verificacion)
        {
            string sql = "";
            int suma = 0;

            sql = string.Format("select valor_dv - (select sum(DVH) from {0}) from dvv where entidad = '{0}'", entidad);

            nConexion.conexionBD(1, sql);

            try
            { suma = (int)nConexion.nCom.ExecuteScalar(); }
            catch (Exception)
            {}
                 

            nConexion.conexionBD(0);

            if(suma != 0)
            {
                verificacion += entidad + "\n";
            }

            return verificacion;
        }

    }
}
