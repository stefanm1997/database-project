using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Person
    {
        public Person()
        {
        }

        public Person(string name, string surname, string dateOfBirth, string placeOfBirth, Citizenship citizenship)
        {
            Name = name;
            Surname = surname;
            DateOfBirth = dateOfBirth;
            PlaceOfBirth = placeOfBirth;
            Citizenship = citizenship;
        }

        public int ID { get; set; }

        public string Name { get; set; }

        public string Surname { get; set; }

        public string DateOfBirth { get; set; }

        public string PlaceOfBirth { get; set; }

        public int IdCitizenship { get; set; }

        public Citizenship Citizenship { get; set; }
    }
}
