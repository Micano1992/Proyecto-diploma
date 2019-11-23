namespace UI
{
    partial class CU041___Generar_recibo
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
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "CU041__Generar_recibo.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(108, 176);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(130, 44);
            this.button1.TabIndex = 0;
            this.button1.Text = "GENERAR RECIBO";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(56, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "TANQUE";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(56, 127);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "CANTIDAD";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.HelpProviderHG.SetHelpKeyword(this.comboBox1, "CU041__Generar_recibo.htm#label1");
            this.HelpProviderHG.SetHelpNavigator(this.comboBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.comboBox1.Location = new System.Drawing.Point(152, 34);
            this.comboBox1.Name = "comboBox1";
            this.HelpProviderHG.SetShowHelp(this.comboBox1, true);
            this.comboBox1.Size = new System.Drawing.Size(135, 21);
            this.comboBox1.TabIndex = 3;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            this.comboBox1.SelectedValueChanged += new System.EventHandler(this.comboBox1_SelectedValueChanged);
            this.comboBox1.Click += new System.EventHandler(this.comboBox1_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(56, 83);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(68, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "PRODUCTO";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(149, 83);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(0, 13);
            this.label4.TabIndex = 5;
            // 
            // textBox1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox1, "CU041__Generar_recibo.htm#label2");
            this.HelpProviderHG.SetHelpNavigator(this.textBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox1.Location = new System.Drawing.Point(152, 124);
            this.textBox1.MaxLength = 10;
            this.textBox1.Name = "textBox1";
            this.HelpProviderHG.SetShowHelp(this.textBox1, true);
            this.textBox1.Size = new System.Drawing.Size(135, 20);
            this.textBox1.TabIndex = 6;
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // CU041___Generar_recibo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(350, 261);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button1);
            this.HelpProviderHG.SetHelpKeyword(this, "CU041__Generar_recibo.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "CU041___Generar_recibo";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "GENERAR RECIBO";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.CU041___Generar_recibo_FormClosed);
            this.Load += new System.EventHandler(this.CU041___Generar_recibo_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
    }
}