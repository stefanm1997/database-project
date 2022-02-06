using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Stadium
    {
        public Stadium()
        {
        }

        public Stadium(string name, int capacity, int yearOfConstruction, Address address)
        {
            Name = name;
            Capacity = capacity;
            YearOfConstruction = yearOfConstruction;
            Address = address;
        }

        public string Name { get; set; }

        public int Capacity { get; set; }

        public int YearOfConstruction { get; set; }

        public Address Address { get; set; }
    }
}
