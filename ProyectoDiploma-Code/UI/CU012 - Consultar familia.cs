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
        public CU012___Consultar_familia(List<int> listaPatentes, string usuario)
        {
            patentes = listaPatentes;
            usuarioActivo = usuario;

            InitializeComponent();
        }

        BLL.Familia FamiliaBLL = new BLL.Familia();
        BLL.Patente PatenteBLL = new BLL.Patente();
        List<int> patentes = new List<int>();
        public string usuarioActivo { get; set; }


        private void Form_FormClosing(object sender, FormClosingEventArgs e)
        {
            actualizarGrilla();

            //throw new NotImplementedException();
        }


        private void button3_Click(object sender, EventArgs e)
        {
            CU013___Administrar_patente nAdm = new CU013___Administrar_patente(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), usuarioActivo) ;

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

            bloquearPuntos();

            habilitarPuntos(patentes);

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

                DialogResult result = MessageBox.Show("¿Desea eliminar la familia?", "INFORMACIÓN", MessageBoxButtons.YesNo);

            if (result == DialogResult.Yes)
            {

                List<string> pat = new List<string>();

                pat.Clear();

                if (dataGridView1.SelectedCells.Count > 0)
                {
                    foreach (string a in PatenteBLL.verificarPatentesFamilia(dataGridView1.SelectedCells[0].Value.ToString()))
                    {
                        pat.Add(a);
                    }

                    if (pat.Count > 0)
                    {
                        string men = "No es posible eliminar la familia debido a que las siguientes patentes no cuentan con otra asignación:\n";

                        foreach (string a in pat)
                        {
                            men += "\n" + a;
                        }

                        MessageBox.Show(men, "ERROR");
                    }

                    else
                    {

                        FamiliaBLL.eliminarFamilia(celad, usuarioActivo);

                        MessageBox.Show("Se eliminó la familia", "INFORMACIÓN");

                        actualizarGrilla();
                    }
                }

                

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //nCrear.FormClosed += FormClosedEventArgs(Crear_closing);
            //nCrear.ShowDialog();

            CU011___CREAR_FAMILIA form = new CU011___CREAR_FAMILIA(usuarioActivo);

            form.FormClosing += Form_FormClosing;

            this.Enabled = false;

            form.Show(this);

        }

        public void bloquearPuntos()
        {
            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
        }

        public void habilitarPuntos(List<int> patentes)
        {
            foreach(int i in patentes)
            {
                switch(i)
                {
                    case 8:
                        button1.Enabled = true;
                        break;
                    case 7:
                        button2.Enabled = true;
                        break;
                    case 9:
                        button3.Enabled = true;
                        break;
                }
            }

        }
    }
}
