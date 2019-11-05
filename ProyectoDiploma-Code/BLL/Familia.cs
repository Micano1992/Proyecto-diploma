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

        BLL.DigitoVerificador DV = new DigitoVerificador();
        BLL.Bitácora bitacoraBLL = new Bitácora();

        List<string> lFami = new List<string>();
        List<BE.FamiliaBE> lFamilia = new List<BE.FamiliaBE>();
        List<BE.FamiliaBE> lFamilia2 = new List<BE.FamiliaBE>();

        BE.UsuarioBE nUsu = new BE.UsuarioBE();
        BE.FamiliaBE familiaBE = new BE.FamiliaBE();
        BE.Bitácora bitacoraBE = new BE.Bitácora();

        private const string NOMBRE_ENTIDAD_BITACORA = "Bitacora";


        public bool crearFamilia(string desc, string codUsuario)
        {
            BE.FamiliaBE nFam = new BE.FamiliaBE() { descripcion = desc };

            if(FamiliaDAL.crearFamilia(nFam))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Generación familia " + desc, "Familias");
                
                return true;
            }

            return false;
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

        public bool eliminarFamilia(string descFam, string codUsuario)
        {
            BE.FamiliaBE nFam = new BE.FamiliaBE() { descripcion = descFam };
                        
            if (FamiliaDAL.eliminarFamilia(nFam))
            {
                bitacoraBLL.guardarLog(codUsuario, 2, "Se eliminó la familia " + descFam, "Familias");

                return true;
            }

            return false;

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

        public bool asignarFamiliaUsuario(string fam, string codUsu, string codUsuario)
        {
            familiaBE.idFamilia = FamiliaDAL.obtenerIdFamilia(fam);
            nUsu.codUsuario = codUsu;

            if (FamiliaDAL.asignarFamiliaUsuario(familiaBE, nUsu))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Asignación de familia " + fam + " al usuario " + codUsu, "Familias");

                return true;
            }

            return false;

        }

        public bool desAsignarFamiliaUsuario(string fam, string codUsu, string codUsuario)
        {
            familiaBE.idFamilia = FamiliaDAL.obtenerIdFamilia(fam);
            nUsu.codUsuario = codUsu;

            if (FamiliaDAL.desAsignarFamiliaUsuario(familiaBE, nUsu))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Desasignación de familia " + fam + " al usuario " + codUsu, "Familias");
                              
                return true;
            }

            return false;
        }

    }
}
