using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Transfermarkt2021.Model;

namespace Transfermarkt2021.DataAccess
{
    class MySqlJersey
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["Transfermarkt"].ConnectionString;
        public List<Jersey> getAllJerseys()
        {
            List<Jersey> jerseys = new List<Jersey>();
            var selectAll = "SELECT * FROM dres";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    jerseys.Add(new Jersey()
                    {
                        Number = reader.GetInt32(0),
                        Legend = reader.GetString(1)
                    });
                }
                reader.Close();
            }
            return jerseys;
        }

        public List<int> getAllJerseyForClub(int idClub)
        {
            List<int> jerseysForClub = new List<int>();
            var selectAll = "SELECT Broj FROM dres WHERE KLUB_idKluba=@idKluba";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                cmd.Parameters.AddWithValue("@idKluba", idClub);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    jerseysForClub.Add(reader.GetInt32(0));
                }
                reader.Close();
            }
            return jerseysForClub;
        }

        public List<Jersey> getAllPlayersFromClub(string clubName)
        {
            List<Jersey> allPlayersFromClub = new List<Jersey>();
            var selectClubIdFromName = "SELECT idKluba FROM klub WHERE NazivKluba=@Naziv";
            var selectPlayerIdsFromJersey = "SELECT IGRAC_OSOBA_idOsobe FROM dres WHERE KLUB_idKluba=@idKluba";
            var selectPlayer = "SELECT o.Ime, o.Prezime, i.Pozicija, i.Visina, i.Tezina, i.Cijena, d.Broj, d.Natpis FROM osoba o " +
                "inner join igrac i on i.OSOBA_idOsobe=@idOs and o.IdOsobe=@idOs inner join dres d on d.IGRAC_OSOBA_idOsobe=@idOs and d.KLUB_idKluba=@idKl";
            using (var conn = new MySqlConnection(connString))
            {
                int idClub = -1;
                conn.Open();
                //select1
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectClubIdFromName;
                cmd.Parameters.AddWithValue("@Naziv", clubName);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    idClub = reader.GetInt32(0);
                }
                //select2
                conn.Close();
                var listOfPlayersId = new List<int>();
                conn.Open();
                var cmd2 = conn.CreateCommand();
                cmd2.CommandText = selectPlayerIdsFromJersey;
                cmd2.Parameters.AddWithValue("@idKluba", idClub);
                var reader2 = cmd2.ExecuteReader();
                while (reader2.Read())
                {
                    listOfPlayersId.Add(reader2.GetInt32(0));
                }
                //select3
                conn.Close();
                conn.Open();
                var cmd3 = conn.CreateCommand();
                cmd3.CommandText = selectPlayer;
                cmd3.Parameters.Add(new MySqlParameter("@idOs", MySqlDbType.Int32));
                cmd3.Parameters.Add(new MySqlParameter("@idKl", MySqlDbType.Int32));
                cmd3.Parameters["@idKl"].Value = idClub;
                foreach (var playerId in listOfPlayersId)
                {
                    cmd3.Parameters["@idOs"].Value = playerId;
                    //cmd3.Parameters.AddWithValue("@idOs", playerId);
                    var reader3 = cmd3.ExecuteReader();
                    while (reader3.Read())
                    {
                        allPlayersFromClub.Add(new Jersey()
                        {
                            Player = new Player()
                            {
                                Name = reader3.GetString(0),
                                Surname = reader3.GetString(1),
                                Position = reader3.GetString(2),
                                Height = reader3.GetInt32(3),
                                Weight = reader3.GetInt32(4),
                                Price = reader3.GetDecimal(5)
                            },
                            Number = reader3.GetInt32(6),
                            Legend = reader3.GetString(7)
                        });
                        break;
                    }
                    reader3.Close();
                }
                reader2.Close();
                reader.Close();
            }
            return allPlayersFromClub;
        }
    }
}
