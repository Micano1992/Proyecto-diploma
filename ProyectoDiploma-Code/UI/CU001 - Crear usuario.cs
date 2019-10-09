﻿using System;
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
    public partial class CU001_Crear_usuario : Form
    {
        public CU001_Crear_usuario()
        {
            InitializeComponent();
        }

        BLL.TerminalBLL terminalBLL = new BLL.TerminalBLL();
        BLL.UsuarioBLL usuarioBLL = new BLL.UsuarioBLL();
        BLL.Idioma idiomaBLL = new BLL.Idioma();
        BLL.Familia familiaBLL = new BLL.Familia();

        private void CU001_Crear_usuario_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            comboBox2.DataSource = terminalBLL.Retrieve();

            comboBox1.DataSource = usuarioBLL.tiposDoc();

            comboBox3.DataSource = idiomaBLL.listadoIdiomas();

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

            actualizarGrillas();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string[] nuevoUsu = new string[8];

            nuevoUsu[0] = textBox1.Text;
            nuevoUsu[1] = textBox2.Text;
            nuevoUsu[2] = textBox3.Text;
            nuevoUsu[3] = comboBox1.Text;
            nuevoUsu[4] = textBox5.Text;
            nuevoUsu[5] = comboBox2.Text;
            nuevoUsu[6] = comboBox3.Text;
 
            string[] men = usuarioBLL.altaUsurio(nuevoUsu);

            foreach(DataGridViewRow i in dataGridView2.Rows)
            {
                familiaBLL.asignarFamiliaUsuario(i.Cells[0].Value.ToString(), men[0].ToString());

            }
                        

            MessageBox.Show(string.Format("Se generó el usuario {0}. La clave es {1}", men[0], men[1]), "INFORMACIÓN");

            blanquearText();

            actualizarGrillas();

            //this.Close();
        }



        private void CU001_Crear_usuario_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        private void blanquearText()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            //textBox4.Clear();
            textBox5.Clear();
            
        }

        public void actualizarGrillas()
        {
            dataGridView1.Rows.Clear();
            dataGridView2.Rows.Clear();

            foreach (string i in familiaBLL.listarFamilia())
            {
                dataGridView1.Rows.Add(i);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedCells.Count > 0)
            {
                dataGridView2.Rows.Add(dataGridView1.SelectedCells[0].Value.ToString());

                dataGridView1.Rows.Remove(dataGridView1.SelectedRows[0]); 
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView2.SelectedCells.Count > 0)
            {
                dataGridView1.Rows.Add(dataGridView2.SelectedCells[0].Value.ToString());

                dataGridView2.Rows.Remove(dataGridView2.SelectedRows[0]);
            }
        }
    }
}
