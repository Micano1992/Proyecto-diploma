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
        //BLL.Bitácora bitacoraBLL = new BLL.Bitácora();


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

            //actualizarDVV(entidad);

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

        public string[] verificarDV()
        {
            BE.Bitácora bitacoraBE = new BE.Bitácora();

            string[] verificacion = new string[2];
            string log = "";

            verificacion[0] = "";
            verificacion[1] = "";

            DVDAL.verificarDVH(NOMBRE_ENTIDAD_USUARIO, ref verificacion[0]);
            DVDAL.verificarDVH(NOMBRE_ENTIDAD_BITACORA, ref verificacion[0]);
            DVDAL.verificarDVH(NOMBRE_ENTIDAD_USUARIOPATENTE, ref verificacion[0]);
            DVDAL.verificarDVH(NOMBRE_ENTIDAD_FAMILIAPATENTE, ref verificacion[0]);
            DVDAL.verificarDVH(NOMBRE_ENTIDAD_DOCUMENTO, ref verificacion[0]);
            DVDAL.verificarDVH(NOMBRE_ENTIDAD_TANQUE, ref verificacion[0]);

            DVDAL.verificarDVV(NOMBRE_ENTIDAD_USUARIO, ref verificacion[1]);
            DVDAL.verificarDVV(NOMBRE_ENTIDAD_BITACORA, ref verificacion[1]);
            DVDAL.verificarDVV(NOMBRE_ENTIDAD_USUARIOPATENTE, ref verificacion[1]);
            DVDAL.verificarDVV(NOMBRE_ENTIDAD_FAMILIAPATENTE, ref verificacion[1]);
            DVDAL.verificarDVV(NOMBRE_ENTIDAD_DOCUMENTO, ref verificacion[1]);
            DVDAL.verificarDVV(NOMBRE_ENTIDAD_TANQUE, ref verificacion[1]);

            #region bita

            string[] separar;

            if(verificacion[0] != "")
            {
                separar = verificacion[0].Split('\n');

                for (int i = 0; i < separar.Length - 1; i++)
                {
                    bitacoraBE.codUsuario = "-";
                    bitacoraBE.criticidad = "ALTA";
                    ////bitacoraBE.descripcion = verificacion[0] + verificacion[1];
                    bitacoraBE.descripcion = "Error DVH: " + separar[i];
                    bitacoraBE.fecha = DateTime.Now;
                    bitacoraBE.funcionalidad = "DV";
                    bitacoraBE.DVH = calcularDVH(bitacoraBE.descripcion + bitacoraBE.codUsuario + bitacoraBE.criticidad, NOMBRE_ENTIDAD_BITACORA);

                    DAL.Bitacora.GetInstance().guardarLog(bitacoraBE);
                }

                actualizarDVV(NOMBRE_ENTIDAD_BITACORA);
            }

            if (verificacion[1] != "")
            {
                separar = verificacion[1].Split('\n');

                for (int i = 0; i < separar.Length - 1; i++)
                {
                    bitacoraBE.codUsuario = "-";
                    bitacoraBE.criticidad = "ALTA";
                    ////bitacoraBE.descripcion = verificacion[0] + verificacion[1];
                    bitacoraBE.descripcion = "Error DVV: " + separar[i];
                    bitacoraBE.fecha = DateTime.Now;
                    bitacoraBE.funcionalidad = "DV";
                    bitacoraBE.DVH = calcularDVH(bitacoraBE.descripcion + bitacoraBE.codUsuario + bitacoraBE.criticidad, NOMBRE_ENTIDAD_BITACORA);

                    DAL.Bitacora.GetInstance().guardarLog(bitacoraBE);
                }

                actualizarDVV(NOMBRE_ENTIDAD_BITACORA);
            }



            //    if (verificacion[0] != "" || verificacion[1] != "")
            //{
            //    bitacoraBE.codUsuario = "-";
            //    bitacoraBE.criticidad = "ALTA";
            //    ////bitacoraBE.descripcion = verificacion[0] + verificacion[1];
            //    bitacoraBE.descripcion = "Error en verificación";
            //    bitacoraBE.fecha = DateTime.Now;
            //    bitacoraBE.funcionalidad = "DV";
            //    bitacoraBE.DVH = calcularDVH(bitacoraBE.descripcion + bitacoraBE.codUsuario + bitacoraBE.criticidad, NOMBRE_ENTIDAD_BITACORA);

            //    DAL.Bitacora.GetInstance().guardarLog(bitacoraBE);

            //    actualizarDVV(NOMBRE_ENTIDAD_BITACORA);
            //}

            #endregion



            return verificacion;
        }

        public void recalcularDV(string codUsuario)
        {
            BE.Bitácora bitacoraBE = new BE.Bitácora();

            DVDAL.recalcularDV(NOMBRE_ENTIDAD_USUARIO);
            DVDAL.recalcularDV(NOMBRE_ENTIDAD_BITACORA);
            DVDAL.recalcularDV(NOMBRE_ENTIDAD_USUARIOPATENTE);
            DVDAL.recalcularDV(NOMBRE_ENTIDAD_FAMILIAPATENTE);
            DVDAL.recalcularDV(NOMBRE_ENTIDAD_TANQUE);
            DVDAL.recalcularDV(NOMBRE_ENTIDAD_DOCUMENTO);

            bitacoraBE.codUsuario = codUsuario;
            bitacoraBE.criticidad = "ALTA";
            bitacoraBE.descripcion = "Recálculo de dígitos verificadores";
            bitacoraBE.fecha = DateTime.Now;
            bitacoraBE.funcionalidad = "DV";
            bitacoraBE.DVH = calcularDVH(bitacoraBE.descripcion + bitacoraBE.codUsuario + bitacoraBE.criticidad, NOMBRE_ENTIDAD_BITACORA);

            DAL.Bitacora.GetInstance().guardarLog(bitacoraBE);

        }

    }
}
