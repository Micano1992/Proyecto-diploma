using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace DAL
{
    public class SeguridadDAL
    {
        ConexionesSQL nConexion = new ConexionesSQL();
        Encriptacion encrip = new Encriptacion();

        //SqlConnection nCon = new SqlConnection();

        //SqlCommand nCom = new SqlCommand();

        string sql;

        //public void conexionBD(int a, string consulta = "")
        //{
        //    string conex = "Data Source=DESKTOP-P3SLUJR;Initial Catalog=ProyectoAnalista;Integrated Security=True";
                        
        //    nCom.CommandType = CommandType.Text;

        //    nCom.Connection = nCon;

        //    if(a == 1)
        //    {
        //        nCon.ConnectionString = conex;

        //        nCom.CommandText = consulta;

        //        nCon.Open();
        //    }

        //    if (a == 0)
        //    {
        //        nCon.Close();
        //    }
        //}

        public bool validarUsuario(BE.UsuarioBE nUsuario)
        {      
           sql = string.Format("select count(*) from dbo.usuario where cod_usuario = '{0}'", nUsuario.codUsuario);

           nConexion.conexionBD(1, sql);

            if(int.Parse(nConexion.nCom.ExecuteScalar().ToString()) > 0)
            {
                nConexion.nCon.Close();

                return true;
            }

            nConexion.conexionBD(0);

            return false;    
        }

        public bool validarEstado(BE.UsuarioBE nUsuario)
        {
            sql = string.Format("select bloqueado from dbo.usuario where cod_usuario = '{0}'", nUsuario.codUsuario);

            nConexion.conexionBD(1, sql);

            //int a = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

            if (Convert.ToInt16(nConexion.nCom.ExecuteScalar()) == 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool validarContraseña(BE.UsuarioBE nUsuario)
        {
            bool resp = false;

            sql = string.Format("select count(*) from dbo.usuario where cod_usuario = '{0}' and contraseña = '{1}'", nUsuario.codUsuario, GetMD5(nUsuario.contraseña));

            nConexion.conexionBD(1, sql);

            if (int.Parse(nConexion.nCom.ExecuteScalar().ToString()) > 0)
            {
                resp = true;
            }

            nConexion.conexionBD(0);

            actualizarIngresosError(nUsuario, resp);

            return resp;
        }

        public void actualizarIngresosError(BE.UsuarioBE nUsuario, bool acceso)
        {
            int intentos = 0;

            int bloqueado = 0;

            //Contraseña correcta

            if (acceso == true)
            {
                sql = string.Format("Update Usuario Set Cantidad_ingresos_incorrectos = 0 where cod_usuario = '{0}'", nUsuario.codUsuario);
            }

            else
            {
                //Verificar cantidad de ingresos incorrectos

                sql = string.Format("select cantidad_ingresos_incorrectos from dbo.usuario where cod_usuario = '{0}'", nUsuario.codUsuario);

                nConexion.conexionBD(1, sql);

                intentos = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

                nConexion.conexionBD(0);
            }
            
            
            //Contraseña incorrecta

            if (acceso == false)
            {
                if(intentos == 0 || intentos == 1)
                {
                    intentos += 1;
                }
                else
                {
                    intentos = 0;

                    bloqueado = 1;
                }

                sql = string.Format("Update Usuario Set Cantidad_ingresos_incorrectos = {0}, bloqueado = {1} where cod_usuario = '{2}'", intentos.ToString(), bloqueado.ToString(), nUsuario.codUsuario);

            }

            nConexion.conexionBD(1, sql);

            nConexion.nCom.ExecuteNonQuery();

            nConexion.conexionBD(0);

        }

        public List<BE.PatenteBE> listarPatenteUsuario()
        {
            List<BE.PatenteBE> lPatente = new List<BE.PatenteBE>();

           




            return lPatente;
        }

        public bool bloquearUSuario(string usuario, int block)
        {
            sql = string.Format("Update Usuario Set Cantidad_ingresos_incorrectos = 0, bloqueado = {0} where cod_usuario = '{1}'", block, usuario );

            nConexion.conexionBD(1, sql);

            if(nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }
            else
            {
                nConexion.conexionBD(0);

                return false;
            }
        }

        public static string GetMD5(string str)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }

        public static string Base64Encode(string word) 
        {
            byte[] byt = System.Text.Encoding.UTF8.GetBytes(word);
            return Convert.ToBase64String(byt);
        }
        public static string Base64Decode(string word)
        {
            byte[] b = Convert.FromBase64String(word);
            return System.Text.Encoding.UTF8.GetString(b);
        }


        public bool modificarContraseña(BE.UsuarioBE usu)
        {
            sql = string.Format("Update Usuario Set Contraseña = '{0}' where cod_usuario = '{1}'", GetMD5(usu.contraseña), usu.codUsuario);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }
            else
            {
                nConexion.conexionBD(0);

                return false;
            }

        }

    }
}
