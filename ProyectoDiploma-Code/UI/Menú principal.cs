using System;
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
    public partial class principal : Form
    {
        //public principal()
        //{
        //    InitializeComponent();
        //}

        public principal(string usuario)
        {
            InitializeComponent();

            usuarioLogueado = usuario;
        }

        public string usuarioLogueado { get; set; }

        BLL.Usuario nUsuario = new BLL.Usuario();
        BLL.DigitoVerificador DVBLL = new BLL.DigitoVerificador();

        List<int> lPatentesUsu = new List<int>();

        private void Usuarios_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            MainMenuStrip.Enabled = true;

            this.StartPosition = FormStartPosition.CenterParent;

            this.AutoSizeMode = AutoSizeMode.GrowAndShrink;

            label1.Text = usuarioLogueado;

            deshabilitarPuntos();

            habilitarPuntosMenu(nUsuario.listarPatentes(usuarioLogueado));

            string[] errorDV = DVBLL.verificarDV();

            string mensaje =  "";

            if (errorDV[0].Length != 0)
            {
                mensaje = "Conflicto con registros de la base de datos: \n \n" + errorDV[0] + "\n";
            }

            if (errorDV[1].Length != 0)
            {
                mensaje += "Conflictos con tablas: \n \n" + errorDV[1];
            }

            if (mensaje != "")
            {
                MessageBox.Show(mensaje , "ERROR");
            }

            

        }


        #region Producto
        private void consultarProductoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU028___Consultar_producto nCon = new CU028___Consultar_producto();

            nCon.Show(this);

            this.Enabled = false;
        }

        private void altaDeProductoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU027___Alta_de_productos nAlt = new CU027___Alta_de_productos();

            this.Enabled = false;

            nAlt.Show(this);

        }

        private void modificarProductoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU030___Modificar_producto nMod = new CU030___Modificar_producto();

            this.Enabled = false;

            nMod.Show(this);
        }

        private void verificarProductoterminalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU031___Verificar_productos_que_operan_en_terminal nVer = new CU031___Verificar_productos_que_operan_en_terminal();

            this.Enabled = false;

            nVer.Show(this);
        }

        private void asignarProductoterminalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU032___Asignar_producto_que_opera_terminal nAsig = new CU032___Asignar_producto_que_opera_terminal();

            this.Enabled = false;

            nAsig.Show(this);
        }

        #endregion

        #region Tanque
        private void tToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            CU034___Consultar_tanque nCon = new CU034___Consultar_tanque();

            this.Enabled = false;

            nCon.Show(this);
        }

        private void altaTanqueToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU035___Cargar_tanque nCar = new CU035___Cargar_tanque();

            this.Enabled = false;

            nCar.Show(this);
        }

        private void modificarTanqueToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU038___Modificar_tanque nMod = new CU038___Modificar_tanque();

            this.Enabled = false;

            nMod.Show(this);
        }

        private void transferenciaDeStockToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU039___Transferir_stock nTran = new CU039___Transferir_stock();

            this.Enabled = false;

            nTran.Show(this);
        }
        #endregion

        #region Conductor

        private void consultarConductorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU045___Consultar_conductor nCon = new CU045___Consultar_conductor();

            nCon.Show(this);
        }

        private void altaDeConductorToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            CU046___Cargar_conductor nCar = new CU046___Cargar_conductor();

            this.Enabled = false;

            nCar.Show(this);
        }

        private void modificarConductorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU049___Modificar_conductor nMod = new CU049___Modificar_conductor();

            this.Enabled = false;

            nMod.Show(this);
        }
        #endregion

        #region GestionTerminal
        private void verificarDocumentoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU042___Verificar_documento nVerdoc = new CU042___Verificar_documento();

            this.Enabled = false;

            nVerdoc.Show(this);
        }

        private void generarRemitoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU040___Generar_remito nGenrem = new CU040___Generar_remito();

            this.Enabled = false;

            nGenrem.Show(this);
        }

        private void generarReciboToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU041___Generar_recibo nGenRec = new CU041___Generar_recibo();

            this.Enabled = false;

            nGenRec.Show(this);
        }

        private void pedidosPendientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU050___Verificar_pedidos_pendientes nVerPed = new CU050___Verificar_pedidos_pendientes();

            this.Enabled = false;

            nVerPed.Show(this);
        }

        #endregion

        #region MenuUsuario

        private void cambiarContraseñaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU024___Cambiar_contraseña nCam = new CU024___Cambiar_contraseña(usuarioLogueado);

            this.Enabled = false;

            nCam.Show(this);
        }


        private void cambiarIdiomaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU025___Cambiar_idioma nCam = new CU025___Cambiar_idioma();

            this.Enabled = false;

            nCam.Show(this);
        }

        #endregion

        #region AdministracionUsuario

        private void consultarUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU002___Consultar_usuario nCon = new CU002___Consultar_usuario(nUsuario.listarPatentes(usuarioLogueado));

            nCon.Show(this);

            this.Enabled = false;
        }

        private void crearUsuarioToolStripMenuItem1_Click_1(object sender, EventArgs e)
        {
            CU001_Crear_usuario nCrear = new CU001_Crear_usuario();

            this.Enabled = false;

            nCrear.Show(this);
        }


        private void consultarFamiliaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU012___Consultar_familia nCon = new CU012___Consultar_familia(nUsuario.listarPatentes(usuarioLogueado));

            this.Enabled = false;

            nCon.Show(this);
        }

        private void crearFamiliaToolStripMenuItem_Click(object sender, EventArgs e)
        {

            CU011___CREAR_FAMILIA nCrear = new CU011___CREAR_FAMILIA();

            this.Enabled = false;

            nCrear.Show(this);
        }


        private void patentePorUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //CU009___Negar_patente_usuario nNeg = new CU009___Negar_patente_usuario();

            //this.Enabled = false;

            //nNeg.Show(this);
        }

        private void otorgarPatenteAUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //CU008___Asignar_patente_a_usuario nAsg = new CU008___Asignar_patente_a_usuario();

            //this.Enabled = false;

            //nAsg.Show(this);
        }

        #endregion

        #region Seguridad
        private void ConsultarBitácoraToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU018___Consultar_bitacora nCon = new CU018___Consultar_bitacora();

            this.Enabled = false;

            nCon.Show(this);

        }

        private void GenerarCopiaDeSeguridadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU020___Generar_copia_seguridad nGen = new CU020___Generar_copia_seguridad();

            this.Enabled = false;

            nGen.Show(this);
        }

        private void RestaurarCopiaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU021___Restaurar_copia nRes = new CU021___Restaurar_copia();

            this.Enabled = false;

            nRes.Show(this);
        }

        #endregion




        private void principal_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult result = MessageBox.Show("¿Desea cerrar sesión?", "Salir", MessageBoxButtons.YesNo);

            if (result == DialogResult.No)
            {
                e.Cancel = true;

            }
            else
            {
                this.Owner.Show();

            }
        }


        private void cerrarSesiónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Principal_Shown(object sender, EventArgs e)
        {

        }

        private void Principal_Activated(object sender, EventArgs e)
        {
            menuStrip1.Enabled = true;
        }

        public void habilitarPuntosMenu(List<int> patentes)
        {

            foreach (int a in patentes)
            {
                switch (a)
                {

                    case 1:

                        AdmUsuariosToolStripMenuItem.Visible = true;

                        UsuariosToolStripMenuItem.Visible = true;

                        consultarUsuarioToolStripMenuItem1.Visible = true;

                        break;

                    case 2:

                        AdmUsuariosToolStripMenuItem.Visible = true;

                        UsuariosToolStripMenuItem.Visible = true;

                        crearUsuarioToolStripMenuItem1.Visible = true;

                        break;

                    case 3:

                        AdmUsuariosToolStripMenuItem.Visible = true;

                        UsuariosToolStripMenuItem.Visible = true;

                        //modificarUsuarioToolStripMenuItem.Visible = true;

                        break;

                    case 6:

                        AdmUsuariosToolStripMenuItem.Visible = true;

                        familasToolStripMenuItem.Visible = true;

                        consultarFamiliaToolStripMenuItem.Visible = true;

                        break;

                    case 7:

                        AdmUsuariosToolStripMenuItem.Visible = true;

                        familasToolStripMenuItem.Visible = true;

                        crearFamiliaToolStripMenuItem.Visible = true;

                        break;

                    case 9:


                        break;

                    case 10:

                        AdmUsuariosToolStripMenuItem.Visible = true;


                        break;

                    case 11:

                        AdmUsuariosToolStripMenuItem.Visible = true;

                        break;

                    case 12:

                        seguridadDeSistemaToolStripMenuItem.Visible = true;

                        restaurarCopiaToolStripMenuItem.Visible = true;

                        break;

                    case 13:

                        seguridadDeSistemaToolStripMenuItem.Visible = true;

                        generarCopiaDeSeguridadToolStripMenuItem.Visible = true;

                        break;


                    case 14:

                        seguridadDeSistemaToolStripMenuItem.Visible = true;

                        consultarBitácoraToolStripMenuItem.Visible = true;

                        break;

                    case 15:

                        menúUsuarioToolStripMenuItem.Visible = true;

                        cambiarContraseñaToolStripMenuItem.Visible = true;

                        break;


                    case 16:

                        menúUsuarioToolStripMenuItem.Visible = true;

                        cambiarIdiomaToolStripMenuItem.Visible = true;

                        break;

                    case 17:

                        productosToolStripMenuItem.Visible = true;

                        consultarProductoToolStripMenuItem.Visible = true;

                        break;

                    case 18:

                        productosToolStripMenuItem.Visible = true;

                        altaDeProductoToolStripMenuItem.Visible = true;

                        break;

                    case 19:

                        productosToolStripMenuItem.Visible = true;

                        modificarProductoToolStripMenuItem.Visible = true;

                        break;
                        
                    case 21:

                        productosToolStripMenuItem.Visible = true;

                        productosToolStripMenuItem.Visible = true;

                        verificarProductoterminalToolStripMenuItem.Visible = true;

                        break;


                    case 22:

                        productosToolStripMenuItem.Visible = true;

                        productosToolStripMenuItem.Visible = true;

                        asignarProductoterminalToolStripMenuItem.Visible = true;

                        break;

                    case 23:

                        tanqueToolStripMenuItem.Visible = true;

                        consultarTanqueToolStripMenuItem1.Visible = true;

                        break;


                    case 24:

                        tanqueToolStripMenuItem.Visible = true;

                        altaTanqueToolStripMenuItem.Visible = true;

                        break;

                    case 25:

                        tanqueToolStripMenuItem.Visible = true;

                        modificarTanqueToolStripMenuItem.Visible = true;

                        break;

                    case 27:

                        tanqueToolStripMenuItem.Visible = true;

                        transferenciaDeStockToolStripMenuItem.Visible = true;

                        break;

                    case 28:

                        gestionTerminalToolStripMenuItem2.Visible = true;

                        generarRemitoToolStripMenuItem.Visible = true;

                        break;

                    case 29:

                        gestionTerminalToolStripMenuItem2.Visible = true;

                        generarReciboToolStripMenuItem.Visible = true;

                        break;

                    case 30:

                        gestionTerminalToolStripMenuItem2.Visible = true;

                        verificarDocumentoToolStripMenuItem.Visible = true;

                        break;

                    case 31:

                        conductorToolStripMenuItem.Visible = true;

                        consultarConductorToolStripMenuItem.Visible = true;

                        break;

                    case 32:

                        conductorToolStripMenuItem.Visible = true;

                        altaDeConductorToolStripMenuItem1.Visible = true;

                        break;

                    case 33:

                        conductorToolStripMenuItem.Visible = true;

                        modificarConductorToolStripMenuItem.Visible = true;

                        break;

                    case 35:

                        gestionTerminalToolStripMenuItem2.Visible = true;

                        pedidosPendientesToolStripMenuItem.Visible = true;

                        break;

                }


            }
        }

        public void deshabilitarPuntos()
        {
            productosToolStripMenuItem.Visible = false;

            tanqueToolStripMenuItem.Visible = false;

            conductorToolStripMenuItem.Visible = false;

            gestionTerminalToolStripMenuItem2.Visible = false;

            AdmUsuariosToolStripMenuItem.Visible = false;

            consultarFamiliaToolStripMenuItem.Visible = false;

            menúUsuarioToolStripMenuItem.Visible = false;

            seguridadDeSistemaToolStripMenuItem.Visible = false;

            AdmUsuariosToolStripMenuItem.Visible = false;

            consultarUsuarioToolStripMenuItem1.Visible = false; ;

            UsuariosToolStripMenuItem.Visible = false;

            //modificarUsuarioToolStripMenuItem.Visible = false;

           crearFamiliaToolStripMenuItem.Visible = false;

            restaurarCopiaToolStripMenuItem.Visible = false;

            generarCopiaDeSeguridadToolStripMenuItem.Visible = false;

            consultarBitácoraToolStripMenuItem.Visible = false;

            cambiarContraseñaToolStripMenuItem.Visible = false;

            cambiarIdiomaToolStripMenuItem.Visible = false;

            consultarProductoToolStripMenuItem.Visible = false;

            altaDeProductoToolStripMenuItem.Visible = false;

            modificarProductoToolStripMenuItem.Visible = false;

            verificarProductoterminalToolStripMenuItem.Visible = false;

            asignarProductoterminalToolStripMenuItem.Visible = false;

            consultarTanqueToolStripMenuItem1.Visible = false;

            altaTanqueToolStripMenuItem.Visible = false;

            modificarTanqueToolStripMenuItem.Visible = false;

            transferenciaDeStockToolStripMenuItem.Visible = false;

            generarRemitoToolStripMenuItem.Visible = false;

            generarReciboToolStripMenuItem.Visible = false;

            verificarDocumentoToolStripMenuItem.Visible = false;

            consultarConductorToolStripMenuItem.Visible = false;

            altaDeConductorToolStripMenuItem1.Visible = false;

            modificarConductorToolStripMenuItem.Visible = false;

            pedidosPendientesToolStripMenuItem.Visible = false;

            productosOperadosToolStripMenuItem.Visible = false;

            UsuariosToolStripMenuItem.Visible = false;

            familasToolStripMenuItem.Visible = false;

            crearUsuarioToolStripMenuItem1.Visible = false;

        }


    }
}

