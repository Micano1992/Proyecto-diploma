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

        public string usuarioActivo { get; set; }

        BLL.Usuario usuarioBLL = new BLL.Usuario();
        BLL.Terminal terminalBLL = new BLL.Terminal();
        BLL.Patente patenteBLL = new BLL.Patente();
        BLL.Familia familiaBLL = new BLL.Familia();

        List<string> lisUsuarios = new List<string>();

        public CU008___Asignar_patente_a_usuario(String codigoUsuario, string nom, string ape, string usuarioAc)
        {
            this.codUsuario = codigoUsuario;
            this.nombre = nom;
            this.apellido = ape;
            this.usuarioActivo = usuarioAc;

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
            this.Owner.Enabled = true;
            
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
            if (dataGridView1.SelectedRows.Count > 0)
            {
                lisUsuarios.Clear();

                lisUsuarios = patenteBLL.verificarPatentes(dataGridView1.SelectedCells[0].Value.ToString(), codUsuario);


                if (lisUsuarios.Count == 0 & !patenteBLL.verificarPatentesUsuario(dataGridView1.SelectedCells[0].Value.ToString(), codUsuario))
                {
                    MessageBox.Show("No es posible quitar la patente porque solo está asignada a este usuario", "ERROR");
      
                }
                else
                {
                    usuarioBLL.desAsignarPatente(codUsuario, dataGridView1.SelectedCells[0].Value.ToString(), usuarioActivo);

                    actualizarGrillas(codUsuario);

                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                usuarioBLL.asignarPatente(codUsuario, dataGridView2.SelectedCells[0].Value.ToString(), usuarioActivo);

                actualizarGrillas(codUsuario);
            }
            catch (Exception)
            {

                MessageBox.Show("No hay registros seleccionados", "ERROR");
            }


        }
    }
}
