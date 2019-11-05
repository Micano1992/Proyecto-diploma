using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;
using System.Web;

namespace DAL
{
    public class Encriptacion
    {
        public Encriptacion()
        {
            this.m_key = key;
            this.m_iv = iv;
        }

        //Llamada al proveedor de encriptados 3DES
        private TripleDESCryptoServiceProvider m_des = new TripleDESCryptoServiceProvider();

        //Define en controlador de cadenas de texto
        private UTF8Encoding m_utf8 = new UTF8Encoding();

        private Byte[] m_key;
        private Byte[] m_iv;

        //Llave local y vector de bytes
        private readonly Byte[] key = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 };

        //Cambiar los valores numéricos por unos diferentes ya que es parte de la llave de codificación y decodificación
        private readonly Byte[] iv = { 43, 16, 44, 35, 56, 32, 41, 14 };

        public string GetMD5(string str)
        {
            MD5 md5 = MD5CryptoServiceProvider.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] stream = null;
            StringBuilder sb = new StringBuilder();
            stream = md5.ComputeHash(encoding.GetBytes(str));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return sb.ToString();
        }
 
        public string Encriptar3D(string str)
        {
            Byte[] input = m_utf8.GetBytes(str);
            Byte[] output = transform(input, m_des.CreateEncryptor(m_key, m_iv));
            return Convert.ToBase64String(output);
        }

        public string Desencriptar3D(string str)
        {
            if (str != null)
            {
                try
                {
                    Byte[] input = Convert.FromBase64String(str);
                    Byte[] output = transform(input, m_des.CreateDecryptor(m_key, m_iv));
                    return m_utf8.GetString(output);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    return "";
                }
            }
            else
            {
                return "";
            }
        }

        public byte[] transform(byte[] input, ICryptoTransform CryptoTransformar)
        {
            using (var memory = new MemoryStream())
            {
                using (var stream = new CryptoStream(memory, CryptoTransformar, CryptoStreamMode.Write))
                {
                    stream.Write(input, 0, input.Length);
                    stream.FlushFinalBlock();
                    memory.Position = 0;
                    var result = new byte[memory.Length];
                    memory.Read(result, 0, result.Length);
                    return result;
                }
            }
        }
    }


}
