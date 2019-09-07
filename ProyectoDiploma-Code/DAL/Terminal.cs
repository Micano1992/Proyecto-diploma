using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Terminal : BE.ICRUD<BE.Terminal>
    {
        string sql;

        ConexionesSQL nConexion = new ConexionesSQL();

        List<BE.Terminal> lTerminal = new List<BE.Terminal>();

        public bool Create(BE.Terminal objAlta)
        {
            throw new NotImplementedException();
        }

        public bool Delete(BE.Terminal objDelete)
        {
            throw new NotImplementedException();
        }

        public List<BE.Terminal> Retrieve()
        {
            lTerminal.Clear();

            sql = "Select * from dbo.Terminal";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Terminal nTerm = new BE.Terminal();

                nTerm.codTerminal = int.Parse(reader[0].ToString());
                nTerm.descripcionTerminal = reader[1].ToString();

                lTerminal.Add(nTerm);

            }

            return lTerminal;


            throw new NotImplementedException();
        }

        public bool Update(BE.Terminal objUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
