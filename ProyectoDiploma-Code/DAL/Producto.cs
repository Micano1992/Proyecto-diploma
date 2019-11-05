using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Producto
    {
        string sql;

        ConexionesSQL nConexion = new ConexionesSQL();
        BE.Producto productoBE = new BE.Producto();

        public bool crearProducto(BE.Producto prod)
        {
            sql = string.Format("Insert into dbo.Producto values ('{0}', '{1}', '{2}', '{3}', 1)", prod.codPRoducto, prod.descripcion, prod.temperatura, prod.magnitud);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool modificaProducto(BE.Producto prod)
        {
            sql = string.Format("update dbo.Producto set Descripcion_producto = '{0}', Temperatura_natural = '{1}', Magnitud_medida = '{2}' where Cod_Producto = '{3}'", prod.descripcion, prod.temperatura, prod.magnitud, prod.codPRoducto);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool inactivarProducto(BE.Producto prod, int activo)
        {
            sql = string.Format("update dbo.Producto set Activo = {0} where Cod_Producto = '{1}'", activo, prod.codPRoducto);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public List<BE.Producto> listarProductos()
        {
            List<BE.Producto> lProd = new List<BE.Producto>();

            sql = "Select * from dbo.Producto";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Producto nProd = new BE.Producto();

                nProd.codPRoducto = reader[0].ToString();
                nProd.descripcion = reader[1].ToString();
                nProd.temperatura = reader[2].ToString();
                nProd.magnitud = reader[3].ToString();
                nProd.activo = Convert.ToBoolean(reader[4]);

                lProd.Add(nProd);
            }

            nConexion.conexionBD(0);

            return lProd;
        }

        public BE.Producto consultarProducto(BE.Producto codProd)
        {
            BE.Producto nProd = new BE.Producto();

            sql = string.Format("Select * from dbo.Producto where Cod_Producto = '{0}'", codProd.codPRoducto);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                nProd.codPRoducto = reader[0].ToString();
                nProd.descripcion = reader[1].ToString();
                nProd.temperatura = reader[2].ToString();
                nProd.magnitud = reader[3].ToString();
                nProd.activo = Convert.ToBoolean(reader[4]);
            }

            nConexion.conexionBD(0);

            return nProd;
        }


    }
}
