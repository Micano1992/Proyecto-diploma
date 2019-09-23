using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Patente
    {
        ConexionesSQL nConexion = new ConexionesSQL();
        List<BE.PatenteBE> lPat = new List<BE.PatenteBE>();

        string sql;

        //string sql2;

        public void patentesFamilias(List<BE.FamiliaBE> lFam, ref List<BE.PatenteBE> lPat)
        {
            //sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

            //nConexion.conexionBD(1, sql);

            //SqlDataReader reader = nConexion.nCom.ExecuteReader();

            foreach (BE.FamiliaBE fam in lFam)
            {
                sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

                nConexion.conexionBD(1, sql);

                SqlDataReader reader = nConexion.nCom.ExecuteReader();

                while (reader.Read())
                {
                    BE.PatenteBE nPat = new BE.PatenteBE();

                    nPat.idPatente = int.Parse(reader[1].ToString());

                    lPat.Add(nPat);

                }

                nConexion.conexionBD(0);

            }


        }

        public void patentesFamilias(BE.FamiliaBE familia, ref List<BE.PatenteBE> lPat)
        {
            //sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

            //nConexion.conexionBD(1, sql);

            //SqlDataReader reader = nConexion.nCom.ExecuteReader();

            sql = String.Format("Select a.Id_patente, b.Descripcion_patente from dbo.FamiliaPatente a left join dbo.Patente b on b.Id_patente = a.Id_patente where id_familia = (Select id_familia from dbo.Familia where descripcion_familia = '{0}')", familia.descripcion);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.PatenteBE nPat = new BE.PatenteBE();

                nPat.idPatente = int.Parse(reader[0].ToString());
                nPat.descripcion = reader[1].ToString();

                    lPat.Add(nPat);

                }

            

            nConexion.conexionBD(0);

        }

        public List<BE.PatenteBE> listarPatentes()
        {
            lPat.Clear();

            sql = "Select * from dbo.Patente";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.PatenteBE nPat = new BE.PatenteBE();

                nPat.idPatente = int.Parse(reader[0].ToString());
                nPat.descripcion = reader[1].ToString();

                lPat.Add(nPat);

            }

            nConexion.conexionBD(0);

            return lPat;

        }

        public int obtenerIdPatente(string desc)
        {
            sql = string.Format("Select * from dbo.Patente where Descripcion_patente = '{0}'", desc);

            nConexion.conexionBD(1, sql);

            int resul = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

            nConexion.conexionBD(0);

            return resul;
        }

        public bool asignarPatenteFamilia(BE.FamiliaBE fami, BE.PatenteBE pate)
        {
            sql = string.Format("Insert into dbo.FamiliaPatente (id_familia, id_patente) values ({0}, {1})", fami.idFamilia, pate.idPatente);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;

        }

        public bool desAsignarPatenteFamilia(BE.FamiliaBE fami, BE.PatenteBE pate)
        {
            sql = string.Format("Delete from dbo.FamiliaPatente where id_familia = {0} and id_patente = {1}", fami.idFamilia, pate.idPatente);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
            
        }



    }
}
