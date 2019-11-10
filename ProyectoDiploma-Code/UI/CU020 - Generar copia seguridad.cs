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
        public CU020___Generar_copia_seguridad(string usuarioAc)
        {
            usuarioActivo = usuarioAc;

            InitializeComponent();
        }

        public string usuarioActivo { get; set; }
        BLL.Seguridad seguridadBLL = new BLL.Seguridad();

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

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (textBox1.Text.Trim(' ') == "" & comboBox1.Text.Trim(' ') == "")
                {
                    MessageBox.Show("Completar todos los campos", "ERROR");
                }
                else
                {
                    seguridadBLL.backup(Convert.ToInt16(comboBox1.Text), textBox1.Text, usuarioActivo);

                    MessageBox.Show("Se realizó la copia de seguridad", "INFORMACIÓN");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ERROR");

                MessageBox.Show("No se ha podido realizar la copia de seguridad", "ERROR");

            }



        }

        private void button1_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog explorerDialog = new System.Windows.Forms.FolderBrowserDialog();
            if (explorerDialog.ShowDialog() == DialogResult.OK)
            {
                textBox1.Text = explorerDialog.SelectedPath;
                Environment.SpecialFolder root = explorerDialog.RootFolder;
            }
        }
    }
}
