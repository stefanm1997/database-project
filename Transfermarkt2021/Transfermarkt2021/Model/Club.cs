using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Club
    {
        public Club()
        {
        }

        public Club(string name, string league, string website, string dateOfEstablishment, int address, string stadium)
        {
            Name = name;
            League = league;
            Website = website;
            DateOfEstablishment = dateOfEstablishment;
            IdAddress = address;
            IdStadium = stadium;
        }

        public int ID { get; set; }

        public string Name { get; set; }

        public string League { get; set; }

        public string Website { get; set; }

        public string DateOfEstablishment { get; set; }

        public int IdAddress { get; set; }

        public Address Address { get; set; }

        public string IdStadium { get; set; }

        public Stadium Stadium { get; set; }

    }
}
