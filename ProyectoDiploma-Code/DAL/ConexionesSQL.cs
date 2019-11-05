using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Security.Cryptography;
using System.Security;

namespace DAL
{
    public class ConexionesSQL
    {
        public SqlConnection nCon = new SqlConnection();
        public SqlCommand nCom = new SqlCommand();
        static SqlConnection nConnection;
        public string sql;

        public string conex { get; set; }

        public void conexionBD(int a, string consulta = "")
        {
            conex = obtenerConnectionString();      

            nCom.CommandType = CommandType.Text;

            nCom.Connection = nCon;

            if (a == 1)
            {
                nCon.ConnectionString = conex;

                nCom.CommandText = consulta;

                nCon.Open();
            }

            if (a == 0)
            {
                nCon.Close();
            }
        }
                               
        public Boolean ProbarConexion(string str)
        {

            string sCon = str;

            try
            {
                nConnection = new SqlConnection(str);
                nConnection.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Conexión a la BD fallida.");
                Console.WriteLine(ex.Message);
                if (nConnection.State == System.Data.ConnectionState.Open)
                {
                    nConnection.Close();
                }

                nConnection.Dispose();
                return false;
            }

            if (nConnection.State == System.Data.ConnectionState.Open)
            {
                Console.WriteLine("Conexión a la BD exitosa.");
                nConnection.Close();
                nConnection.Dispose();
                return true;
            }
            else
            {
                nConnection.Close();
                nConnection.Dispose();
                return false;
            }
        }

        public string obtenerConnectionString()
        {
            string connectionString = null;
            System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
            doc.Load(@"C:\\ProyectoDiploma\\ProyectoDiploma-conexion.xml");
            XmlNodeList xmlnode;
            xmlnode = doc.GetElementsByTagName("conexionDB");
            foreach (XmlNode nodo in xmlnode)
                connectionString = string.Format(nodo.SelectSingleNode("connectionString").InnerText);

            if(DesencriptarASCII(connectionString) != "ERROR")
            {
                return DesencriptarASCII(connectionString);
            }

            else
            {
                return "ERROR";
            }

            
        }

        public void actualizarConexion(string conex)
        {
            string conncectionString = EncriptarASCII(conex);
            XmlDocument doc = new XmlDocument();
            doc.Load(@"C:\\ProyectoDiploma\\ProyectoDiploma-conexion.xml");
            XmlNodeList xmlnode;
            xmlnode = doc.GetElementsByTagName("conexionDB");
            foreach (XmlNode nodo in xmlnode)
                nodo.SelectSingleNode("connectionString").InnerText = conncectionString;
            doc.Save(@"C:\\ProyectoDiploma\\ProyectoDiploma-conexion.xml");

        }

        public string EncriptarASCII(string input)
        {
            Byte[] IV = ASCIIEncoding.ASCII.GetBytes("qualityi");
            Byte[] EncryptionKey = Convert.FromBase64String("rpaSPvIvVLlrcmtzPU9/c67Gkj7yL1S5");
            Byte[] Buffer = Encoding.UTF8.GetBytes(input);
            TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
            des.Key = EncryptionKey;
            des.IV = IV;
            return Convert.ToBase64String(des.CreateEncryptor().TransformFinalBlock(Buffer, 0, Buffer.Length));
        }

        public string DesencriptarASCII(string input)
        {
            try
            {
                Byte[] IV = ASCIIEncoding.ASCII.GetBytes("qualityi"); // La clave debe ser de 8 caracteres
                Byte[] EncryptionKey = Convert.FromBase64String("rpaSPvIvVLlrcmtzPU9/c67Gkj7yL1S5"); // No se puede alterar la cantidad de caracteres pero si la clave
                Byte[] Buffer = Convert.FromBase64String(input);
                TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
                des.Key = EncryptionKey;
                des.IV = IV;
                return Encoding.UTF8.GetString(des.CreateDecryptor().TransformFinalBlock(Buffer, 0, Buffer.Length));

            }

            catch
            {
                return "Error";
            }

                   }
    }
}
