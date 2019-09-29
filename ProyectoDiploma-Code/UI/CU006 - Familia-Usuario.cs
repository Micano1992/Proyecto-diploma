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
    public partial class CU006___Administrar_familia : Form
    {
        public CU006___Administrar_familia(string a, string b, string c)
        {
            codUSuario = a;
            nombre = b;
            apellido = c;

            InitializeComponent();
        }

        public string codUSuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }

        BLL.Familia familiaBLL = new BLL.Familia();
        BLL.Patente patenteBLL = new BLL.Patente();



        private void CU006___Administrar_familia_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            label6.Text = codUSuario;
            label7.Text = nombre;
            label8.Text = apellido;

            dataGridView1.Columns.Add("FamAsg", "FAMILIA");
            dataGridView1.Columns["FamAsg"].Width = 190;

            dataGridView2.Columns.Add("FamNoAsg", "FAMILIA");
            dataGridView2.Columns["FamNoAsg"].Width = 190;

            dataGridView1.RowHeadersVisible = false;
            dataGridView1.AllowUserToAddRows = false;
            dataGridView1.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.AllowUserToResizeColumns = false;
            dataGridView1.AllowUserToResizeRows = false;
            dataGridView1.MultiSelect = false;
            dataGridView1.AllowUserToDeleteRows = false;
            dataGridView1.AutoGenerateColumns = false;

            dataGridView2.RowHeadersVisible = false;
            dataGridView2.AllowUserToAddRows = false;
            dataGridView2.EditMode = DataGridViewEditMode.EditProgrammatically;
            dataGridView2.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView2.AllowUserToResizeColumns = false;
            dataGridView2.AllowUserToResizeRows = false;
            dataGridView2.MultiSelect = false;
            dataGridView2.AllowUserToDeleteRows = false;
            dataGridView2.AutoGenerateColumns = false;

            actualizarGrillas(codUSuario);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CU006___Administrar_familia_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        public void actualizarGrillas(string usu)
        {
            //dataGridView1.DataSource = patBLL.listarPatentesAsignadas(fam);

            dataGridView1.Rows.Clear();
            dataGridView2.Rows.Clear();

            foreach (string i in familiaBLL.listarFamiliasAsignadas(usu))
            {
                dataGridView1.Rows.Add(i);
            }

            foreach (string i in familiaBLL.listarFamiliasNoAsignadas(usu))
            {
                dataGridView2.Rows.Add(i);
            }

            //patBLL.listarPatentes();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(dataGridView2.SelectedCells.Count > 0)
            {
                
                familiaBLL.asignarFamiliaUsuario(dataGridView2.SelectedCells[0].Value.ToString(), codUSuario);

            }

            actualizarGrillas(codUSuario);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            List<string> pat = new List<string>();

            pat.Clear();

            if (dataGridView1.SelectedCells.Count > 0)
            {
                foreach(string a in patenteBLL.verificarPatentesFamilia(dataGridView1.SelectedCells[0].Value.ToString(), codUSuario))
                {
                    pat.Add(a);
                }

                if(pat.Count > 0)
                {
                    string men = "No es posible desasignar la familia al usuario debido a que las siguientes patentes no cuentan con otra asignación:\n";

                    foreach (string a in pat)
                    {
                        men += "\n" + a;
                    }

                    MessageBox.Show(men, "ERROR");
                }

                else
                {
                    familiaBLL.desAsignarFamiliaUsuario(dataGridView1.SelectedCells[0].Value.ToString(), codUSuario);

                    actualizarGrillas(codUSuario);
                }

            }

            
        }
    }
}
