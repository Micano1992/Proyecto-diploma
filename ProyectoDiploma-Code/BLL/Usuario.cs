using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL
{
    public class Usuario
    {
        private const string NOMBRE_ENTIDAD_USUARIO = "Usuario";
        private const string NOMBRE_ENTIDAD_USUARIOPATENTE = "UsuarioPatente";

        BE.UsuarioBE nUsuario = new BE.UsuarioBE();
        BE.PatenteBE patenteBE = new BE.PatenteBE();
        DAL.Usuario nUsuDAL = new DAL.Usuario();
        DAL.Patente patDAL = new DAL.Patente();
        DAL.Terminal TerminalDAL = new DAL.Terminal();
        DAL.Idioma idiomaDAL = new DAL.Idioma();
        DAL.Encriptacion nEncrip = new DAL.Encriptacion();
        BLL.DigitoVerificador DV = new DigitoVerificador();
        BLL.Bitácora bitacoraBLL = new Bitácora();

        List<int> listaPat = new List<int>();
        List<BE.PatenteBE> lPat = new List<BE.PatenteBE>();

        public List<int> listarPatentes(string codUsuario)
        {
            listaPat.Clear();

            lPat.Clear();

            nUsuario.codUsuario = codUsuario;

            patDAL.patentesFamilias(nUsuDAL.familiaAsignada(nUsuario), ref lPat);

            nUsuDAL.patentesAsignadas(nUsuario, ref lPat);

            nUsuDAL.patentesNegadas(nUsuario, ref lPat);

            foreach(BE.PatenteBE pat in lPat)
            {
                listaPat.Add(pat.idPatente);
            }
 

            return listaPat;


        }

        public List<string[]> listarUSu()
        {
            List<string[]> lista = new List<string[]>();


            foreach(BE.UsuarioBE usu in nUsuDAL.listarUsuarios())
            {
                string[] nUsuario = new string[8];

                nUsuario[0] = usu.codUsuario;
                nUsuario[1] = usu.nombre;
                nUsuario[2] = usu.apellido;
                nUsuario[3] = usu.nroDocumento;
                nUsuario[4] = usu.tipoDocumento.ToString();
                nUsuario[5] = usu.bloqueado.ToString();
                nUsuario[6] = usu.mail;
                nUsuario[7] = usu.terminal.ToString();

                lista.Add(nUsuario);

            }

            return lista;
        }

        public string[] consulUsuario(string codUsuario)
        {
            BE.UsuarioBE usu = new BE.UsuarioBE();

            usu.codUsuario = codUsuario;

               usu = nUsuDAL.consultarUSuario(usu);

            string[] nUsuario = new string[9];

            nUsuario[0] = "";
            nUsuario[1] = "";
            nUsuario[2] = "";
            nUsuario[3] = "";
            nUsuario[4] = "";
            nUsuario[5] = "";
            nUsuario[6] = "";
            nUsuario[7] = "";
            nUsuario[8] = "";

            nUsuario[0] = usu.codUsuario;
            nUsuario[1] = usu.nombre;
            nUsuario[2] = usu.apellido;
            nUsuario[3] = usu.nroDocumento;
            nUsuario[4] = usu.tipoDocumento.ToString();
            nUsuario[5] = usu.bloqueado.ToString();
            nUsuario[6] = usu.mail;
            nUsuario[7] = usu.terminal.descripcionTerminal.ToString();
            nUsuario[8] = usu.idioma.ToString();

            return nUsuario;

        }

        ////public string generarContraseña()
        //{
        //    string passwordAleatorio;
        //    string s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        //    Random rd = new Random();
        //    StringBuilder sb = new StringBuilder();
        //    for (int i = 0; i < 8; i++)
        //    {
        //        int idx = rd.Next(0, 10);
        //        sb.Append(s.Substring(idx, 1));
        //    }
        //    passwordAleatorio = sb.ToString();
        //    return passwordAleatorio;
        //}

        public string altaUsurio(string[] nUsuUI, string usuarioLog, string ruta)
        {
            BE.UsuarioBE usuario = new BE.UsuarioBE();
            BE.Terminal nTer = new BE.Terminal();

            usuario.nombre = nUsuUI[0].ToString();
            usuario.apellido = nUsuUI[1].ToString();
            usuario.tipoDocumento = (BE.UsuarioBE.tipoDoc)Enum.Parse(typeof(BE.UsuarioBE.tipoDoc), nUsuUI[3].ToString());
            usuario.nroDocumento = nUsuUI[2].ToString();
            usuario.mail = nUsuUI[4].ToString();
            nTer.codTerminal = TerminalDAL.obtenerIdTerminal(nUsuUI[5].ToString());
            usuario.terminal = nTer;
            usuario.idioma = idiomaDAL.obtenerIdIdioma(nUsuUI[6]);
            usuario.contraseña = nUsuDAL.generarContraseña();
            usuario.DVH = DV.calcularDVH(usuario.nombre + usuario.apellido + usuario.tipoDocumento + usuario.nroDocumento + usuario.mail + usuario.terminal.codTerminal, NOMBRE_ENTIDAD_USUARIO);

            string resp = nUsuDAL.altaUsuario(usuario, ruta);

            DV.actualizarDVV(NOMBRE_ENTIDAD_USUARIO);

            bitacoraBLL.guardarLog(usuarioLog, 3, "Generación usuario " + resp, "Usuarios");
            
            return resp;

        }

        public List<string> tiposDoc()
        {
            List<string> lisTipos = new List<string>();

            lisTipos.Add(BE.UsuarioBE.tipoDoc.CUIL.ToString());
            lisTipos.Add(BE.UsuarioBE.tipoDoc.CUIT.ToString());
            lisTipos.Add(BE.UsuarioBE.tipoDoc.DNI.ToString());

            return lisTipos;
        }

        public bool modificarUsario(string[] nUsu, String usuarioLog)
        {
            BE.UsuarioBE nUsuario = new BE.UsuarioBE();
            BE.Terminal nTer = new BE.Terminal();

            nUsuario.codUsuario = nUsu[0].ToString();
            nUsuario.nombre = nUsu[1].ToString();
            nUsuario.apellido = nUsu[2].ToString();
            nUsuario.nroDocumento = nUsu[3].ToString();
            nUsuario.tipoDocumento = (BE.UsuarioBE.tipoDoc)Enum.Parse(typeof(BE.UsuarioBE.tipoDoc), nUsu[4].ToString());
            nUsuario.mail = nUsu[5].ToString();
            nTer.codTerminal = TerminalDAL.obtenerIdTerminal(nUsu[6].ToString());
            nUsuario.terminal = nTer;
            nUsuario.DVH = DV.calcularDVH(nEncrip.Encriptar3D(nUsuario.nombre) + nUsuario.apellido + nUsuario.tipoDocumento + nUsuario.nroDocumento + nUsuario.mail + nUsuario.terminal.codTerminal, NOMBRE_ENTIDAD_USUARIO);

            bool resp = nUsuDAL.modificarUsuario(nUsuario);

            DV.actualizarDVV(NOMBRE_ENTIDAD_USUARIO);

            bitacoraBLL.guardarLog(usuarioLog, 3, "Modificación usuario " + nUsuario.codUsuario, "Usuarios");

            return resp;
        }

        public List<string> patentesOtorgadas(string codUsu)
        {
            List<string> patOtor = new List<string>();

            nUsuario.codUsuario = codUsu;

            lPat = nUsuDAL.patentesOtorgadas(nUsuario);

            foreach(BE.PatenteBE pat in lPat)
            {
                patOtor.Add(pat.descripcion);
            }

            return patOtor;
            


        }

        public List<string> patentesNoOtorgadas(string codUsu)
        {
            List<string> patNoOtor = new List<string>();

            nUsuario.codUsuario = codUsu;

            lPat = nUsuDAL.patentesNoOtorgadas(nUsuario);

            foreach (BE.PatenteBE pat in lPat)
            {
                patNoOtor.Add(pat.descripcion);
            }

            return patNoOtor;
        }

        public bool asignarPatente(string usu, string pat, string codUsuario)
        {
            nUsuario.codUsuario = usu;
            patenteBE.idPatente = patDAL.obtenerIdPatente(pat);
            DV.calcularDVH(usu + pat, NOMBRE_ENTIDAD_USUARIOPATENTE);

            bool resp = nUsuDAL.asignarPatente(nUsuario, patenteBE, DV.calcularDVH(nUsuario.codUsuario + patenteBE.idPatente, NOMBRE_ENTIDAD_USUARIOPATENTE));

            DV.actualizarDVV(NOMBRE_ENTIDAD_USUARIOPATENTE);

            if (resp)
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Asignación de la patente " + pat + " al usuario " + usu, "Usuarios");

                return true;
            }

            return false;
        }

        public bool desAsignarPatente(string usu, string pat, string codUsuario)
        {
            nUsuario.codUsuario = usu;
            patenteBE.idPatente = patDAL.obtenerIdPatente(pat);

            bool resp = nUsuDAL.desAsignarPatente(nUsuario, patenteBE);

            DV.actualizarDVV(NOMBRE_ENTIDAD_USUARIOPATENTE);

            if (resp)
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Deasignación de la patente " + pat + " al usuario " + usu, "Usuarios");

                return true;
            }

            return false;
        }

        public bool negarPatente(string usu, string pat, string codUsuario)
        {
            nUsuario.codUsuario = usu;
            patenteBE.idPatente = patDAL.obtenerIdPatente(pat);
            
            bool resp = nUsuDAL.negarPatente(nUsuario, patenteBE, DV.calcularDVH(nUsuario.codUsuario + patenteBE.idPatente, NOMBRE_ENTIDAD_USUARIOPATENTE));

            DV.actualizarDVV(NOMBRE_ENTIDAD_USUARIOPATENTE);

            if (resp)
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Negación de patente " + pat + " al usuario " + usu, "Usuarios");

                return true;
            }

            return false;

        }

        public bool desNegarPatente(string usu, string pat, string codUsuario)
        {
            nUsuario.codUsuario = usu;
            patenteBE.idPatente = patDAL.obtenerIdPatente(pat);

            bool resp = nUsuDAL.desNegarPatente(nUsuario, patenteBE);

            DV.actualizarDVV(NOMBRE_ENTIDAD_USUARIOPATENTE);

            if (resp)
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Desnegación de la patente " + pat + " al usuario " + usu, "Usuarios");

                return true;
            }

            return false;
        }

        public List<string> patentesNegadas(string codUsu)
        {
            List<string> patNeg = new List<string>();

            nUsuario.codUsuario = codUsu;

            lPat = nUsuDAL.patentesNegadas(nUsuario);

            foreach (BE.PatenteBE pat in lPat)
            {
                patNeg.Add(pat.descripcion);
            }

            return patNeg;



        }

        public List<string> patentesNoNegadas(string codUsu)
        {
            List<string> patNoNeg = new List<string>();

            List<BE.PatenteBE> patentes = new List<BE.PatenteBE>();

            nUsuario.codUsuario = codUsu;

            //lPat = nUsuDAL.patentesNoNegadas(nUsuario);
            lPat = nUsuDAL.patentesNegadas(nUsuario);


            patentes = patDAL.listarPatentes();
            
            foreach (BE.PatenteBE pat in lPat)
            {
                patentes.Remove(pat);                
            }

            foreach(BE.PatenteBE pat in patentes)
            {
                patNoNeg.Add(pat.descripcion);
            }

            return patNoNeg;
        }

        public bool modificarIdioma(string idioma, string usuario)
        {
            BE.UsuarioBE nUsuario = new BE.UsuarioBE();
            BE.Idioma nIdioma = new BE.Idioma();

            nUsuario.codUsuario = usuario;
            nIdioma.idIdioma = idiomaDAL.obtenerIdIdioma(idioma);

            if(nUsuDAL.modificarIdioma(nUsuario, nIdioma))
            {
                bitacoraBLL.guardarLog(usuario, 3, "Cambio de idioma", "Usuarios");

                return true;
            }
            else
            {
                return false;
            }


        }


    }
}
