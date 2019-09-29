using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Familia
    {
        string sql;

        List<BE.FamiliaBE> lFamilia = new List<BE.FamiliaBE>();

        ConexionesSQL nConexion = new ConexionesSQL();

        public bool crearFamilia(BE.FamiliaBE fami)
        {
            sql = string.Format("Insert into dbo.Familia (Descripcion_familia) values ('{0}')", fami.descripcion);

            nConexion.conexionBD(1, sql);

            if(nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public List<BE.FamiliaBE> listarFamilia()
        {
            List<BE.FamiliaBE> lFamilia = new List<BE.FamiliaBE>();

            sql = "Select * from dbo.Familia";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while(reader.Read())
            {
                BE.FamiliaBE nFam = new BE.FamiliaBE();

                nFam.idFamilia = int.Parse( reader[0].ToString());
                nFam.descripcion = reader[1].ToString();

                lFamilia.Add(nFam);
            }

            nConexion.conexionBD(0);

            return lFamilia;
        }

        public bool eliminarFamilia(BE.FamiliaBE fami)
        {
            sql = string.Format("Delete from dbo.Familia where Descripcion_familia = '{0}'", fami.descripcion);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;

        }

        public int obtenerIdFamilia(string desc)
        {
            sql = string.Format("Select id_familia from dbo.Familia where Descripcion_familia = '{0}'", desc);

            nConexion.conexionBD(1, sql);

            int resul = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

            nConexion.conexionBD(0);

            return resul;
        }

        //public bool asignarPatenteFamilia(BE.FamiliaBE fami, BE.PatenteBE pate)
        //{
        //    sql = string.Format("Insert into dbo.FamiliaPatente (id_familia, id_patente) values ({0}, {1})", fami.idFamilia, pate.idPatente);

        //    nConexion.conexionBD(1, sql);

        //    if (nConexion.nCom.ExecuteNonQuery() > 0)
        //    {
        //        nConexion.conexionBD(0);

        //        return true;
        //    }

        //    nConexion.conexionBD(0);

        //    return false;


        //    return true;
        //}

        //public bool desAsignarPatenteFamilia(BE.FamiliaBE fami, BE.PatenteBE pate)
        //{
        //    sql = string.Format("Delete from dbo.FamiliaPatente where id_familia = {0} and id_patente = {1}", fami.idFamilia, pate.idPatente);

        //    nConexion.conexionBD(1, sql);

        //    if (nConexion.nCom.ExecuteNonQuery() > 0)
        //    {
        //        nConexion.conexionBD(0);

        //        return true;
        //    }

        //    nConexion.conexionBD(0);

        //    return false;


        //    return true;
        //}

        public List<BE.FamiliaBE> listarFamiliaUsuario(BE.UsuarioBE usuar)
        {
            sql = String.Format("select b.* from dbo.FamiliaUsuario a left join dbo.Familia b on b.Id_familia = a.Id_familia where a.Cod_usuario = '{0}'", usuar.codUsuario);

            lFamilia.Clear();

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.FamiliaBE nFam = new BE.FamiliaBE();

                nFam.idFamilia = int.Parse(reader[0].ToString());
                nFam.descripcion = reader[1].ToString();

                lFamilia.Add(nFam);

            }

            nConexion.conexionBD(0);

            return lFamilia;

        }


        public bool asignarFamiliaUsuario(BE.FamiliaBE fami, BE.UsuarioBE usu)
        {
            sql = string.Format("Insert into dbo.FamiliaUsuario (id_familia, cod_usuario) values ({0}, '{1}')", fami.idFamilia, usu.codUsuario);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;

        }

        public bool desAsignarFamiliaUsuario(BE.FamiliaBE fami, BE.UsuarioBE usu)
        {
            sql = string.Format("Delete from dbo.FamiliaUsuario where id_familia = {0} and Cod_usuario = '{1}'", fami.idFamilia, usu.codUsuario);

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
