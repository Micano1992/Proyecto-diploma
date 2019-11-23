namespace UI
{
    partial class CU020___Generar_copia_seguridad
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
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(86, 60);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(143, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "SELECCIONAR UBICACIÓN";
            // 
            // textBox1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox1, "CU020__Generar_copia_seguridad.htm#label1");
            this.HelpProviderHG.SetHelpNavigator(this.textBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox1.Location = new System.Drawing.Point(89, 80);
            this.textBox1.Name = "textBox1";
            this.HelpProviderHG.SetShowHelp(this.textBox1, true);
            this.textBox1.Size = new System.Drawing.Size(205, 20);
            this.textBox1.TabIndex = 1;
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "CU020__Generar_copia_seguridad.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(366, 60);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(97, 59);
            this.button1.TabIndex = 2;
            this.button1.Text = "EXAMINAR";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button2, "CU020__Generar_copia_seguridad.htm#button2");
            this.HelpProviderHG.SetHelpNavigator(this.button2, System.Windows.Forms.HelpNavigator.Topic);
            this.button2.Location = new System.Drawing.Point(139, 210);
            this.button2.Name = "button2";
            this.HelpProviderHG.SetShowHelp(this.button2, true);
            this.button2.Size = new System.Drawing.Size(202, 42);
            this.button2.TabIndex = 5;
            this.button2.Text = "REALIZAR COPIA";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(86, 128);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(150, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "CANTIDAD DE VOLÚMENES";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.HelpProviderHG.SetHelpKeyword(this.comboBox1, "CU020__Generar_copia_seguridad.htm#label3");
            this.HelpProviderHG.SetHelpNavigator(this.comboBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.comboBox1.Items.AddRange(new object[] {
            "1",
            "2",
            "3"});
            this.comboBox1.Location = new System.Drawing.Point(89, 144);
            this.comboBox1.Name = "comboBox1";
            this.HelpProviderHG.SetShowHelp(this.comboBox1, true);
            this.comboBox1.Size = new System.Drawing.Size(205, 21);
            this.comboBox1.TabIndex = 7;
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // CU020___Generar_copia_seguridad
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(493, 274);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.HelpProviderHG.SetHelpKeyword(this, "CU020__Generar_copia_seguridad.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "CU020___Generar_copia_seguridad";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "REALIZAR COPIA DE SEGURIDAD";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.CU020___Generar_copia_seguridad_FormClosing);
            this.Load += new System.EventHandler(this.CU020___Generar_copia_seguridad_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
    }
}