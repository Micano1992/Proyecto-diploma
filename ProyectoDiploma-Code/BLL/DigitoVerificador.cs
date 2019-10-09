using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class DigitoVerificador
    {



        public int calcularDVH(string registroStr)
        {
            int valorFinal = 0;
            int valorAscPosicion;
            char[] valorCharArray = registroStr.ToCharArray();
            for (int i = 0; i < valorCharArray.Length; i++)
            {
                valorAscPosicion = (valorCharArray[i] * (i + 1));
                valorFinal = valorFinal + valorAscPosicion;
            }
            return valorFinal;
        }

        public int recalcularDVV()
        {
            return -1;
        }
    }
}
