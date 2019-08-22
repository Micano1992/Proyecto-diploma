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
    public partial class CU030___Modificar_producto : Form
    {
        public CU030___Modificar_producto()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se modificó el producto", "INFORMACIÓN");

            this.Close();
        }

        private void CU030___Modificar_producto_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU030___Modificar_producto_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
