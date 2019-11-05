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
        public string usuarioActivo { get; set; }

        public CU027___Alta_de_productos(string usuAc)
        {
            this.usuarioActivo = usuAc;

            InitializeComponent();
        }

        BLL.Producto productoBLL = new BLL.Producto();

        private void button1_Click(object sender, EventArgs e)
        {
            if(productoBLL.crearProducto(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, usuarioActivo))
            {
                MessageBox.Show("Se creó el producto", "INFORMACIÓN");

                this.Owner.Enabled = true;

                this.Close();
            }

            else
            {
                MessageBox.Show("No se creó el producto", "ERROR");
            }



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
