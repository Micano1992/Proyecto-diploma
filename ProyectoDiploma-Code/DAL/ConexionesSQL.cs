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
        public SqlConnection nCon = new SqlConnection();

        public SqlCommand nCom = new SqlCommand();

        public string sql;

        public string conex { get; set; }

        public void conexionBD(int a, string consulta = "")
        {
            conex = "Data Source=DESKTOP-P3SLUJR;Initial Catalog=ProyectoAnalista;Integrated Security=True";

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
    }
}
