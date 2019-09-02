using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Patente : BE.ICRUD<Patente>
    {
        ConexionesSQL nConexion = new ConexionesSQL();

        string sql;

        public bool Create(Patente objAlta)
        {
            throw new NotImplementedException();
        }

        public bool Delete(Patente objDelete)
        {
            throw new NotImplementedException();
        }

        public List<Patente> Retrieve()
        {

            throw new NotImplementedException();
        }

        public bool Update(Patente objUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
