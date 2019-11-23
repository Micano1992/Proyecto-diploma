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
    public partial class CU034___Consultar_tanque : Form
    {
        List<int> lPAt = new List<int>();
        public string usuarioActivo { get; set; }

        BLL.Tanque tanqueBLL = new BLL.Tanque();

        public CU034___Consultar_tanque(string usu, List<int> pat)
        {
            usuarioActivo = usu;
            lPAt = pat;

            InitializeComponent();
        }

        private void CU034___Consultar_tanque_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrilla();

            bloquearPuntos();

            actualizarGrilla();
            
            actualizarGruopBox();

            habilitarPuntos(lPAt);


        }

        private void button1_Click(object sender, EventArgs e)
        {
            CU038___Modificar_tanque nMod = new CU038___Modificar_tanque(usuarioActivo, int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), dataGridView1.SelectedRows[0].Cells[1].Value.ToString(), dataGridView1.SelectedRows[0].Cells[2].Value.ToString(), tanqueBLL.consultarTanque(Convert.ToInt16(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()))[2], int.Parse(tanqueBLL.consultarTanque(Convert.ToInt16(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()))[6]));

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

        private void button2_Click(object sender, EventArgs e)
        {
            CU035___Cargar_tanque nCar = new CU035___Cargar_tanque(usuarioActivo);

            this.Enabled = false;

            nCar.Show(this);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            CU039___Transferir_stock nTran = new CU039___Transferir_stock();

            this.Enabled = false;

            nTran.Show(this);
        }

        private void CU034___Consultar_tanque_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        public void habilitarPuntos(List<int> patentes)
        {
            foreach (int i in patentes)
            {
                switch (i)
                {
                    case 24:
                        //button2.Enabled = true;
                        break;
                    case 25:
                        button1.Enabled = true;
                        break;
                    case 26:
                        button4.Enabled = true;
                        button5.Enabled = true;
                        break;
                    case 27:
                        button3.Enabled = true;
                        break;
                }
            }
        }

        public void bloquearPuntos()
        {
            button1.Enabled = false;
            //button2.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = false;

        }

        public void actualizarGrilla()
        {
            dataGridView1.Rows.Clear();

            foreach (string[] arreglo in tanqueBLL.listarTanque())
            {
                dataGridView1.Rows.Add(arreglo[0], arreglo[1], arreglo[2]);
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
            string[] tanq = new string[8];

            try
            {
                tanq = tanqueBLL.consultarTanque(Convert.ToInt16(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()));

                label6.Text = tanq[3].ToString();
                label7.Text = tanq[6].ToString();
                label8.Text = tanq[7].ToString();
                label9.Text = tanq[4].ToString();
                label10.Text = tanq[5].ToString();

            }
            catch
            {

            }



        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            actualizarGruopBox();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            tanqueBLL.activarTanque(int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()));

            actualizarGruopBox();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            tanqueBLL.inactivarProducto(int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()));

            actualizarGruopBox();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            actualizarGruopBox();
        }
    }
}
