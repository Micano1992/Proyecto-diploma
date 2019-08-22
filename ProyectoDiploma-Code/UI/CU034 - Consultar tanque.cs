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
    public partial class CU034___Consultar_tanque : Form
    {
        public CU034___Consultar_tanque()
        {
            InitializeComponent();
        }

        private void CU034___Consultar_tanque_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU038___Modificar_tanque nMod = new CU038___Modificar_tanque();

            nMod.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            CU035___Cargar_tanque nCar = new CU035___Cargar_tanque();

            nCar.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CU039___Transferir_stock nTran = new CU039___Transferir_stock();

            nTran.Show();
        }
    }
}
