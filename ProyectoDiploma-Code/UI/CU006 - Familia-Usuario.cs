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
    public partial class CU006___Administrar_familia : Form
    {
        public CU006___Administrar_familia(string a, string b, string c)
        {
            codUSuario = a;
            nombre = b;
            apellido = c;

            InitializeComponent();
        }

        public string codUSuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }


        private void CU006___Administrar_familia_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            label6.Text = codUSuario;
            label7.Text = nombre;
            label8.Text = apellido;
               
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CU006___Administrar_familia_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
