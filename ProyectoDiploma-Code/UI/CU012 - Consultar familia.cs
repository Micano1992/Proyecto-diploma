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
    public partial class CU012___Consultar_familia : Form
    {
        public CU012___Consultar_familia()
        {
            InitializeComponent();
        }

        BLL.Familia FamiliaBLL = new BLL.Familia();



        private void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
            actualizarGrilla();

            //throw new NotImplementedException();
        }


        private void button3_Click(object sender, EventArgs e)
        {
            CU013___Administrar_patente nAdm = new CU013___Administrar_patente();

            this.Enabled = false;

            nAdm.Show(this);
        }

        private void CU012___Consultar_familia_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrilla();

            actualizarGrilla();

        }

        private void CU012___Consultar_familia_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        public void setearGrilla()
        {           

            dataGridView1.Columns.Add("FAMILIA", "Familia");
            dataGridView1.Columns[0].Width = 160;

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

            foreach(string desc in FamiliaBLL.listarFamilia())
            {
                dataGridView1.Rows.Add(desc);
            }


        }

        private void button1_Click(object sender, EventArgs e)
        {
            string celad = dataGridView1.SelectedRows[0].Cells[0].Value.ToString();

            if(FamiliaBLL.eliminarFamilia(celad))
            {
                MessageBox.Show("Se eliminó la familia", "INFORMACIÓN");
            }

            else
            {
                MessageBox.Show("No se ha podido eliminar la familia", "ERROR");
            }

            actualizarGrilla();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //nCrear.FormClosed += FormClosedEventArgs(Crear_closing);
            //nCrear.ShowDialog();



            CU011___CREAR_FAMILIA form = new CU011___CREAR_FAMILIA();

            form.FormClosing += Form_FormClosing;

            this.Enabled = false;

            form.Show(this);

        }
    }
}
