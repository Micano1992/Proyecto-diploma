using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.IO;

namespace DAL
{
    public class Usuario
    {
        ConexionesSQL nConexion = new ConexionesSQL();

        public int codUsuario { get; set; }

        string sql;

        BE.PatenteBE nPat = new BE.PatenteBE();
        //BE.FamiliaBE nFam = new BE.FamiliaBE();
        List<BE.FamiliaBE> lFamilia = new List<BE.FamiliaBE>();
        List<BE.PatenteBE> lPaten = new List<BE.PatenteBE>();
        List<BE.PatenteBE> lPaten2 = new List<BE.PatenteBE>();

        Encriptacion nEncrip = new Encriptacion();

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

        public List<BE.PatenteBE> patentesNoOtorgadas(BE.UsuarioBE usu)
        {
            lPaten.Clear();
            

            sql = string.Format("select id_patente, Descripcion_patente from dbo.patente where id_patente not in (select distinct Id_patente from dbo.FamiliaPatente where Id_familia in (select Id_familia from dbo.FamiliaUsuario where Cod_usuario = '{0}'))and id_patente not in (select id_patente from dbo.UsuarioPatente where Cod_usuario = '{0}') ", usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.PatenteBE nPate = new BE.PatenteBE();

                nPate.idPatente = Convert.ToInt16(reader[0]);
                nPate.descripcion = nEncrip.Desencriptar3D(reader[1].ToString());

                lPaten.Add(nPate);
            }

            nConexion.conexionBD(0);

            return lPaten;
        }

        public List<BE.PatenteBE> patentesOtorgadas(BE.UsuarioBE usu)
        {
            lPaten2.Clear();



            sql = string.Format("select id_patente, Descripcion_patente from dbo.Patente where id_patente in(select Id_patente from dbo.UsuarioPatente where cod_usuario = '{0}' and Negado = 0)", usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.PatenteBE nPate = new BE.PatenteBE();

                nPate.idPatente = Convert.ToInt16(reader[0]);
                nPate.descripcion = nEncrip.Desencriptar3D(reader[1].ToString());

                lPaten2.Add(nPate);
            }

            nConexion.conexionBD(0);

            return lPaten2;

        }

        public List<BE.UsuarioBE> listarUsuarios()
        {
            List<BE.UsuarioBE> lUsuarios = new List<BE.UsuarioBE>();

            sql = "Select a.*, b.descripcion from dbo.Usuario a left join dbo.Terminal b on b.codTerminal = a.Terminal";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.UsuarioBE nUsu = new BE.UsuarioBE();
                BE.Terminal nTer = new BE.Terminal();

                nUsu.codUsuario = reader[0].ToString();
                nUsu.nombre = nEncrip.Desencriptar3D(reader[1].ToString());
                nUsu.apellido =  reader[2].ToString();
                nUsu.nroDocumento = reader[4].ToString();

                switch (reader[5].ToString())
                {
                    case "CUIT":
                        nUsu.tipoDocumento = BE.UsuarioBE.tipoDoc.CUIT;
                        break;

                    case "CUIL":
                        nUsu.tipoDocumento = BE.UsuarioBE.tipoDoc.CUIL;
                        break;

                    case "DNI":
                        nUsu.tipoDocumento = BE.UsuarioBE.tipoDoc.DNI;
                        break;
                }

                
                nUsu.bloqueado = Convert.ToBoolean(reader[7]);
                nUsu.mail = reader[10].ToString();
                nTer.codTerminal = Convert.ToInt16(reader[11]);
                nTer.descripcionTerminal = reader[12].ToString();
                nUsu.terminal = nTer;

                lUsuarios.Add(nUsu);
            }

            nConexion.conexionBD(0);

            return lUsuarios;
        }

        public BE.UsuarioBE consultarUSuario(BE.UsuarioBE usu)
        {
            BE.UsuarioBE nUsu = new BE.UsuarioBE();
            BE.Terminal nTer = new BE.Terminal();

            sql = string.Format("Select a.*, b.descripcion from dbo.Usuario a left join dbo.Terminal b on b.codTerminal = a.Terminal where cod_usuario = '{0}'", usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {

                nUsu.codUsuario = reader[0].ToString();
                nUsu.nombre = nEncrip.Desencriptar3D(reader[1].ToString());
                nUsu.apellido = reader[2].ToString();
                nUsu.nroDocumento = reader[4].ToString();

                switch (reader[5].ToString())
                {
                    case "CUIT":
                        nUsu.tipoDocumento = BE.UsuarioBE.tipoDoc.CUIT;
                        break;

                    case "CUIL":
                        nUsu.tipoDocumento = BE.UsuarioBE.tipoDoc.CUIL;
                        break;

                    case "DNI":
                        nUsu.tipoDocumento = BE.UsuarioBE.tipoDoc.DNI;
                        break;
                }


                nUsu.bloqueado = Convert.ToBoolean(reader[7]);
                nUsu.idioma = Convert.ToInt16(reader[8]);
                nUsu.mail = reader[10].ToString();
                nTer.codTerminal = Convert.ToInt16(reader[11]);
                nTer.descripcionTerminal = reader[12].ToString();
                nUsu.terminal = nTer;

                break;
            }

            nConexion.conexionBD(0);

            return nUsu;
        }

        public string altaUsuario(BE.UsuarioBE nUsuario, string ruta)
        {
            string nCod = generarCodigoUsuario();

            sql = string.Format("Insert into dbo.Usuario values ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', {11})", nCod, nEncrip.Encriptar3D(nUsuario.nombre), nUsuario.apellido, nEncrip.GetMD5(nUsuario.contraseña), nUsuario.nroDocumento, nUsuario.tipoDocumento, "0", "0", nUsuario.idioma, nUsuario.DVH , nUsuario.mail, nUsuario.terminal.codTerminal);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                StreamWriter sw = new StreamWriter(ruta);

                sw.WriteLine(nCod + " - " + nUsuario.contraseña);

                sw.Close();
            }

            nConexion.conexionBD(0);

            return nCod;
        }

        public string generarCodigoUsuario()
        {

            sql = "select SUBSTRING(max(cod_usuario), 2, 5) from dbo.Usuario";

            nConexion.conexionBD(1, sql);

            codUsuario = Convert.ToInt16(nConexion.nCom.ExecuteScalar());          

            nConexion.conexionBD(0);

            codUsuario += 1;

            string codigo = "A" + codUsuario.ToString();

            return codigo;

        }

        public bool modificarUsuario(BE.UsuarioBE nUsuario)
        {
            sql = string.Format("update dbo.usuario set Nombre = '{0}', Apellido = '{1}', Nro_documento = '{2}', Tipo_documento = '{3}', Email = '{4}', Terminal = {5}, DVH = {6} where Cod_usuario = '{7}'", nEncrip.Encriptar3D(nUsuario.nombre), nUsuario.apellido, nUsuario.nroDocumento, nUsuario.tipoDocumento, nUsuario.mail, nUsuario.terminal.codTerminal, nUsuario.DVH, nUsuario.codUsuario);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool asignarPatente(BE.UsuarioBE usu, BE.PatenteBE pat, int DVH)
        {
            sql = string.Format("select * from dbo.UsuarioPatente where Id_patente = {0} and cod_usuario = '{1}'", pat.idPatente, usu.codUsuario);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                sql = string.Format("update dbo.UsuarioPatente set Negado = 0 where Id_patente = {0} and cod_usuario = '{1}' and DVH = {2}", pat.idPatente, usu.codUsuario, DVH);
            }

            else
            {
                nConexion.conexionBD(0);

                sql = string.Format("insert into dbo.UsuarioPatente (Id_patente, cod_usuario, Negado, DVH) values({0}, '{1}', 0, {2})", pat.idPatente, usu.codUsuario, DVH);

            }

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            else
            {
                nConexion.conexionBD(0);

                return false;
            }

        }

        public bool desAsignarPatente(BE.UsuarioBE usu, BE.PatenteBE pat)
        {
            sql = string.Format("delete from dbo.UsuarioPatente where Id_patente = {0} and cod_usuario = '{1}'", pat.idPatente, usu.codUsuario);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public bool negarPatente(BE.UsuarioBE usu, BE.PatenteBE pat, int DVH)
        {
            sql = string.Format("select * from dbo.UsuarioPatente where Id_patente = {0} and cod_usuario = '{1}'", pat.idPatente, usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            if (reader.HasRows)
            {
                nConexion.conexionBD(0);

                sql = string.Format("update dbo.UsuarioPatente set Negado = 1 where Id_patente = {0} and cod_usuario = '{1}' and DVH = {2}", pat.idPatente, usu.codUsuario, DVH);
            }

            else
            {
                nConexion.conexionBD(0);

                sql = string.Format("insert into dbo.UsuarioPatente (Id_patente, cod_usuario, Negado, DVH) values({0}, '{1}', 1, {2})", pat.idPatente, usu.codUsuario, DVH);

            }

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            else
            {
                nConexion.conexionBD(0);

                return false;
            }

        }

        public bool desNegarPatente(BE.UsuarioBE usu, BE.PatenteBE pat)
        {
            sql = string.Format("delete from dbo.UsuarioPatente where Id_patente = {0} and cod_usuario = '{1}'", pat.idPatente, usu.codUsuario);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return true;
            }

            nConexion.conexionBD(0);

            return false;
        }

        public List<BE.PatenteBE> patentesNoNegadas(BE.UsuarioBE usu)
        {
            lPaten.Clear();

            sql = string.Format("select id_patente, Descripcion_patente from dbo.patente where id_patente in (select distinct Id_patente from dbo.FamiliaPatente where Id_familia in (select Id_familia from dbo.FamiliaUsuario where Cod_usuario = '{0}')) and id_patente not in (select id_patente from dbo.UsuarioPatente where cod_usuario = '{0}' and Negado = 1) ", usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.PatenteBE nPate = new BE.PatenteBE();

                nPate.idPatente = Convert.ToInt16(reader[0]);
                nPate.descripcion = nEncrip.Desencriptar3D(reader[1].ToString());

                lPaten.Add(nPate);
            }


            nConexion.conexionBD(0);

            return lPaten;
        }

        public List<BE.PatenteBE> patentesNegadas(BE.UsuarioBE usu)
        {
            lPaten2.Clear();

            sql = string.Format("select id_patente, Descripcion_patente from dbo.Patente where id_patente in(select Id_patente from dbo.UsuarioPatente where cod_usuario = '{0}' and Negado = 1)", usu.codUsuario);

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.PatenteBE nPate = new BE.PatenteBE();

                nPate.idPatente = Convert.ToInt16(reader[0]);
                nPate.descripcion = nEncrip.Desencriptar3D(reader[1].ToString());

                lPaten2.Add(nPate);
            }

            nConexion.conexionBD(0);

            return lPaten2;

        }

        public string generarContraseña()
        {
            string passwordAleatorio;
            string s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random rd = new Random();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 8; i++)
            {
                int idx = rd.Next(0, 10);
                sb.Append(s.Substring(idx, 1));
            }
            passwordAleatorio = sb.ToString();
            return passwordAleatorio;
        }

        public bool modificarIdioma(BE.UsuarioBE usu, BE.Idioma idi)
        {
            sql = string.Format("update dbo.usuario set Idioma = {0} where Cod_usuario = '{1}'", idi.idIdioma , usu.codUsuario);

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
