using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Bitácora
    {
        private const string CRITICIDAD_ALTA = "ALTA"; //1
        private const string CRITICIDAD_MEDIA = "MEDIA"; //2
        private const string CRITICIDAD_BAJA = "BAJA"; //3

        private const string NOMBRE_ENTIDAD_BITACORA = "Bitacora";

        DAL.Bitacora bitacoraDAL = new DAL.Bitacora();
        BE.Bitácora bitacoraBE = new BE.Bitácora();
        BLL.DigitoVerificador DV = new DigitoVerificador();

        public void guardarLog(string codUsuario, int criticidad, string descripcion, string funcionalidad)
        {
                bitacoraBE.codUsuario = codUsuario;
            switch(criticidad)
            {
                case 1:
                    bitacoraBE.criticidad = CRITICIDAD_ALTA;
                    break;

                case 2:
                    bitacoraBE.criticidad = CRITICIDAD_MEDIA;
                    break;

                case 3:
                    bitacoraBE.criticidad = CRITICIDAD_BAJA;
                    break;



            }
                
                bitacoraBE.descripcion = descripcion;
                bitacoraBE.fecha = DateTime.Now;
                bitacoraBE.funcionalidad = funcionalidad;
                bitacoraBE.DVH = DV.calcularDVH(bitacoraBE.descripcion + bitacoraBE.codUsuario + bitacoraBE.criticidad, NOMBRE_ENTIDAD_BITACORA);
                DAL.Bitacora.GetInstance().guardarLog(bitacoraBE);

                DV.actualizarDVV(NOMBRE_ENTIDAD_BITACORA);

        }

        public List<string[]> listarBitacora()
        {
            List<string[]> lista = new List<string[]>();

            foreach (BE.Bitácora log in bitacoraDAL.listarBitacora())
            {
                string[] nBit = new string[8];

                nBit[0] = log.id_log.ToString();
                nBit[1] = log.descripcion;
                nBit[2] = log.codUsuario;
                nBit[3] = log.fecha.ToString();
                nBit[4] = log.criticidad;
                nBit[5] = log.funcionalidad;


                lista.Add(nBit);

            }

            return lista;
        }

        public List<string[]> listarBitacora(string criti = null, string codUsuario = null, DateTime? fechaD = null, DateTime? fechaH = null)
        {
            List<string[]> lista = new List<string[]>();

            BE.Bitácora nBitac = new BE.Bitácora();
            nBitac.criticidad = criti;
            nBitac.codUsuario = codUsuario;

            DateTime fecD = fechaD ?? DateTime.MinValue;
            DateTime fecH = fechaH ?? DateTime.MinValue;


            foreach (BE.Bitácora log in bitacoraDAL.listarBitacora(nBitac, fecD, fecH))
            {
                string[] nBit = new string[8];

                nBit[0] = log.id_log.ToString();
                nBit[1] = log.descripcion;
                nBit[2] = log.codUsuario;
                nBit[3] = log.fecha.ToString();
                nBit[4] = log.criticidad;
                nBit[5] = log.funcionalidad;


                lista.Add(nBit);

            }

            return lista;
        }
    }
}
