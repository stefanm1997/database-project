using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Address
    {
        public Address()
        {
        }

        public Address(string street, int number)
        {
            Street = street;
            Number = number;
        }

        public int ID { get; set; }

        public string Street { get; set; }

        public int Number { get; set; }
    }
}
