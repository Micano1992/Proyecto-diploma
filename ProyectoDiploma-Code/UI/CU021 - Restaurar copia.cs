using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Globalization;
using System.IO;

namespace UI
{
    public partial class CU021___Restaurar_copia : Form
    {
        public CU021___Restaurar_copia(string usuarioAc)
        {
            usuarioActivo = usuarioAc;

            InitializeComponent();
        }

        public string usuarioActivo { get; set; }
        BLL.Seguridad seguridadBLL = new BLL.Seguridad();

        private void CU021___Restaurar_copia_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU021___Restaurar_copia_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog explorerDialog = new System.Windows.Forms.FolderBrowserDialog();
            explorerDialog.ShowNewFolderButton = false;
            if (explorerDialog.ShowDialog() == DialogResult.OK)
            {
                comboBox1.Items.Clear();
                int contVol = 0;
                textBox1.Text = explorerDialog.SelectedPath;
                foreach (String str in Directory.GetFiles(explorerDialog.SelectedPath))
                {
                    if (str.ToLower().EndsWith(".bak"))
                    {
                        string nombreVol = Path.GetFileNameWithoutExtension(str);
                        nombreVol = nombreVol.Substring(0, nombreVol.Length - 1);
                        contVol += 1;
                    }
                }
                comboBox1.Items.Add(contVol.ToString());
                comboBox1.SelectedIndex = 0;
                button1.Enabled = contVol == 0 ? false : true;
                Environment.SpecialFolder root = explorerDialog.RootFolder;

            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                seguridadBLL.restore(Convert.ToInt16(comboBox1.Text), textBox1.Text, usuarioActivo);

                MessageBox.Show("Se realizó la copia de seguridad", "INFORMACIÓN");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ERROR");

                MessageBox.Show("No se ha podido restaurar la copia de seguridad", "ERROR");

            }


        }
    }
}
