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
    public partial class CU045___Consultar_conductor : Form
    {
        public string usuarioActivo { get; set; }

        BLL.Conductor conductorBLL = new BLL.Conductor();

        List<int> listaPatentes = new List<int>();

        public CU045___Consultar_conductor(string usu, List<int> listPat)
        {
            usuarioActivo = usu;

            listaPatentes = listPat;

            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //CU046___Cargar_conductor nCar = new CU046___Cargar_conductor();

            //this.Enabled = false;

            //nCar.Show(this);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU049___Modificar_conductor nMod = new CU049___Modificar_conductor(usuarioActivo, int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), dataGridView1.SelectedRows[0].Cells[1].Value.ToString(), dataGridView1.SelectedRows[0].Cells[2].Value.ToString(), dataGridView1.SelectedRows[0].Cells[3].Value.ToString(), dataGridView1.SelectedRows[0].Cells[4].Value.ToString());

            nMod.FormClosing += cierreFormClosing;

            this.Enabled = false;

            nMod.Show(this);
        }

        private void cierreFormClosing(object sender, FormClosingEventArgs e)
        {
            actualizarGrilla();

        }

        private void CU045___Consultar_conductor_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrilla();

            actualizarGrilla();

            bloquearPuntos();

            habilitarPuntos(listaPatentes);

        }

        private void CU045___Consultar_conductor_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }



        public void setearGrilla()
        {

            //dataGridView1.Columns.Add("USUARIO", "usuario");
            //dataGridView1.Columns[0].Width = 160;

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

            foreach (string[] arreglo in conductorBLL.listarConductor())
            {
                dataGridView1.Rows.Add(arreglo);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            conductorBLL.activarConductor(int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), usuarioActivo);

            actualizarGrilla();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            conductorBLL.inactivarConductor(int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), usuarioActivo);

            actualizarGrilla();
        }

        private void CU045___Consultar_conductor_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;

        }

        public void bloquearPuntos()
        {
            button1.Enabled = false;
            button5.Enabled = false;
            button4.Enabled = false;

        }

        public void habilitarPuntos(List<int> patentes)
        {
            foreach (int i in patentes)
            {
                switch (i)
                {
                    case 33:
                        button1.Enabled = true;
                        break;
                    case 34:
                        button4.Enabled = true;
                        button5.Enabled = true;
                        break;

                }
            }
        }
    }
}
