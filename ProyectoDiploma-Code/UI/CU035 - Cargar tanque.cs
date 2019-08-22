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
    public partial class CU035___Cargar_tanque : Form
    {
        public CU035___Cargar_tanque()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se creó el tanque", "INFORMACIÓN");

            this.Close();
        }

        private void CU035___Cargar_tanque_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU035___Cargar_tanque_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
