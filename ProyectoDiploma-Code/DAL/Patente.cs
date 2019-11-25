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
        List<BE.Patente> lPat = new List<BE.Patente>();
        List<BE.UsuarioBE> lUsu = new List<BE.UsuarioBE>();

        Encriptacion nEncrip = new Encriptacion();

        string sql;

        //string sql2;

        public void patentesFamilias(List<BE.Familia> lFam, ref List<BE.Patente> lPat)
        {
            //sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

            //nConexion.conexionBD(1, sql);

            //SqlDataReader reader = nConexion.nCom.ExecuteReader();

            foreach (BE.Familia fam in lFam)
            {
                sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

                nConexion.conexionBD(1, sql);

                SqlDataReader reader = nConexion.nCom.ExecuteReader();

                while (reader.Read())
                {
                    BE.Patente nPat = new BE.Patente();

                    nPat.idPatente = int.Parse(reader[1].ToString());

                    lPat.Add(nPat);

                }

                nConexion.conexionBD(0);

            }


        }

        public void patentesFamilias(BE.Familia familia, ref List<BE.Patente> lPat)
        {
            //sql = string.Format("Select * from dbo.FamiliaPatente where id_familia = {0}", fam.idFamilia);

            //nConexion.conexionBD(1, sql);

            //SqlDataReader reader = nConexion.nCom.ExecuteReader();

            sql = String.Format("Select a.Id_patente, b.Descripcion_patente from dbo.FamiliaPatente a left join dbo.Patente b on b.Id_patente = a.Id_patente where id_familia = (Select id_familia from dbo.Familia where descripcion_familia = '{0}')", nEncrip.Encriptar3D(familia.descripcion));

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Patente nPat = new BE.Patente();

                nPat.idPatente = int.Parse(reader[0].ToString());
                nPat.descripcion = nEncrip.Desencriptar3D(reader[1].ToString());

                lPat.Add(nPat);

            }



            nConexion.conexionBD(0);

        }

        public List<BE.Patente> listarPatentes()
        {
            lPat.Clear();

            sql = "Select * from dbo.Patente";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Patente nPat = new BE.Patente();

                nPat.idPatente = int.Parse(reader[0].ToString());
                nPat.descripcion = nEncrip.Desencriptar3D(reader[1].ToString());

                lPat.Add(nPat);

            }

            nConexion.conexionBD(0);

            return lPat;

        }

        public int obtenerIdPatente(string desc)
        {
            sql = string.Format("Select * from dbo.Patente where Descripcion_patente = '{0}'", nEncrip.Encriptar3D(desc));

            nConexion.conexionBD(1, sql);

            int resul = int.Parse(nConexion.nCom.ExecuteScalar().ToString());

            nConexion.conexionBD(0);

            return resul;
        }

        public string obtenerDescripcionPatente(int cod)
        {
            sql = string.Format("Select Descripcion_patente from dbo.Patente where Id_patente = '{0}'", cod);

            nConexion.conexionBD(1, sql);

            string resul = nEncrip.Desencriptar3D(nConexion.nCom.ExecuteScalar().ToString());

            nConexion.conexionBD(0);

            return resul;
        }

        public bool asignarPatenteFamilia(BE.Familia fami, BE.Patente pate, int dv)
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

        public bool desAsignarPatenteFamilia(BE.Familia fami, BE.Patente pate)
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

        public List<BE.UsuarioBE> verificarPatentes(BE.Patente pat, BE.UsuarioBE usu)
        {
            lUsu.Clear();

            //sql = string.Format("select distinct a.Cod_usuario from dbo.Usuario a left join dbo.FamiliaUsuario b on b.Cod_usuario = a.Cod_usuario left join dbo.FamiliaPatente c on c.Id_familia = b.Id_familia where c.Id_patente = {0} and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') except select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 1 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') union all (select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 0 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}'))", pat.idPatente, usu.codUsuario);

            sql = string.Format("select distinct a.Cod_usuario from dbo.Usuario a left join dbo.FamiliaUsuario b on b.Cod_usuario = a.Cod_usuario left join dbo.FamiliaPatente c on c.Id_familia = b.Id_familia where c.Id_patente = {0} and a.bloqueado = 0 except select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 1 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') union all (select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 0 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}'))", pat.idPatente, usu.codUsuario);


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

        public List<BE.UsuarioBE> verificarPatentes(BE.Patente pat, BE.Familia fam)
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

        public List<BE.UsuarioBE> verificarPatentes(BE.Patente pat, BE.Familia fam, BE.UsuarioBE usu)
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

        //public void encrep(List<BE.PatenteBE> pate)
        //{
        //    foreach (BE.PatenteBE nPat in pate)
        //    {
        //        sql = string.Format("Update dbo.Patente set Descripcion_patente = '{0}' where Id_patente = {1}", nEncrip.Encriptar3D(nPat.descripcion), nPat.idPatente);

        //        nConexion.conexionBD(1, sql);

        //        nConexion.nCom.ExecuteNonQuery();

        //        nConexion.conexionBD(0);
        //    }

        //}

        public bool verificarPatenteUsuario(BE.UsuarioBE nUsario, BE.Patente nPatente)
        {
            sql = string.Format("select * from dbo.UsuarioPatente where Id_patente = {0} and cod_usuario = '{1}' and Negado = 0", nPatente.idPatente, nUsario.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.HasRows)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public List<BE.UsuarioBE> verificarPatentesNegacion(BE.Patente pat, BE.UsuarioBE usu)
        {
            lUsu.Clear();

            sql = string.Format("select distinct a.Cod_usuario from dbo.Usuario a left join dbo.FamiliaUsuario b on b.Cod_usuario = a.Cod_usuario left join dbo.FamiliaPatente c on c.Id_familia = b.Id_familia where c.Id_patente = {0} and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') except select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 1 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') union all (select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 0 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}'))", pat.idPatente, usu.codUsuario);

            //sql = string.Format("select distinct a.Cod_usuario from dbo.Usuario a left join dbo.FamiliaUsuario b on b.Cod_usuario = a.Cod_usuario left join dbo.FamiliaPatente c on c.Id_familia = b.Id_familia where c.Id_patente = {0} and a.bloqueado = 0 except select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 1 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}') union all (select distinct a.Cod_usuario from dbo.Usuario a left join dbo.UsuarioPatente b on b.cod_usuario = a.Cod_usuario where b.Id_patente = {0} and b.Negado = 0 and a.bloqueado = 0 and a.Cod_usuario not in ('{1}'))", pat.idPatente, usu.codUsuario);


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
