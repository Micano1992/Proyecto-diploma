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
    public partial class CU038___Modificar_tanque : Form
    {
        public CU038___Modificar_tanque()
        {
            InitializeComponent();
        }

        private void CU038___Modificar_tanque_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Se actualizó el tanque", "INFORMACIÓN");

            this.Close();

        }
    }
}
