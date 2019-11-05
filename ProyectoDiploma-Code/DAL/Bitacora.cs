using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class Bitacora
    {
        ConexionesSQL nConexion = new ConexionesSQL();

        Encriptacion nEncrip = new Encriptacion();

        public static Bitacora instancia;

        public static Bitacora GetInstance()
        {
            if (instancia == null)
            {
                return new Bitacora();
            }
            return instancia;
            
        }

        public void guardarLog(BE.Bitácora log)
        {
            string sql = string.Format("insert into Bitacora (Descripcion_log, Cod_usuario, Fecha, Criticidad, Funcionalidad, DVH) values ('{0}', '{1}', '{2}','{3}','{4}', {5})", log.descripcion, log.codUsuario, log.fecha, log.criticidad, nEncrip.Encriptar3D(log.funcionalidad), log.DVH);

            try
            {
                nConexion.conexionBD(1, sql);

                nConexion.nCom.ExecuteNonQuery();

                nConexion.conexionBD(0);
            }
            catch (Exception ex)
            {

                Console.WriteLine("DAL Bitacora guardarLog: " + ex.Message);

            }


        }

        public List<BE.Bitácora> listarBitacora()
        {
            List<BE.Bitácora> lBitacora = new List<BE.Bitácora>();

            string sql = "Select * from dbo.Bitacora";

            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Bitácora nLog = new BE.Bitácora();

                nLog.id_log = int.Parse(reader[0].ToString());
                nLog.descripcion = reader[1].ToString();
                nLog.codUsuario = reader[2].ToString();
                nLog.fecha = Convert.ToDateTime(reader[3]);
                nLog.criticidad = reader[4].ToString();
                nLog.funcionalidad = nEncrip.Desencriptar3D(reader[5].ToString());

                lBitacora.Add(nLog);
            }

            nConexion.conexionBD(0);

            return lBitacora;
        }

        public List<BE.Bitácora> listarBitacora(BE.Bitácora filtro, DateTime fechaDesde, DateTime fechaHasta)
        {
            int a = 0;

            List<BE.Bitácora> lBitacora = new List<BE.Bitácora>();

            string sql = "Select * from dbo.Bitacora where ";

            if(filtro.codUsuario != "")
            {
                a = 1;

                sql += "Cod_usuario = '" + filtro.codUsuario + "'";
            }

            if (filtro.criticidad != "")
            {
                if(a == 0)
                {
                    a = 1;

                    sql += "Criticidad = '" + filtro.criticidad + "'";
                }
                else
                {
                    sql += "and Criticidad = '" + filtro.criticidad + "'";
                }

            }

            if (fechaDesde != DateTime.MinValue)
            {
                if (a == 0)
                {
                    a = 1;

                    sql += "Fecha > '" + fechaDesde + "'";
                }
                else
                {
                    sql += "and Fecha > '" + fechaDesde + "'";
                }

            }

            if (fechaHasta != DateTime.MaxValue)
            {
                if (a == 0)
                {
                    a = 1;

                    sql += "Fecha < '" + fechaHasta + "'";
                }
                else
                {
                    sql += "and Fecha < '" + fechaHasta + "'";
                }

            }


            nConexion.conexionBD(1, sql);

            SqlDataReader reader = nConexion.nCom.ExecuteReader();

            while (reader.Read())
            {
                BE.Bitácora nLog = new BE.Bitácora();

                nLog.id_log = int.Parse(reader[0].ToString());
                nLog.descripcion = reader[1].ToString();
                nLog.codUsuario = reader[2].ToString();
                nLog.fecha = Convert.ToDateTime(reader[3]);
                nLog.criticidad = reader[4].ToString();
                nLog.funcionalidad = nEncrip.Desencriptar3D(reader[5].ToString());

                lBitacora.Add(nLog);
            }

            nConexion.conexionBD(0);

            return lBitacora;
        }

    }
}
