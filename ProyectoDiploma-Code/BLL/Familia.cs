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
        List<BE.Familia> lFamilia = new List<BE.Familia>();
        List<BE.Familia> lFamilia2 = new List<BE.Familia>();

        BE.UsuarioBE nUsu = new BE.UsuarioBE();
        BE.Familia familiaBE = new BE.Familia();
        BE.Bitácora bitacoraBE = new BE.Bitácora();

        private const string NOMBRE_ENTIDAD_BITACORA = "Bitacora";
        private const string NOMBRE_ENTIDAD_FAMILIAPATENTE = "FamiliaPatente";


        public bool crearFamilia(string desc, string codUsuario)
        {
            BE.Familia nFam = new BE.Familia() { descripcion = desc };

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

            foreach(BE.Familia fam in FamiliaDAL.listarFamilia())
            {
                lFami.Add(fam.descripcion);
            }

            return lFami;
        } 

        public bool eliminarFamilia(string descFam, string codUsuario)
        {
            BE.Familia nFam = new BE.Familia() { descripcion = descFam };
                        
            if (FamiliaDAL.eliminarFamilia(nFam))
            {
                bitacoraBLL.guardarLog(codUsuario, 2, "Se eliminó la familia " + descFam, "Familias");

                DV.actualizarDVV(NOMBRE_ENTIDAD_FAMILIAPATENTE);

                return true;
            }

            return false;

        }

        public List<string> listarFamiliasAsignadas(string usua)
        {
            lFami.Clear();

            nUsu.codUsuario = usua;

            lFamilia = FamiliaDAL.listarFamiliaUsuario(nUsu);

            foreach (BE.Familia fam in lFamilia)
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


            foreach (BE.Familia fam in lFamilia2)
            {
                foreach (BE.Familia fam2 in lFamilia)
                {
                    if (fam2.idFamilia == fam.idFamilia)
                    {
                        lFamilia.Remove(fam2);

                        break;
                    }

                }
            }

            foreach (BE.Familia fam in lFamilia)
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
