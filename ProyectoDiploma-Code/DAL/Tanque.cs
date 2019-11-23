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

        Terminal terminalDAL = new Terminal();

        public bool crearTanque(BE.Tanque tanq, int DVH)
        {
            sql = string.Format("Insert into dbo.Tanque values ('{0}', {1}, 1, {2}, '{3}', {4}, 0, '{5}')", tanq.producto.codPRoducto, DVH, tanq.cantidadMaxima, tanq.codTanque, tanq.terminal.codTerminal, 0, tanq.descripcionTanque );

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool modificaTanque(BE.Tanque tanq)
        {
            sql = string.Format("update dbo.Tanque set cantidadMaxima = {0}, descripcion = '{1}' where id_tanque = {2}", tanq.cantidadMaxima, tanq.descripcionTanque, tanq.idTanque);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool inactivarTanque(BE.Tanque tanq, int activo)
        {
            sql = string.Format("update dbo.Tanque set Activo = {0} where id_tanque = '{1}'", activo, tanq.idTanque );

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public List<BE.Tanque> listarTanques()
        {
            List<BE.Tanque> lTanq = new List<BE.Tanque>();

            sql = "Select * from dbo.Tanque";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Tanque nTan = new BE.Tanque();
                BE.Producto nProd = new BE.Producto();
                BE.Terminal nTer = new BE.Terminal();


                nProd.codPRoducto = reader[0].ToString();
                nTan.producto = nProd;
                nTan.activo = Convert.ToBoolean(reader[2]);
                nTan.cantidadMaxima = int.Parse(reader[3].ToString());
                nTan.codTanque = reader[4].ToString();
                nTer.codTerminal = Convert.ToInt16(reader[5]);
                nTan.terminal = nTer;
                nTan.stock = int.Parse(reader[6].ToString());
                nTan.descripcionTanque = reader[7].ToString();
                nTan.idTanque = Convert.ToInt16(reader[8]);

                lTanq.Add(nTan);
            }

            nConexion.conexionBD(0);

            return lTanq;
        }

        public BE.Tanque consultarTanque(BE.Tanque codTanq)
        {
            BE.Tanque nTan = new BE.Tanque();

            sql = string.Format("Select * from dbo.Tanque where id_tanque = '{0}'", codTanq.idTanque);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
   
                BE.Producto nProd = new BE.Producto();
                BE.Terminal nTer = new BE.Terminal();


                nProd.codPRoducto = reader[0].ToString();
                nTan.producto = nProd;
                nTan.activo = Convert.ToBoolean(reader[2]);
                nTan.cantidadMaxima = int.Parse(reader[3].ToString());
                nTan.codTanque = reader[4].ToString();
                nTer.codTerminal = int.Parse(reader[5].ToString());
                nTan.terminal = nTer;
                nTan.stock = Convert.ToInt16(reader[6]);
                nTan.descripcionTanque = reader[7].ToString();
                nTan.idTanque = Convert.ToInt16(reader[8]);
            }

            nConexion.conexionBD(0);

            return nTan;
        }

        public void cambiarStock(BE.Tanque tanque, int stock)
        {
            sql = string.Format("Update dbo.Tanque set stock = {0} where id_tanque = {1}", stock, tanque.idTanque);

            nConexion.conexionBD(1, sql);

            nConexion.nCom.ExecuteNonQuery();

            nConexion.conexionBD(0);

        }

        public int consultarStock(BE.Tanque tanque)
        {
            sql = string.Format("Select stock from dbo.Tanque where id_tanque = '{0}'", tanque.idTanque);

            nConexion.conexionBD(1, sql);

            int resul = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

            nConexion.conexionBD(0);

            return resul;
        }

    }
}
