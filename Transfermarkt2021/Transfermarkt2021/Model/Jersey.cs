using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Jersey
    {
        public Jersey()
        {
        }

        public Jersey(int idPlayer, int idClub, string legend, int number)
        {
            IdPlayer = idPlayer;
            IdClub = idClub;
            Legend = legend;
            Number = number;
        }

        public int IdPlayer { get; set; }

        public Player Player { get; set; }

        public int IdClub { get; set; }

        public Club Club { get; set; }

        public string Legend { get; set; }

        public int Number { get; set; }
    }
}
