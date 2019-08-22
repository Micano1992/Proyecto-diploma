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
    public partial class CU012___Consultar_familia : Form
    {
        public CU012___Consultar_familia()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            CU011___CREAR_FAMILIA nCrear = new CU011___CREAR_FAMILIA();

            nCrear.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CU013___Administrar_patente nAdm = new CU013___Administrar_patente();

            nAdm.Show();
        }

        private void CU012___Consultar_familia_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }
    }
}
