using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;


namespace UI
{

    public partial class Login : Form
    {

        string mensaje;

        BLL.ConexionesSQL conexionBD = new ConexionesSQL();

        public void Login_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;
            
            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

        }

        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //button1.Enabled = false;

            try
            {
                bool conex = conexionBD.ProbarConnectionString();
                if (!conex)
                {
                    errorBD();
                }

                else
                {
                    ingreso();

                }
            }
            catch
            {

                errorBD();
            }            

        }

        public void errorBD()
        {
            MessageBox.Show("No es posible conectarse con la BD", "ERROR");

            this.Hide();

            ConexionBD nCon = new ConexionBD();

            nCon.Show(this);

            this.Hide();


            textBox1.Text = null;
            textBox2.Text = null;
        }

        public void ingreso()
        {
            if (textBox1.Text == string.Empty || textBox2.Text == string.Empty)
            {
                MessageBox.Show("Por favor completar datos de usuario y contraseña", "ERROR");
            }

            else
            {

                BLL.Seguridad nSeg = new Seguridad();
                if (nSeg.login(textBox1.Text, textBox2.Text, ref mensaje))
                {
                    principal nPrincipal = new principal(textBox1.Text);

                    nPrincipal.Show(this);

                    this.Hide();


                    textBox1.Text = null;
                    textBox2.Text = null;

                }

                else
                {
                    MessageBox.Show(mensaje, "ERROR");

                    textBox2.Text = null;
                }


            }
        }

        private void Login_Enter(object sender, EventArgs e)
        {
            ingreso();
        }

        private void textBox2_Leave(object sender, EventArgs e)
        {
            ingreso();
        }

        private void progressBar1_Click(object sender, EventArgs e)
        {
            ProgressBar pBar = new ProgressBar();
        }
    }
}
