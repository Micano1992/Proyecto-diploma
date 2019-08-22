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
    public partial class CU027___Alta_de_productos : Form
    {
        public CU027___Alta_de_productos()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se creó el producto", "INFORMACIÓN");

            this.Close();

            this.Owner.Activate();
        }

        private void CU027___Alta_de_productos_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU027___Alta_de_productos_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
