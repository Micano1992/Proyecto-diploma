using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Xml;

namespace BLL
{
    public class Seguridad
    {
        BE.UsuarioBE Usu = new BE.UsuarioBE();
        BLL.Bitácora bitacoraBLL = new Bitácora();
        DAL.Seguridad nSeg = new DAL.Seguridad();
        DAL.Usuario usuDAL = new DAL.Usuario();


        public bool login(string usuario, string contraseña, ref string mensaje)
        {
            Usu.codUsuario = usuario;
            Usu.contraseña = contraseña;

            bool acceso;

            if(nSeg.validarUsuario(Usu))
            {
                if(nSeg.validarEstado(Usu))
                {
                    acceso = nSeg.validarContraseña(Usu);

                    if (acceso)
                    {
                        nSeg.actualizarIngresosError(Usu, acceso);

                        bitacoraBLL.guardarLog(usuario, 3, "Ingreso a aplicación", "Login");

                        return true;
                    }

                    else
                    {
                        mensaje = "Contraseña inválida";

                        bitacoraBLL.guardarLog(usuario, 2, "Contraseña errónea", "Login");


                        return false;
                    }

                }

                else
                {
                    mensaje = "Usuario bloqueado";

                    bitacoraBLL.guardarLog(usuario, 2, "Usuario bloqueado", "Login");

                    return false;
                }                  
                                    
            }

            else
            {
                mensaje = "Usuario inválido";

                bitacoraBLL.guardarLog(usuario, 2, "Usuario inválido", "Login");

                return false;
 
            }
            
        }

        public bool validarContraseña(string usuario, string contraseña)
        {
            Usu.codUsuario = usuario;
            Usu.contraseña = contraseña;

            return nSeg.validarContraseña(Usu);

        }

        public bool bloquear(string usuarioBloq, int bloqueo, string usuarioLog)
        {

            if(nSeg.bloquearUSuario(usuarioBloq, bloqueo))
            {
                if(bloqueo == 1)
                {
                    bitacoraBLL.guardarLog(usuarioLog, 2, "Bloqueo al usuario " + usuarioBloq, "Usuarios");
                }
                else
                {
                    bitacoraBLL.guardarLog(usuarioLog, 2, "Desbloqueo al usuario " + usuarioBloq, "Usuarios");
                }

                return true;
            }

            return false;
        }

        public void blanquearContraseña(string usuarioBlan, string ruta, string usuarioLog)
        {
            Usu.codUsuario = usuarioBlan;
            Usu.contraseña = usuDAL.generarContraseña();

            nSeg.blanquerContraseña(Usu, ruta);

            bitacoraBLL.guardarLog(usuarioLog, 3, "Se blanqueo la contraseña del usuario " + usuarioBlan, "Usuarios");

        }

        public bool modificarContraseña(string usuario, string contraseña)
        {
            Usu.codUsuario = usuario;
            Usu.contraseña = contraseña;

            if(nSeg.modificarContraseña(Usu))
            {
                bitacoraBLL.guardarLog(usuario, 3, "Modificación de contraseña", "Usuarios");


                return true;
            }

            return false;
        }

        public void backup(int partes, string direc, string usuario)
        {
            try
            {
                nSeg.ejecutarBackUp(partes, direc);

                bitacoraBLL.guardarLog(usuario, 1, "Generación copia de seguridad", "Seguridad");
            }
            catch (Exception)
            {

                throw;
            }


        }

        public void restore(int partes, string direc, string usuario)
        {
            try
            {
                nSeg.restaurarBackup(direc, partes);
                
                bitacoraBLL.guardarLog(usuario, 1, "Restauración de copia de seguridad", "Seguridad");
            }
            catch (Exception)
            {

                throw;
            }       


        }



    }
}
