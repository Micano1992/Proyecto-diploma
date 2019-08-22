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
    public partial class CU025___Cambiar_idioma : Form
    {
        public CU025___Cambiar_idioma()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se actualizó el idioma", "INFORMACIÓN");

            this.Close();
        }

        private void CU025___Cambiar_idioma_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU025___Cambiar_idioma_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
