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

        public static int codUsuario { get; set; }

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
                nUsu.nombre = reader[1].ToString();
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
                nUsu.nombre = reader[1].ToString();
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
                nUsu.mail = reader[10].ToString();
                nTer.codTerminal = Convert.ToInt16(reader[11]);
                nTer.descripcionTerminal = reader[12].ToString();
                nUsu.terminal = nTer;

                break;
            }

            nConexion.conexionBD(0);

            return nUsu;
        }

        public string altaUsuario(BE.UsuarioBE nUsuario)
        {
            string nCod = generarCodigoUsuario();

            sql = string.Format("Insert into dbo.Usuario values ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', '{9}', '{10}', {11})", nCod, nUsuario.nombre, nUsuario.apellido, nUsuario.contraseña, nUsuario.nroDocumento, nUsuario.tipoDocumento, "0", "0", nUsuario.idioma, "0", nUsuario.mail, nUsuario.terminal);

            nConexion.conexionBD(1, sql);

            if (nConexion.nCom.ExecuteNonQuery() > 0)
            {
                nConexion.conexionBD(0);

                return nCod;
            }

            nConexion.conexionBD(0);

            return "No se ha podido realizar el alta";
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
            sql = string.Format("update dbo.usuario set Nombre = '{0}', Apellido = '{1}', Nro_documento = '{2}', Tipo_documento = '{3}', Email = '{4}', Terminal = {5} where Cod_usuario = '{6}'", nUsuario.nombre, nUsuario.apellido, nUsuario.nroDocumento, nUsuario.tipoDocumento, nUsuario.mail, nUsuario.terminal.codTerminal, nUsuario.codUsuario);

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
