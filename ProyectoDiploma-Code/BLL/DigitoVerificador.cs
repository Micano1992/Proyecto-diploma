using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DigitoVerificador
    {
        private const string NOMBRE_ENTIDAD_USUARIO = "Usuario";
        private const string NOMBRE_ENTIDAD_BITACORA = "Bitacora";
        private const string NOMBRE_ENTIDAD_USUARIOPATENTE = "UsuarioPatente";
        private const string NOMBRE_ENTIDAD_FAMILIAPATENTE = "FamiliaPatente";
        private const string NOMBRE_ENTIDAD_DOCUMENTO = "Documento";
        private const string NOMBRE_ENTIDAD_TANQUE = "Tanque";

        DAL.DigitoVerificador DVDAL = new DAL.DigitoVerificador();


        public int calcularDVH(string registroStr, string entidad)
        {
            int valorFinal = 0;
            int valorAscPosicion;
            char[] valorCharArray = registroStr.ToCharArray();
            for (int i = 0; i < valorCharArray.Length; i++)
            {
                valorAscPosicion = (valorCharArray[i] * (i + 1));
                valorFinal = valorFinal + valorAscPosicion;
            }

            actualizarDVV(entidad);

            return valorFinal;
        }

        public Boolean actualizarDVV(string entidad)
        {
            int sumaDVH;

            sumaDVH = DVDAL.obtenerSumaDVH(entidad);

            if (sumaDVH > -1)
            {
                if (DVDAL.actualizarDVV(entidad, sumaDVH))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }


    }
}
