using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text;

namespace UI
{
    public partial class CU041___Generar_recibo : Form
    {
        public string usuarioActivo { get; set; }

        public List<string[]> listaTanques { get; set; }

        BLL.Tanque tanqueBLL = new BLL.Tanque();
        BLL.Usuario usuarioBLL = new BLL.Usuario();
        BLL.Documento documentoBLL = new BLL.Documento();

        public CU041___Generar_recibo(string usu)
        {
            usuarioActivo = usu;

            InitializeComponent();
        }

        private void CU041___Generar_recibo_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            tanquesDisponibles();

            comboBox1.SelectedIndex = 1;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;

        }

        private void CU041___Generar_recibo_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        public void tanquesDisponibles()
        {
            listaTanques = tanqueBLL.listarTanque(usuarioBLL.consulUsuario(usuarioActivo)[7]);

            foreach (string[] arreglo in listaTanques)
            {
                comboBox1.Items.Add(arreglo[0] + "-" + arreglo[1]);
            }        

            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string num = documentoBLL.generarRecibo(int.Parse(textBox1.Text), usuarioActivo, int.Parse(comboBox1.Text.Split('-')[0]));

            if (num != "")
            {
                MessageBox.Show(num, "INFORMACIÓN");

                textBox1.Text = "";


            }
            else
            {
                MessageBox.Show("CASI");
            }
               
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var listaTan = from tanqueCombo in listaTanques
                           where tanqueCombo[1] == comboBox1.Text.Split('-')[1]
                           select tanqueCombo[3];
            

            foreach (string nTanque1 in listaTan)
            {
                label4.Text = nTanque1;
            }
           
        }

        private void comboBox1_Click(object sender, EventArgs e)
        {
            //var listaTan = from tanqueCombo in listaTanques
            //               where tanqueCombo[1] == comboBox1.Text.Split('-')[1]
            //               select tanqueCombo[3];


            //foreach (string nTanque1 in listaTan)
            //{
            //    label4.Text = nTanque1;
            //}
        }

        private void comboBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            var listaTan = from tanqueCombo in listaTanques
                           where tanqueCombo[1] == comboBox1.Text
                           select tanqueCombo[3];


            foreach (string nTanque1 in listaTan)
            {
                label4.Text = nTanque1;
            }
        }
    }
}
