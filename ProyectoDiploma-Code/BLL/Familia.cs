using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Familia
    {
        DAL.Familia FamiliaDAL = new DAL.Familia();

        List<string> lFami = new List<string>();
        List<BE.FamiliaBE> lFamilia = new List<BE.FamiliaBE>();
        List<BE.FamiliaBE> lFamilia2 = new List<BE.FamiliaBE>();

        BE.UsuarioBE nUsu = new BE.UsuarioBE();
        BE.FamiliaBE familiaBE = new BE.FamiliaBE();

        public bool crearFamilia(string desc)
        {
            BE.FamiliaBE nFam = new BE.FamiliaBE() { descripcion = desc };

            return FamiliaDAL.crearFamilia(nFam);

        }

        public List<string> listarFamilia()
        {
            lFami.Clear();

            foreach(BE.FamiliaBE fam in FamiliaDAL.listarFamilia())
            {
                lFami.Add(fam.descripcion);
            }

            return lFami;
        } 

        public bool eliminarFamilia(string descFam)
        {
            BE.FamiliaBE nFam = new BE.FamiliaBE() { descripcion = descFam };

            return FamiliaDAL.eliminarFamilia(nFam);
            
        }

        public List<string> listarFamiliasAsignadas(string usua)
        {
            lFami.Clear();

            nUsu.codUsuario = usua;

            lFamilia = FamiliaDAL.listarFamiliaUsuario(nUsu);

            foreach (BE.FamiliaBE fam in lFamilia)
            {
                lFami.Add(fam.descripcion);
            }

            return lFami;
        }

        public List<string> listarFamiliasNoAsignadas(string usu)
        {
            lFami.Clear();

            nUsu.codUsuario = usu;

            lFamilia = FamiliaDAL.listarFamilia();

            lFamilia2 = FamiliaDAL.listarFamiliaUsuario(nUsu);


            foreach (BE.FamiliaBE fam in lFamilia2)
            {
                foreach (BE.FamiliaBE fam2 in lFamilia)
                {
                    if (fam2.idFamilia == fam.idFamilia)
                    {
                        lFamilia.Remove(fam2);

                        break;
                    }

                }
            }

            foreach (BE.FamiliaBE fam in lFamilia)
            {

                lFami.Add(fam.descripcion);
            }

            return lFami;

        }

        public bool asignarFamiliaUsuario(string fam, string codUsu)
        {
            familiaBE.idFamilia = FamiliaDAL.obtenerIdFamilia(fam);
            nUsu.codUsuario = codUsu;

            return FamiliaDAL.asignarFamiliaUsuario(familiaBE, nUsu);

        }

        public bool desAsignarFamiliaUsuario(string fam, string codUsu)
        {
            familiaBE.idFamilia = FamiliaDAL.obtenerIdFamilia(fam);
            nUsu.codUsuario = codUsu;

            return FamiliaDAL.desAsignarFamiliaUsuario(familiaBE, nUsu);
        }
    }
}
