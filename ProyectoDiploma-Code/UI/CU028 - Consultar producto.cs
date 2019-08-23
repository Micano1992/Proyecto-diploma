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
    public partial class CU028___Consultar_producto : Form
    {
        public CU028___Consultar_producto()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU030___Modificar_producto nMod = new CU030___Modificar_producto();

            this.Enabled = false;

            nMod.Show(this);
        }

        private void CU028___Consultar_producto_FormClosed(object sender, FormClosedEventArgs e)
        {

            this.Owner.Enabled = true;
            
        }

        private void Owner_Load(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        private void CU028___Consultar_producto_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU028___Consultar_producto_Load_1(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }
    }
}
