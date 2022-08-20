using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication2
{
    public partial class Form4 : Form
    {
        public static string docID;
        public static string docSum;

        public Form4()
        {
            InitializeComponent();
            LoadData();
        }
    
        private void LoadData()
        {
            Form1.myConnection.Open();
            string query = "SELECT ФИО_Врача, Специальность, Приём_первичный, Приём_вторичный, id FROM doctors";
            MySqlCommand command = new MySqlCommand(query, Form1.myConnection);
            MySqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                if (reader[3].ToString() != "")
                {
                    data.Add(new string[5]);
                    data[data.Count - 1][0] = reader[0].ToString();
                    data[data.Count - 1][1] = reader[1].ToString();
                    data[data.Count - 1][2] = reader[2].ToString();
                    data[data.Count - 1][3] = reader[3].ToString();
                    data[data.Count - 1][4] = reader[4].ToString();
                }
            }
            reader.Close();
            dataGridView1.Rows.Clear();
            foreach (string[] s in data)
              dataGridView1.Rows.Add(s);

            
            query = "SELECT Приёмы, Сумма_приём FROM patients WHERE id = " + Form1.sid;
            MySqlCommand command1 = new MySqlCommand(query, Form1.myConnection);
            reader = command1.ExecuteReader();
            while (reader.Read())
            {
                docID = reader[0].ToString();
                docSum = reader[1].ToString();
            }
            reader.Close();
            textBox3.Text = docSum;

            if (docID != "")
            {
                query = "SELECT ФИО_Врача, Специальность FROM doctors WHERE id = " + docID;
                MySqlCommand command2 = new MySqlCommand(query, Form1.myConnection);
                reader = command2.ExecuteReader();
                while (reader.Read())
                {
                    textBox1.Text = reader[0].ToString();
                    textBox2.Text = reader[1].ToString();
                }
                button1.Enabled = false;
                if (docSum == "0") button2.Enabled = true;
                else button3.Enabled = true;
            }
            else textBox4.Text = docID;
            
            Form1.myConnection.Close();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            if (radioButton1.Checked) textBox3.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            else textBox3.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            textBox4.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            docID = textBox4.Text;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form1.myConnection.Open();
            string query = "Update patients SET Приёмы = \"" + docID + "\" WHERE id = '" + Form1.sid + "';";
            MySqlCommand cmd = new MySqlCommand(query, Form1.myConnection);
            cmd.ExecuteNonQuery();

            Form1.myConnection.Close();
            button2.Enabled = true;
            button1.Enabled = false;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked) textBox3.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            else textBox3.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1.myConnection.Open();
            string query = "Update patients SET Сумма_приём = \"" + textBox3.Text + "\" WHERE id = '" + Form1.sid + "';";
            MySqlCommand cmd = new MySqlCommand(query, Form1.myConnection);
            cmd.ExecuteNonQuery();

            Form1.myConnection.Close();
            button3.Enabled = true;
            button2.Enabled = false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form1.myConnection.Open();
            string query = "Update patients SET Сумма_приём = '0', Приёмы = '' WHERE id = '" + Form1.sid + "';";
            MySqlCommand cmd = new MySqlCommand(query, Form1.myConnection);
            cmd.ExecuteNonQuery();

            Form1.myConnection.Close();
            button3.Enabled = false;
            button2.Enabled = false;
            button1.Enabled = true;
        }
    }
}
