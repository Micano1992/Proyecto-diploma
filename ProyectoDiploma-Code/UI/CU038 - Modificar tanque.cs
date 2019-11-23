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
    public partial class CU038___Modificar_tanque : Form
    {
        public string usuarioActivo { get; set; }
        public string codigo { get; set; }
        public string producto { get; set; }
        public int idTanq { get; set; }

        public string descripcion { get; set; }
        public int cantidadMax { get; set; }

        BLL.Tanque tanqueBLL = new BLL.Tanque();

        public CU038___Modificar_tanque(string usu, int id, string cod, string produ, string desc, int can)
        {
            usuarioActivo = usu;
            codigo = cod;
            producto = produ;
            idTanq = id;
            descripcion = desc;
            cantidadMax = can;

            InitializeComponent();
        }

        private void CU038___Modificar_tanque_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            label2.Text = codigo;

            label4.Text = producto;

            textBox1.Text = descripcion;
            textBox2.Text = cantidadMax.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {

            if (textBox1.Text.Trim(' ') == "" || textBox2.Text.Trim(' ') == "" )
            {
                MessageBox.Show("Completar todos los campos", "ERROR");
            }

            else
            {
                tanqueBLL.modificarTanque(idTanq, codigo, textBox1.Text, producto, int.Parse(textBox2.Text), usuarioActivo);

                MessageBox.Show("Se actualizó el tanque", "INFORMACIÓN");

                this.Close();

            }

            //this.Owner.Enabled = true;




        }

        private void CU038___Modificar_tanque_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void CU038___Modificar_tanque_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }
    }
}
