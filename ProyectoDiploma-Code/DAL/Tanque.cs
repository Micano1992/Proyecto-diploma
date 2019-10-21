using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Tanque
    {
        string sql;
        
        ConexionesSQL nConexion = new ConexionesSQL();

        public bool crearTanque(BE.Tanque tanq, int DVH)
        {
            sql = string.Format("Insert into dbo.Tanque values ({0}, {1}, 1, {2}, {3}, {4}, 0, '{5}')", tanq.codProducto, DVH, tanq.cantidadMaxima, tanq.codTanque, tanq.terminal.codTerminal, 0, tanq.descripcionTanque );

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool modificaTanque(BE.Tanque tanq, int DVH)
        {
            sql = string.Format("update dbo.Tanque set cantidadMaxima = '{0}', descripcion = '{1}', DVH = {2} where codTanque = '{3}' and terminal = {4}", tanq.cantidadMaxima, tanq.descripcionTanque, DVH, tanq.codTanque, tanq.terminal.codTerminal);

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
