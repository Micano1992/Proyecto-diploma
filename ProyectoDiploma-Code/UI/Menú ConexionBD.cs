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
    public partial class ConexionBD : Form
    {
        public ConexionBD()
        {
            InitializeComponent();
        }

        BLL.ConexionesSQL conexionBLL = new BLL.ConexionesSQL();

        private void ConexionBD_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (conexionBLL.ProbarConnectionString(textBox3.Text, textBox4.Text, textBox2.Text, textBox1.Text, false))
                {
                    MessageBox.Show("Prueba satisfactora", "INFORMACIÓN");

                    conexionBLL.actualizarConexion(textBox3.Text, textBox4.Text, textBox2.Text, textBox1.Text, true);

                    this.Close();
                }
                else
                {
                    textBox3.Text = null;
                    textBox4.Text = null;

                    MessageBox.Show("No se ha podido conectarse a la base, por favor ingrese datos nuevamente", "ERROR");

                }
            }
            catch
            {
                textBox3.Text = null;
                textBox4.Text = null;

                MessageBox.Show("No se ha podido conectarse a la base, por favor ingrese datos nuevamente", "ERROR");

            }

           


        }

        private void ConexionBD_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Show();

        }
    }
}
