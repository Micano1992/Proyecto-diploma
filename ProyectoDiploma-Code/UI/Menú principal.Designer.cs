namespace UI
{
    partial class principal
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(principal));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.productosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultarProductoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaDeProductoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.modificarProductoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.productosOperadosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.verificarProductoterminalToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.asignarProductoterminalToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.altaTanqueToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.modificarTanqueToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.transferenciaDeStockToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.terminalToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultarConductorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.altaDeConductorToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.modificarConductorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tToolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.verificarDocumentoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.generarRemitoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.generarReciboToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pedidosPendientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menúUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cambiarIdiomaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cambiarContraseñaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.usuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.crearUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultarUsuarioToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.crearUsuarioToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.modificarUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.modificarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultarFamiliaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.crearFamiliaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.familiaPorUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.patentesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.patentePorUsuarioToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.seguridadDeSistemaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultarBitácoraToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.generarCopiaDeSeguridadToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.restaurarCopiaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.cerrarSesiónToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.productosToolStripMenuItem,
            this.tToolStripMenuItem,
            this.terminalToolStripMenuItem,
            this.tToolStripMenuItem2,
            this.menúUsuarioToolStripMenuItem,
            this.usuariosToolStripMenuItem,
            this.seguridadDeSistemaToolStripMenuItem,
            this.cerrarSesiónToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(9, 3, 0, 3);
            this.menuStrip1.Size = new System.Drawing.Size(1183, 35);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // productosToolStripMenuItem
            // 
            this.productosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.consultarProductoToolStripMenuItem,
            this.altaDeProductoToolStripMenuItem,
            this.modificarProductoToolStripMenuItem,
            this.productosOperadosToolStripMenuItem});
            this.productosToolStripMenuItem.Name = "productosToolStripMenuItem";
            this.productosToolStripMenuItem.Size = new System.Drawing.Size(101, 29);
            this.productosToolStripMenuItem.Text = "Producto";
            // 
            // consultarProductoToolStripMenuItem
            // 
            this.consultarProductoToolStripMenuItem.Name = "consultarProductoToolStripMenuItem";
            this.consultarProductoToolStripMenuItem.Size = new System.Drawing.Size(276, 34);
            this.consultarProductoToolStripMenuItem.Text = "Consultar producto";
            this.consultarProductoToolStripMenuItem.Click += new System.EventHandler(this.consultarProductoToolStripMenuItem_Click);
            // 
            // altaDeProductoToolStripMenuItem
            // 
            this.altaDeProductoToolStripMenuItem.Name = "altaDeProductoToolStripMenuItem";
            this.altaDeProductoToolStripMenuItem.Size = new System.Drawing.Size(276, 34);
            this.altaDeProductoToolStripMenuItem.Text = "Alta de producto";
            this.altaDeProductoToolStripMenuItem.Click += new System.EventHandler(this.altaDeProductoToolStripMenuItem_Click);
            // 
            // modificarProductoToolStripMenuItem
            // 
            this.modificarProductoToolStripMenuItem.Name = "modificarProductoToolStripMenuItem";
            this.modificarProductoToolStripMenuItem.Size = new System.Drawing.Size(276, 34);
            this.modificarProductoToolStripMenuItem.Text = "Modificar producto";
            this.modificarProductoToolStripMenuItem.Click += new System.EventHandler(this.modificarProductoToolStripMenuItem_Click);
            // 
            // productosOperadosToolStripMenuItem
            // 
            this.productosOperadosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.verificarProductoterminalToolStripMenuItem,
            this.asignarProductoterminalToolStripMenuItem});
            this.productosOperadosToolStripMenuItem.Name = "productosOperadosToolStripMenuItem";
            this.productosOperadosToolStripMenuItem.Size = new System.Drawing.Size(276, 34);
            this.productosOperadosToolStripMenuItem.Text = "Productos operados";
            // 
            // verificarProductoterminalToolStripMenuItem
            // 
            this.verificarProductoterminalToolStripMenuItem.Name = "verificarProductoterminalToolStripMenuItem";
            this.verificarProductoterminalToolStripMenuItem.Size = new System.Drawing.Size(326, 34);
            this.verificarProductoterminalToolStripMenuItem.Text = "Verificar producto-terminal";
            this.verificarProductoterminalToolStripMenuItem.Click += new System.EventHandler(this.verificarProductoterminalToolStripMenuItem_Click);
            // 
            // asignarProductoterminalToolStripMenuItem
            // 
            this.asignarProductoterminalToolStripMenuItem.Name = "asignarProductoterminalToolStripMenuItem";
            this.asignarProductoterminalToolStripMenuItem.Size = new System.Drawing.Size(326, 34);
            this.asignarProductoterminalToolStripMenuItem.Text = "Asignar producto-terminal";
            this.asignarProductoterminalToolStripMenuItem.Click += new System.EventHandler(this.asignarProductoterminalToolStripMenuItem_Click);
            // 
            // tToolStripMenuItem
            // 
            this.tToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tToolStripMenuItem1,
            this.altaTanqueToolStripMenuItem,
            this.modificarTanqueToolStripMenuItem,
            this.transferenciaDeStockToolStripMenuItem});
            this.tToolStripMenuItem.Name = "tToolStripMenuItem";
            this.tToolStripMenuItem.Size = new System.Drawing.Size(84, 29);
            this.tToolStripMenuItem.Text = "Tanque";
            // 
            // tToolStripMenuItem1
            // 
            this.tToolStripMenuItem1.Name = "tToolStripMenuItem1";
            this.tToolStripMenuItem1.Size = new System.Drawing.Size(287, 34);
            this.tToolStripMenuItem1.Text = "Consultar tanque";
            this.tToolStripMenuItem1.Click += new System.EventHandler(this.tToolStripMenuItem1_Click);
            // 
            // altaTanqueToolStripMenuItem
            // 
            this.altaTanqueToolStripMenuItem.Name = "altaTanqueToolStripMenuItem";
            this.altaTanqueToolStripMenuItem.Size = new System.Drawing.Size(287, 34);
            this.altaTanqueToolStripMenuItem.Text = "Alta de tanque";
            this.altaTanqueToolStripMenuItem.Click += new System.EventHandler(this.altaTanqueToolStripMenuItem_Click);
            // 
            // modificarTanqueToolStripMenuItem
            // 
            this.modificarTanqueToolStripMenuItem.Name = "modificarTanqueToolStripMenuItem";
            this.modificarTanqueToolStripMenuItem.Size = new System.Drawing.Size(287, 34);
            this.modificarTanqueToolStripMenuItem.Text = "Modificar ttanque";
            this.modificarTanqueToolStripMenuItem.Click += new System.EventHandler(this.modificarTanqueToolStripMenuItem_Click);
            // 
            // transferenciaDeStockToolStripMenuItem
            // 
            this.transferenciaDeStockToolStripMenuItem.Name = "transferenciaDeStockToolStripMenuItem";
            this.transferenciaDeStockToolStripMenuItem.Size = new System.Drawing.Size(287, 34);
            this.transferenciaDeStockToolStripMenuItem.Text = "Transferencia de stock";
            this.transferenciaDeStockToolStripMenuItem.Click += new System.EventHandler(this.transferenciaDeStockToolStripMenuItem_Click);
            // 
            // terminalToolStripMenuItem
            // 
            this.terminalToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.consultarConductorToolStripMenuItem,
            this.altaDeConductorToolStripMenuItem1,
            this.modificarConductorToolStripMenuItem});
            this.terminalToolStripMenuItem.Name = "terminalToolStripMenuItem";
            this.terminalToolStripMenuItem.Size = new System.Drawing.Size(112, 29);
            this.terminalToolStripMenuItem.Text = "Conductor";
            // 
            // consultarConductorToolStripMenuItem
            // 
            this.consultarConductorToolStripMenuItem.Name = "consultarConductorToolStripMenuItem";
            this.consultarConductorToolStripMenuItem.Size = new System.Drawing.Size(275, 34);
            this.consultarConductorToolStripMenuItem.Text = "Consultar conductor";
            this.consultarConductorToolStripMenuItem.Click += new System.EventHandler(this.consultarConductorToolStripMenuItem_Click);
            // 
            // altaDeConductorToolStripMenuItem1
            // 
            this.altaDeConductorToolStripMenuItem1.Name = "altaDeConductorToolStripMenuItem1";
            this.altaDeConductorToolStripMenuItem1.Size = new System.Drawing.Size(275, 34);
            this.altaDeConductorToolStripMenuItem1.Text = "Alta de conductor";
            this.altaDeConductorToolStripMenuItem1.Click += new System.EventHandler(this.altaDeConductorToolStripMenuItem1_Click);
            // 
            // modificarConductorToolStripMenuItem
            // 
            this.modificarConductorToolStripMenuItem.Name = "modificarConductorToolStripMenuItem";
            this.modificarConductorToolStripMenuItem.Size = new System.Drawing.Size(275, 34);
            this.modificarConductorToolStripMenuItem.Text = "Modificar conductor";
            this.modificarConductorToolStripMenuItem.Click += new System.EventHandler(this.modificarConductorToolStripMenuItem_Click);
            // 
            // tToolStripMenuItem2
            // 
            this.tToolStripMenuItem2.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.verificarDocumentoToolStripMenuItem,
            this.generarRemitoToolStripMenuItem,
            this.generarReciboToolStripMenuItem,
            this.pedidosPendientesToolStripMenuItem});
            this.tToolStripMenuItem2.Name = "tToolStripMenuItem2";
            this.tToolStripMenuItem2.Size = new System.Drawing.Size(157, 29);
            this.tToolStripMenuItem2.Text = "Gestión terminal";
            // 
            // verificarDocumentoToolStripMenuItem
            // 
            this.verificarDocumentoToolStripMenuItem.Name = "verificarDocumentoToolStripMenuItem";
            this.verificarDocumentoToolStripMenuItem.Size = new System.Drawing.Size(273, 34);
            this.verificarDocumentoToolStripMenuItem.Text = "Verificar documento";
            this.verificarDocumentoToolStripMenuItem.Click += new System.EventHandler(this.verificarDocumentoToolStripMenuItem_Click);
            // 
            // generarRemitoToolStripMenuItem
            // 
            this.generarRemitoToolStripMenuItem.Name = "generarRemitoToolStripMenuItem";
            this.generarRemitoToolStripMenuItem.Size = new System.Drawing.Size(273, 34);
            this.generarRemitoToolStripMenuItem.Text = "Generar remito";
            this.generarRemitoToolStripMenuItem.Click += new System.EventHandler(this.generarRemitoToolStripMenuItem_Click);
            // 
            // generarReciboToolStripMenuItem
            // 
            this.generarReciboToolStripMenuItem.Name = "generarReciboToolStripMenuItem";
            this.generarReciboToolStripMenuItem.Size = new System.Drawing.Size(273, 34);
            this.generarReciboToolStripMenuItem.Text = "Generar recibo";
            this.generarReciboToolStripMenuItem.Click += new System.EventHandler(this.generarReciboToolStripMenuItem_Click);
            // 
            // pedidosPendientesToolStripMenuItem
            // 
            this.pedidosPendientesToolStripMenuItem.Name = "pedidosPendientesToolStripMenuItem";
            this.pedidosPendientesToolStripMenuItem.Size = new System.Drawing.Size(273, 34);
            this.pedidosPendientesToolStripMenuItem.Text = "Pedidos pendientes";
            this.pedidosPendientesToolStripMenuItem.Click += new System.EventHandler(this.pedidosPendientesToolStripMenuItem_Click);
            // 
            // menúUsuarioToolStripMenuItem
            // 
            this.menúUsuarioToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.cambiarIdiomaToolStripMenuItem,
            this.cambiarContraseñaToolStripMenuItem});
            this.menúUsuarioToolStripMenuItem.Name = "menúUsuarioToolStripMenuItem";
            this.menúUsuarioToolStripMenuItem.Size = new System.Drawing.Size(136, 29);
            this.menúUsuarioToolStripMenuItem.Text = "Menú usuario";
            // 
            // cambiarIdiomaToolStripMenuItem
            // 
            this.cambiarIdiomaToolStripMenuItem.Name = "cambiarIdiomaToolStripMenuItem";
            this.cambiarIdiomaToolStripMenuItem.Size = new System.Drawing.Size(271, 34);
            this.cambiarIdiomaToolStripMenuItem.Text = "Cambiar idioma";
            this.cambiarIdiomaToolStripMenuItem.Click += new System.EventHandler(this.cambiarIdiomaToolStripMenuItem_Click);
            // 
            // cambiarContraseñaToolStripMenuItem
            // 
            this.cambiarContraseñaToolStripMenuItem.Name = "cambiarContraseñaToolStripMenuItem";
            this.cambiarContraseñaToolStripMenuItem.Size = new System.Drawing.Size(271, 34);
            this.cambiarContraseñaToolStripMenuItem.Text = "Cambiar contraseña";
            this.cambiarContraseñaToolStripMenuItem.Click += new System.EventHandler(this.cambiarContraseñaToolStripMenuItem_Click);
            // 
            // usuariosToolStripMenuItem
            // 
            this.usuariosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.crearUsuarioToolStripMenuItem,
            this.modificarToolStripMenuItem,
            this.patentesToolStripMenuItem});
            this.usuariosToolStripMenuItem.Name = "usuariosToolStripMenuItem";
            this.usuariosToolStripMenuItem.Size = new System.Drawing.Size(243, 29);
            this.usuariosToolStripMenuItem.Text = "Administración de usuarios";
            // 
            // crearUsuarioToolStripMenuItem
            // 
            this.crearUsuarioToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.consultarUsuarioToolStripMenuItem1,
            this.crearUsuarioToolStripMenuItem1,
            this.modificarUsuarioToolStripMenuItem});
            this.crearUsuarioToolStripMenuItem.Name = "crearUsuarioToolStripMenuItem";
            this.crearUsuarioToolStripMenuItem.Size = new System.Drawing.Size(182, 34);
            this.crearUsuarioToolStripMenuItem.Text = "Usuarios";
            // 
            // consultarUsuarioToolStripMenuItem1
            // 
            this.consultarUsuarioToolStripMenuItem1.Name = "consultarUsuarioToolStripMenuItem1";
            this.consultarUsuarioToolStripMenuItem1.Size = new System.Drawing.Size(252, 34);
            this.consultarUsuarioToolStripMenuItem1.Text = "Consultar usuario";
            this.consultarUsuarioToolStripMenuItem1.Click += new System.EventHandler(this.consultarUsuarioToolStripMenuItem_Click);
            // 
            // crearUsuarioToolStripMenuItem1
            // 
            this.crearUsuarioToolStripMenuItem1.Name = "crearUsuarioToolStripMenuItem1";
            this.crearUsuarioToolStripMenuItem1.Size = new System.Drawing.Size(252, 34);
            this.crearUsuarioToolStripMenuItem1.Text = "Crear usuario";
            this.crearUsuarioToolStripMenuItem1.Click += new System.EventHandler(this.crearUsuarioToolStripMenuItem1_Click_1);
            // 
            // modificarUsuarioToolStripMenuItem
            // 
            this.modificarUsuarioToolStripMenuItem.Name = "modificarUsuarioToolStripMenuItem";
            this.modificarUsuarioToolStripMenuItem.Size = new System.Drawing.Size(252, 34);
            this.modificarUsuarioToolStripMenuItem.Text = "Modificar usuario";
            this.modificarUsuarioToolStripMenuItem.Click += new System.EventHandler(this.modificarUsuarioToolStripMenuItem_Click_1);
            // 
            // modificarToolStripMenuItem
            // 
            this.modificarToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.consultarFamiliaToolStripMenuItem,
            this.crearFamiliaToolStripMenuItem,
            this.familiaPorUsuarioToolStripMenuItem});
            this.modificarToolStripMenuItem.Name = "modificarToolStripMenuItem";
            this.modificarToolStripMenuItem.Size = new System.Drawing.Size(182, 34);
            this.modificarToolStripMenuItem.Text = "Familias";
            // 
            // consultarFamiliaToolStripMenuItem
            // 
            this.consultarFamiliaToolStripMenuItem.Name = "consultarFamiliaToolStripMenuItem";
            this.consultarFamiliaToolStripMenuItem.Size = new System.Drawing.Size(264, 34);
            this.consultarFamiliaToolStripMenuItem.Text = "Consultar familia";
            this.consultarFamiliaToolStripMenuItem.Click += new System.EventHandler(this.consultarFamiliaToolStripMenuItem_Click);
            // 
            // crearFamiliaToolStripMenuItem
            // 
            this.crearFamiliaToolStripMenuItem.Name = "crearFamiliaToolStripMenuItem";
            this.crearFamiliaToolStripMenuItem.Size = new System.Drawing.Size(264, 34);
            this.crearFamiliaToolStripMenuItem.Text = "Crear familia";
            this.crearFamiliaToolStripMenuItem.Click += new System.EventHandler(this.crearFamiliaToolStripMenuItem_Click);
            // 
            // familiaPorUsuarioToolStripMenuItem
            // 
            this.familiaPorUsuarioToolStripMenuItem.Name = "familiaPorUsuarioToolStripMenuItem";
            this.familiaPorUsuarioToolStripMenuItem.Size = new System.Drawing.Size(264, 34);
            this.familiaPorUsuarioToolStripMenuItem.Text = "Familia por usuario";
            this.familiaPorUsuarioToolStripMenuItem.Click += new System.EventHandler(this.familiaPorUsuarioToolStripMenuItem_Click);
            // 
            // patentesToolStripMenuItem
            // 
            this.patentesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.patentePorUsuarioToolStripMenuItem});
            this.patentesToolStripMenuItem.Name = "patentesToolStripMenuItem";
            this.patentesToolStripMenuItem.Size = new System.Drawing.Size(182, 34);
            this.patentesToolStripMenuItem.Text = "Patentes";
            // 
            // patentePorUsuarioToolStripMenuItem
            // 
            this.patentePorUsuarioToolStripMenuItem.Name = "patentePorUsuarioToolStripMenuItem";
            this.patentePorUsuarioToolStripMenuItem.Size = new System.Drawing.Size(268, 34);
            this.patentePorUsuarioToolStripMenuItem.Text = "Patente por usuario";
            this.patentePorUsuarioToolStripMenuItem.Click += new System.EventHandler(this.patentePorUsuarioToolStripMenuItem_Click);
            // 
            // seguridadDeSistemaToolStripMenuItem
            // 
            this.seguridadDeSistemaToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.consultarBitácoraToolStripMenuItem,
            this.generarCopiaDeSeguridadToolStripMenuItem,
            this.restaurarCopiaToolStripMenuItem});
            this.seguridadDeSistemaToolStripMenuItem.Name = "seguridadDeSistemaToolStripMenuItem";
            this.seguridadDeSistemaToolStripMenuItem.Size = new System.Drawing.Size(199, 29);
            this.seguridadDeSistemaToolStripMenuItem.Text = "Seguridad de sistema";
            // 
            // consultarBitácoraToolStripMenuItem
            // 
            this.consultarBitácoraToolStripMenuItem.Name = "consultarBitácoraToolStripMenuItem";
            this.consultarBitácoraToolStripMenuItem.Size = new System.Drawing.Size(332, 34);
            this.consultarBitácoraToolStripMenuItem.Text = "Consultar bitácora";
            this.consultarBitácoraToolStripMenuItem.Click += new System.EventHandler(this.ConsultarBitácoraToolStripMenuItem_Click);
            // 
            // generarCopiaDeSeguridadToolStripMenuItem
            // 
            this.generarCopiaDeSeguridadToolStripMenuItem.Name = "generarCopiaDeSeguridadToolStripMenuItem";
            this.generarCopiaDeSeguridadToolStripMenuItem.Size = new System.Drawing.Size(332, 34);
            this.generarCopiaDeSeguridadToolStripMenuItem.Text = "Generar copia de seguridad";
            this.generarCopiaDeSeguridadToolStripMenuItem.Click += new System.EventHandler(this.GenerarCopiaDeSeguridadToolStripMenuItem_Click);
            // 
            // restaurarCopiaToolStripMenuItem
            // 
            this.restaurarCopiaToolStripMenuItem.Name = "restaurarCopiaToolStripMenuItem";
            this.restaurarCopiaToolStripMenuItem.Size = new System.Drawing.Size(332, 34);
            this.restaurarCopiaToolStripMenuItem.Text = "Restaurar copia";
            this.restaurarCopiaToolStripMenuItem.Click += new System.EventHandler(this.RestaurarCopiaToolStripMenuItem_Click);
            // 
            // cerrarSesiónToolStripMenuItem
            // 
            this.cerrarSesiónToolStripMenuItem.Name = "cerrarSesiónToolStripMenuItem";
            this.cerrarSesiónToolStripMenuItem.Size = new System.Drawing.Size(130, 29);
            this.cerrarSesiónToolStripMenuItem.Text = "Cerrar sesión";
            this.cerrarSesiónToolStripMenuItem.Click += new System.EventHandler(this.cerrarSesiónToolStripMenuItem_Click);
            // 
            // principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(1183, 451);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "principal";
            this.Text = "Menú principal";
            this.TransparencyKey = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(128)))));
            this.Activated += new System.EventHandler(this.Principal_Activated);
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.principal_FormClosing);
            this.Load += new System.EventHandler(this.Usuarios_Load);
            this.Shown += new System.EventHandler(this.Principal_Shown);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem usuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem crearUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem modificarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultarUsuarioToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem patentesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultarFamiliaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem crearFamiliaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem familiaPorUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem patentePorUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem productosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultarProductoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem altaDeProductoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem modificarProductoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem productosOperadosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem verificarProductoterminalToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem asignarProductoterminalToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem altaTanqueToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem modificarTanqueToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem transferenciaDeStockToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem terminalToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultarConductorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem altaDeConductorToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem modificarConductorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tToolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem verificarDocumentoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem generarRemitoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem generarReciboToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem pedidosPendientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem crearUsuarioToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem modificarUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem menúUsuarioToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cambiarIdiomaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cambiarContraseñaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem seguridadDeSistemaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultarBitácoraToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem generarCopiaDeSeguridadToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem restaurarCopiaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cerrarSesiónToolStripMenuItem;
    }
}