using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Transfermarkt2021.Model;

namespace Transfermarkt2021.DataAccess
{
    class MySqlTransfer
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["Transfermarkt"].ConnectionString;

        public void insertInTransfer(int idPerson, int idClubFrom, int idClubTo, string Date, decimal Price)
        {
            var insertTransfer = "INSERT INTO transfer(DatumTransfera, Cijena, OSOBA_idOsobe, KLUB_idKluba1, KLUB_idKluba2) " +
                "VALUES(@Datum, @Cijena, @idOsobe, @idKluba1, @idKluba2)";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = insertTransfer;
                cmd.Parameters.AddWithValue("@Datum", Date);
                cmd.Parameters.AddWithValue("@Cijena", Price);
                cmd.Parameters.AddWithValue("@idOsobe", idPerson);
                cmd.Parameters.AddWithValue("@idKluba1", idClubFrom);
                cmd.Parameters.AddWithValue("@idKluba2", idClubTo);
                cmd.ExecuteNonQuery();
            }
        }

        public List<Transfer> getAllTransfers()
        {
            var transfers = new List<Transfer>();
            /*var selectAll = "select t.Cijena, t.DatumTransfera, o.Ime, o.Prezime, k1.NazivKluba, k2.NazivKluba from transfer t inner join osoba o on o.idOsobe = t.OSOBA_idOsobe "+
                               "inner join klub k1 on k1.idKluba = t.KLUB_idKluba1 inner join klub k2 on k2.idKluba = t.KLUB_idKluba2; ";*/
            var selectAll = "SELECT * from select_all_transfers";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    transfers.Add(new Transfer()
                    {
                        Price = reader.GetDecimal(0),
                        DateOfTransfer = reader.GetString(1),
                        Person = new Person() { Name = reader.GetString(2), Surname = reader.GetString(3) },
                        ClubFrom = new Club() { Name = reader.GetString(4) },
                        ClubIn = new Club() { Name = reader.GetString(5) }
                    });
                }
                reader.Close();
            }
            return transfers;
        }
    }
}
