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
        public string  usuarioActivo { get; set; }
        public string codProducto { get; set; }

        BLL.Producto productoBLL = new BLL.Producto();

        public CU030___Modificar_producto(string codProd, string usuarioAc)
        {
            this.codProducto = codProd;

            this.usuarioActivo = usuarioAc;

            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(productoBLL.modificaProducto(codProducto, textBox1.Text, textBox2.Text, textBox3.Text, usuarioActivo))
            {
                MessageBox.Show("Se modificó el producto", "INFORMACIÓN");
                this.Close();
            }
            else
            {
                MessageBox.Show("No se ha podido modificar el producto", "ERROR");
            }


        }

        private void CU030___Modificar_producto_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            this.label5.Text = codProducto;
        }

        private void CU030___Modificar_producto_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
