using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Conductor
    {
        string sql;

        ConexionesSQL nConexion = new ConexionesSQL();
        BE.Conductor conductorBE = new BE.Conductor();

        public bool crearConductor(BE.Conductor conduc)
        {
            sql = string.Format("insert into dbo.Conductor (apellido, nombre, habilitado, patente, NroDocumento) values ('{0}', '{1}', '{2}', '{3}', '{4}')", conduc.apellido, conduc.nombre, 0, conduc.patente, conduc.nroDocumento);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }
        public bool modificarConductor(BE.Conductor conduc)
        {
            sql = string.Format("update dbo.Conductor set apellido = '{0}', nombre = '{1}', patente = '{2}', NroDocumento = '{3}' where id_conductor = {4}", conduc.apellido, conduc.nombre, conduc.patente, conduc.nroDocumento, conduc.idConductor);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }    
        public bool inactivarConductor(BE.Conductor conduc, int activo)
        {
            sql = string.Format("update dbo.Conductor set habilitado = {0} where id_conductor = '{1}'", activo, conduc.idConductor);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public List<BE.Conductor> listarConductor()
        {
            List<BE.Conductor> lConductor = new List<BE.Conductor>();

            sql = "Select * from dbo.Conductor";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Conductor nCon = new BE.Conductor();

                nCon.idConductor = int.Parse(reader[0].ToString());
                nCon.apellido = reader[1].ToString();
                nCon.nombre = reader[2].ToString();
                nCon.activo = Convert.ToBoolean(reader[3]);
                nCon.patente = reader[4].ToString();
                nCon.nroDocumento = reader[5].ToString();
                

                lConductor.Add(nCon);
            }

            nConexion.conexionBD(0);

            return lConductor;
        }

        public int obtenerIdConductor(string doc)
        {
            sql = string.Format("Select id_conductor from dbo.Conductor where NroDocumento = '{0}'", doc);

            nConexion.conexionBD(1, sql);

            int resul = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

            nConexion.conexionBD(0);

            return resul;
        }

    }
}
