using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Transfermarkt2021.DataAccess;
using Transfermarkt2021.Model;

namespace Transfermarkt2021
{
    public partial class MainForm : Form
    {
        public static int idPerson;
        public MainForm()
        {
            InitializeComponent();
            InitializeAboutTab();
            IntializeComboBoxCitizenship();
            IntializeComboBoxClubs();
            IntializeComboBoxPlayers();
            IntializeDataGridView();
            IntializeDataGridView3();
        }

        private void InitializeAboutTab()
        {
            this.labelProductName.Text = Util.AssemblyProduct;
            this.labelVersion.Text = String.Format("Version {0}", Util.AssemblyVersion);
            this.labelCopyright.Text = Util.AssemblyCopyright;
            this.labelCompanyName.Text = Util.AssemblyCompany;
            this.textBoxDescription.Text = Util.AssemblyDescription;
        }

        private void IntializeComboBoxCitizenship()
        {
            var listOfCitizenship = new MySqlCitizenship().getAllCitizenships();
            foreach (var list in listOfCitizenship)
            {
                comboBox2.Items.Add(list.Name);
            }
        }

        private void IntializeComboBoxClubs()
        {
            var listOfClubs = new MySqlClub().getAllClubs();
            foreach (var list in listOfClubs)
            {
                comboBox3.Items.Add(list.Name);
                comboBox4.Items.Add(list.Name);
            }
        }

        private void IntializeComboBoxPlayers()
        {
            var listOfPlayers = new MySqlPerson().getPersonsNameAndSurname();
            foreach (var list in listOfPlayers)
            {
                comboBox5.Items.Add(list.ID + " " + list.Name + " " + list.Surname);
            }
        }

        private void IntializeDataGridView()
        {
            var list = new MySqlCommon().getAll();
            for (int i = 0; i < list.Count; i++)
            {
                //DataGridViewRow row = (DataGridViewRow)dataGridView1.Rows[0].Clone();
                var index = dataGridView1.Rows.Add();
                dataGridView1.Rows[index].Cells[0].Value = list.ElementAt(i).Name;
                dataGridView1.Rows[index].Cells[1].Value = list.ElementAt(i).Surname;
                dataGridView1.Rows[index].Cells[2].Value = list.ElementAt(i).DateOfBirth;
                dataGridView1.Rows[index].Cells[3].Value = list.ElementAt(i).PlaceOfBirth;
                dataGridView1.Rows[index].Cells[4].Value = list.ElementAt(i).Citizenship;
                dataGridView1.Rows[index].Cells[5].Value = list.ElementAt(i).Position;
                dataGridView1.Rows[index].Cells[6].Value = list.ElementAt(i).Height;
                dataGridView1.Rows[index].Cells[7].Value = list.ElementAt(i).Weight;
                dataGridView1.Rows[index].Cells[8].Value = list.ElementAt(i).Price;
                dataGridView1.Rows[index].Cells[9].Value = list.ElementAt(i).Foot;
                dataGridView1.Rows[index].Cells[10].Value = list.ElementAt(i).Number;
                dataGridView1.Rows[index].Cells[11].Value = list.ElementAt(i).Legend;
                dataGridView1.Rows[index].Cells[12].Value = list.ElementAt(i).ClubName;
                // dataGridView1.Rows.Add(row);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];
                textBox1.Text = row.Cells[0].Value.ToString();
                textBox2.Text = row.Cells[1].Value.ToString();
                dateTimePicker1.Text = row.Cells[2].Value.ToString();
                textBox3.Text = row.Cells[3].Value.ToString();
                comboBox2.Text = row.Cells[4].Value.ToString();
                textBox5.Text = row.Cells[5].Value.ToString();
                textBox6.Text = row.Cells[6].Value.ToString();
                textBox7.Text = row.Cells[7].Value.ToString();
                textBox8.Text = row.Cells[8].Value.ToString();
                comboBox1.Text = row.Cells[9].Value.ToString();
                textBox9.Text = row.Cells[10].Value.ToString();
                textBox10.Text = row.Cells[11].Value.ToString();
                comboBox3.Text = row.Cells[12].Value.ToString();
                var idCitizenship = new MySqlCitizenship().GetIdOfCitizenships(comboBox2.Text);
                var person = new Person(textBox1.Text, textBox2.Text, dateTimePicker1.Text, textBox3.Text, new Citizenship() { Name = comboBox2.Text, ID = idCitizenship });
                idPerson = new MySqlPerson().getPersonID(person);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                var person = new Person(textBox1.Text, textBox2.Text, dateTimePicker1.Text, textBox3.Text, new Citizenship() { Name = comboBox2.Text });
                var player = new Player(textBox5.Text, Int32.Parse(textBox6.Text), Int32.Parse(textBox7.Text), Decimal.Parse(textBox8.Text), comboBox1.Text);
                var jersey = new Jersey() { Number = Int32.Parse(textBox9.Text), Legend = textBox10.Text };
                var club = new Club { Name = comboBox3.Text };
                var idClub = new MySqlClub().GetIdOfClub(club.Name);
                var allJerseyForClub = new MySqlJersey().getAllJerseyForClub(idClub);
                if (allJerseyForClub.Contains(jersey.Number))
                {
                    string message = "Trazeni broj je vec zauzet, izaberite neki drugi broj!";
                    string title = "Desila se greska";
                    MessageBox.Show(message, title);
                }
                else
                    new MySqlPlayer().Insert(player, person, jersey, club);

                dataGridView1.Rows.Clear();
                IntializeDataGridView();
                comboBox5.Items.Clear();
                IntializeComboBoxPlayers();
            }
            catch (System.FormatException)
            {
                string message = "Greska prilikom unosa! U nekom od textbox-ova je promasen format ili je neki od textbox-ova prazan!!";
                string title = "Desila se greska";
                MessageBox.Show(message, title);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                var idCitizenship = new MySqlCitizenship().GetIdOfCitizenships(comboBox2.Text);
                var person = new Person(textBox1.Text, textBox2.Text, dateTimePicker1.Text, textBox3.Text, new Citizenship() { Name = comboBox2.Text, ID = idCitizenship });
                person.ID = idPerson;
                //var person = new Person(textBox1.Text, textBox2.Text, dateTimePicker1.Text, textBox3.Text, new Citizenship() { Name = comboBox2.Text });
                var player = new Player(textBox5.Text, Int32.Parse(textBox6.Text), Int32.Parse(textBox7.Text), Decimal.Parse(textBox8.Text), comboBox1.Text);
                var jersey = new Jersey() { Number = Int32.Parse(textBox9.Text), Legend = textBox10.Text };
                var club = new Club { Name = comboBox3.Text };
                var idClub = new MySqlClub().GetIdOfClub(club.Name);
                var allJerseyForClub = new MySqlJersey().getAllJerseyForClub(idClub);
                var result = new MySqlPlayer().Update(player, person, jersey, club);
                if (result.Equals("postoji broj"))
                {
                    string message = "Trazeni broj je vec zauzet, izaberite neki drugi broj!";
                    string title = "Desila se greska";
                    MessageBox.Show(message, title);
                }

                dataGridView1.Rows.Clear();
                IntializeDataGridView();
            }
            catch (System.FormatException)
            {
                string message = "Greska prilikom izmjene! U nekom od textbox-ova je promasen format ili je neki od textbox-ova prazan!";
                string title = "Desila se greska";
                MessageBox.Show(message, title);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {

            if (new MySqlPlayer().DeletePlayer(idPerson))
            {
                //Console.WriteLine("Uspjesno izbrisan lik sa ID-em" + idPerson);
                dataGridView1.Rows.Clear();
                IntializeDataGridView();
                dataGridView3.Rows.Clear();
                IntializeDataGridView3();
                comboBox5.Items.Clear();
                IntializeComboBoxPlayers();
            }

        }

        private void IntializeDataGridView2()
        {
            var listOfPlayers = new MySqlJersey().getAllPlayersFromClub(comboBox4.Text);
            for (int i = 0; i < listOfPlayers.Count; i++)
            {
                //DataGridViewRow row = (DataGridViewRow)dataGridView1.Rows[0].Clone();
                var index = dataGridView2.Rows.Add();
                dataGridView2.Rows[index].Cells[0].Value = listOfPlayers.ElementAt(i).Player.Name;
                dataGridView2.Rows[index].Cells[1].Value = listOfPlayers.ElementAt(i).Player.Surname;
                dataGridView2.Rows[index].Cells[2].Value = listOfPlayers.ElementAt(i).Player.Position;
                dataGridView2.Rows[index].Cells[3].Value = listOfPlayers.ElementAt(i).Player.Height;
                dataGridView2.Rows[index].Cells[4].Value = listOfPlayers.ElementAt(i).Player.Weight;
                dataGridView2.Rows[index].Cells[5].Value = listOfPlayers.ElementAt(i).Player.Price;
                dataGridView2.Rows[index].Cells[6].Value = listOfPlayers.ElementAt(i).Number;
                dataGridView2.Rows[index].Cells[7].Value = listOfPlayers.ElementAt(i).Legend;
                // dataGridView1.Rows.Add(row);
            }
        }

        private void IntializeDataGridView3()
        {
            var listOfTransfers = new MySqlTransfer().getAllTransfers();
            for (int i = 0; i < listOfTransfers.Count; i++)
            {
                //DataGridViewRow row = (DataGridViewRow)dataGridView1.Rows[0].Clone();
                var index = dataGridView3.Rows.Add();
                dataGridView3.Rows[index].Cells[0].Value = listOfTransfers.ElementAt(i).Person.Name;
                dataGridView3.Rows[index].Cells[1].Value = listOfTransfers.ElementAt(i).Person.Surname;
                dataGridView3.Rows[index].Cells[2].Value = listOfTransfers.ElementAt(i).ClubFrom.Name;
                dataGridView3.Rows[index].Cells[3].Value = listOfTransfers.ElementAt(i).ClubIn.Name;
                dataGridView3.Rows[index].Cells[4].Value = listOfTransfers.ElementAt(i).DateOfTransfer;
                dataGridView3.Rows[index].Cells[5].Value = listOfTransfers.ElementAt(i).Price;
                // dataGridView1.Rows.Add(row);
            }
        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            var club = new MySqlClub().getClubInfo(comboBox4.Text);
            textBox12.Text = club.Name;
            textBox11.Text = club.League;
            textBox4.Text = club.Website;
            textBox15.Text = club.DateOfEstablishment;
            textBox14.Text = club.Stadium.Name;
            textBox13.Text = club.Address.Street + " " + club.Address.Number;

            dataGridView2.Rows.Clear();
            IntializeDataGridView2();
        }

        private void comboBox5_SelectedValueChanged(object sender, EventArgs e)
        {

            var split = comboBox5.Text.Split(null);
            var clubName = new MySqlClub().getClubName(Int32.Parse(split[0]));
            textBox16.Text = clubName;

            var listOfClubs = new MySqlClub().getAllClubs();
            foreach (var list in listOfClubs)
            {
                if (!textBox16.Text.Equals(list.Name))
                    comboBox6.Items.Add(list.Name);
            }
        }

        private void comboBox5_SelectionChangeCommitted(object sender, EventArgs e)
        {
            comboBox6.Items.Clear();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                int clubIdIn = new MySqlClub().GetIdOfClub(comboBox6.Text);
                int clubIdFrom = new MySqlClub().GetIdOfClub(textBox16.Text);
                var split = comboBox5.Text.Split(null);
                new MySqlTransfer().insertInTransfer(Int32.Parse(split[0]), clubIdFrom, clubIdIn, dateTimePicker2.Text, Decimal.Parse(textBox17.Text));
                comboBox6.Text = "";
                dataGridView3.Rows.Clear();
                IntializeDataGridView3();
                dataGridView1.Rows.Clear();
                IntializeDataGridView();

            }
            catch (System.FormatException)
            {
                string message = "Greska prilikom unosa! U nekom od textbox-ova je promasen format ili je neki od textbox-ova prazan!!";
                string title = "Desila se greska";
                MessageBox.Show(message, title);
            }
        }
    }
}
