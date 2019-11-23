using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Pedido
    {
        public int nroPedido { get; set; }
        public bool anulado { get; set; }
        public int cantidad { get; set; }
        public Conductor conductor { get; set; }
        public Producto producto { get; set; }
        public bool entregado { get; set; }
        public string domicilio { get; set; }
        public Terminal terminal { get; set; }
        public int documentoAnulador { get; set; }
    }
}
