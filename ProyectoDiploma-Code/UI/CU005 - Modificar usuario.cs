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
    public partial class CU005___Modificar_usuario : Form
    {
        public string codUsuario { get; set; }

        BLL.UsuarioBLL usuarioBLL = new BLL.UsuarioBLL();
        BLL.TerminalBLL terminalBLL = new BLL.TerminalBLL();

        public CU005___Modificar_usuario(string codigoUsuario)
        {
            this.codUsuario = codigoUsuario;

            InitializeComponent();
        }

        private void CU005___Mod_usuario_Load(object sender, EventArgs e)
        {
            label8.Text = codUsuario;
            
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            comboBox2.DataSource = terminalBLL.Retrieve();

            comboBox1.DataSource = usuarioBLL.tiposDoc();

            datosUsuario();
            
        }



        private void button2_Click(object sender, EventArgs e)
        {
            string[] nUsuario = new string[7];

            nUsuario[0] = codUsuario;
            nUsuario[1] = textBox1.Text;
            nUsuario[2] = textBox2.Text;
            nUsuario[4] = comboBox1.Text;
            nUsuario[3] = textBox4.Text;
            nUsuario[5] = textBox5.Text;
            nUsuario[6] = comboBox2.Text;

            if (usuarioBLL.modificarUsario(nUsuario))
            {
                MessageBox.Show("Se realizó la modificación", "INFORMACIÓN");

                this.Close();

            }
            
            else
            {
                MessageBox.Show("Error en los datos ingresados", "ERROR");
            }


            //this.Close();
        }

        private void CU005___Modificar_usuario_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void datosUsuario()
        {
            string[] usuario = new string[8];

            usuario = usuarioBLL.consulUsuario(codUsuario);

            textBox1.Text = usuario[1].ToString();
            textBox2.Text = usuario[2].ToString();
            comboBox1.Text = usuario[4].ToString();
            textBox4.Text = usuario[3].ToString();
            textBox5.Text = usuario[6].ToString();
            comboBox2.Text = usuario[7].ToString();

        }
    }
}
