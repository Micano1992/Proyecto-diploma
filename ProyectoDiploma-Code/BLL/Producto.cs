using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Producto
    {
        DAL.Producto productoDAL = new DAL.Producto();
        BE.Producto nProd = new BE.Producto();
        BLL.Bitácora bitacoraBLL = new Bitácora();

        public bool crearProducto(string cPRod, string dProd, string mag, string temp, string codUsuario)
        {
            nProd.codPRoducto = cPRod;
            nProd.descripcion = dProd;
            nProd.magnitud = mag;
            nProd.temperatura = temp;

            if(productoDAL.crearProducto(nProd))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Generación producto " + cPRod, "Productos");

                return true;
            }
            return false;

        }

        public bool modificaProducto(string cProd, string dPRod, string mag, string temp, string codUsuario)
        {
            nProd.codPRoducto = cProd;
            nProd.descripcion = dPRod;
            nProd.magnitud = mag;
            nProd.temperatura = temp;

            if (productoDAL.modificaProducto(nProd))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Modificación producto " + cProd, "Productos");

                return true;
            }
            return false;

        }

        public bool inactivarProducto(string prod)
        {
            nProd.codPRoducto = prod;

            return productoDAL.inactivarProducto(nProd, 0);
        }

        public bool activarProducto(string prod)
        {
            nProd.codPRoducto = prod;

            return productoDAL.inactivarProducto(nProd, 1);
        }

        public string[] consultarProducto(string codPro)
        {
            BE.Producto nProdu = new BE.Producto();
            BE.Producto nProdu1 = new BE.Producto();

            nProdu.codPRoducto = codPro;

            string[] nProd = new string[5];

            nProdu1 = productoDAL.consultarProducto(nProdu);
            
            nProd[0] = nProdu1.codPRoducto;
            nProd[1] = nProdu1.descripcion;
            nProd[2] = nProdu1.temperatura;
            nProd[3] = nProdu1.magnitud;
            nProd[4] = nProdu1.activo.ToString();

            return nProd;
        }

        public List<string[]> listarProducto()
        {
            List<string[]> lProd = new List<string[]>();

            string[] nProd = new string[5];

            foreach (BE.Producto prod in productoDAL.listarProductos())
            {
                nProd[0] = prod.codPRoducto;
                nProd[1] = prod.descripcion;
                nProd[2] = prod.temperatura;
                nProd[3] = prod.magnitud;
                nProd[4] = prod.activo.ToString();

                lProd.Add(nProd);
            }


            return lProd;
        }
    }
}
