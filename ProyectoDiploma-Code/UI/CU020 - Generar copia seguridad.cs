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
    public partial class CU020___Generar_copia_seguridad : Form
    {
        public CU020___Generar_copia_seguridad()
        {
            InitializeComponent();
        }

        private void CU020___Generar_copia_seguridad_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU020___Generar_copia_seguridad_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
