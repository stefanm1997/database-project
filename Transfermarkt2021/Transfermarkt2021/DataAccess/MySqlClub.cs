using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Transfermarkt2021.Model;

namespace Transfermarkt2021.DataAccess
{
    class MySqlClub
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["Transfermarkt"].ConnectionString;
        public List<Club> getAllClubs()
        {
            List<Club> clubs = new List<Club>();
            var selectAll = "SELECT * FROM klub";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    clubs.Add(new Club()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        League = reader.GetString(2),
                        Website = reader.GetString(3),
                        DateOfEstablishment = reader.GetString(4),
                        IdStadium = reader.GetString(5),
                        IdAddress = reader.GetInt32(6)
                    });
                }
                reader.Close();
            }
            return clubs;
        }

        public int GetIdOfClub(String name)
        {
            var selectAll = "SELECT idKluba FROM klub WHERE NazivKluba = @name";
            int result = 0;
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.Parameters.AddWithValue("@name", name);
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    result = reader.GetInt32(0);
                }
                reader.Close();
            }
            return result;
        }

        public Club getClubInfo(string name)
        {
            Club club = null;
            var selectAll = "SELECT k.NazivKluba, k.Liga, k.Website, k.DatumOsnivanja, s.NazivStadiona, a.Ulica, a.Broj FROM klub k " +
                "inner join stadion s on s.NazivStadiona = k.STADION_NazivStadiona inner join adresa a on a.idAdrese=k.ADRESA_idAdrese";

            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (name.Equals(reader.GetString(0)))
                    {
                        club = new Club()
                        {
                            Name = reader.GetString(0),
                            League = reader.GetString(1),
                            Website = reader.GetString(2),
                            DateOfEstablishment = reader.GetString(3),
                            Stadium = new Stadium() { Name = reader.GetString(4) },
                            Address = new Address() { Street = reader.GetString(5), Number = reader.GetInt32(6) }
                        };
                    }

                }
                reader.Close();
            }
            return club;
        }

        public string getClubName(int idPerson)
        {
            var clubName = "";
            var selectClubName = "SELECT k.NazivKluba FROM klub k inner join dres d on d.IGRAC_OSOBA_idOsobe = @idOsobe and d.KLUB_idKluba = k.idKluba";

            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectClubName;
                cmd.Parameters.AddWithValue("@idOsobe", idPerson);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    clubName = reader.GetString(0);
                }
                reader.Close();
            }
            return clubName;
        }
    }
}
