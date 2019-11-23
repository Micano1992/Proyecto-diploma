namespace UI
{
    partial class CU040___Generar_remito
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.PEDIDO = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PRODUCTO = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CANTIDAD = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CONDUCTOR = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label1 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.PEDIDO,
            this.PRODUCTO,
            this.CANTIDAD,
            this.CONDUCTOR});
            this.HelpProviderHG.SetHelpKeyword(this.dataGridView1, "CU040__Generar_remito.htm#dataGridView1");
            this.HelpProviderHG.SetHelpNavigator(this.dataGridView1, System.Windows.Forms.HelpNavigator.Topic);
            this.dataGridView1.Location = new System.Drawing.Point(34, 12);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.RowHeadersWidth = 62;
            this.HelpProviderHG.SetShowHelp(this.dataGridView1, true);
            this.dataGridView1.Size = new System.Drawing.Size(426, 150);
            this.dataGridView1.TabIndex = 0;
            // 
            // PEDIDO
            // 
            this.PEDIDO.HeaderText = "PEDIDO";
            this.PEDIDO.MinimumWidth = 8;
            this.PEDIDO.Name = "PEDIDO";
            // 
            // PRODUCTO
            // 
            this.PRODUCTO.HeaderText = "PRODUCTO";
            this.PRODUCTO.MinimumWidth = 8;
            this.PRODUCTO.Name = "PRODUCTO";
            // 
            // CANTIDAD
            // 
            this.CANTIDAD.HeaderText = "CANTIDAD";
            this.CANTIDAD.MinimumWidth = 8;
            this.CANTIDAD.Name = "CANTIDAD";
            // 
            // CONDUCTOR
            // 
            this.CONDUCTOR.HeaderText = "CONDUCTOR";
            this.CONDUCTOR.MinimumWidth = 8;
            this.CONDUCTOR.Name = "CONDUCTOR";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(101, 198);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "TANQUE";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.HelpProviderHG.SetHelpKeyword(this.comboBox1, "CU040__Generar_remito.htm#label1");
            this.HelpProviderHG.SetHelpNavigator(this.comboBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.comboBox1.Location = new System.Drawing.Point(194, 195);
            this.comboBox1.Name = "comboBox1";
            this.HelpProviderHG.SetShowHelp(this.comboBox1, true);
            this.comboBox1.Size = new System.Drawing.Size(188, 21);
            this.comboBox1.TabIndex = 2;
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "CU040__Generar_remito.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(148, 256);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(188, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "GENERAR DESPACHO";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // CU040___Generar_remito
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(502, 322);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.HelpProviderHG.SetHelpKeyword(this, "CU040__Generar_remito.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "CU040___Generar_remito";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "GENERAR REMITO";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.CU040___Generar_remito_FormClosed);
            this.Load += new System.EventHandler(this.CU040___Generar_remito_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
        private System.Windows.Forms.DataGridViewTextBoxColumn PEDIDO;
        private System.Windows.Forms.DataGridViewTextBoxColumn PRODUCTO;
        private System.Windows.Forms.DataGridViewTextBoxColumn CANTIDAD;
        private System.Windows.Forms.DataGridViewTextBoxColumn CONDUCTOR;
    }
}