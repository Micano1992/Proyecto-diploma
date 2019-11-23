namespace UI
{
    partial class CU046___Cargar_conductor
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
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "CU046__Cargar_conductor.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(69, 189);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(202, 40);
            this.button1.TabIndex = 22;
            this.button1.Text = "CONFIRMAR ALTA";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // textBox4
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox4, "CU046__Cargar_conductor.htm#label3");
            this.HelpProviderHG.SetHelpNavigator(this.textBox4, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox4.Location = new System.Drawing.Point(190, 135);
            this.textBox4.MaxLength = 12;
            this.textBox4.Name = "textBox4";
            this.HelpProviderHG.SetShowHelp(this.textBox4, true);
            this.textBox4.Size = new System.Drawing.Size(121, 20);
            this.textBox4.TabIndex = 20;
            this.textBox4.TextChanged += new System.EventHandler(this.textBox4_TextChanged);
            // 
            // textBox3
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox3, "CU046__Cargar_conductor.htm#label4");
            this.HelpProviderHG.SetHelpNavigator(this.textBox3, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox3.Location = new System.Drawing.Point(190, 97);
            this.textBox3.MaxLength = 10;
            this.textBox3.Name = "textBox3";
            this.HelpProviderHG.SetShowHelp(this.textBox3, true);
            this.textBox3.Size = new System.Drawing.Size(121, 20);
            this.textBox3.TabIndex = 19;
            this.textBox3.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
            // 
            // textBox2
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox2, "CU046__Cargar_conductor.htm#label2");
            this.HelpProviderHG.SetHelpNavigator(this.textBox2, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox2.Location = new System.Drawing.Point(190, 61);
            this.textBox2.MaxLength = 50;
            this.textBox2.Name = "textBox2";
            this.HelpProviderHG.SetShowHelp(this.textBox2, true);
            this.textBox2.Size = new System.Drawing.Size(121, 20);
            this.textBox2.TabIndex = 18;
            this.textBox2.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // textBox1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox1, "CU046__Cargar_conductor.htm#label1");
            this.HelpProviderHG.SetHelpNavigator(this.textBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox1.Location = new System.Drawing.Point(190, 25);
            this.textBox1.MaxLength = 50;
            this.textBox1.Name = "textBox1";
            this.HelpProviderHG.SetShowHelp(this.textBox1, true);
            this.textBox1.Size = new System.Drawing.Size(121, 20);
            this.textBox1.TabIndex = 17;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(66, 100);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(26, 13);
            this.label4.TabIndex = 15;
            this.label4.Text = "DNI";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(66, 138);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 13);
            this.label3.TabIndex = 14;
            this.label3.Text = "PATENTE";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(66, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "APELLIDO";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(66, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(54, 13);
            this.label1.TabIndex = 12;
            this.label1.Text = "NOMBRE";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // CU046___Cargar_conductor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(397, 271);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.HelpProviderHG.SetHelpKeyword(this, "CU046__Cargar_conductor.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "CU046___Cargar_conductor";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "CONDUCTOR";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.CU046___Cargar_conductor_FormClosed);
            this.Load += new System.EventHandler(this.CU046___Cargar_conductor_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
    }
}