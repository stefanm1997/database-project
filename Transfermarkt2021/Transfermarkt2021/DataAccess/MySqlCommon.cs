using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Transfermarkt2021.Model;

namespace Transfermarkt2021.DataAccess
{
    class MySqlCommon
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["Transfermarkt"].ConnectionString;
        public List<CommonClass> getAll()
        {
            List<CommonClass> allProperties = new List<CommonClass>();
            /*var selectAll = "SELECT i.Pozicija, i.Visina, i.Tezina, i.Cijena, i.Noga, o.Ime, o.Prezime, o.DatumRodjenja, o.MjestoRodjenja, d.NazivDrzave, r.Broj, r.Natpis, k.NazivKluba " +
                "FROM igrac i inner join osoba o on i.OSOBA_idOsobe = o.idOsobe inner join drzavljanstvo d on d.idDrzavljanstva = o.DRZAVLJANSTVO_idDrzavljanstva " +
                "inner join dres r on i.OSOBA_idOsobe = r.IGRAC_OSOBA_idOsobe inner join klub k on k.idKluba = r.KLUB_idKluba;";*/
            var selectAll = "SELECT * FROM select_all";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    allProperties.Add(new CommonClass()
                    {
                        Position = reader.GetString(0),
                        Height = reader.GetInt32(1),
                        Weight = reader.GetInt32(2),
                        Price = reader.GetDecimal(3),
                        Foot = reader.GetString(4),
                        Name = reader.GetString(5),
                        Surname = reader.GetString(6),
                        DateOfBirth = reader.GetString(7),
                        PlaceOfBirth = reader.GetString(8),
                        Citizenship = reader.GetString(9),
                        Number = reader.GetInt32(10),
                        Legend = reader.GetString(11),
                        ClubName = reader.GetString(12)
                    });
                }
                reader.Close();
            }
            return allProperties;
        }
    }
}

