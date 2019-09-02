using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class FamiliaBE : ICRUD<FamiliaBE>
    {

        public int idFamilia { get; set; }

        public string descripcion { get; set; }

        public bool Create(FamiliaBE objAlta)
        {
            throw new NotImplementedException();
        }

        public bool Delete(FamiliaBE objDelete)
        {
            throw new NotImplementedException();
        }

        public List<FamiliaBE> Retrieve()
        {
            throw new NotImplementedException();
        }

        public bool Update(FamiliaBE objUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
