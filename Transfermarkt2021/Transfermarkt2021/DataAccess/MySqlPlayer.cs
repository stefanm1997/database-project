using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Transfermarkt2021.Model;

namespace Transfermarkt2021.DataAccess
{
    class MySqlPlayer
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["Transfermarkt"].ConnectionString;
        public static string messFromProcedure = "";
        public List<Player> getAllPlayers()
        {
            List<Player> players = new List<Player>();
            var selectAll = "SELECT * FROM igrac";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    players.Add(new Player()
                    {
                        Position = reader.GetString(0),
                        Height = reader.GetInt32(1),
                        Weight = reader.GetInt32(2),
                        Price = reader.GetDecimal(3),
                        Foot = reader.GetString(4),
                    });
                }
                reader.Close();
            }
            return players;
        }


        public void Insert(Player ply, Person pers, Jersey jrs, Club cl)
        {
            /*var insertPerson = "INSERT INTO osoba(Ime, Prezime, DatumRodjenja, MjestoRodjenja, DRZAVLJANSTVO_idDrzavljanstva)" +
                " VALUES(@Ime, @Prezime, @DatumRodjenja, @MjestoRodjenja, @Drzavljanstvo) ";*/
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = "insert";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@varIme", pers.Name);
                cmd.Parameters.AddWithValue("@varPrezime", pers.Surname);
                cmd.Parameters.AddWithValue("@varDatumRodjenja", pers.DateOfBirth);
                cmd.Parameters.AddWithValue("@varMjestoRodjenja", pers.PlaceOfBirth);
                cmd.Parameters.AddWithValue("@varNazivDrzave", pers.Citizenship.Name);
                cmd.Parameters.AddWithValue("@varPozicija", ply.Position);
                cmd.Parameters.AddWithValue("@varVisina", ply.Height);
                cmd.Parameters.AddWithValue("@varTezina", ply.Weight);
                cmd.Parameters.AddWithValue("@varCijena", ply.Price);
                cmd.Parameters.AddWithValue("@varNoga", ply.Foot);
                cmd.Parameters.AddWithValue("@varBroj", jrs.Number);
                cmd.Parameters.AddWithValue("@varNatpis", jrs.Legend);
                cmd.Parameters.AddWithValue("@varNazivKluba", cl.Name);

                cmd.ExecuteNonQuery();
            }
        }

        public string Update(Player ply, Person pers, Jersey jrs, Club cl)
        {
            using (var conn = new MySqlConnection(connString))
            {
                string result = "";
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = "update";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@varIdOsobe", pers.ID);
                cmd.Parameters.AddWithValue("@varIme", pers.Name);
                cmd.Parameters.AddWithValue("@varPrezime", pers.Surname);
                cmd.Parameters.AddWithValue("@varDatumRodjenja", pers.DateOfBirth);
                cmd.Parameters.AddWithValue("@varMjestoRodjenja", pers.PlaceOfBirth);
                cmd.Parameters.AddWithValue("@varNazivDrzave", pers.Citizenship.Name);
                cmd.Parameters.AddWithValue("@varPozicija", ply.Position);
                cmd.Parameters.AddWithValue("@varVisina", ply.Height);
                cmd.Parameters.AddWithValue("@varTezina", ply.Weight);
                cmd.Parameters.AddWithValue("@varCijena", ply.Price);
                cmd.Parameters.AddWithValue("@varNoga", ply.Foot);
                cmd.Parameters.AddWithValue("@varBroj", jrs.Number);
                cmd.Parameters.AddWithValue("@varNatpis", jrs.Legend);
                cmd.Parameters.AddWithValue("@varNazivKluba", cl.Name);
                cmd.Parameters.Add("@rezultat", MySqlDbType.VarChar, 30).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                messFromProcedure = Convert.ToString(cmd.Parameters["@rezultat"].Value);
                result = Convert.ToString(cmd.Parameters["@rezultat"].Value);
                return result;
            }
        }

        public bool DeletePlayer(int idPerson)
        {
            var deleteJersey = "DELETE FROM dres WHERE IGRAC_OSOBA_idOsobe=@idOsobe";
            var deletePlayer = "DELETE FROM igrac WHERE OSOBA_idOsobe=@idOsobe";
            var deletePerson = "DELETE FROM osoba WHERE idOsobe=@idOsobe";
            var deleteTransfer = "DELETE FROM transfer WHERE OSOBA_idOsobe=@idOsobe";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = deleteJersey;
                cmd.Parameters.AddWithValue("@idOsobe", idPerson);
                cmd.ExecuteNonQuery();
                var cmd2 = conn.CreateCommand();
                cmd2.CommandText = deletePlayer;
                cmd2.Parameters.AddWithValue("@idOsobe", idPerson);
                cmd2.ExecuteNonQuery();
                var cmd3 = conn.CreateCommand();
                cmd3.CommandText = deleteTransfer;
                cmd3.Parameters.AddWithValue("@idOsobe", idPerson);
                cmd3.ExecuteNonQuery();
                var cmd4 = conn.CreateCommand();
                cmd4.CommandText = deletePerson;
                cmd4.Parameters.AddWithValue("@idOsobe", idPerson);
                cmd4.ExecuteNonQuery();
            }
            return true;
        }
    }
}
