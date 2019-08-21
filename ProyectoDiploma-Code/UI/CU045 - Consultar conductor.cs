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
    public partial class CU045___Consultar_conductor : Form
    {
        public CU045___Consultar_conductor()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            CU046___Cargar_conductor nCar = new CU046___Cargar_conductor();

            nCar.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU049___Modificar_conductor nMod = new CU049___Modificar_conductor();

            nMod.Show();
        }
    }
}
