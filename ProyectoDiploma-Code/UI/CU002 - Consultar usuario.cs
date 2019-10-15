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
        BLL.Usuario usuarioBLL = new BLL.Usuario();
        BLL.Seguridad seguridadBLL = new BLL.Seguridad();
        BLL.Patente patenteBLL = new BLL.Patente();
        List<int> listaPatentes = new List<int>();

        List<string> lisUsuarios = new List<string>();

        public CU002___Consultar_usuario(List<int> listaPatentes)
        {
            this.listaPatentes = listaPatentes;

            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CU008___Asignar_patente_a_usuario nAsg = new CU008___Asignar_patente_a_usuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), dataGridView1.SelectedRows[0].Cells[1].Value.ToString(), dataGridView1.SelectedRows[0].Cells[2].Value.ToString());

            nAsg.FormClosing += cierreFormClosing;

            this.Enabled = false;

            nAsg.Show(this);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU005___Modificar_usuario nMod = new CU005___Modificar_usuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

            nMod.FormClosing += cierreFormClosing;

            this.Enabled = false;

            nMod.Show(this);
        }

        private void cierreFormClosing(object sender, FormClosingEventArgs e)
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

            bloquearPuntos();

            habilitarPuntos(listaPatentes);
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

            try
            {
                usuSelec = usuarioBLL.consulUsuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

                label5.Text = usuSelec[6].ToString();
                label6.Text = usuSelec[7].ToString();
                label4.Text = usuSelec[4].ToString();
                label7.Text = usuSelec[3].ToString();
                label8.Text = usuSelec[5].ToString();

            }
            catch (Exception)
            {

            }

           

        }

        private void button5_Click(object sender, EventArgs e)
        {
            lisUsuarios.Clear();

            lisUsuarios = patenteBLL.verificarPatentes(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

            if (lisUsuarios.Count == 0)
            {
                seguridadBLL.bloquear(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), 1);

                actualizarGruopBox();
            }

            else
            {
                string men = "No es posible bloquear el usuario debido a que las siguientes patentes no cuentan con otra asignación:\n";

                foreach (string a in lisUsuarios)
                {
                    men += "\n" + a;
                }

                MessageBox.Show(men, "ERROR");
            }


        }


        private void button4_Click_1(object sender, EventArgs e)
        {
            seguridadBLL.bloquear(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), 0);

            actualizarGruopBox();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            CU009___Negar_patente_usuario nNeg = new CU009___Negar_patente_usuario(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), dataGridView1.SelectedRows[0].Cells[1].Value.ToString(), dataGridView1.SelectedRows[0].Cells[2].Value.ToString());

            nNeg.FormClosing += cierreFormClosing;

            this.Enabled = false;

            nNeg.Show(this);
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            actualizarGruopBox();
        }

        public void habilitarPuntos(List<int> patentes)
        {
            foreach(int i in patentes)
            {
                switch(i)
                {
                    case 3:
                        button1.Enabled = true;
                        break;
                    case 4:
                        button5.Enabled = true;
                        break;
                    case 5:
                        button4.Enabled = true;
                        break;
                    case 37:
                        button2.Enabled = true;
                        break;
                    case 10:
                        button3.Enabled = true;
                        break;
                    case 11:
                        button7.Enabled = true;
                        break;
                    case 38:
                        button6.Enabled = true;
                        break;

                }
            }

        }

        public void bloquearPuntos()
        {
            button1.Enabled = false;
            button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = false;
            button6.Enabled = false;
            button7.Enabled = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show(string.Format("Se generó la contraseña {0} para el usuario {1}", seguridadBLL.blanquearContraseña(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), "INFORMACIÓN");
        }
    }
}

