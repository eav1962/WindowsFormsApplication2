using System;
using System.Collections.Generic;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using Excel = Microsoft.Office.Interop.Excel;

namespace WindowsFormsApplication2
{
    public partial class Form3 : Form
    {
        public static string anlz2;
        public static string gr_an;
        public static string znach2;

        public Form3()
        {
            InitializeComponent();

            Form1.myConnection.Open();
            // Вызов анализов и значений по id
            string query = "SELECT Анализы,Значения FROM patients WHERE id ='" + Form1.sid + "'";
            MySqlCommand command = new MySqlCommand(query, Form1.myConnection);
            MySqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                anlz2 = reader[0].ToString();
                znach2 = reader[1].ToString();
            }
            reader.Close();
            Form1.myConnection.Close();

        }

      /*  private void Loadanl()              // Выборка Списка анализов по начальным буквам
        {
            string str = textBox1.Text;
            Form1.myConnection.Open();
            string query = "SELECT Sleng, Цена, Max(id) FROM analysis WHERE Sleng LIKE '" + str + "%'" + " GROUP BY Sleng;";
            MySqlCommand command = new MySqlCommand(query, Form1.myConnection);

            MySqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                data.Add(new string[3]);
                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
                data[data.Count - 1][2] = reader[2].ToString();
            }
            reader.Close();
            Form1.myConnection.Close();

            dataGridView1.Rows.Clear();
            foreach (string[] s in data)
                dataGridView1.Rows.Add(s);

        }*/

        private void textBox1_TextChanged(object sender, EventArgs e) // Выборка Списка анализов по начальным буквам
        {
            Form1.myConnection.Open();
            string query = "SELECT Sleng, Any_Value(Цена), Max(id) FROM analysis WHERE Sleng LIKE '" + textBox1.Text + "%'" + " GROUP BY Sleng;";
            MySqlCommand command = new MySqlCommand(query, Form1.myConnection);

            MySqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                data.Add(new string[3]);
                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
                data[data.Count - 1][2] = reader[2].ToString();
            }
            reader.Close();
            Form1.myConnection.Close();

            dataGridView1.Rows.Clear();
            foreach (string[] s in data)
                dataGridView1.Rows.Add(s);
        }

        public string group_an(int sid) // Выборка групп анализов (коагулограмма, лих.антиген и т.д.)
        {

            return gr_an;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e) //Набор анализов
        {
            //Коагулограмма
            if (dataGridView1.CurrentRow.Cells[2].Value.ToString() == "3") 
            {
                anlz2 = anlz2 + "105;106;107;108;109;110;";
                znach2 = znach2 + ";;;;;;";
                textBox2.Text = textBox2.Text + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "      " + dataGridView1.CurrentRow.Cells[1].Value.ToString() + "\r\n";
            }
            //Лихорадочный антиген
            else if (dataGridView1.CurrentRow.Cells[2].Value.ToString() == "121")
            {
                anlz2 = anlz2 + "116;117;118;119;120;121;";
                znach2 = znach2 + ";;;;;;";
                textBox2.Text = textBox2.Text + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "      " + dataGridView1.CurrentRow.Cells[1].Value.ToString() + "\r\n";
            }
            else {
                  anlz2 = anlz2 + dataGridView1.CurrentRow.Cells[2].Value.ToString() + ";";
                  znach2 = znach2 + ";";
                  textBox2.Text = textBox2.Text + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "      " + dataGridView1.CurrentRow.Cells[1].Value.ToString() + "\r\n";
                 }

                textBox3.Text = anlz2;
                textBox4.Text = znach2;
                
        }

        private void button1_Click(object sender, EventArgs e)          //Сохранение и печать чека
        {
            Form1.myConnection.Open();

            string query = "Update patients SET Анализы = '" + anlz2 + "' , Значения = '" + znach2 + "' WHERE id = '" + Form1.sid + "';";
            MySqlCommand cmd = new MySqlCommand(query, Form1.myConnection);
            cmd.ExecuteNonQuery();
            Form1.myConnection.Close();

            // Распечатка чека
            // Создаём экземпляр нашего приложения
            Excel.Application excelApp = new Excel.Application();
            // Создаём экземпляр рабочий книги Excel
            Excel.Workbook workBook;
            // Создаём экземпляр листа Excel
            Excel.Worksheet workSheet;

            workBook = excelApp.Workbooks.Add();
            workSheet = (Excel.Worksheet)workBook.Worksheets.get_Item(1);

            // Заполняем первую строку числами от 1 до 10
            for (int j = 1; j <= 10; j++)
            {
                workSheet.Cells[1, j] = j;
            }

            // Открываем созданный excel-файл
            excelApp.Visible = true;
            excelApp.UserControl = true;
            
        }
    }
}
