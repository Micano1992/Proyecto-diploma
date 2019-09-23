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
    public partial class CU002___Consultar_usuario : Form
    {
        BLL.UsuarioBLL usuarioBLL = new BLL.UsuarioBLL();
        BLL.SeguridadBLL seguridadBLL = new BLL.SeguridadBLL();

        public CU002___Consultar_usuario()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CU008___Asignar_patente_a_usuario nAsg = new CU008___Asignar_patente_a_usuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), dataGridView1.SelectedRows[0].Cells[1].Value.ToString(), dataGridView1.SelectedRows[0].Cells[2].Value.ToString());

            this.Close();

            nAsg.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU005___Modificar_usuario nMod = new CU005___Modificar_usuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

            nMod.FormClosing += nMod_FormClosing;

            this.Enabled = false;

            nMod.Show(this);
        }

        private void nMod_FormClosing(object sender, FormClosingEventArgs e)
        {
            actualizarGrilla();

            actualizarGruopBox();

            //throw new NotImplementedException();
        }

        private void CU002___Consultar_usuario_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrilla();

            actualizarGrilla();

            actualizarGruopBox();
        }

        private void CU002___Consultar_usuario_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void Button6_Click(object sender, EventArgs e)
        {
            CU006___Administrar_familia nAdm = new CU006___Administrar_familia(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), dataGridView1.SelectedRows[0].Cells[1].Value.ToString(), dataGridView1.SelectedRows[0].Cells[2].Value.ToString());

            this.Enabled = false;

            nAdm.Show(this);
        }

        public void actualizarGrilla()
        {
            dataGridView1.Rows.Clear();

            foreach(string[] arreglo in usuarioBLL.listarUSu())
            {
                dataGridView1.Rows.Add(arreglo);
            }
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

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            



        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            actualizarGruopBox();
        }

        public void actualizarGruopBox()
        {
            string[] usuSelec = new string[8];

            usuSelec = usuarioBLL.consulUsuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

            label5.Text = usuSelec[6].ToString();
            label6.Text = usuSelec[7].ToString();
            label4.Text = usuSelec[4].ToString();
            label7.Text = usuSelec[3].ToString();
            label8.Text = usuSelec[5].ToString();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            seguridadBLL.bloquear(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), 1);

            actualizarGruopBox();
        }


        private void button4_Click_1(object sender, EventArgs e)
        {
            seguridadBLL.bloquear(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), 0);

            actualizarGruopBox();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            CU009___Negar_patente_usuario nNeg = new CU009___Negar_patente_usuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), dataGridView1.SelectedRows[0].Cells[1].Value.ToString(), dataGridView1.SelectedRows[0].Cells[2].Value.ToString());

            this.Close();

            nNeg.Show();
        }
    }
}

