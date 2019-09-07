using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Familia
    {
        string sql;

        ConexionesSQL nConexion = new ConexionesSQL();

        public bool crearFamilia(BE.FamiliaBE fami)
        {
            sql = string.Format("Insert into dbo.Familia (Descripcion_familia) values ('{0}')", fami.descripcion);

            nConexion.conexionBD(1, sql);

            if(nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public List<BE.FamiliaBE> listarFamilia()
        {
            List<BE.FamiliaBE> lFamilia = new List<BE.FamiliaBE>();

            sql = "Select * from dbo.Familia";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while(reader.Read())
            {
                BE.FamiliaBE nFam = new BE.FamiliaBE();

                nFam.idFamilia = int.Parse( reader[0].ToString());
                nFam.descripcion = reader[1].ToString();

                lFamilia.Add(nFam);
            }

            nConexion.conexionBD(0);

            return lFamilia;
        }

        public bool eliminarFamilia(BE.FamiliaBE fami)
        {
            sql = string.Format("Delete from dbo.Familia where Descripcion_familia = '{0}'", fami.descripcion);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;

        }
        

         
            
    }
}
