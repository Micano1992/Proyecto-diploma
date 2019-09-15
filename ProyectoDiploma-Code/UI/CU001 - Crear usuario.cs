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
    public partial class CU001_Crear_usuario : Form
    {
        public CU001_Crear_usuario()
        {
            InitializeComponent();
        }

        BLL.TerminalBLL terminalBLL = new BLL.TerminalBLL();
        BLL.UsuarioBLL usuarioBLL = new BLL.UsuarioBLL();
        BLL.Idioma idiomaBLL = new BLL.Idioma();

        private void button1_Click(object sender, EventArgs e)
        {
            string[] nuevoUsu = new string[8];

            nuevoUsu[0] = textBox1.Text;
            nuevoUsu[1] = textBox2.Text;
            nuevoUsu[2] = textBox3.Text;
            nuevoUsu[3] = comboBox1.Text;
            nuevoUsu[4] = textBox5.Text;
            nuevoUsu[5] = comboBox2.Text;
            nuevoUsu[6] = comboBox3.Text;
 
            string men = usuarioBLL.altaUsurio(nuevoUsu);

            MessageBox.Show("Se generó el código " + men, "INFORMACIÓN");

            blanquearText();

            //this.Close();
        }

        private void CU001_Crear_usuario_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            comboBox2.DataSource = terminalBLL.Retrieve();

            comboBox1.DataSource = usuarioBLL.tiposDoc();

            comboBox3.DataSource = idiomaBLL.listadoIdiomas();

        }

        private void CU001_Crear_usuario_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void blanquearText()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            //textBox4.Clear();
            textBox5.Clear();
            
        }
    }
}
