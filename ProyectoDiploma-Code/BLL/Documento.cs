using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Documento
    {
        DAL.Documento documentoDAL = new DAL.Documento();
        DAL.Conductor conductorDAL = new DAL.Conductor();
        BE.Pedido pedidoBE = new BE.Pedido();
        BE.Conductor conductorBE = new BE.Conductor();
        BLL.Bitácora bitacoraBLL = new Bitácora();
        BLL.DigitoVerificador DV = new DigitoVerificador();
        Tanque tanqueBLL = new Tanque();

        private const string NOMBRE_ENTIDAD_DOCUMENTO = "Documento";

        public List<string[]> listaPedidos(string terminal)
        {
            List<string[]> lisPed = new List<string[]>();

            BE.Terminal nTer = new BE.Terminal();
            nTer.descripcionTerminal = terminal;

            var lisP = from pedi in documentoDAL.listarPedidos(nTer)
                       where pedi.entregado == false & pedi.anulado == false
                       select pedi;

            foreach(BE.Pedido ped in lisP.ToList())
            {
                string[] pedid = new string[9];

                pedid[0] = ped.nroPedido.ToString();
                pedid[1] = ped.anulado.ToString();
                pedid[2] = ped.cantidad.ToString();
                pedid[3] = ped.conductor.idConductor.ToString();
                pedid[4] = ped.producto.codPRoducto.ToString();
                pedid[5] = ped.entregado.ToString();                
                pedid[6] = ped.domicilio.ToString();
                pedid[7] = ped.terminal.codTerminal.ToString();
                pedid[8] = ped.documentoAnulador.ToString();

                lisPed.Add(pedid);

            }
            return lisPed;
        }

        public bool asignarConductor(int nroPed, string docCond, string codUsuario)
        {
            pedidoBE.nroPedido = nroPed;
            conductorBE.idConductor = conductorDAL.obtenerIdConductor(docCond);
            pedidoBE.conductor = conductorBE;

            if (documentoDAL.asignarConductor(pedidoBE))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Asignación conductor DNI: " + docCond +  " Pedido: " + nroPed.ToString(), "Documento");

                return true;
            }

            return false;
        }

        public string generarRecibo(int cantidad, string codUsuario, int idTan)
        {
            BE.Documento nDocumen = new BE.Documento();
            BE.Producto productoBE = new BE.Producto();
            BE.Tanque tanqueBE = new BE.Tanque();
                        

            nDocumen.cantidad = cantidad;
            productoBE.codPRoducto = tanqueBLL.consultarTanque(idTan)[3];
            nDocumen.producto = productoBE;
            tanqueBE.idTanque = idTan;
            nDocumen.tanque = tanqueBE;
            nDocumen.tipoDocumento = "RC";

            int DVH = DV.calcularDVH(nDocumen.tipoDocumento + nDocumen.producto.codPRoducto + nDocumen.cantidad.ToString(), NOMBRE_ENTIDAD_DOCUMENTO);

            if (tanqueBLL.aumentarStock(tanqueBE, cantidad))
            {
                int numGen = documentoDAL.generarDocumento(nDocumen, DVH);

                bitacoraBLL.guardarLog(codUsuario, 3, "Generación recibo " + numGen, "Documento");

                DV.actualizarDVV(NOMBRE_ENTIDAD_DOCUMENTO);

                return "Se generó el recibo " + numGen;
            }
            else
            {
                return "No hay suficiente capacidad en el tanque";
            }

        }

        public string generarRemito(int pedido, string codUsuario, int idTan)
        {
            BE.Documento nDocumen = new BE.Documento();
            BE.Producto productoBE = new BE.Producto();
            BE.Tanque tanqueBE = new BE.Tanque();
            BE.Pedido pedidoBE = new BE.Pedido();

            BE.Pedido nPedido = documentoDAL.consultaPedido(pedido);
            
            nDocumen.cantidad = nPedido.cantidad;
            productoBE.codPRoducto = tanqueBLL.consultarTanque(idTan)[3];
            nDocumen.producto = productoBE;
            tanqueBE.idTanque = idTan;
            nDocumen.tanque = tanqueBE;
            nDocumen.tipoDocumento = "RM";
            pedidoBE.nroPedido = pedido;
            nDocumen.nroPedido = pedidoBE;

            int DVH = DV.calcularDVH(nDocumen.tipoDocumento + nDocumen.producto.codPRoducto + nDocumen.cantidad.ToString(), NOMBRE_ENTIDAD_DOCUMENTO);

            if (tanqueBLL.reducirStock(tanqueBE, nDocumen.cantidad))
            {
                int numGen = documentoDAL.generarDocumento(nDocumen, DVH);

                bitacoraBLL.guardarLog(codUsuario, 3, "Generación remito " + numGen, "Documento");

                DV.actualizarDVV(NOMBRE_ENTIDAD_DOCUMENTO);

                documentoDAL.pedidoEntrega(nDocumen.nroPedido.nroPedido);

                return "Se generó el remito " + numGen;
            }
            else
            {
                return "No hay suficiente stock en el tanque";
            }

        }

        public List<string[]> listaDocumentos()
        {
            List<string[]> lisDoc = new List<string[]>();

            foreach (BE.Documento doc in documentoDAL.listarDocumentos())
            {
                string[] docu = new string[9];

                docu[0] = doc.nroDocumento.ToString();
                docu[1] = doc.nroPedido.nroPedido.ToString();
                docu[2] = doc.cantidad.ToString();
                docu[3] = doc.producto.codPRoducto;
                docu[4] = doc.tanque.idTanque.ToString();
                docu[5] = doc.tipoDocumento;
                docu[6] = doc.nroAnulador.ToString();
                docu[7] = doc.tanque.terminal.codTerminal.ToString();
                docu[8] = doc.tanque.codTanque.ToString();


                lisDoc.Add(docu);

            }
            return lisDoc;
        }
    }
}
