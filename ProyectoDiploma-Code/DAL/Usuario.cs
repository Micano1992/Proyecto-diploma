using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Usuario
    {
        ConexionesSQL nConexion = new ConexionesSQL();

        string sql;

        BE.PatenteBE nPat = new BE.PatenteBE();
        //BE.FamiliaBE nFam = new BE.FamiliaBE();
        List<BE.FamiliaBE> lFamilia = new List<BE.FamiliaBE>();

        public List<BE.FamiliaBE> familiaAsignada(BE.UsuarioBE nUsu)
        {

            lFamilia.Clear();

            sql = string.Format("Select * from dbo.FamiliaUSuario where cod_usuario = '{0}'", nUsu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            //reader.Read();
     

            if(reader.HasRows)
            {
                while (reader.Read())
                {
                    //nFam.idFamilia = int.Parse(reader.GetInt16(0).ToString());
                    //BE.FamiliaBE nFam = new BE.FamiliaBE() { idFamilia = int.Parse(reader[0].ToString()) };

                    BE.FamiliaBE nFam = new BE.FamiliaBE();

                    nFam.idFamilia = int.Parse(reader[0].ToString());

                    lFamilia.Add(nFam);

                    //reader.Read();
                }
            }
            

            nConexion.conexionBD(0);

            return lFamilia;

        }



        public void patentesAsignadas(BE.UsuarioBE nUsu, ref List<BE.PatenteBE> lPat)
        {
            sql = string.Format("Select * from dbo.UsuarioPatente where negado = 0 and cod_usuario = '{0}'", nUsu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();



            while (reader.Read())
            {
                BE.PatenteBE nPat = new BE.PatenteBE();

                nPat.idPatente = int.Parse(reader[0].ToString());

                lPat.Add(nPat);                

            }

            nConexion.conexionBD(0);

        }

        public void patentesNegadas(BE.UsuarioBE nUsu, ref List<BE.PatenteBE> lPat)
        {
            sql = string.Format("Select * from dbo.UsuarioPatente where negado = 1 and cod_usuario = '{0}'", nUsu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            

            while (reader.Read())
            {
                BE.PatenteBE nPat = new BE.PatenteBE();

                nPat.idPatente = int.Parse(reader[0].ToString());

                foreach (BE.PatenteBE negar in lPat)

                {
                    if (negar.idPatente == nPat.idPatente)
                    {
                        lPat.Remove(negar);

                        break;
                    }
                }

            }

            nConexion.conexionBD(0);
        }

    }
}
