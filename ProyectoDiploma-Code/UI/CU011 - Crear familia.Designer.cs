﻿namespace UI
{
    partial class CU011___CREAR_FAMILIA
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
            this.HelpProviderHG = new System.Windows.Forms.HelpProvider();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(26, 52);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(185, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "DESCRIPCIÓN DE NUEVA FAMILIA:";
            // 
            // textBox1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.textBox1, "CU011__Crear_familia.htm#label1");
            this.HelpProviderHG.SetHelpNavigator(this.textBox1, System.Windows.Forms.HelpNavigator.Topic);
            this.textBox1.Location = new System.Drawing.Point(232, 52);
            this.textBox1.MaxLength = 49;
            this.textBox1.Name = "textBox1";
            this.HelpProviderHG.SetShowHelp(this.textBox1, true);
            this.textBox1.Size = new System.Drawing.Size(160, 20);
            this.textBox1.TabIndex = 1;
            // 
            // button1
            // 
            this.HelpProviderHG.SetHelpKeyword(this.button1, "CU011__Crear_familia.htm#button1");
            this.HelpProviderHG.SetHelpNavigator(this.button1, System.Windows.Forms.HelpNavigator.Topic);
            this.button1.Location = new System.Drawing.Point(132, 96);
            this.button1.Name = "button1";
            this.HelpProviderHG.SetShowHelp(this.button1, true);
            this.button1.Size = new System.Drawing.Size(120, 63);
            this.button1.TabIndex = 2;
            this.button1.Text = "CREAR";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // HelpProviderHG
            // 
            this.HelpProviderHG.HelpNamespace = "ProyectoDiploma.chm";
            // 
            // CU011___CREAR_FAMILIA
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(409, 194);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.HelpProviderHG.SetHelpKeyword(this, "CU011__Crear_familia.htm");
            this.HelpProviderHG.SetHelpNavigator(this, System.Windows.Forms.HelpNavigator.Topic);
            this.Name = "CU011___CREAR_FAMILIA";
            this.HelpProviderHG.SetShowHelp(this, true);
            this.Text = "CREAR FAMILIA";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.CU011___CREAR_FAMILIA_FormClosing);
            this.Load += new System.EventHandler(this.CU011___CREAR_FAMILIA_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.HelpProvider HelpProviderHG;
    }
}