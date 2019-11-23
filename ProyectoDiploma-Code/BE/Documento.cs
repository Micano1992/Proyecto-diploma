using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Documento
    {
        public int nroDocumento { get; set; }

        public string tipoDocumento { get; set; }

        public Pedido nroPedido { get; set; }
        public int nroAnulador { get; set; }
        public Tanque tanque { get; set; }
        public Producto producto { get; set; }
        public int cantidad { get; set; }
        
    }
}
