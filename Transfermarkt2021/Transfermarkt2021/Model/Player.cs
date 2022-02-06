using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Transfermarkt2021.Model
{
    class Player : Person
    {
        public Player()
        {
        }

        public Player(string position, int height, int weight, decimal price, string foot)
        {
            Position = position;
            Height = height;
            Weight = weight;
            Price = price;
            Foot = foot;
        }

        public string Position { get; set; }

        public int Height { get; set; }

        public int Weight { get; set; }

        public decimal Price { get; set; }

        public string Foot { get; set; }
    }
}
