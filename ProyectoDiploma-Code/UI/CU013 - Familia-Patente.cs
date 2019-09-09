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
    public partial class CU013___Administrar_patente : Form
    {
        public CU013___Administrar_patente()
        {
            InitializeComponent();
        }

        public CU013___Administrar_patente(string familia)
        {
            this.familiaPat = familia;

            InitializeComponent();
        }


        BLL.Patente patBLL = new BLL.Patente();

        public string familiaPat { get; set; }

        private void button3_Click(object sender, EventArgs e)
        {
            //MessageBox.Show("Se realizó la modificación correctamente", "INFORMACIÓN");

            this.Close();
        }

        private void CU013___Administrar_patente_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            label2.Text = this.familiaPat;

            dataGridView1.Columns.Add("PatAsg", "PATENTES ASIGNADAS");
            dataGridView1.Columns["PatAsg"].Width = 190;

            dataGridView2.Columns.Add("PatNoAsg", "PATENTES NO ASIGNADAS");
            dataGridView2.Columns["PatNoAsg"].Width = 190;

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

            actualizarGrillas(familiaPat);
        }

        private void CU013___Administrar_patente_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        public void actualizarGrillas(string fam)
        {
            //dataGridView1.DataSource = patBLL.listarPatentesAsignadas(fam);

            dataGridView1.Rows.Clear();
            dataGridView2.Rows.Clear();

            foreach (string i in patBLL.listarPatentesAsignadas(fam))
            {
                dataGridView1.Rows.Add(i);
            }

            foreach (string i in patBLL.listarPatentesNoAsignadas(fam))
            {
                dataGridView2.Rows.Add(i);
            }

            //patBLL.listarPatentes();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                patBLL.desAsignarPatenteFamilia(familiaPat, dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

            }
            catch (Exception)
            {

                MessageBox.Show("No hay patentes seleccionadas", "ERROR");
            }
           
            actualizarGrillas(familiaPat);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                patBLL.asignarPatenteFamilia(familiaPat, dataGridView2.SelectedRows[0].Cells[0].Value.ToString());

            }
            catch (Exception)
            {

                MessageBox.Show("No hay patentes seleccionadas", "ERROR");
            }

            
            actualizarGrillas(familiaPat);
        }
    }
}
