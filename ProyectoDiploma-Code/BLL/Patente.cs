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
        List<BE.PatenteBE> lisPat = new List<BE.PatenteBE>();
        List<BE.PatenteBE> lisPate = new List<BE.PatenteBE>();

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

        public bool asignarPatenteFamilia(string fam, string pat)
        {
            PatBE.idPatente = PatDAL.obtenerIdPatente(pat);
            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fam);

            return PatDAL.asignarPatenteFamilia(FamBE, PatBE);        }

        public bool desAsignarPatenteFamilia(string fam, string pat)
        {
            PatBE.idPatente = PatDAL.obtenerIdPatente(pat);
            FamBE.idFamilia = FamDAL.obtenerIdFamilia(fam);
            
            return PatDAL.desAsignarPatenteFamilia(FamBE, PatBE);
        }


    }
}
