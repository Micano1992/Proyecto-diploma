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
    public partial class CU031___Verificar_productos_que_operan_en_terminal : Form
    {
        public CU031___Verificar_productos_que_operan_en_terminal()
        {
            InitializeComponent();
        }

        private void CU031___Verificar_productos_que_operan_en_terminal_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU031___Verificar_productos_que_operan_en_terminal_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
