using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class CU050___Verificar_pedidos_pendientes : Form
    {
        public CU050___Verificar_pedidos_pendientes()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se asignó conducto al pedido", "INFORMACIÓN");

            this.Close();
        }
    }
}
