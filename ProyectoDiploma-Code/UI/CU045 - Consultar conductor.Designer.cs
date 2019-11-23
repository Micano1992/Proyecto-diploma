namespace UI
{
    partial class CU045___Consultar_conductor
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.button5 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            this.Id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Apellido = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.NroDocumento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Deshabilitado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Patente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // button5
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button5, "CU045__Consultar_conductor.htm#button5");
            this.HelpProviderHG.SetHelpNavigator(this.button5, System.Windows.Forms.HelpNavigator.Topic);
            this.button5.Location = new System.Drawing.Point(200, 249);
            this.button5.Name = "button5";
            this.HelpProviderHG.SetShowHelp(this.button5, true);
            this.button5.Size = new System.Drawing.Size(173, 23);
            this.button5.TabIndex = 13;
            this.button5.Text = "INACTIVAR CONDUCTOR";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // button4
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button4, "CU045__Consultar_conductor.htm#button4");
            this.HelpProviderHG.SetHelpNavigator(this.button4, System.Windows.Forms.HelpNavigator.Topic);
            this.button4.Location = new System.Drawing.Point(379, 249);
            this.button4.Name = "button4";
            this.HelpProviderHG.SetShowHelp(this.button4, true);
            this.button4.Size = new System.Drawing.Size(173, 23);
            this.button4.TabIndex = 12;
            this.button4.Text = "REACTIVAR CONDUCTOR";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "CU045__Consultar_conductor.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(22, 249);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(173, 23);
            this.button1.TabIndex = 9;
            this.button1.Text = "MODIFICAR";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Id,
            this.Nombre,
            this.Apellido,
            this.NroDocumento,
            this.Deshabilitado,
            this.Patente});
            this.HelpProviderHG.SetHelpKeyword(this.dataGridView1, "CU045__Consultar_conductor.htm#dataGridView1");
            this.HelpProviderHG.SetHelpNavigator(this.dataGridView1, System.Windows.Forms.HelpNavigator.Topic);
            this.dataGridView1.Location = new System.Drawing.Point(38, 12);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.RowHeadersWidth = 62;
            this.HelpProviderHG.SetShowHelp(this.dataGridView1, true);
            this.dataGridView1.Size = new System.Drawing.Size(531, 209);
            this.dataGridView1.TabIndex = 7;
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // Id
            // 
            this.Id.HeaderText = "Id";
            this.Id.Name = "Id";
            this.Id.Width = 30;
            // 
            // Nombre
            // 
            this.Nombre.HeaderText = "Nombre";
            this.Nombre.MinimumWidth = 8;
            this.Nombre.Name = "Nombre";
            // 
            // Apellido
            // 
            this.Apellido.HeaderText = "Apellido";
            this.Apellido.MinimumWidth = 8;
            this.Apellido.Name = "Apellido";
            // 
            // NroDocumento
            // 
            this.NroDocumento.HeaderText = "NroDocumento";
            this.NroDocumento.MinimumWidth = 8;
            this.NroDocumento.Name = "NroDocumento";
            // 
            // Deshabilitado
            // 
            this.Deshabilitado.HeaderText = "Deshabilitado";
            this.Deshabilitado.MinimumWidth = 8;
            this.Deshabilitado.Name = "Deshabilitado";
            this.Deshabilitado.Width = 80;
            // 
            // Patente
            // 
            this.Patente.HeaderText = "Patente";
            this.Patente.MinimumWidth = 8;
            this.Patente.Name = "Patente";
            // 
            // CU045___Consultar_conductor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(622, 300);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dataGridView1);
            this.HelpProviderHG.SetHelpKeyword(this, "CU045__Consultar_conductor.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "CU045___Consultar_conductor";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "CONDUCTORES";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.CU045___Consultar_conductor_FormClosing);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.CU045___Consultar_conductor_FormClosed);
            this.Load += new System.EventHandler(this.CU045___Consultar_conductor_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
        private System.Windows.Forms.DataGridViewTextBoxColumn Id;
        private System.Windows.Forms.DataGridViewTextBoxColumn Nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn Apellido;
        private System.Windows.Forms.DataGridViewTextBoxColumn NroDocumento;
        private System.Windows.Forms.DataGridViewTextBoxColumn Deshabilitado;
        private System.Windows.Forms.DataGridViewTextBoxColumn Patente;
    }
}