using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Transfer
    {
        public Transfer()
        {
        }

        public Transfer(string dateOfTransfer, decimal price, Person person, Club clubFrom, Club clubIn)
        {
            DateOfTransfer = dateOfTransfer;
            Price = price;
            Person = person;
            ClubFrom = clubFrom;
            ClubIn = clubIn;
        }

        public int ID { get; set; }

        public string DateOfTransfer { get; set; }

        public decimal Price { get; set; }

        public Person Person { get; set; }

        public Club ClubFrom { get; set; }

        public Club ClubIn { get; set; }
    }
}
