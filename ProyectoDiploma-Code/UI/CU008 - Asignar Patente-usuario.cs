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
    public partial class CU008___Asignar_patente_a_usuario : Form
    {
        public string codUsuario { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }

        BLL.UsuarioBLL usuarioBLL = new BLL.UsuarioBLL();
        BLL.TerminalBLL terminalBLL = new BLL.TerminalBLL();
        BLL.Patente patenteBLL = new BLL.Patente();
        BLL.Familia familiaBLL = new BLL.Familia();

        public CU008___Asignar_patente_a_usuario(String codigoUsuario, string nom, string ape)
        {
            this.codUsuario = codigoUsuario;
            this.nombre = nom;
            this.apellido = ape;

            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CU008___Asignar_patente_a_usuario_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            dataGridView1.Columns.Add("PatAsg", "PATENTE");
            dataGridView1.Columns["PatAsg"].Width = 190;

            dataGridView2.Columns.Add("PatNoAsg", "PATENTE");
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

            label6.Text = codUsuario;
            label7.Text = nombre;
            label8.Text = apellido;

            actualizarGrillas(codUsuario);

        }

        private void CU008___Asignar_patente_a_usuario_FormClosing(object sender, FormClosingEventArgs e)
        {
          
            //patenteBLL.listarPatentesAsignadas
              
          
        }

        public void actualizarGrillas(string usu)
        {
            dataGridView1.Rows.Clear();
            dataGridView2.Rows.Clear();

            foreach(string i in usuarioBLL.patentesOtorgadas(usu))
            {
                dataGridView1.Rows.Add(i);
            }

            foreach (string i in usuarioBLL.patentesNoOtorgadas(usu))
            {
                dataGridView2.Rows.Add(i);
            }


        }

        private void button1_Click(object sender, EventArgs e)
        {
            usuarioBLL.desAsignarPatente(codUsuario, dataGridView2.SelectedCells[0].Value.ToString());

            actualizarGrillas(codUsuario);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            usuarioBLL.asignarPatente(codUsuario, dataGridView2.SelectedCells[0].Value.ToString());

            actualizarGrillas(codUsuario);
        }
    }
}
