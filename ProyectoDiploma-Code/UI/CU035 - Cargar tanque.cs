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
    public partial class CU035___Cargar_tanque : Form
    {
        public string usuarioActivo { get; set; }

        BLL.Tanque tanqueBLL = new BLL.Tanque();
        BLL.Producto productoBLL = new BLL.Producto();

        public CU035___Cargar_tanque(string usu)
        {
            usuarioActivo = usu;

            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Trim(' ') == "" || textBox2.Text.Trim(' ') == "" || comboBox1.Text.Trim(' ') == "" || textBox4.Text.Trim(' ') == "")
            {
                MessageBox.Show("Completar todos los campos", "ERROR");
            }

            else
            {
                tanqueBLL.crearTanque(textBox1.Text, textBox2.Text, comboBox1.Text, int.Parse(textBox4.Text), usuarioActivo);

                MessageBox.Show("Se creó el tanque", "INFORMACIÓN");

                this.Owner.Enabled = true;

                this.Close();
            }

        }

        private void CU035___Cargar_tanque_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            foreach(string[] prod in productoBLL.listarProducto())
            {
                comboBox1.Items.Add(prod[0]);
            }



        }

        private void CU035___Cargar_tanque_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
