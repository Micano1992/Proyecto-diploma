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
        public principal()
        {
            InitializeComponent();
        }


        private void Usuarios_Load(object sender, EventArgs e)
        {
            this.MaximizeBox = false;

            MainMenuStrip.Enabled = true;
        }

        #region Producto
        private void consultarProductoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU028___Consultar_producto nCon = new CU028___Consultar_producto();

            //this.menuStrip1.Enabled = false;

            nCon.Show(this);
        }

        private void altaDeProductoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU027___Alta_de_productos nAlt = new CU027___Alta_de_productos();

            nAlt.Show(this);

            this.Hide();

        }

        private void modificarProductoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU030___Modificar_producto nMod = new CU030___Modificar_producto();

            nMod.Show();
        }

        private void verificarProductoterminalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU031___Verificar_productos_que_operan_en_terminal nVer = new CU031___Verificar_productos_que_operan_en_terminal();

            nVer.Show();
        }

        private void asignarProductoterminalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU032___Asignar_producto_que_opera_terminal nAsig = new CU032___Asignar_producto_que_opera_terminal();

            nAsig.Show();
        }

        #endregion

        #region Tanque
        private void tToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            CU034___Consultar_tanque nCon = new CU034___Consultar_tanque();

            nCon.Show();
        }

        private void altaTanqueToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU035___Cargar_tanque nCar = new CU035___Cargar_tanque();

            nCar.Show();
        }

        private void modificarTanqueToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU038___Modificar_tanque nMod = new CU038___Modificar_tanque();

            nMod.Show();
        }

        private void transferenciaDeStockToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU039___Transferir_stock nTran = new CU039___Transferir_stock();

            nTran.Show();
        }
        #endregion

        #region Conductor

        private void consultarConductorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU045___Consultar_conductor nCon = new CU045___Consultar_conductor();

            nCon.Show();
        }

        private void altaDeConductorToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            CU046___Cargar_conductor nCar = new CU046___Cargar_conductor();

            nCar.Show();

            //sdfsfdsfds
        }

        private void modificarConductorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU049___Modificar_conductor nMod = new CU049___Modificar_conductor();

            nMod.Show();
        }
        #endregion

        #region GestionTerminal
        private void verificarDocumentoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU042___Verificar_documento nVerdoc = new CU042___Verificar_documento();

            nVerdoc.Show();
        }

        private void generarRemitoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU040___Generar_remito nGenrem = new CU040___Generar_remito();

            nGenrem.Show();
        }

        private void generarReciboToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU041___Generar_recibo nGenRec = new CU041___Generar_recibo();

            nGenRec.Show();
        }

        private void pedidosPendientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU050___Verificar_pedidos_pendientes nVerPed = new CU050___Verificar_pedidos_pendientes();

            nVerPed.Show();
        }

        #endregion

        #region MenuUsuario

        private void cambiarContraseñaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU024___Cambiar_contraseña nCam = new CU024___Cambiar_contraseña();

            nCam.Show();
        }


        private void cambiarIdiomaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU025___Cambiar_idioma nCam = new CU025___Cambiar_idioma();

            nCam.Show();
        }

        #endregion

        #region AdministracionUsuario

        private void consultarUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU002___Consultar_usuario nCon = new CU002___Consultar_usuario();

            nCon.Show(this);

            this.menuStrip1.Enabled = false;
        }

        private void crearUsuarioToolStripMenuItem1_Click_1(object sender, EventArgs e)
        {
            CU001_Crear_usuario nCrear = new CU001_Crear_usuario();

            nCrear.Show();
        }

        private void modificarUsuarioToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            CU005___Modificar_usuario nMod = new CU005___Modificar_usuario();

            nMod.Show();
        }

        private void consultarFamiliaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU012___Consultar_familia nCon = new CU012___Consultar_familia();

            nCon.Show();
        }

        private void crearFamiliaToolStripMenuItem_Click(object sender, EventArgs e)
        {

            CU011___CREAR_FAMILIA nCrear = new CU011___CREAR_FAMILIA();

            nCrear.Show();
        }

        private void familiaPorUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU006___Administrar_familia nAdm = new CU006___Administrar_familia();

            nAdm.Show();
        }

        private void patentePorUsuarioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU013___Administrar_patente nAdm = new CU013___Administrar_patente();

            nAdm.Show();
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

        public void cerrarSesion()
        {



        }

        private void ConsultarBitácoraToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU018___Consultar_bitacora nCon = new CU018___Consultar_bitacora();

            nCon.Show();

        }

        private void GenerarCopiaDeSeguridadToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU020___Generar_copia_seguridad nGen = new CU020___Generar_copia_seguridad();

            nGen.Show();
        }

        private void RestaurarCopiaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CU021___Restaurar_copia nRes = new CU021___Restaurar_copia();

            nRes.Show();
        }
    }
}
