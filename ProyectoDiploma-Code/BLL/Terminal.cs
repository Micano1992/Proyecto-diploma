using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace BLL
{
    public class Terminal
    {
        DAL.Terminal TerDAL = new DAL.Terminal();    

        public List<string> Retrieve()
        {
            List<string> lTer = new List<string>();

            foreach(BE.Terminal term in TerDAL.Retrieve())
            {
                lTer.Add(term.descripcionTerminal);
            }

            return lTer;
                
        }



       
    }
}
