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
    public partial class CU018___Consultar_bitacora : Form
    {
        public CU018___Consultar_bitacora()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void CU018___Consultar_bitacora_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU018___Consultar_bitacora_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
