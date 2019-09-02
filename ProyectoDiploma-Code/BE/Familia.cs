using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Familia : ICRUD<Familia>
    {

        public int idFamilia { get; set; }

        public string descripcion { get; set; }

        public bool Create(Familia objAlta)
        {
            throw new NotImplementedException();
        }

        public bool Delete(Familia objDelete)
        {
            throw new NotImplementedException();
        }

        public List<Familia> Retrieve()
        {
            throw new NotImplementedException();
        }

        public bool Update(Familia objUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
