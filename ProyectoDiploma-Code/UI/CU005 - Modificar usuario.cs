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
        public CU005___Modificar_usuario()
        {
            InitializeComponent();
        }

        private void CU005___Mod_usuario_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU006___Administrar_familia nAdm = new CU006___Administrar_familia();

            this.Enabled = false;

            nAdm.Show(this);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CU005___Modificar_usuario_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
