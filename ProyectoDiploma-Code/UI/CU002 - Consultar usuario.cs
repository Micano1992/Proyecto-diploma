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

        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU005___Modificar_usuario nMod = new CU005___Modificar_usuario();

            nMod.Show();
        }

        private void CU002___Consultar_usuario_Load(object sender, EventArgs e)
        {

        }
    }
}
