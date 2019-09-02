using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PatenteBE : BE.ICRUD<PatenteBE>
    {
        ConexionesSQL nConexion = new ConexionesSQL();

        string sql;

        public bool Create(PatenteBE objAlta)
        {
            throw new NotImplementedException();
        }

        public bool Delete(PatenteBE objDelete)
        {
            throw new NotImplementedException();
        }

        public List<PatenteBE> Retrieve()
        {
            throw new NotImplementedException();
        }

        public bool Update(PatenteBE objUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
