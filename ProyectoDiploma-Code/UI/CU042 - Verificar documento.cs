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
    public partial class CU042___Verificar_documento : Form
    {

        public string usuarioActivo { get; set; }

        BLL.Documento documentoBLL = new BLL.Documento();

        public List<string[]> lisDoc { get; set; }

        public CU042___Verificar_documento(string usu)
        {
            usuarioActivo = usu;

            InitializeComponent();
        }

        private void CU042___Verificar_documento_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrilla();

            actualizarGrilla();

            groupBox2.Visible = false;
            
            lisDoc = documentoBLL.listaDocumentos();

            actualizarGruopBox();
        }

        private void CU042___Verificar_documento_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Owner.Enabled = true;
        }

        public void setearGrilla()
        {
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

            foreach (string[] arreglo in documentoBLL.listaDocumentos())
            {
                dataGridView1.Rows.Add(arreglo[5], arreglo[0], arreglo[7]);
            }
        }

        public void actualizarGruopBox()
        {
            try
            {
                var docu = from documento in lisDoc
                           where documento[5] == dataGridView1.SelectedRows[0].Cells[0].Value.ToString() &
                                 documento[0] == dataGridView1.SelectedRows[0].Cells[1].Value.ToString()
                           select documento;

                label5.Text = docu.First()[3];
                label6.Text = docu.First()[2];
                label7.Text = docu.First()[8];
            }
            catch (Exception)
            {
                
            }




        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            actualizarGruopBox();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            actualizarGruopBox();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            actualizarGruopBox();
        }

        private void dataGridView1_SelectionChanged_1(object sender, EventArgs e)
        {
            actualizarGruopBox();
        }

        private void button2_Click(object sender, EventArgs e)
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

                    hoja_trabajo.Cells[1, 1] = "Número documento";
                    hoja_trabajo.Cells[1, 2] = "Número pedido";
                    hoja_trabajo.Cells[1, 3] = "Cantidad";
                    hoja_trabajo.Cells[1, 4] = "Producto";
                    hoja_trabajo.Cells[1, 5] = "Id Tanque";
                    hoja_trabajo.Cells[1, 6] = "Tipo documento";
                    hoja_trabajo.Cells[1, 7] = "Número anulador";
                    hoja_trabajo.Cells[1, 8] = "Terminal";
                    hoja_trabajo.Cells[1, 9] = "Código tanque";

                    for (int i = 0; i < lisDoc.Count; i++)
                    {
                        for (int j = 0; j < 9; j++)
                        {
                            if ((lisDoc[i][j] == null) == false)
                            {
                                hoja_trabajo.Cells[i + 2, j + 1] = lisDoc[i][j].ToString();
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
