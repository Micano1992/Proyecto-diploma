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
    }
}
