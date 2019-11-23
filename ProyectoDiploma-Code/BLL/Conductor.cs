using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Conductor
    {
        DAL.Conductor conductorDAL = new DAL.Conductor();
        BE.Conductor nConduc = new BE.Conductor();
        BLL.Bitácora bitacoraBLL = new Bitácora();

        public bool crearConductor(string apellido, string nombre, string patente, string nroDoc, string codUsuario)
        {
            nConduc.apellido = apellido;
            nConduc.nombre = nombre;
            nConduc.patente = patente;
            nConduc.nroDocumento = nroDoc;

            if (conductorDAL.crearConductor(nConduc))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Generación conductor " + nConduc.apellido + " Patente: " + nConduc.nroDocumento, "Conductor");

                return true;
            }
            return false;

        }

        public bool modificarConductor(int id, string apellido, string nombre, string patente, string nroDoc, string codUsuario)
        {
            nConduc.idConductor = id;
            nConduc.apellido = apellido;
            nConduc.nombre = nombre;
            nConduc.patente = patente;
            nConduc.nroDocumento = nroDoc;

            if (conductorDAL.modificarConductor(nConduc))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Modificación conductor " + nConduc.apellido + " Patente: " + nConduc.nroDocumento, "Conductor");

                return true;
            }
            return false;

        }

        public bool inactivarConductor(int id, string codUsuario)
        {
            nConduc.idConductor = id;

            if (conductorDAL.inactivarConductor(nConduc, 1))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Desactivación conductor " + id.ToString(), "Conductor");

                return true;
            }
            else
            {
                return false;
            }

        }

        public bool activarConductor(int id, string codUsuario)
        {
            nConduc.idConductor = id;

            if (conductorDAL.inactivarConductor(nConduc, 0))
            {
                bitacoraBLL.guardarLog(codUsuario, 3, "Activación conductor " + id.ToString(), "Conductor");

                return true;
            }
            else
            {
                return false;
            }
        }

        public List<string[]> listarConductor()
        {
            List<string[]> lConductor = new List<string[]>();
            
            foreach (BE.Conductor cond in conductorDAL.listarConductor())
            {
                string[] nCond = new string[6];

                nCond[0] = cond.idConductor.ToString();
                nCond[1] = cond.nombre;
                nCond[2] = cond.apellido;
                nCond[3] = cond.nroDocumento;
                nCond[4] = cond.activo.ToString();
                nCond[5] = cond.patente;

                lConductor.Add(nCond);
            }


            return lConductor;
        }
    }
}
