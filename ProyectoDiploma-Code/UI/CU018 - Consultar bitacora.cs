using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Office;

namespace UI
{
    public partial class CU018___Consultar_bitacora : Form
    {
        public CU018___Consultar_bitacora()
        {
            InitializeComponent();
        }

        BLL.Bitácora bitacoraBLL = new BLL.Bitácora();

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void CU018___Consultar_bitacora_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            setearGrilla();

            actualizarGrilla(bitacoraBLL.listarBitacora());

            dateTimePicker1.Enabled = false;
            dateTimePicker2.Enabled = false;
            comboBox1.Enabled = false;
            textBox1.Enabled = false;
            
        }

        private void CU018___Consultar_bitacora_FormClosing(object sender, FormClosingEventArgs e)
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

        public void actualizarGrilla(List<String[]> lista)
        {
            dataGridView1.Rows.Clear();

            foreach (string[] arreglo in lista)
            {
                dataGridView1.Rows.Add(arreglo);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(this.checkBox1.Checked)
            {
                dateTimePicker1.Enabled = true;
            }
            else
            {
                dateTimePicker1.Enabled = false;
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (this.checkBox2.Checked)
            {
                dateTimePicker2.Enabled = true;
            }
            else
            {
                dateTimePicker2.Enabled = false;
            }
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (this.checkBox3.Checked)
            {
                comboBox1.Enabled = true;
                comboBox1.SelectedIndex = 1;
                comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
               
            }
            else
            {
                comboBox1.Enabled = false;
            }
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (this.checkBox4.Checked)
            {
                textBox1.Enabled = true;
            }
            else
            {
                textBox1.Enabled = false;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string var1 = "", var2 = "";
            DateTime f1 = DateTime.MinValue;
            DateTime f2 = DateTime.MaxValue;

            int a = 0;

            if (checkBox1.Checked)
            {
                a = 1;

                TimeSpan ts = new TimeSpan(00, 00, 0);

                f1 = dateTimePicker1.Value;

                f1 = f1.Date + ts;
                  
            }

            if (checkBox2.Checked)
            {
                a = 1;

                TimeSpan ts = new TimeSpan(24, 00, 0);

                f2 = dateTimePicker2.Value;

                f2 = f2.Date + ts;

            }

            if (checkBox3.Checked)
            {
                a = 1;

                var1 = comboBox1.Text;
            }

            if(checkBox4.Checked)
            {
                a = 1;

                var2 = textBox1.Text;
            }

            if(a == 0)
            {
                actualizarGrilla(bitacoraBLL.listarBitacora());
            }
            else
            {
                actualizarGrilla(bitacoraBLL.listarBitacora(var1, var2, f1, f2));
            }

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

                for (int i = 0; i < dataGridView1.Columns.Count; i++)
                {
                    string nom = dataGridView1.Columns[i].Name;

                    hoja_trabajo.Cells[1, i +1] = nom;
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
