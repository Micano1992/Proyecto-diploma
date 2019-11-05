using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL
{
    public class Patente
    {
        DAL.Patente PatDAL = new DAL.Patente();
        DAL.Familia FamDAL = new DAL.Familia();
        BE.PatenteBE PatBE = new BE.PatenteBE();
        BE.FamiliaBE FamBE = new BE.FamiliaBE();
        BE.UsuarioBE UsuBE = new BE.UsuarioBE();
        BLL.Usuario usuBLL = new Usuario();
        BLL.Bitácora bitacoraBLL = new Bitácora();
        List<BE.PatenteBE> lisPat = new List<BE.PatenteBE>();
        List<BE.PatenteBE> lisPate = new List<BE.PatenteBE>();
        List<BE.FamiliaBE> listaFami = new List<BE.FamiliaBE>();
        BLL.DigitoVerificador DV = new DigitoVerificador();

        private const string NOMBRE_ENTIDAD_FAMILIAPATENTE = "FamiliaPatente";


        List<string> listaP = new List<string>();
        List<string> listarPate = new List<string>();

        public List<string> listarPatentes()
        {
            listaP.Clear();

            foreach(BE.PatenteBE pat in PatDAL.listarPatentes())
            {
                listaP.Add(pat.descripcion);
            }

            return listaP;
        }

        public List<string> listarPatentesAsignadas(string fami)
        {            
            listaP.Clear();

            lisPat.Clear();

            FamBE.descripcion = fami;

            PatDAL.patentesFamilias(FamBE, ref lisPat);

            foreach (BE.PatenteBE pat in lisPat)
            {
                listaP.Add(pat.descripcion);
            }

            return listaP;
        }

        public List<string> listarPatentesNoAsignadas(string fami)
        {
            listaP.Clear();
            listarPate.Clear();
            lisPate.Clear();

            lisPat = PatDAL.listarPatentes();

            FamBE.descripcion = fami;
            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fami);

            PatDAL.patentesFamilias(FamBE, ref lisPate);

            foreach (BE.PatenteBE pat in lisPate)
            {
                foreach(BE.PatenteBE pat2 in lisPat)
                {
                    if(pat2.idPatente == pat.idPatente)
                    {
                        lisPat.Remove(pat2);

                        break;
                    }

                }
            }

            foreach(BE.PatenteBE pat in lisPat)
            {

                listarPate.Add(pat.descripcion);
            }

            return listarPate;

        }

        public List<string> listarPatentesNoAsignadas(List<string> fami)
        {
            listaP.Clear();
            listarPate.Clear();
            lisPate.Clear();

            lisPat = PatDAL.listarPatentes();

            foreach (string i in fami)
            {
                FamBE.descripcion = i;
                FamBE.idFamilia = FamDAL.obtenerIdFamilia(i);

                listaFami.Add(FamBE);
            }

            PatDAL.patentesFamilias(FamBE, ref lisPate);

            foreach (BE.PatenteBE pat in lisPate)
            {
                foreach (BE.PatenteBE pat2 in lisPat)
                {
                    if (pat2.idPatente == pat.idPatente)
                    {
                        lisPat.Remove(pat2);

                        break;
                    }

                }
            }

            foreach (BE.PatenteBE pat in lisPat)
            {

                listarPate.Add(pat.descripcion);
            }

            return listarPate;

        }

        public bool asignarPatenteFamilia(string fam, string pat, string codUsuario)
        {
            PatBE.idPatente = PatDAL.obtenerIdPatente(pat);
            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fam);
            int DVH = DV.calcularDVH(FamBE.idFamilia.ToString() + PatBE.idPatente.ToString(), NOMBRE_ENTIDAD_FAMILIAPATENTE);

            DV.actualizarDVV(NOMBRE_ENTIDAD_FAMILIAPATENTE);

            if (PatDAL.asignarPatenteFamilia(FamBE, PatBE, DVH))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Asignación de la patente " + pat + " a la familia " + fam, "Familias");

                return true;
            }

            return false;


        }

        public bool desAsignarPatenteFamilia(string fam, string pat, string codUsuario)
        {
            PatBE.idPatente = PatDAL.obtenerIdPatente(pat);
            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fam);

           if (PatDAL.desAsignarPatenteFamilia(FamBE, PatBE))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Desasignación de la patente " + pat + " a la familia " + fam, "Familias");

                return true;
            }

            return false;

        }

        public List<string> verificarPatentes(string pat, string usu)
        {
            List<string> lisUsu = new List<string>();

            PatBE.idPatente = PatDAL.obtenerIdPatente(pat);
            UsuBE.codUsuario = usu;

            foreach(BE.UsuarioBE u in PatDAL.verificarPatentes(PatBE, UsuBE))
            {
                lisUsu.Add(u.codUsuario);
            }

            return lisUsu;

        }

        public List<string> verificarPatentes(string usu)
        {
            List<string> lisPat = new List<string>();

            lisPat.Clear();

            UsuBE.codUsuario = usu;

            List<int> lnum = usuBLL.listarPatentes(usu);

            foreach (int p in lnum)
            {
                BE.PatenteBE nPat = new BE.PatenteBE();

                nPat.idPatente = p;

                nPat.descripcion = PatDAL.obtenerDescripcionPatente(p);

                if (PatDAL.verificarPatentes(nPat, UsuBE).Count == 0)
                {
                    lisPat.Add(nPat.descripcion);
                }
            }
            
            return lisPat;
        }

        public List<string> verificarPatentesFamilia(string fam)
        {
            List<string> lisPa = new List<string>();

            lisPat.Clear();
            lisPa.Clear();

            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fam);
            FamBE.descripcion = fam;

            PatDAL.patentesFamilias(FamBE, ref lisPat);
          
            foreach (BE.PatenteBE p in lisPat)
            {
                if (PatDAL.verificarPatentes(p, FamBE).Count == 0)
                {
                    lisPa.Add(PatDAL.obtenerDescripcionPatente(p.idPatente));
                }
            }

            return lisPa;
        }

        public bool verificarPatenteFamilia(string fam, string pat)
        {
            lisPat.Clear();
            List<string> lisPa = new List<string>();

            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fam);
            FamBE.descripcion = fam;

            PatBE.idPatente = PatDAL.obtenerIdPatente(pat);

            if (PatDAL.verificarPatentes(PatBE, FamBE).Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
       
        }

        public List<string> verificarPatentesFamilia(string fam, string usu)
        {
            List<string> lisPa = new List<string>();

            lisPat.Clear();
            lisPa.Clear();

            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fam);
            FamBE.descripcion = fam;

            PatDAL.patentesFamilias(FamBE, ref lisPat);

            UsuBE.codUsuario = usu;

            foreach (BE.PatenteBE p in lisPat)
            {
                if (PatDAL.verificarPatentes(p, FamBE, UsuBE).Count == 0)
                {
                    lisPa.Add(PatDAL.obtenerDescripcionPatente(p.idPatente));
                }
            }

            return lisPa;
        }

    }
}
