using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Citizenship
    {
        public Citizenship()
        {
        }

        public Citizenship(string name, string iSO, string iSO3)
        {
            Name = name;
            ISO = iSO;
            ISO3 = iSO3;
        }

        public int ID { get; set; }

        public string Name { get; set; }

        public string ISO { get; set; }

        public string ISO3 { get; set; }
    }
}
