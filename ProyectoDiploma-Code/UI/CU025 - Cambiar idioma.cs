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
        public CU025___Cambiar_idioma(string usuAc)
        {
            this.usuarioActivo = usuAc;

            InitializeComponent();
        }

        BLL.Idioma idiomaBLL = new BLL.Idioma();
        BLL.Usuario usuarioBLL = new BLL.Usuario();

        public string usuarioActivo { get; set; }

        public List<string[]> listaIdioma { get; set; }


        private void button1_Click(object sender, EventArgs e)
        {
            if(usuarioBLL.modificarIdioma(comboBox1.SelectedItem.ToString(), usuarioActivo))
            {
                MessageBox.Show("Se actualizó el idioma. Para visualizar el cambio por favor reinicir la aplicación", "INFORMACIÓN");
            }
            
            this.Close();
        }

        private void CU025___Cambiar_idioma_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;


            label3.Text = idiomaBLL.obtenerDescripcion(int.Parse(usuarioBLL.consulUsuario(usuarioActivo)[8]));


            listaIdioma = idiomaBLL.listadoIdiomas();

            foreach (string[] nIdi in listaIdioma)
            {
                comboBox1.Items.Add(nIdi[1]);
            }

            comboBox1.SelectedIndex = 1;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
        }

        private void CU025___Cambiar_idioma_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
