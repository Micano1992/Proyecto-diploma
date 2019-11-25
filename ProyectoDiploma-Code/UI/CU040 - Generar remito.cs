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
    public partial class CU040___Generar_remito : Form
    {
        public string usuarioActivo { get; set; }
        public List<string[]> listaTanques { get; set; }

        BLL.Documento documentoBLL = new BLL.Documento();
        BLL.Usuario usuarioBLL = new BLL.Usuario();
        BLL.Tanque tanqueBLL = new BLL.Tanque();

        public CU040___Generar_remito(string usu)
        {
            usuarioActivo = usu;

            InitializeComponent();
        }

        private void CU040___Generar_remito_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrill();

            actualizarGrilla();

            tanquesDisponibles();

            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;

            try
            {
                comboBox1.SelectedIndex = 1;

            }
            catch (Exception)
            {
                
            }
            
        }

        private void CU040___Generar_remito_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //string n = comboBox1.Text.Split(':')[1];
            //string m = " " + dataGridView1.SelectedRows[0].Cells[1].Value.ToString();

            if (comboBox1.Text != "")
            {

                if (comboBox1.Text.Split(':')[1].Trim(' ') != dataGridView1.SelectedRows[0].Cells[1].Value.ToString())
                {
                    MessageBox.Show("El producto del pedido no coincide con el del tanque", "ERROR");
                }
                else
                {
                    string num = documentoBLL.generarRemito(int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), usuarioActivo, int.Parse(comboBox1.Text.Split('-')[0]));

                    if (num != "")
                    {
                        MessageBox.Show(num, "INFORMACIÓN");

                        actualizarGrilla();
                    }
                    else
                    {
                        MessageBox.Show("CASI");
                    }

                }

            }
            else
            {
                MessageBox.Show("Seleccione o cargue un tanque para realizar el despacho", "ERROR");
            }
        }

        public void setearGrill()
        {
            dataGridView1.RowHeadersVisible = false;
            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.AllowUserToResizeColumns = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.MultiSelect = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AutoGenerateColumns = false;

        }

        public void actualizarGrilla()
        {
            dataGridView1.Rows.Clear();

            foreach (string[] arreglo in documentoBLL.listaPedidos(usuarioBLL.consulUsuario(usuarioActivo)[7]))
            {
                if(arreglo[3] !=  "0")
                {
                    dataGridView1.Rows.Add(arreglo[0], arreglo[4], arreglo[2], arreglo[3]);
                }
            }
        }

        public void tanquesDisponibles()
        {
            listaTanques = tanqueBLL.listarTanque(usuarioBLL.consulUsuario(usuarioActivo)[7]);

            foreach (string[] arreglo in listaTanques)
            {
                comboBox1.Items.Add(arreglo[0] + "-" + arreglo[1] + "- Producto: " + arreglo[3]);
            }


        }
    }
}
