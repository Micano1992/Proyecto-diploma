namespace UI
{
    partial class CU042___Verificar_documento
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
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.TIPODOC = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.NUMDOC = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TERMINAL = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.button2 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.TIPODOC,
            this.NUMDOC,
            this.TERMINAL});
            this.HelpProviderHG.SetHelpKeyword(this.dataGridView1, "CU042__Verificar_documento.htm#dataGridView1");
            this.HelpProviderHG.SetHelpNavigator(this.dataGridView1, System.Windows.Forms.HelpNavigator.Topic);
            this.dataGridView1.Location = new System.Drawing.Point(26, 30);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.RowHeadersWidth = 62;
            this.HelpProviderHG.SetShowHelp(this.dataGridView1, true);
            this.dataGridView1.Size = new System.Drawing.Size(373, 273);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.SelectionChanged += new System.EventHandler(this.dataGridView1_SelectionChanged_1);
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "CU042__Verificar_documento.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(36, 63);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(134, 20);
            this.button1.TabIndex = 1;
            this.button1.Text = "ANULAR DOCUMENTO";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(472, 30);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(200, 161);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "INFORMACIÓN";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 117);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(55, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "TANQUE:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 74);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "CANTIDAD:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(71, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "PRODUCTO:";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.comboBox1);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.button1);
            this.groupBox2.Location = new System.Drawing.Point(472, 220);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(248, 100);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "ANULACIÓN";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.HelpProviderHG.SetHelpKeyword(this.comboBox1, "CU042__Verificar_documento.htm#label4");
            this.HelpProviderHG.SetHelpNavigator(this.comboBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.comboBox1.Location = new System.Drawing.Point(94, 31);
            this.comboBox1.Name = "comboBox1";
            this.HelpProviderHG.SetShowHelp(this.comboBox1, true);
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 3;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 31);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(52, 13);
            this.label4.TabIndex = 2;
            this.label4.Text = "TANQUE";
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(91, 36);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(35, 13);
            this.label5.TabIndex = 3;
            this.label5.Text = "label5";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(91, 74);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(35, 13);
            this.label6.TabIndex = 4;
            this.label6.Text = "label6";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(91, 117);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(35, 13);
            this.label7.TabIndex = 5;
            this.label7.Text = "label7";
            // 
            // TIPODOC
            // 
            this.TIPODOC.HeaderText = "TIPO DOCUMENTO";
            this.TIPODOC.MinimumWidth = 8;
            this.TIPODOC.Name = "TIPODOC";
            // 
            // NUMDOC
            // 
            this.NUMDOC.HeaderText = "NÚMERO DOCUMENTO";
            this.NUMDOC.MinimumWidth = 8;
            this.NUMDOC.Name = "NUMDOC";
            this.NUMDOC.Width = 150;
            // 
            // TERMINAL
            // 
            this.TERMINAL.HeaderText = "TERMINAL";
            this.TERMINAL.Name = "TERMINAL";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(107, 327);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(167, 33);
            this.button2.TabIndex = 4;
            this.button2.Text = "DESCARGAR";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // CU042___Verificar_documento
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(765, 389);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dataGridView1);
            this.HelpProviderHG.SetHelpKeyword(this, "CU042__Verificar_documento.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "CU042___Verificar_documento";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "DOCUMENTOS";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.CU042___Verificar_documento_FormClosed);
            this.Load += new System.EventHandler(this.CU042___Verificar_documento_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DataGridViewTextBoxColumn TIPODOC;
        private System.Windows.Forms.DataGridViewTextBoxColumn NUMDOC;
        private System.Windows.Forms.DataGridViewTextBoxColumn TERMINAL;
        private System.Windows.Forms.Button button2;
    }
}