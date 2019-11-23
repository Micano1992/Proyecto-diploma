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
    public partial class CU050___Verificar_pedidos_pendientes : Form
    {
        public string usuarioActivo { get; set; }
        public List<int> listaPaten { get; set; }

        BLL.Documento documentoBLL = new BLL.Documento();
        BLL.Usuario usuarioBLL = new BLL.Usuario();
        BLL.Conductor conductorBLL = new BLL.Conductor();

        public CU050___Verificar_pedidos_pendientes(string usu, List<int> lisPat)
        {
            listaPaten = lisPat;

            usuarioActivo = usu;

            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (documentoBLL.asignarConductor(int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString()), dataGridView2.SelectedRows[0].Cells[1].Value.ToString(), usuarioActivo))
                {
                    MessageBox.Show("Se asignó conducto al pedido", "INFORMACIÓN");

                    actualizarGrilla();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("No se pudo asignar el conductor", "ERROR");
            }

        }

        private void CU050___Verificar_pedidos_pendientes_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            setearGrilla();

            actualizarGrilla();

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

        }

        private void CU050___Verificar_pedidos_pendientes_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        public void setearGrilla()
        {
            //dataGridView1.Columns.Add("USUARIO", "usuario");
            //dataGridView1.Columns[0].Width = 160;


            var pat = from paten in listaPaten
                      where paten == 36
                      select paten;

            try
            {
                if (pat.First() == 36)
                {
                    button1.Enabled = true;
                }

            }
            catch (Exception)
            {
                
            }


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

        }

        public void actualizarGrilla()
        {
            dataGridView1.Rows.Clear();

            foreach (string[] arreglo in documentoBLL.listaPedidos(usuarioBLL.consulUsuario(usuarioActivo)[7]))
            {
                dataGridView1.Rows.Add(arreglo[0], arreglo[4], arreglo[2], arreglo[3]);
            }

            dataGridView2.Rows.Clear();


            foreach (string[] arreglo in conductorBLL.listarConductor())
            {
                dataGridView2.Rows.Add(arreglo[0], arreglo[3], arreglo[1], arreglo[2], arreglo[5]);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {

                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xls)|*.xls";
                fichero.FileName = "ArchivoExportado";
                if (fichero.ShowDialog() == DialogResult.OK)
                {
                    Microsoft.Office.Interop.Excel.Application aplicacion;
                    Microsoft.Office.Interop.Excel.Workbook libros_trabajo;
                    Microsoft.Office.Interop.Excel.Worksheet hoja_trabajo;

                    aplicacion = new Microsoft.Office.Interop.Excel.Application();
                    libros_trabajo = aplicacion.Workbooks.Add();
                    hoja_trabajo =
                        (Microsoft.Office.Interop.Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);

                    for (int i = 0; i < dataGridView1.Columns.Count; i++)
                    {
                        string nom = dataGridView1.Columns[i].Name;

                        hoja_trabajo.Cells[1, i + 1] = nom;
                    }
                    //Recorremos el DataGridView rellenando la hoja de trabajo
                    for (int i = 0; i < dataGridView1.Rows.Count; i++)
                    {
                        for (int j = 0; j < dataGridView1.Columns.Count; j++)
                        {
                            if ((dataGridView1.Rows[i].Cells[j].Value == null) == false)
                            {
                                hoja_trabajo.Cells[i + 2, j + 1] = dataGridView1.Rows[i].Cells[j].Value.ToString();
                            }
                        }
                    }
                    libros_trabajo.SaveAs(fichero.FileName,
                        Microsoft.Office.Interop.Excel.XlFileFormat.xlWorkbookNormal);
                    libros_trabajo.Close(true);
                    aplicacion.Quit();

                    MessageBox.Show("Se descargó el archivo correctamente", "INFORMACIÓN");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
            }
        }
    }
}
