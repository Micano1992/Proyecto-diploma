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
    public partial class CU046___Cargar_conductor : Form
    {
        public string usuarioActivo { get; set; }

        public CU046___Cargar_conductor(string usuarioAc)
        {
            usuarioActivo = usuarioAc;

            InitializeComponent();
        }

        BLL.Conductor conductorBLL = new BLL.Conductor();

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Trim(' ') == "" || textBox2.Text.Trim(' ') == "" || textBox3.Text.Trim(' ') == "" || textBox4.Text.Trim(' ') == "")
            {
                MessageBox.Show("Completar todos los campos", "ERROR");
            }

            else
            {

                if (conductorBLL.crearConductor(textBox2.Text, textBox1.Text, textBox4.Text, textBox3.Text, usuarioActivo))
                {
                    MessageBox.Show("Se creó el conductor", "INFORMACIÓN");

                    this.Owner.Enabled = true;

                    this.Close();
                }

                else
                {
                    MessageBox.Show("No se creó el producto", "ERROR");
                }

            }

        }

        private void CU046___Cargar_conductor_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU046___Cargar_conductor_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
