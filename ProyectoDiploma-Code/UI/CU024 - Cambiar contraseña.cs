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
    public partial class CU024___Cambiar_contraseña : Form
    {
        public CU024___Cambiar_contraseña(string usu)
        {
            codUsuario = usu;

            InitializeComponent();
        }

        BLL.Usuario usuBLL = new BLL.Usuario();
        BLL.Seguridad segBLL = new BLL.Seguridad();
        public string codUsuario { get; set; }

        private void button1_Click(object sender, EventArgs e)
        {
            if(textBox2.Text != textBox3.Text)
            {
                MessageBox.Show("Las contraseñas nuevas no coinciden", "ERROR");
            }

            else
            {
                if (segBLL.validarContraseña(codUsuario, textBox1.Text))
                {
                    segBLL.modificarContraseña(codUsuario, textBox3.Text);

                    MessageBox.Show("Se actualizó la contraseña", "INFORMACIÓN");

                    this.Close();
                }
                else
                {
                    MessageBox.Show("Contraseña inválida", "ERROR");
                }
            }
            
        }

        private void CU024___Cambiar_contraseña_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU024___Cambiar_contraseña_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
