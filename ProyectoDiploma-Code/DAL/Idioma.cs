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



    }
}
