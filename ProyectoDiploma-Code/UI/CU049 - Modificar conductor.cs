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
    public partial class CU049___Modificar_conductor : Form
    {
        public string usuarioActivo { get; set; }

        public int idConductor { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string dni { get; set; }
        public string patente { get; set; }
        BLL.Conductor conductorBLL = new BLL.Conductor();


        public CU049___Modificar_conductor(string usu, int id, string nom, string ape, string dn, string pate)
        {
            usuarioActivo = usu;

            idConductor = id;

            nombre = nom;
            apellido = ape;
            dni = dn;
            patente = pate;

            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Trim(' ') == "" || textBox2.Text.Trim(' ') == "" || textBox3.Text.Trim(' ') == "" || textBox4.Text.Trim(' ') == "")
            {
                MessageBox.Show("Completar todos los campos", "ERROR");
            }

            else
            {
                conductorBLL.modificarConductor(Convert.ToInt16(label6.Text), textBox2.Text, textBox1.Text, textBox4.Text, textBox3.Text, usuarioActivo);
                
                MessageBox.Show("Se actualizó el conductor", "INFORMACIÓN");

                this.Close();

            }

        }

        private void CU049___Modificar_conductor_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            label6.Text = idConductor.ToString();

            textBox1.Text = nombre;
            textBox2.Text = apellido;
            textBox3.Text = dni;
            textBox4.Text = patente;
        }

        private void CU049___Modificar_conductor_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
