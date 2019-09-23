using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL
{
    public class UsuarioBLL
    {
        BE.UsuarioBE nUsuario = new BE.UsuarioBE();
        BE.PatenteBE patenteBE = new BE.PatenteBE();
        DAL.Usuario nUsuDAL = new DAL.Usuario();
        DAL.Patente patDAL = new DAL.Patente();
        DAL.Terminal TerminalDAL = new DAL.Terminal();
        DAL.Idioma idiomaDAL = new DAL.Idioma();

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

            string[] nUsuario = new string[8];

            nUsuario[0] = "";
            nUsuario[1] = "";
            nUsuario[2] = "";
            nUsuario[3] = "";
            nUsuario[4] = "";
            nUsuario[5] = "";
            nUsuario[6] = "";
            nUsuario[7] = "";

            nUsuario[0] = usu.codUsuario;
            nUsuario[1] = usu.nombre;
            nUsuario[2] = usu.apellido;
            nUsuario[3] = usu.nroDocumento;
            nUsuario[4] = usu.tipoDocumento.ToString();
            nUsuario[5] = usu.bloqueado.ToString();
            nUsuario[6] = usu.mail;
            nUsuario[7] = usu.terminal.descripcionTerminal.ToString();

            return nUsuario;

        }

        private string generarContraseña()
        {
            string passwordAleatorio;
            string s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random rd = new Random();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 8; i++)
            {
                int idx = rd.Next(0, 10);
                sb.Append(s.Substring(idx, 1));
            }
            passwordAleatorio = sb.ToString();
            return passwordAleatorio;
        }

        public string altaUsurio(string[] nUsuUI)
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
            usuario.contraseña = generarContraseña();

            return nUsuDAL.altaUsuario(usuario);

        }

        public List<string> tiposDoc()
        {
            List<string> lisTipos = new List<string>();

            lisTipos.Add(BE.UsuarioBE.tipoDoc.CUIL.ToString());
            lisTipos.Add(BE.UsuarioBE.tipoDoc.CUIT.ToString());
            lisTipos.Add(BE.UsuarioBE.tipoDoc.DNI.ToString());

            return lisTipos;
        }

        public bool modificarUsario(string[] nUsu)
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

            return nUsuDAL.modificarUsuario(nUsuario);
            

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

        public bool asignarPatente(string usu, string pat)
        {
            nUsuario.codUsuario = usu;
            patenteBE.idPatente = patDAL.obtenerIdPatente(pat);

            return nUsuDAL.asignarPatente(nUsuario, patenteBE);
        }

        public bool desAsignarPatente(string usu, string pat)
        {
            nUsuario.codUsuario = usu;
            patenteBE.idPatente = patDAL.obtenerIdPatente(pat);

            return nUsuDAL.desAsignarPatente(nUsuario, patenteBE);
        }


    }
}
