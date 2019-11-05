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

        Encriptacion nEncrip = new Encriptacion();

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
                            verificacion += entidad + " - " + reader[7] + "\n" ;
                        }

                    }

                    nConexion.conexionBD(0);


                    break;
                #endregion

                #region bitacora
                case "Bitacora":

                    sql = "Select Descripcion_log, Cod_usuario, Criticidad, DVH, Id_log from dbo.Bitacora";

                    nConexion.conexionBD(1, sql);

                    reader = nConexion.nCom.ExecuteReader();

                    while (reader.Read())
                    {
                        regis = "";

                        for (int i = 0; i < 3; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        int calcu = calcularDVH(regis);

                        if (calcu != Convert.ToInt64(reader[3].ToString()))
                        {
                            verificacion += entidad + " - " + reader[4] + "\n";
                        }

                    }

                    nConexion.conexionBD(0);


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
                            verificacion += entidad + "-" + reader[0].ToString() + "/" + nEncrip.Desencriptar3D(reader[3].ToString()) + "\n";
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
                            verificacion += entidad + " - " +  nEncrip.Desencriptar3D(reader[3].ToString()) + "/" + nEncrip.Desencriptar3D(reader[4].ToString()) + "\n";
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
            { }


            nConexion.conexionBD(0);

            if (suma != 0)
            {
                verificacion += entidad + "\n";
            }

            return verificacion;
        }

        public void recalcularDV(string entidad)
        {
            string sql = "";
            string regis = "";
            string sqlm = "";
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
                        string usuario = reader[7].ToString();
                        regis = "";
                        
                        for (int i = 0; i < 6; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        int calcu = calcularDVH(regis);

                        if (calcu != Convert.ToInt64(reader[6].ToString()))
                        {                            
                            sqlm += string.Format("Update Usuario set DVH = {0} where Cod_usuario = '{1}';", calcu, usuario);                           
                        }
                    }

                    nConexion.conexionBD(0);

                    if(sqlm != "")
                    {
                        nConexion.conexionBD(1, sqlm);

                        nConexion.nCom.ExecuteNonQuery();

                        nConexion.conexionBD(0);

                        actualizarDVV(entidad, obtenerSumaDVH(entidad));
                    }

                    break;
                #endregion

                #region bitacora
                case "Bitacora":

                    sql = "Select Descripcion_log, Cod_usuario, Criticidad, DVH, Id_log from dbo.Bitacora";

                    nConexion.conexionBD(1, sql);

                    reader = nConexion.nCom.ExecuteReader();

                    while (reader.Read())
                    {
                        regis = "";
                        string id = reader[4].ToString();

                        for (int i = 0; i < 3; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        int calcu = calcularDVH(regis);

                        if (calcu != Convert.ToInt64(reader[3].ToString()))
                        {
                            sqlm += string.Format("Update Bitacora set DVH = {0} where Id_log = '{1}';", calcu, id);

                        }

                    }

                    nConexion.conexionBD(0);

                    if (sqlm != "")
                    {
                        nConexion.conexionBD(1, sqlm);

                        nConexion.nCom.ExecuteNonQuery();

                        nConexion.conexionBD(0);
                    }

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

                        string codUsu = reader[0].ToString();
                        string id = reader[1].ToString();

                        for (int i = 0; i < 2; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        int calcu = calcularDVH(regis);

                        if (calcu != Convert.ToInt64(reader[2].ToString()))
                        {
                            sqlm += string.Format("Update UsuarioPatente set DVH = {0} where Id_patente = {1} and Cod_usuario = '{2}';", calcu, id, codUsu);

                        }
                   }

                    nConexion.conexionBD(0);

                    if (sqlm != "")
                    {
                        nConexion.conexionBD(1, sqlm);

                        nConexion.nCom.ExecuteNonQuery();

                        nConexion.conexionBD(0);
                    }

                    break;
                #endregion

                #region FamiliaPatente
                case "FamiliaPatente":

                    sql = "select a.Id_familia, a.Id_patente, a.DVH, b.Descripcion_patente, c.Descripcion_familia from dbo.FamiliaPatente a left join dbo.Patente b on b.Id_patente = a.Id_patente left join dbo.Familia c on c.Id_familia = a.Id_familia";

                    nConexion.conexionBD(1, sql);

                    reader = nConexion.nCom.ExecuteReader();

                    while (reader.Read())
                    {
                        regis = "";
                        int calcu, entr = 0;

                        string idF = reader[0].ToString();
                        string idP = reader[1].ToString();

                        for (int i = 0; i < 2; i++)
                        {
                            regis += reader[i].ToString();
                        }

                        calcu = calcularDVH(regis);

                        entr = Convert.ToInt32(reader[2].ToString());

                        if (calcu != entr)
                        {
                            sqlm += string.Format("Update FamiliaPatente set DVH = {0} where Id_patente = {1} and Id_familia = '{2}';", calcu, idP, idF);
                        }
                    }

                    nConexion.conexionBD(0);

                    if (sqlm != "")
                    {
                        nConexion.conexionBD(1, sqlm);

                        nConexion.nCom.ExecuteNonQuery();

                        nConexion.conexionBD(0);
                    }

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

            actualizarDVV(entidad, obtenerSumaDVH(entidad));

        }
    }
}
