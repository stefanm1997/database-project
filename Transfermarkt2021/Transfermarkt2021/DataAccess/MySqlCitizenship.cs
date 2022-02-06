using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Transfermarkt2021.Model;

namespace Transfermarkt2021.DataAccess
{
    class MySqlCitizenship
    {

        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["Transfermarkt"].ConnectionString;
        public List<Citizenship> getAllCitizenships()
        {
            List<Citizenship> citizenship = new List<Citizenship>();
            var selectAll = "SELECT * FROM drzavljanstvo";
            using (var conn = new MySqlConnection(connString))
            {
                conn.Open();
                var cmd = conn.CreateCommand();
                cmd.CommandText = selectAll;
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    citizenship.Add(new Citizenship()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    });
                }
                reader.Close();
            }
            return citizenship;
        }

        public int GetIdOfCitizenships(String name)
        {
            var selectAll = "SELECT idDrzavljanstva FROM drzavljanstvo WHERE NazivDrzave = @name";
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
    }
}
