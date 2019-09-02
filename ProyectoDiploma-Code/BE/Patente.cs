using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Patente : ICRUD<Patente>
    {
        public int idPatente { get; set; }

        public string descripcion { get; set; }

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
