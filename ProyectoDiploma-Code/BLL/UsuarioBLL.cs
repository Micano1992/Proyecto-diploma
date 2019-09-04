﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UsuarioBLL
    {
        BE.UsuarioBE nUsuario = new BE.UsuarioBE();
        DAL.UsuarioDAL nUsuDAL = new DAL.UsuarioDAL();

        List<int> listaPat = new List<int>();
        List<BE.PatenteBE> lPat = new List<BE.PatenteBE>();

        public List<int> listarPatentes(string codUsuario)
        {
            listaPat.Clear();

            lPat.Clear();

            nUsuario.codUsuario = codUsuario;

            nUsuDAL.patentesFamilias(nUsuDAL.familiaAsignada(nUsuario), ref lPat);

            nUsuDAL.patentesAsignadas(nUsuario, ref lPat);

            nUsuDAL.patentesNegadas(nUsuario, ref lPat);

            foreach(BE.PatenteBE pat in lPat)
            {
                listaPat.Add(pat.idPatente);
            }
 

            return listaPat;


        }


    }
}
