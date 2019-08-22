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
    public partial class CU011___CREAR_FAMILIA : Form
    {
        public CU011___CREAR_FAMILIA()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se creó la familia correctamente", "INFORMACIÓN");

            this.Close();
        }

        private void CU011___CREAR_FAMILIA_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU011___CREAR_FAMILIA_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
