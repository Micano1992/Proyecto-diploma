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
    public partial class CU013___Administrar_patente : Form
    {
        public CU013___Administrar_patente()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se realizó la modificación correctamente", "INFORMACIÓN");

            this.Close();
        }
    }
}
