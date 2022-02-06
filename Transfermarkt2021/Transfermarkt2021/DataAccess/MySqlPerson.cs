using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Transfermarkt2021.Model;

namespace Transfermarkt2021.DataAccess
{
    class MySqlPerson
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["Transfermarkt"].ConnectionString;
        public List<Person> getAllPersons()
        {
            List<Person> persons = new List<Person>();
            var selectAll = "SELECT * FROM osoba";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    persons.Add(new Person()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Surname = reader.GetString(2),
                        DateOfBirth = reader.GetString(3),
                        PlaceOfBirth = reader.GetString(4),

                    });
                }
                reader.Close();
            }
            return persons;
        }

        public List<Person> getPersonsNameAndSurname()
        {
            var result = new List<Person>();
            var select = "SELECT idOsobe,Ime,Prezime FROM osoba";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = select;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    result.Add(new Person()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Surname = reader.GetString(2)
                    });
                }
                reader.Close();
            }
            return result;
        }


        public int getPersonID(Person pers)
        {
            int id = 0;
            var selectId = "SELECT idOsobe FROM osoba WHERE Ime=@Ime AND Prezime=@Prezime AND DatumRodjenja=@DatumRodjenja AND MjestoRodjenja=@MjestoRodjenja " +
                " AND DRZAVLJANSTVO_idDrzavljanstva=@Drzavljanstvo";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectId;
                cmd.Parameters.AddWithValue("@Ime", pers.Name);
                cmd.Parameters.AddWithValue("@Prezime", pers.Surname);
                cmd.Parameters.AddWithValue("@DatumRodjenja", pers.DateOfBirth);
                cmd.Parameters.AddWithValue("@MjestoRodjenja", pers.PlaceOfBirth);
                cmd.Parameters.AddWithValue("@Drzavljanstvo", pers.Citizenship.ID);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    id = reader.GetInt32(0);
                }
                reader.Close();
            }
            return id;
        }
    }
}
