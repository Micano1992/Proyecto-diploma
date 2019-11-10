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
    public partial class CU028___Consultar_producto : Form
    {
        List<int> lPAt = new List<int>();
        public string usuarioActivo { get; set; }

        BLL.Producto productoBLL = new BLL.Producto();

        public CU028___Consultar_producto(List<int> patentes, string usuarioAc)
        {
            this.usuarioActivo = usuarioAc;

            lPAt = patentes;

            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU030___Modificar_producto nMod = new CU030___Modificar_producto(dataGridView1.SelectedRows[0].Cells[0].Value.ToString(), usuarioActivo);

            nMod.FormClosing += cierreFormClosing;

            this.Enabled = false;

            nMod.Show(this);
        }

        private void CU028___Consultar_producto_FormClosed(object sender, FormClosedEventArgs e)
        {

            this.Owner.Enabled = true;

        }

        private void Owner_Load(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        private void CU028___Consultar_producto_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;
        }

        private void CU028___Consultar_producto_Load_1(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrilla();

            bloquearPuntos();

            habilitarPuntos(lPAt);

            actualizarGrilla();

            actualizarGruopBox();
        }

        public void habilitarPuntos(List<int> patentes)
        {
            foreach (int i in patentes)
            {
                switch (i)
                {
                    case 19:
                        button1.Enabled = true;
                        break;
                    case 20:
                        button4.Enabled = true;
                        button5.Enabled = true;
                        break;
                }
            }
        }

        public void bloquearPuntos()
        {
            button1.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = false;

        }

        public void actualizarGrilla()
        {
            dataGridView1.Rows.Clear();

            foreach (string[] arreglo in productoBLL.listarProducto())
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

        public void actualizarGruopBox()
        {
            string[] prodElec = new string[8];

            try
            {
                prodElec = productoBLL.consultarProducto(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

            label2.Text = prodElec[3].ToString();
            label5.Text = prodElec[2].ToString();
            label6.Text = prodElec[4].ToString();

            }
            catch
            {

            }



        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            actualizarGruopBox();
        }

        private void cierreFormClosing(object sender, FormClosingEventArgs e)
        {
            actualizarGrilla();

            actualizarGruopBox();

            //throw new NotImplementedException();
        }

    }
}

