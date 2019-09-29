﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class Seguridad
    {
        BE.UsuarioBE Usu = new BE.UsuarioBE();

        DAL.SeguridadDAL nSeg = new DAL.SeguridadDAL();



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

                        return true;
                    }

                    else
                    {
                        mensaje = "Contraseña inválida";
                        return false;
                    }

                }

                else
                {
                    mensaje = "Usuario bloqueado";
                    return false;
                }                  
                                    
            }

            else
            {
                mensaje = "Usuario inválido";

                return false;
 
            }
            
        }

        public bool bloquear(string usuario, int bloqueo)
        {
            return nSeg.bloquearUSuario(usuario, bloqueo);
        }



    }
}