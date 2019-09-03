using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class UsuarioDAL
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

        public void patentesFamilias(List<BE.FamiliaBE> lFam, ref List<BE.PatenteBE> lPat)
        {
            //sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

            //nConexion.conexionBD(1, sql);

            //SqlDataReader reader = nConexion.nCom.ExecuteReader();

            foreach (BE.FamiliaBE fam in lFam )
            {
                sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

                nConexion.conexionBD(1, sql);

                SqlDataReader reader = nConexion.nCom.ExecuteReader();

                reader.Read();

                while(reader.HasRows)
                {
                    nPat.idPatente = reader.GetInt16(2);

                    lPat.Add(nPat);

                    reader.Read();
                }

            }

            nConexion.conexionBD(0);

        }

        public void patentesAsignadas(BE.UsuarioBE nUsu, ref List<BE.PatenteBE> lPat)
        {
            sql = string.Format("Select * from dbo.UsuarioPatente where bloqueado = 0 and codUsuario = '{0}'", nUsu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            reader.Read();

            while(reader.HasRows)
            {
                nPat.idPatente = reader.GetInt16(1);

                lPat.Add(nPat);                

                reader.Read();
            }

            nConexion.conexionBD(0);

        }

        public void patentesNegadas(BE.UsuarioBE nUsu, ref List<BE.PatenteBE> lPat)
        {
            sql = string.Format("Select * from dbo.UsuarioPatente where bloqueado = 1 and codUsuario = '{0}'", nUsu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            reader.Read();

            while (reader.HasRows)
            {
                nPat.idPatente = reader.GetInt16(1);

                lPat.Remove(nPat);  

                reader.Read();
            }

            nConexion.conexionBD(0);
        }

    }
}
