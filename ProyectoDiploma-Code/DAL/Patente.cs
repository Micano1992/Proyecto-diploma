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
        List<BE.UsuarioBE> lUsu = new List<BE.UsuarioBE>();

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

        public string obtenerDescripcionPatente(int cod)
        {
            sql = string.Format("Select Descripcion_patente from dbo.Patente where Id_patente = '{0}'", cod);

            nConexion.conexionBD(1, sql);

            string resul = nConexion.nCom.ExecuteScalar().ToString();

            nConexion.conexionBD(0);

            return resul;
        }

        public bool asignarPatenteFamilia(BE.FamiliaBE fami, BE.PatenteBE pate, int dv)
        {
            sql = string.Format("Insert into dbo.FamiliaPatente values ({0}, {1}, {2})", fami.idFamilia, pate.idPatente, dv);

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

        public List<BE.UsuarioBE> verificarPatentes(BE.PatenteBE pat, BE.UsuarioBE usu)
        {
            lUsu.Clear();

            sql = string.Format("select distinct a.Cod_usuario from dbo.Usuario a left join dbo.FamiliaUsuario b on b.Cod_usuario = a.Cod_usuario left join dbo.FamiliaPatente c on c.Id_familia = b.Id_familia where c.Id_patente = {0} and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') except select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 1 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') union all (select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 0 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}'))", pat.idPatente, usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.UsuarioBE nUsu = new BE.UsuarioBE();

                nUsu.codUsuario = reader[0].ToString();

                lUsu.Add(nUsu);

            }
            nConexion.conexionBD(0);

            return lUsu;
        }

        public List<BE.UsuarioBE> verificarPatentes(BE.PatenteBE pat, BE.FamiliaBE fam)
        {
            lUsu.Clear();

            sql = string.Format("select distinct a.Cod_usuario from dbo.Usuario a left join dbo.FamiliaUsuario b on b.Cod_usuario = a.Cod_usuario left join dbo.FamiliaPatente c on c.Id_familia = b.Id_familia where c.Id_patente = {0} and a.bloqueado = 0 and b.Id_familia not in ({1}) except select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 1 and a.bloqueado = 0 union all (select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 0 and a.bloqueado = 0)", pat.idPatente, fam.idFamilia);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.UsuarioBE nUsu = new BE.UsuarioBE();

                nUsu.codUsuario = reader[0].ToString();

                lUsu.Add(nUsu);

            }
            nConexion.conexionBD(0);

            return lUsu;
        }

        public List<BE.UsuarioBE> verificarPatentes(BE.PatenteBE pat, BE.FamiliaBE fam, BE.UsuarioBE usu)
        {
            lUsu.Clear();

            sql = string.Format("select distinct a.Cod_usuario from dbo.Usuario a left join dbo.FamiliaUsuario b on b.Cod_usuario = a.Cod_usuario left join dbo.FamiliaPatente c on c.Id_familia = b.Id_familia where c.Id_patente = {0} and a.bloqueado = 0 and a.Cod_usuario not in('{1}') except select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 1 and a.bloqueado = 0 union all (select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 0 and a.bloqueado = 0)", pat.idPatente, usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.UsuarioBE nUsu = new BE.UsuarioBE();

                nUsu.codUsuario = reader[0].ToString();

                lUsu.Add(nUsu);

            }
            nConexion.conexionBD(0);

            return lUsu;
        }


    }
}
