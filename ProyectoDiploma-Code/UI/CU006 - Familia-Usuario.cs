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
    public partial class CU006___Administrar_familia : Form
    {
        public CU006___Administrar_familia()
        {
            InitializeComponent();
        }

        private void CU006___Administrar_familia_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CU006___Administrar_familia_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
