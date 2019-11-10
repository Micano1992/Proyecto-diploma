using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Idioma
    {
        ConexionesSQL nConexion = new ConexionesSQL();
        List<BE.Idioma> lisIdioma = new List<BE.Idioma>();

        string sql;

        public int obtenerIdIdioma(string desc)
        {
            sql = string.Format("Select id_idioma from dbo.Idioma where descripcion_idioma = '{0}'", desc);

            nConexion.conexionBD(1, sql);

            int resul = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

            nConexion.conexionBD(0);

            return resul;
        }

        public List<BE.Idioma> Retrieve()
        {
            lisIdioma.Clear();

            sql = "Select * from dbo.Idioma";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Idioma nIdiom = new BE.Idioma();

                nIdiom.idIdioma = int.Parse(reader[0].ToString());
                nIdiom.descripcion_idioma = reader[1].ToString();

                lisIdioma.Add(nIdiom);

            }

            return lisIdioma;


            throw new NotImplementedException();
        }

        public void mensajesIdioma(ref BE.Idioma idiom)
        {
            sql = string.Format("Select * from dbo.IdiomaMensaje where id_idioma = {0}", idiom.idIdioma);

            //BE.Idioma nIdiom = new BE.Idioma();

            List<string[]> lista = new List<string[]>();

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                string[] nMen = new string[2];

                nMen[0] = reader[1].ToString();
                nMen[1] = reader[2].ToString();

               lista.Add(nMen);

            }

            idiom.mensajes = lista;

        }

        public BE.Idioma obtenerDescripcion(BE.Idioma idi)
        {
            sql = "Select * from dbo.Idioma where Id_idioma = " + idi.idIdioma;

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            BE.Idioma nIdiom = new BE.Idioma();

            while (reader.Read())
            {

                nIdiom.idIdioma = int.Parse(reader[0].ToString());
                nIdiom.descripcion_idioma = reader[1].ToString();
            }

            nConexion.conexionBD(0);

            return nIdiom;
        }

    }
}
