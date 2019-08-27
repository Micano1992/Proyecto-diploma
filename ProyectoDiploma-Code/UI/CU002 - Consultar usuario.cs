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
    public partial class CU002___Consultar_usuario : Form
    {
        public CU002___Consultar_usuario()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CU008___Asignar_patente_a_usuario nAsg = new CU008___Asignar_patente_a_usuario();

            this.Close();

            nAsg.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU005___Modificar_usuario nMod = new CU005___Modificar_usuario();

            this.Enabled = false;

            nMod.Show(this);
        }

        private void CU002___Consultar_usuario_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU002___Consultar_usuario_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void Button6_Click(object sender, EventArgs e)
        {
            CU006___Administrar_familia nAdm = new CU006___Administrar_familia();

            this.Enabled = false;

            nAdm.Show(this);
        }
    }
}
