using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class ConexionesSQL
    {
        public void conectar(string bd)
        {
            SqlConnection nCon = new SqlConnection(bd);

            nCon.Open();
            
        }

        public void desconectar(string bd)
        {
            SqlConnection nCon = new SqlConnection(bd);

            nCon.Close();
        }
    }
}
