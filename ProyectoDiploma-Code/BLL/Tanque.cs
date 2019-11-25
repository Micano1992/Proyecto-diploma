using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Tanque
    {
        DAL.Tanque tanqueDAL = new DAL.Tanque();
        DAL.Terminal terminalDAL = new DAL.Terminal();
        BE.Tanque nTanq = new BE.Tanque();
        BE.Producto nProd = new BE.Producto();
        BE.Terminal nTerm = new BE.Terminal();
        BLL.Bitácora bitacoraBLL = new Bitácora();
        BLL.DigitoVerificador DV = new DigitoVerificador();
        BLL.Usuario usuarioBLL = new Usuario();

  

        private const string NOMBRE_ENTIDAD_TANQUE = "Tanque";

        public bool crearTanque(string codTan, string descr, string produc, int cantMax, string codUsuario)
        {
            nTanq.codTanque = codTan;
            nTanq.descripcionTanque = descr;
            nProd.codPRoducto = produc;
            nTanq.producto = nProd;
            nTanq.stock = 0;
            nTanq.cantidadMaxima = cantMax;
            nTerm.descripcionTerminal = usuarioBLL.consulUsuario(codUsuario)[7].ToString();
            nTerm.codTerminal = terminalDAL.obtenerIdTerminal(nTerm.descripcionTerminal);
            nTanq.terminal = nTerm;

            int DVH = DV.calcularDVH(codTan + produc + nTanq.stock.ToString() + nTerm.codTerminal, NOMBRE_ENTIDAD_TANQUE);
            

            if (tanqueDAL.crearTanque(nTanq, DVH))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Generación tanque " + codTan + " Terminal: " + nTerm.descripcionTerminal, "Tanques");

                DV.actualizarDVV(NOMBRE_ENTIDAD_TANQUE);

                return true;
            }
            return false;

        }

        public bool modificarTanque(int id, string codTan, string descr, string produc, int cantMax, string codUsuario)
        {
            nTanq.idTanque = id;
            nTanq.codTanque = codTan;
            nTanq.descripcionTanque = descr;
            nProd.codPRoducto = produc;
            nTanq.producto = nProd;
            nTanq.stock = 0;
            nTanq.cantidadMaxima = cantMax;
            nTerm.descripcionTerminal = usuarioBLL.consulUsuario(codUsuario)[7].ToString();
            nTerm.codTerminal = terminalDAL.obtenerIdTerminal(nTerm.descripcionTerminal);
            nTanq.terminal = nTerm;

            //int DVH = DV.calcularDVH(codTan + produc + nTanq.stock.ToString() + nTerm.codTerminal, NOMBRE_ENTIDAD_TANQUE);

            DV.actualizarDVV(NOMBRE_ENTIDAD_TANQUE);

            if (tanqueDAL. modificaTanque(nTanq))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Modificación tanque " + codTan + " Terminal: " + nTerm.codTerminal, "Productos");

                return true;
            }
            return false;

        }

        public bool inactivarProducto(int idTan)
        {
            nTanq.idTanque = idTan;

            return tanqueDAL.inactivarTanque(nTanq, 0);
        }

        public bool activarTanque(int idTan)
        {
            nTanq.idTanque = idTan;

            return tanqueDAL.inactivarTanque(nTanq, 1);
        }

        public string[] consultarTanque(int idTanq)
        {
            nTanq.idTanque = idTanq;

            BE.Tanque nTanque1 = new BE.Tanque();

            string[] nTanque = new string[9];

            nTanque1 = tanqueDAL.consultarTanque(nTanq);

            nTanque[0] = nTanque1.idTanque.ToString();
            nTanque[1] = nTanque1.codTanque.ToString();
            nTanque[2] = nTanque1.descripcionTanque.ToString();
            nTanque[3] = nTanque1.producto.codPRoducto.ToString();
            nTanque[4] = terminalDAL.obtenerDescripcionTerminal(nTanque1.terminal.codTerminal);
            nTanque[5] = nTanque1.stock.ToString();
            nTanque[6] = nTanque1.cantidadMaxima.ToString();
            nTanque[7] = nTanque1.activo.ToString();
            nTanque[8] = nTanque1.terminal.codTerminal.ToString();

            return nTanque;
        }

        public List<string[]> listarTanque()
        {
            List<string[]> lTanq = new List<string[]>();

            foreach (BE.Tanque nTanque1 in tanqueDAL.listarTanques())
            {
                string[] nTanque = new string[8];

                nTanque[0] = nTanque1.idTanque.ToString();
                nTanque[1] = nTanque1.codTanque.ToString();
                nTanque[2] = nTanque1.descripcionTanque.ToString();
                nTanque[3] = nTanque1.producto.codPRoducto.ToString();
                nTanque[4] = terminalDAL.obtenerDescripcionTerminal(nTanque1.terminal.codTerminal);
                nTanque[5] = nTanque1.stock.ToString();
                nTanque[6] = nTanque1.cantidadMaxima.ToString();
                nTanque[7] = nTanque1.activo.ToString();

                lTanq.Add(nTanque);
            }


            return lTanq;
        }

        public List<string[]> listarTanque(string terminal)
        {
            int term = terminalDAL.obtenerIdTerminal(terminal);

            List<string[]> lTanq = new List<string[]>();

            var listaTan = from tanque in tanqueDAL.listarTanques()
                           where tanque.terminal.codTerminal == term & tanque.activo == true
                           select tanque;

            foreach (BE.Tanque nTanque1 in listaTan)
            {
                string[] nTanque = new string[8];

                nTanque[0] = nTanque1.idTanque.ToString();
                nTanque[1] = nTanque1.codTanque.ToString();
                nTanque[2] = nTanque1.descripcionTanque.ToString();
                nTanque[3] = nTanque1.producto.codPRoducto.ToString();
                nTanque[4] = terminalDAL.obtenerDescripcionTerminal(nTanque1.terminal.codTerminal);
                nTanque[5] = nTanque1.stock.ToString();
                nTanque[6] = nTanque1.cantidadMaxima.ToString();
                nTanque[7] = nTanque1.activo.ToString();

                lTanq.Add(nTanque);
            }

           


            return lTanq;
        }

        public bool aumentarStock(BE.Tanque tanque, int stoc)
        {
            int stock = tanqueDAL.consultarStock(tanque) + stoc;

            if (tanqueDAL.consultarTanque(tanque).cantidadMaxima < stock)
            {
                return false;
            }
            else
            {
                int DVH = DV.calcularDVH(tanque.codTanque + tanque.producto.codPRoducto + stock.ToString() + tanque.terminal.codTerminal, NOMBRE_ENTIDAD_TANQUE);

                tanqueDAL.cambiarStock(tanque, stock, DVH);

                DV.actualizarDVV(NOMBRE_ENTIDAD_TANQUE);

                return true;
            }
            
        }

        public bool reducirStock(BE.Tanque tanque, int stoc)
        {
            int stock = tanqueDAL.consultarStock(tanque) - stoc;

            if (0 > stock)
            {
                return false;
            }
            else
            {
                int DVH = DV.calcularDVH(tanque.codTanque + tanque.producto + stock.ToString() + tanque.terminal, NOMBRE_ENTIDAD_TANQUE);

                tanqueDAL.cambiarStock(tanque, stock, DVH);

                DV.actualizarDVV(NOMBRE_ENTIDAD_TANQUE);

                return true;
            }

        }
    }
}
