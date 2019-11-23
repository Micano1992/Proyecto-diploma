using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Documento
    {
        ConexionesSQL nConexion = new ConexionesSQL();
        Terminal terminalDAL = new Terminal();

        string sql;

        public List<BE.Pedido> listarPedidos(BE.Terminal terminal)
        {
            List<BE.Pedido> lisPedidos = new List<BE.Pedido>();

            sql = "Select * from dbo.Pedido where codTerminal = " + terminalDAL.obtenerIdTerminal(terminal.descripcionTerminal);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Pedido nPed = new BE.Pedido();
                BE.Conductor nCon = new BE.Conductor();
                BE.Terminal nTer = new BE.Terminal();
                BE.Producto nProd = new BE.Producto();

                nPed.nroPedido = int.Parse(reader[0].ToString());
                nPed.anulado = bool.Parse(reader[1].ToString());
                nPed.cantidad = int.Parse(reader[2].ToString());
                nCon.idConductor = int.Parse(reader[3].ToString());
                nPed.conductor = nCon;
                nProd.codPRoducto = reader[4].ToString();
                nPed.producto = nProd;
                nPed.entregado = bool.Parse(reader[5].ToString());
                nPed.domicilio = reader[6].ToString();
                nTer.codTerminal = int.Parse(reader[7].ToString());
                nPed.terminal = nTer;
                nPed.documentoAnulador = int.Parse(reader[8].ToString());

                lisPedidos.Add(nPed);
            }

            nConexion.conexionBD(0);

            return lisPedidos;
        }

        public bool asignarConductor(BE.Pedido pedido)
        {
            sql = string.Format("update dbo.Pedido set idConductor = {0} where nroPedido = {1}", pedido.conductor.idConductor, pedido.nroPedido );

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public int generarDocumento(BE.Documento docu, int dvh)
        {
            int num = calcularNumeracion(docu.tipoDocumento);

            sql = string.Format("insert into dbo.Documento values ({0}, {1}, {2}, {3}, '{4}', {5}, '{6}', 0)", num, docu.nroPedido, docu.cantidad, dvh, docu.producto.codPRoducto, docu.tanque.idTanque, docu.tipoDocumento);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return num;
            }

            nConexion.conexionBD(0);

            return 0;
        }

        public int calcularNumeracion(string tipo)
        {

            sql = string.Format("select max(nroDocumento) from dbo.Documento where tipoDocumento = '{0}'", tipo);

            nConexion.conexionBD(1, sql);

            int numero = Convert.ToInt16(nConexion.nCom.ExecuteScalar());

            nConexion.conexionBD(0);

            numero += 1;

            return numero;

        }

        public BE.Pedido consultaPedido(int pedi)
        {
            BE.Pedido nPed = new BE.Pedido();
            BE.Conductor nCon = new BE.Conductor();
            BE.Terminal nTer = new BE.Terminal();
            BE.Producto nProd = new BE.Producto();

            sql = "Select * from dbo.Pedido where nroPedido = " + pedi.ToString();

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                nPed.nroPedido = int.Parse(reader[0].ToString());
                nPed.anulado = bool.Parse(reader[1].ToString());
                nPed.cantidad = int.Parse(reader[2].ToString());
                nCon.idConductor = int.Parse(reader[3].ToString());
                nPed.conductor = nCon;
                nProd.codPRoducto = reader[4].ToString();
                nPed.producto = nProd;
                nPed.entregado = bool.Parse(reader[5].ToString());
                nPed.domicilio = reader[6].ToString();
                nTer.codTerminal = int.Parse(reader[7].ToString());
                nPed.terminal = nTer;
                nPed.documentoAnulador = int.Parse(reader[8].ToString());

                break;
            }

            nConexion.conexionBD(0);

            return nPed;
        }


        public bool pedidoEntrega(int pedi)
        {

            sql = "Update dbo.Pedido set entregado = 1 where nroPedido = " + pedi.ToString();

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;

        }

        public List<BE.Documento> listarDocumentos()
        {
            List<BE.Documento> lisDocumento = new List<BE.Documento>();

            sql = "Select a.*, b.codTerminal, b.codTanque from dbo.Documento a left join dbo.Tanque b on b.id_tanque = a.tanque"; // where codTerminal = " + terminalDAL.obtenerIdTerminal(terminal.descripcionTerminal);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Documento nDoc = new BE.Documento();
                BE.Pedido pedido = new BE.Pedido();
                BE.Conductor nCon = new BE.Conductor();
                BE.Terminal nTer = new BE.Terminal();
                BE.Producto nProd = new BE.Producto();
                BE.Tanque nTan = new BE.Tanque();

                nDoc.nroDocumento = int.Parse(reader[0].ToString());
                pedido.nroPedido = int.Parse(reader[1].ToString());

                nDoc.cantidad = int.Parse(reader[2].ToString());
                nProd.codPRoducto = reader[4].ToString();
                nDoc.producto = nProd;
                nTan.idTanque = int.Parse(reader[5].ToString());

                nDoc.tipoDocumento = reader[6].ToString();
                nDoc.nroAnulador = int.Parse(reader[7].ToString());
                nTer.codTerminal = int.Parse(reader[8].ToString());
                nTan.codTanque = reader[9].ToString();

                nTan.terminal = nTer;              
                nDoc.tanque = nTan;
                nDoc.nroPedido = pedido;

                lisDocumento.Add(nDoc);
            }

            nConexion.conexionBD(0);

            return lisDocumento;
        }

    }
}
