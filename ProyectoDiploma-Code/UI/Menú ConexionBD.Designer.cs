﻿namespace UI
{
    partial class ConexionBD
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
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "Menu_ConexionBD.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(146, 244);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(218, 37);
            this.button1.TabIndex = 10;
            this.button1.Text = "PROBAR CONEXION";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.label3.Font = new System.Drawing.Font("Calibri", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label3.Location = new System.Drawing.Point(44, 36);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(437, 39);
            this.label3.TabIndex = 8;
            this.label3.Text = "CONEXION CON BASE DE DATOS";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(97, 146);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(143, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "NOMBRE BASE DE DATOS";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(97, 120);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "SERVIDOR";
            // 
            // textBox2
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox2, "Menu_ConexionBD.htm#label2");
            this.HelpProviderHG.SetHelpNavigator(this.textBox2, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox2.Location = new System.Drawing.Point(287, 143);
            this.textBox2.MaxLength = 30;
            this.textBox2.Name = "textBox2";
            this.HelpProviderHG.SetShowHelp(this.textBox2, true);
            this.textBox2.Size = new System.Drawing.Size(116, 20);
            this.textBox2.TabIndex = 6;
            // 
            // textBox1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox1, "Menu_ConexionBD.htm#label1");
            this.HelpProviderHG.SetHelpNavigator(this.textBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox1.Location = new System.Drawing.Point(287, 117);
            this.textBox1.MaxLength = 50;
            this.textBox1.Name = "textBox1";
            this.HelpProviderHG.SetShowHelp(this.textBox1, true);
            this.textBox1.Size = new System.Drawing.Size(116, 20);
            this.textBox1.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(97, 172);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 13);
            this.label4.TabIndex = 12;
            this.label4.Text = "USUARIO";
            // 
            // textBox3
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox3, "Menu_ConexionBD.htm#label4");
            this.HelpProviderHG.SetHelpNavigator(this.textBox3, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox3.Location = new System.Drawing.Point(287, 169);
            this.textBox3.MaxLength = 20;
            this.textBox3.Name = "textBox3";
            this.HelpProviderHG.SetShowHelp(this.textBox3, true);
            this.textBox3.Size = new System.Drawing.Size(116, 20);
            this.textBox3.TabIndex = 11;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(97, 195);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(81, 13);
            this.label5.TabIndex = 14;
            this.label5.Text = "CONTRASEÑA";
            // 
            // textBox4
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox4, "Menu_ConexionBD.htm#label5");
            this.HelpProviderHG.SetHelpNavigator(this.textBox4, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox4.Location = new System.Drawing.Point(287, 195);
            this.textBox4.MaxLength = 30;
            this.textBox4.Name = "textBox4";
            this.HelpProviderHG.SetShowHelp(this.textBox4, true);
            this.textBox4.Size = new System.Drawing.Size(116, 20);
            this.textBox4.TabIndex = 13;
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // ConexionBD
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDark;
            this.ClientSize = new System.Drawing.Size(525, 316);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.HelpProviderHG.SetHelpKeyword(this, "Menu_ConexionBD.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "ConexionBD";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "ConexionBD";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ConexionBD_FormClosing);
            this.Load += new System.EventHandler(this.ConexionBD_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
    }
}