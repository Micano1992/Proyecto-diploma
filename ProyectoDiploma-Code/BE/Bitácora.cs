﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Bitácora
    {
        public string criticidad { get; set; }
        public string descripcion { get; set; }
        public int DVH { get; set; }
        public DateTime fecha { get; set; }
        public string funcionalidad { get; set; }
        public int id_log { get; set; }
        public string codUsuario { get; set; }
    }
}
