using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Windows.Forms;
using Word = Microsoft.Office.Interop.Word;


namespace WindowsFormsApplication2
{
    
    public partial class Form1 : Form
    {
        public static string sid;
        public static string gender;
        public static string age;
        public static int yearNow; 
        public static bool ban;
        public static string fullname;

        public static string connectString = "server=192.168.38.10; user id=root; password=root; persistsecurityinfo=True; database=111a; charset=utf8; allowuservariables=True";
        public static MySqlConnection myConnection = new MySqlConnection(connectString);

         
        public Form1()
        {
            InitializeComponent();
            LoadData();
            
        }

        private void LoadData()  
        {
            button2.Enabled = false;
            button4.Enabled = false;
            button3.Enabled = false;
            button4.Enabled = false;
            button5.Enabled = false;
            button6.Enabled = false;
            button7.Enabled = false;
            ban = true;
            string dt = dateTimePicker1.Value.ToString("dd-MM-yyyy");
            yearNow = Convert.ToInt16(dateTimePicker1.Value.ToString("yyyy"));
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            

             myConnection.Open();

                                 
             string query = "SELECT * FROM patients WHERE Дата = '" + dt + "' ORDER BY id ";
             MySqlCommand command = new MySqlCommand(query, myConnection);

             MySqlDataReader reader = command.ExecuteReader();
             List<string[]> data = new List<string[]>(); 
             while (reader.Read())
             {
                 data.Add(new string[7]);
                 data[data.Count - 1][0] = reader[0].ToString();
                 data[data.Count - 1][1] = reader[1].ToString();
                 data[data.Count - 1][2] = reader[2].ToString();
                 data[data.Count - 1][3] = reader[3].ToString();
                 data[data.Count - 1][4] = reader[4].ToString();
                 data[data.Count - 1][5] = reader[6].ToString();
                 data[data.Count - 1][6] = reader[7].ToString();

             }
            reader.Close();
            myConnection.Close();

            dataGridView1.Rows.Clear();
            foreach (string[] s in data)
            dataGridView1.Rows.Add(s);
        }
    
        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)               //Выборка пациентов по дате
        {
            LoadData();
            
        }   
    
        private void textBox2_TextChanged(object sender, EventArgs e)                       //Выборка пациентов по фамилии (поиск)
        {
            string str = textBox2.Text;
            if (str.Length > 2)
            {
                if (ban) 
                {
                    
                    myConnection.Open();
                    
                    string query = "SELECT * FROM patients WHERE Фамилия LIKE '" + str + "%" + "' ORDER BY Датта DESC";
                    MySqlCommand command = new MySqlCommand(query, myConnection);

                    MySqlDataReader reader = command.ExecuteReader();
                    List<string[]> data = new List<string[]>();
                    while (reader.Read())
                    {
                        data.Add(new string[12]);
                        data[data.Count - 1][0] = reader[0].ToString(); 
                        data[data.Count - 1][1] = reader[1].ToString();
                        data[data.Count - 1][2] = reader[2].ToString();
                        data[data.Count - 1][3] = reader[3].ToString();
                        data[data.Count - 1][4] = reader[4].ToString();
                        data[data.Count - 1][5] = reader[6].ToString();
                        data[data.Count - 1][6] = reader[7].ToString();

                    }
                    reader.Close();
                    myConnection.Close();

                    dataGridView1.Rows.Clear();
                    foreach (string[] s in data)
                        dataGridView1.Rows.Add(s);
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)                              //Запись в базу нового пациента
        {
            myConnection.Open();

            // ........
            string dt = dateTimePicker1.Value.ToString("dd-MM-yyyy");
            string fname = textBox2.Text;
            string lname = textBox3.Text;
            gender = textBox4.Text;
            age = textBox5.Text;
            int sidd = 0;

            string query = "SELECT MAX(idd) FROM patients WHERE Дата ='" + dt + "'";
            MySqlCommand command = new MySqlCommand(query, myConnection);
            try
            {
                sidd = 1 + Convert.ToByte(command.ExecuteScalar().ToString());
            }
            catch { sidd = 0; }

            query = "INSERT INTO patients (idd,Дата,Фамилия,Имя,Пол,Год_рождения) VALUES('" + sidd + "','" + dt + "','" + fname + "','" + lname + "','" + gender + "','" + age + "')";
            MySqlCommand cmd = new MySqlCommand(query, myConnection);
            try
            {
                int rowCount = cmd.ExecuteNonQuery();
            }
            catch
            {
                MessageBox.Show("Введите данные пациента", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            // ........
            myConnection.Close();

            LoadData();

        }

        private void button2_Click(object sender, EventArgs e)                              //Запись пациентов на прием к Врачу Ф4
        {
            string fname = "";
            string lname = "";
            try
            {
                fname = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                lname = dataGridView1.CurrentRow.Cells[4].Value.ToString();

                Form4 priem = new Form4();
                priem.Text = fname + " " + lname;
                fullname = fname + " " + lname;
                priem.Show();
            }
            catch
            {
                MessageBox.Show("Пациент не выбран!(Ф4)", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)    //Выбор строки и ввод значений
        {
            button2.Enabled = true;
            button4.Enabled = true;
            button3.Enabled = true;
            button4.Enabled = true;
            //button5.Enabled = true;
            //button6.Enabled = true;
            //button7.Enabled = true;

                textBox6.Text = dataGridView1.CurrentCell.RowIndex.ToString();
                textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                ban = false;        // Установка запрета на изменение отбора
                textBox2.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                ban = true;
                textBox3.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
                textBox4.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
                textBox5.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();

            sid = textBox1.Text;
            gender = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            age = dataGridView1.CurrentRow.Cells[6].Value.ToString();

        }

         private void button3_Click(object sender, EventArgs e)                              //Вызов формы с Анализами Ф2
        {
            string fname = "";
            string lname = "";
            try
            {
                fname = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                lname = dataGridView1.CurrentRow.Cells[4].Value.ToString();

                Form2 analis = new Form2();
                analis.Text = fname + " " + lname;
                fullname = fname + " " + lname;
                analis.Show();
            }
            catch
            {
                MessageBox.Show("Пациент не выбран!(Ф2)", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            
        }

        private void button4_Click(object sender, EventArgs e)                              // Вызов формы Регистратуры Ф3
        {
            string fname = "";
            string lname = "";
            try
            {
                fname = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                lname = dataGridView1.CurrentRow.Cells[4].Value.ToString();

                Form3 analis = new Form3();
                analis.Text = fname + " " + lname;
                analis.Show();
            }
            catch
            {
                MessageBox.Show("Пациент не выбран!(Ф3)", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

        }

        private void button5_Click(object sender, EventArgs e)
        {
            string fname = "";
            string lname = "";
            try
            {
                fname = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                lname = dataGridView1.CurrentRow.Cells[4].Value.ToString();

                Form5 diagn = new Form5();
                diagn.Text = fname + " " + lname;
                fullname = fname + " " + lname;
                diagn.Show();
            }
            catch
            {
                MessageBox.Show("Пациент не выбран!(Ф5)", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }
    }
}

//Печать в Word
/*String fname = textBox2.Text;
           String year_b = textBox4.Text;
           String gender = textBox5.Text; 

           // Создаём объект документа
           Word.Document doc = null;
           try
           {
               // Создаём объект приложения
               Word.Application app = new Word.Application();
               // Путь до шаблона документа
               string source = @"E:\\Test.docx";
               // Открываем
               doc = app.Documents.Open(source);

               //doc.Activate();
               app.Visible = true;

               // Добавляем информацию
               // wBookmarks содержит все закладки
               Word.Bookmarks wBookmarks = doc.Bookmarks;
               Word.Range wRange;
               int i = 0;

               string[] data = new string[3] { fname, year_b, gender };
               foreach (Word.Bookmark mark in wBookmarks)
               {
                   wRange = mark.Range;
                   wRange.Text = data[i];
                   i++;
               }

               //doc.PrintOut();
               // Закрываем документ
               //doc.Close();
               //doc = null;
           }
           catch (Exception ex)
           {
               // Если произошла ошибка, то
               // закрываем документ и выводим информацию
               doc.Close();
               doc = null;
               Console.WriteLine("Во время выполнения произошла ошибка!");
               Console.ReadLine();
           }*/
